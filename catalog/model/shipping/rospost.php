<?php
class ModelShippingRospost extends Model {
	function getQuote($address) {

		// version Opencart 2
		$v2 = ((int)substr(VERSION, 0, 1) == 2);

		if($v2)
			$this->load->language('shipping/rospost');
		else
			$this->language->load('shipping/rospost');

		// load lib
		if(method_exists($this->load, 'library'))
			$this->load->library('rospostcalclight');
		if(!isset($this->rospostcalclight) && class_exists('RospostCalclight'))
			$this->registry->set('rospostcalclight', new RospostCalclight($this->registry));
		else 
			exit("can't load library RospostCalclight");

		// init params
		$postcalc_from = $this->rospostcalclight->config_default_from;
		$postcalc_to = (isset($address['postcode']) && $address['postcode'] ? $address['postcode'] : (isset($address['city']) && $address['city']? $address['city'] : '-'));
		$postcalc_weight = $this->weight->convert(($weight = $this->cart->getWeight()), $this->config->get('config_weight_class_id'), 2); // 2 - gramm classid
		$postcalc_valuation = $this->cart->getSubTotal();
		$postcalc_country = 'RU';
		$error = false;
		$status = false;

		if ($postcalc_from != '') {
			$quote_data = array();
			// postcalc request
			$arrResponse = $this->rospostcalclight->postcalc_request($postcalc_from, $postcalc_to, $postcalc_weight, $postcalc_valuation);
			// if string - error
			if (!is_array($arrResponse)) {
				$status = false;
				$error = $arrResponse;
				if (count($arrError = error_get_last())) {
					$error .= '<br />PHP Error: ' . $arrError['message'] . '(file: ' . $arrError['file'] . ', line: ' . $arrError['line'];
				}
			}
			else { // if array return - Status=='OK'
				$status = true;
				if(!$this->rospostcalclight->get('config_hide_from')) {
					$from_info = "<br /><span>" . $this->language->get('text_from') . "
								{$arrResponse['Откуда']['Индекс']}, {$arrResponse['Откуда']['Название']}
								<br /> {$arrResponse['Откуда']['Адрес']} 
								<br /> {$arrResponse['Откуда']['Телефон']}
								</span>";
				}
				if(!$this->rospostcalclight->get('config_hide_to')) {
					if ($postcalc_country == 'RU') {
						$to_info = "<br /><span>" . $this->language->get('text_to') . "
								{$arrResponse['Куда']['Индекс']}, {$arrResponse['Куда']['Название']}
								<br />{$arrResponse['Куда']['Адрес']}
								</span>";
					}
					else {
						$to_info = "<br /><span>" . $this->language->get('text_to') . "</b>" . $this->language->get('text_international_deliver') . " {$arrPostcalcCountries[$postcalc_country]}</span>";
					}
				}
				// listing tariff
				$counter = 0;
				foreach ($arrResponse['Отправления'] as $k => $parcel) {
					// check few parts on package
					if(!$this->rospostcalclight->get('config_allow_part_package') && $parcel['Количество'] > 1) {
						continue;
					}
					if($this->rospostcalclight->get('config_only_costtype') && !$parcel['Ценное']) {
						continue;
					}
					if (isset($parcel['Доставка']) && $parcel['Доставка']) {
						$parcel_index = 'Доставка';
						$cod = '';
						$cod_cost = 0;
						if (isset($parcel['ОценкаПолная']) && $parcel['ОценкаПолная']) {
							//$parcel_index = 'ОценкаПолная';
							if($this->rospostcalclight->get('config_append_cod_to_total') || $this->rospostcalclight->get('config_show_cod')) {
								if(isset($parcel['НаложенныйПлатеж']) && $parcel['НаложенныйПлатеж'] > 0) {
									if($this->rospostcalclight->get('config_show_cod')) {
										$cod = '; ' . ($this->rospostcalclight->get('config_allow_detail_types') ? $this->language->get('text_cod') : $this->language->get('text_cod_short')) . ' ' . $parcel['НаложенныйПлатеж'] . ' руб.';
									}
									if($this->rospostcalclight->get('config_append_cod_to_total')) {
										$cod_cost = round($parcel['НаложенныйПлатеж'], 2);
									}
								}
								elseif(isset($parcel['НаложенныйПлатеж2']) && $parcel['НаложенныйПлатеж2'] > 0) {
									if($this->rospostcalclight->get('config_show_cod')) {
										$cod = '; ' . ($this->rospostcalclight->get('config_allow_detail_types') ? $this->language->get('text_cod') : $this->language->get('text_cod_short')) . ' ' . $parcel['НаложенныйПлатеж2'] . ' руб.';
									}
									if($this->rospostcalclight->get('config_append_cod_to_total')) {
										$cod_cost = round($parcel['НаложенныйПлатеж2'], 2);
									}
								}
								elseif(isset($parcel['НаложенныйПлатеж3']) && $parcel['НаложенныйПлатеж3'] > 0) {
									if($this->rospostcalclight->get('config_show_cod')) {
										$cod = '; ' . ($this->rospostcalclight->get('config_allow_detail_types') ? $this->language->get('text_cod') : $this->language->get('text_cod_short')) . ' ' . $parcel['НаложенныйПлатеж3'] . ' руб.';
									}
									if($this->rospostcalclight->get('config_append_cod_to_total')) {
										$cod_cost = round($parcel['НаложенныйПлатеж3'], 2);
									}
								}
								else {}
							}
						}
						// cost deliver (api)
						$price = round($parcel[$parcel_index], 2);
						// get over sum (module)
						$rp_cost = str_replace(array(".", ","), array(",", "."), (($rp_cost = $this->config->get('rospost_cost')) ? $rp_cost : '0'));
						// get rates (module)
						$rp_rate_cost = 0;
						$rates = explode(',', $this->config->get('rospost_rate'));
						foreach ($rates as $rate) {
							$data = explode(':', $rate);
							if ($data[0] >= $weight) {
								if (isset($data[1])) {
									$rp_rate_cost = $data[1];
								}
								break;
							}
						}
						$cost = number_format($rp_cost, 2) + number_format($rp_rate_cost, 2) + $price;
						if($this->rospostcalclight->get('config_append_cod_to_total'))
							$cost = $cost + $cod_cost;
						//$cost = $this->tax->calculate($cost, '', $this->config->get('config_tax'));

						$text = ($this->rospostcalclight->get('config_allow_detail_types') ? "<span>$parcel[Название].</span>" : '') . " <span>" . ($this->rospostcalclight->get('config_allow_detail_types') ? $this->language->get('text_cost') . ' ' : '') . "<b>" . $cost . " руб.</b></span> <span class=\"center\">(" . $this->language->get('text_time') . " $parcel[СрокДоставки] " . $this->language->get('text_days') . $cod . ')</span>';
						if($this->rospostcalclight->get('config_type') && in_array($k, $this->rospostcalclight->get('config_type'))) {
							$quote_data['rospost' . $counter] = array(
								'code'         => 'rospost.rospost' . $counter,
								'title'        => ($this->rospostcalclight->get('config_allow_detail_types') ? '<span>' . $this->language->get('text_description') . '</span>' : "<span>$parcel[Название]</span>"),
								'cost'         => $cost,
								'tax_class_id' => '',
								'text'         => $text
								);
						}
						else {
							if(!$this->rospostcalclight->get('config_type')) {
								$quote_data['rospost' . $counter] = array(
									'code'         => 'rospost.rospost' . $counter,
									'title'        => ($this->rospostcalclight->get('config_allow_detail_types') ? '<span>' . $this->language->get('text_description') . '</span>' : "<span>$parcel[Название]</span>"),
									'cost'         => $cost,
									'tax_class_id' => '',
									'text'         => $text
								);
							}
						}
					}
					$counter++;
				}
			}
		}

		// get image
		$header = '';
		$type_icon = $this->rospostcalclight->get('config_ico_type');
		$size_icon = $this->rospostcalclight->get('config_ico_size');
		$pos_icon = $this->rospostcalclight->get('config_ico_pos');
		$src = (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/image/rospost/rospost_icon_t' . $type_icon . '_' . $size_icon . '.png') ? '/catalog/view/theme/' . $this->config->get('config_template') . '/image/rospost/rospost_icon_t' . $type_icon . '_' . $size_icon . '.png' : '/catalog/view/theme/default/image/rospost/rospost_icon_t' . $type_icon . '_' . $size_icon . '.png');

		if($type_icon) {
			if($pos_icon == 2) {
				$header = $this->config->get('rospost_name') . '<img src="' . $src . '" style="padding: 5px 10px; vertical-align: middle;" />';
			}
			else {
				$header = '<img src="' . $src . '" style="padding: 5px 10px; vertical-align: middle;" />' . $this->config->get('rospost_name');
			}
		}
		else {
			$header = $this->config->get('rospost_name');
		}

		$method_data = array(
			'code'       => 'rospost',
			'title'      =>  $header . ($status ? ($this->rospostcalclight->get('config_allow_detail_title') ? "<span> (" . $this->language->get('text_weight') . '' . $postcalc_weight . ' ' . $this->language->get('text_gramm') . ', ' . $this->language->get('text_evaluation') . ' ' . $postcalc_valuation . ' руб.)</span>' : '') . (!$this->rospostcalclight->get('config_hide_from') ? $from_info : '') . (!$this->rospostcalclight->get('config_hide_to') ? $to_info : '') : '') . ($quote_data ? '' : '<div><i>' . $this->language->get('text_not_result') . '</i></div>'),
			'quote'      => $status ? $quote_data : '',
			'sort_order' => $this->config->get('rospost_sort_order'),
			'error'      => $status ? false : $error
		);
		return $method_data;
	}
}
?>