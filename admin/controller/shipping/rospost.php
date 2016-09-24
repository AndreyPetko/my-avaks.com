<?php
class ControllerShippingRospost extends Controller {
	private $error = array();

	public function index() {

		// version Opencart 2
		$v2 = $data['v2'] = ((int)substr(VERSION, 0, 1) == 2);
		$v22 = $data['v22'] = (version_compare(VERSION, '2.2.0', '>='));

		$this->load->language('shipping/rospost');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('rospost', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			if($v2) {
				if($v22)
					$this->response->redirect($this->url->link('extension/shipping', 'token=' . $this->session->data['token'], true));
				else
					$this->response->redirect($this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL'));
			}
			else {
				$this->redirect($this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}
		$data['token'] = $this->session->data['token'];
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit_rospost'] = $this->language->get('text_edit_rospost');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_select_all'] = $this->language->get('text_select_all');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');

		$data['text_options_common'] = $this->language->get('text_options_common');
		$data['text_options_calc_view'] = $this->language->get('text_options_calc_view');
		$data['text_options_postcalc'] = $this->language->get('text_options_postcalc');
		$data['text_postcalc_copy'] = $this->language->get('text_postcalc_copy');
		$data['tab_option'] = $this->language->get('tab_option');
		$data['tab_history'] = $this->language->get('tab_history');
		$data['tab_server'] = $this->language->get('tab_server');
		$data['tab_log'] = $this->language->get('tab_log');
		$data['tab_general'] = $this->language->get('tab_general');
		$data['text_get_stat'] = $this->language->get('text_get_stat');
		$data['text_get_test'] = $this->language->get('text_get_test');
		$data['text_get_log'] = $this->language->get('text_get_log');
		$data['text_stat_postcalc'] = $this->language->get('text_stat_postcalc');
		$data['text_test_postcalc'] = $this->language->get('text_test_postcalc');
		$data['text_test_postcalc_etc'] = $this->language->get('text_test_postcalc_etc');
		$data['text_log_postcalc'] = $this->language->get('text_log_postcalc');
		$data['text_all_types'] = $this->language->get('text_all_types');
		$data['text_ico_before'] = $this->language->get('text_ico_before');
		$data['text_ico_after'] = $this->language->get('text_ico_after');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_name_tooltip'] = $this->language->get('entry_name_tooltip');
		$data['entry_cost'] = $this->language->get('entry_cost');
		$data['entry_cost_tooltip'] = $this->language->get('entry_cost_tooltip');
		$data['entry_rate'] = $this->language->get('entry_rate');
		$data['entry_rate_tooltip'] = $this->language->get('entry_rate_tooltip');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		// postcalc
		$data['entry_source'] = $this->language->get('entry_source');
		$data['entry_source_tooltip'] = $this->language->get('entry_source_tooltip');
		$data['entry_st']                         = $this->language->get('entry_st');
		$data['entry_st_tooltip']                 = $this->language->get('entry_st_tooltip');
		$data['entry_ml']                         = $this->language->get('entry_ml');
		$data['entry_ml_tooltip']                 = $this->language->get('entry_ml_tooltip');
		$data['entry_ib']                         = $this->language->get('entry_ib');
		$data['entry_ib_tooltip']                 = $this->language->get('entry_ib_tooltip');
		$data['entry_ib_text_full']                 = $this->language->get('entry_ib_text_full');
		$data['entry_ib_text_part']                 = $this->language->get('entry_ib_text_part');
		$data['entry_r']                          = $this->language->get('entry_r');
		$data['entry_r_tooltip']                  = $this->language->get('entry_r_tooltip');
		$data['entry_pr']                         = $this->language->get('entry_pr');
		$data['entry_pr_tooltip']                 = $this->language->get('entry_pr_tooltip');
		$data['entry_pk']                         = $this->language->get('entry_pk');
		$data['entry_pk_tooltip']                 = $this->language->get('entry_pk_tooltip');
		$data['entry_cs']                         = $this->language->get('entry_cs');
		$data['entry_cs_tooltip']                 = $this->language->get('entry_cs_tooltip');
		$data['entry_cs_text_utf']                 = $this->language->get('entry_cs_text_utf');
		$data['entry_cs_text_win']                 = $this->language->get('entry_cs_text_win');
		$data['entry_d']                          = $this->language->get('entry_d');
		$data['entry_d_tooltip']                  = $this->language->get('entry_d_tooltip');
		$data['entry_default_from'] = $this->language->get('entry_default_from');
		$data['entry_default_from_tooltip'] = $this->language->get('entry_default_from_tooltip');
		$data['entry_hide_from']                  = $this->language->get('entry_hide_from');
		$data['entry_hide_from_tooltip']          = $this->language->get('entry_hide_from_tooltip');
		$data['entry_hide_to']                  = $this->language->get('entry_hide_to');
		$data['entry_hide_to_tooltip']          = $this->language->get('entry_hide_to_tooltip');
		$data['entry_log']                        = $this->language->get('entry_log');
		$data['entry_log_tooltip']                = $this->language->get('entry_log_tooltip');
		$data['entry_error_log']                  = $this->language->get('entry_error_log');
		$data['entry_error_log_tooltip']          = $this->language->get('entry_error_log_tooltip');
		$data['entry_error_log_send']             = $this->language->get('entry_error_log_send');
		$data['entry_error_log_send_tooltip']     = $this->language->get('entry_error_log_send_tooltip');
		$data['entry_cache_dir']                  = $this->language->get('entry_cache_dir');
		$data['entry_cache_dir_tooltip']          = $this->language->get('entry_cache_dir_tooltip');
		$data['entry_cache_valid']                = $this->language->get('entry_cache_valid');
		$data['entry_cache_valid_tooltip']        = $this->language->get('entry_cache_valid_tooltip');
		$data['entry_timeout']                    = $this->language->get('entry_timeout');
		$data['entry_timeout_tooltip']            = $this->language->get('entry_timeout_tooltip');
		$data['entry_servers']                    = $this->language->get('entry_servers');
		$data['entry_servers_tooltip']            = $this->language->get('entry_servers_tooltip');
		$data['entry_city_as_pindex']             = $this->language->get('entry_city_as_pindex');
		$data['entry_city_as_pindex_tooltip']     = $this->language->get('entry_city_as_pindex_tooltip');
		$data['entry_allow_part_package']             = $this->language->get('entry_allow_part_package');
		$data['entry_allow_part_package_tooltip']     = $this->language->get('entry_allow_part_package_tooltip');
		$data['entry_allow_detail_title']             = $this->language->get('entry_allow_detail_title');
		$data['entry_allow_detail_title_tooltip']     = $this->language->get('entry_allow_detail_title_tooltip');
		$data['entry_allow_detail_types']             = $this->language->get('entry_allow_detail_types');
		$data['entry_allow_detail_types_tooltip']     = $this->language->get('entry_allow_detail_types_tooltip');
		$data['entry_ico_type']             = $this->language->get('entry_ico_type');
		$data['entry_ico_type_tooltip']     = $this->language->get('entry_ico_type_tooltip');
		$data['entry_ico_size']             = $this->language->get('entry_ico_size');
		$data['entry_ico_size_tooltip']     = $this->language->get('entry_ico_size_tooltip');
		$data['entry_ico_pos']              = $this->language->get('entry_ico_pos');
		$data['entry_ico_pos_tooltip']      = $this->language->get('entry_ico_pos_tooltip');

		$data['entry_show_cod']             = $this->language->get('entry_show_cod');
		$data['entry_show_cod_tooltip']     = $this->language->get('entry_show_cod_tooltip');
		$data['entry_append_cod_to_total']             = $this->language->get('entry_append_cod_to_total');
		$data['entry_append_cod_to_total_tooltip']     = $this->language->get('entry_append_cod_to_total_tooltip');
		$data['entry_type']             = $this->language->get('entry_type');
		$data['entry_type_tooltip']     = $this->language->get('entry_type_tooltip');
		$data['entry_only_costtype']             = $this->language->get('entry_only_costtype');
		$data['entry_only_costtype_tooltip']     = $this->language->get('entry_only_costtype_tooltip');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_save_and_stay'] = $this->language->get('button_save_and_stay');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['error_field'] = $this->language->get('error_field');

		/* error */
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		/* error PostCalc */
 		if (isset($this->error['source'])) {
			$data['error_source'] = $this->error['source'];
		} else {
			$data['error_source'] = '';
		}

 		if (isset($this->error['st'])) {
			$data['error_st'] = $this->error['st'];
		} else {
			$data['error_st'] = '';
		}

 		if (isset($this->error['ml'])) {
			$data['error_ml'] = $this->error['ml'];
		} else {
			$data['error_ml'] = '';
		}

 		if (isset($this->error['default_from'])) {
			$data['error_default_from'] = $this->error['default_from'];
		} else {
			$data['error_default_from'] = '';
		}

 		if (isset($this->error['cache_dir'])) {
			$data['error_cache_dir'] = $this->error['cache_dir'];
		} else {
			$data['error_cache_dir'] = '';
		}

 		if (isset($this->error['servers'])) {
			$data['error_servers'] = $this->error['servers'];
		} else {
			$data['error_servers'] = '';
		}


  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_shipping'),
			'href'      => $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('shipping/rospost', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$data['action'] = $this->url->link('shipping/rospost', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL');


		if (isset($this->request->post['rospost_name'])) {
			$data['rospost_name'] = $this->request->post['rospost_name'];
		} else {
			$data['rospost_name'] = $this->config->get('rospost_name');
		}

		if (isset($this->request->post['rospost_cost'])) {
			$data['rospost_cost'] = $this->request->post['rospost_cost'];
		} else {
			$data['rospost_cost'] = $this->config->get('rospost_cost');
		}

		if (isset($this->request->post['rospost_rate'])) {
			$data['rospost_rate'] = $this->request->post['rospost_rate'];
		} else {
			$data['rospost_rate'] = $this->config->get('rospost_rate');
		}

		if (isset($this->request->post['rospost_status'])) {
			$data['rospost_status'] = $this->request->post['rospost_status'];
		} else {
			$data['rospost_status'] = $this->config->get('rospost_status');
		}

		if (isset($this->request->post['rospost_sort_order'])) {
			$data['rospost_sort_order'] = $this->request->post['rospost_sort_order'];
		} else {
			$data['rospost_sort_order'] = $this->config->get('rospost_sort_order');
		}

		// Postcalc
		// db mysql
		if (isset($this->request->post['rospost_postcalc_source'])) {
			$data['rospost_postcalc_source'] = $this->request->post['rospost_postcalc_source'];
		} else {
			if($this->config->has('rospost_postcalc_source'))
				$data['rospost_postcalc_source'] = $this->config->get('rospost_postcalc_source');
			else
				$data['rospost_postcalc_source'] = 'mysql';
		}

		if (isset($this->request->post['rospost_postcalc_st'])) {
			$data['rospost_postcalc_st'] = $this->request->post['rospost_postcalc_st'];
		} else {
			if($this->config->has('rospost_postcalc_st'))
				$data['rospost_postcalc_st'] = $this->config->get('rospost_postcalc_st');
			else
				$data['rospost_postcalc_st'] = $_SERVER['HTTP_HOST'];
		}

		if (isset($this->request->post['rospost_postcalc_ml'])) {
			$data['rospost_postcalc_ml'] = $this->request->post['rospost_postcalc_ml'];
		} else {
			if($this->config->has('rospost_postcalc_ml'))
				$data['rospost_postcalc_ml'] = $this->config->get('rospost_postcalc_ml');
			else
				$data['rospost_postcalc_ml'] = $this->config->get('config_email');
		}

		if (isset($this->request->post['rospost_postcalc_ib'])) {
			$data['rospost_postcalc_ib'] = $this->request->post['rospost_postcalc_ib'];
		} else {
			$data['rospost_postcalc_ib'] = $this->config->get('rospost_postcalc_ib');
		}

		if (isset($this->request->post['rospost_postcalc_r'])) {
			$data['rospost_postcalc_r'] = $this->request->post['rospost_postcalc_r'];
		} else {
			$data['rospost_postcalc_r'] = $this->config->get('rospost_postcalc_r');
		}

		if (isset($this->request->post['rospost_postcalc_pr'])) {
			$data['rospost_postcalc_pr'] = $this->request->post['rospost_postcalc_pr'];
		} else {
			$data['rospost_postcalc_pr'] = $this->config->get('rospost_postcalc_pr');
		}

		if (isset($this->request->post['rospost_postcalc_pk'])) {
			$data['rospost_postcalc_pk'] = $this->request->post['rospost_postcalc_pk'];
		} else {
			$data['rospost_postcalc_pk'] = $this->config->get('rospost_postcalc_pk');
		}

		if (isset($this->request->post['rospost_postcalc_cs'])) {
			$data['rospost_postcalc_cs'] = $this->request->post['rospost_postcalc_cs'];
		} else {
			$data['rospost_postcalc_cs'] = $this->config->get('rospost_postcalc_cs');
		}

		if (isset($this->request->post['rospost_postcalc_d'])) {
			$data['rospost_postcalc_d'] = $this->request->post['rospost_postcalc_d'];
		} else {
			$data['rospost_postcalc_d'] = $this->config->get('rospost_postcalc_d');
		}

		if (isset($this->request->post['rospost_postcalc_default_from'])) {
			$data['rospost_postcalc_default_from'] = $this->request->post['rospost_postcalc_default_from'];
		} else {
			$data['rospost_postcalc_default_from'] = $this->config->get('rospost_postcalc_default_from');
		}

		if (isset($this->request->post['rospost_postcalc_hide_from'])) {
			$data['rospost_postcalc_hide_from'] = $this->request->post['rospost_postcalc_hide_from'];
		} else {
			$data['rospost_postcalc_hide_from'] = $this->config->get('rospost_postcalc_hide_from');
		}

		if (isset($this->request->post['rospost_postcalc_hide_to'])) {
			$data['rospost_postcalc_hide_to'] = $this->request->post['rospost_postcalc_hide_to'];
		} else {
			$data['rospost_postcalc_hide_to'] = $this->config->get('rospost_postcalc_hide_to');
		}

		if (isset($this->request->post['rospost_postcalc_log'])) {
			$data['rospost_postcalc_log'] = $this->request->post['rospost_postcalc_log'];
		} else {
			$data['rospost_postcalc_log'] = $this->config->get('rospost_postcalc_log');
		}

		if (isset($this->request->post['rospost_postcalc_error_log'])) {
			$data['rospost_postcalc_error_log'] = $this->request->post['rospost_postcalc_error_log'];
		} else {
			$data['rospost_postcalc_error_log'] = $this->config->get('rospost_postcalc_error_log');
		}

		if (isset($this->request->post['rospost_postcalc_error_log_send'])) {
			$data['rospost_postcalc_error_log_send'] = $this->request->post['rospost_postcalc_error_log_send'];
		} else {
			if($this->config->has('rospost_postcalc_error_log_send'))
				$data['rospost_postcalc_error_log_send'] = $this->config->get('rospost_postcalc_error_log_send');
			else
				// default value
				$data['rospost_postcalc_error_log_send'] = '10';
		}

		if (isset($this->request->post['rospost_postcalc_cache_dir'])) {
			$data['rospost_postcalc_cache_dir'] = $this->request->post['rospost_postcalc_cache_dir'];
		} else {
			if($this->config->has('rospost_postcalc_cache_dir'))
				$data['rospost_postcalc_cache_dir'] = $this->config->get('rospost_postcalc_cache_dir');
			else
				// default value
				$data['rospost_postcalc_cache_dir'] = 'system/storage/cache';
		}

		if (isset($this->request->post['rospost_postcalc_cache_valid'])) {
			$data['rospost_postcalc_cache_valid'] = $this->request->post['rospost_postcalc_cache_valid'];
		} else {
			if($this->config->has('rospost_postcalc_cache_valid'))
				$data['rospost_postcalc_cache_valid'] = $this->config->get('rospost_postcalc_cache_valid');
			else
				// default value
				$data['rospost_postcalc_cache_valid'] = '600';
		}

		if (isset($this->request->post['rospost_postcalc_timeout'])) {
			$data['rospost_postcalc_timeout'] = $this->request->post['rospost_postcalc_timeout'];
		} else {
			if($this->config->has('rospost_postcalc_timeout'))
				$data['rospost_postcalc_timeout'] = $this->config->get('rospost_postcalc_timeout');
			else
				// default value
				$data['rospost_postcalc_timeout'] = '5';
		}

		if (isset($this->request->post['rospost_postcalc_servers'])) {
			$data['rospost_postcalc_servers'] = $this->request->post['rospost_postcalc_servers'];
		} else {
			$data['rospost_postcalc_servers'] = $this->config->get('rospost_postcalc_servers');
		}

		if (isset($this->request->post['rospost_postcalc_city_as_pindex'])) {
			$data['rospost_postcalc_city_as_pindex'] = $this->request->post['rospost_postcalc_city_as_pindex'];
		} else {
			$data['rospost_postcalc_city_as_pindex'] = $this->config->get('rospost_postcalc_city_as_pindex');
		}

		if (isset($this->request->post['rospost_postcalc_allow_detail_title'])) {
			$data['rospost_postcalc_allow_detail_title'] = $this->request->post['rospost_postcalc_allow_detail_title'];
		} else {
			$data['rospost_postcalc_allow_detail_title'] = $this->config->get('rospost_postcalc_allow_detail_title');
		}

		if (isset($this->request->post['rospost_postcalc_allow_detail_types'])) {
			$data['rospost_postcalc_allow_detail_types'] = $this->request->post['rospost_postcalc_allow_detail_types'];
		} else {
			$data['rospost_postcalc_allow_detail_types'] = $this->config->get('rospost_postcalc_allow_detail_types');
		}

		if (isset($this->request->post['rospost_postcalc_ico_type'])) {
			$data['rospost_postcalc_ico_type'] = $this->request->post['rospost_postcalc_ico_type'];
		} else {
			$data['rospost_postcalc_ico_type'] = $this->config->get('rospost_postcalc_ico_type');
		}

		if (isset($this->request->post['rospost_postcalc_ico_size'])) {
			$data['rospost_postcalc_ico_size'] = $this->request->post['rospost_postcalc_ico_size'];
		} else {
			$data['rospost_postcalc_ico_size'] = $this->config->get('rospost_postcalc_ico_size');
		}

		if (isset($this->request->post['rospost_postcalc_ico_pos'])) {
			$data['rospost_postcalc_ico_pos'] = $this->request->post['rospost_postcalc_ico_pos'];
		} else {
			$data['rospost_postcalc_ico_pos'] = $this->config->get('rospost_postcalc_ico_pos');
		}

		if (isset($this->request->post['rospost_postcalc_show_cod'])) {
			$data['rospost_postcalc_show_cod'] = $this->request->post['rospost_postcalc_show_cod'];
		} else {
			$data['rospost_postcalc_show_cod'] = $this->config->get('rospost_postcalc_show_cod');
		}

		if (isset($this->request->post['rospost_postcalc_append_cod_to_total'])) {
			$data['rospost_postcalc_append_cod_to_total'] = $this->request->post['rospost_postcalc_append_cod_to_total'];
		} else {
			$data['rospost_postcalc_append_cod_to_total'] = $this->config->get('rospost_postcalc_append_cod_to_total');
		}

		if (isset($this->request->post['rospost_postcalc_allow_part_package'])) {
			$data['rospost_postcalc_allow_part_package'] = $this->request->post['rospost_postcalc_allow_part_package'];
		} else {
			$data['rospost_postcalc_allow_part_package'] = $this->config->get('rospost_postcalc_allow_part_package');
		}

		if (isset($this->request->post['rospost_postcalc_type'])) {
			$data['rospost_postcalc_type'] = $this->request->post['rospost_postcalc_type'];
		} else {
			$data['rospost_postcalc_type'] = $this->config->get('rospost_postcalc_type');
		}

		if (isset($this->request->post['rospost_postcalc_only_costtype'])) {
			$data['rospost_postcalc_only_costtype'] = $this->request->post['rospost_postcalc_only_costtype'];
		} else {
			$data['rospost_postcalc_only_costtype'] = $this->config->get('rospost_postcalc_only_costtype');
		}

		//$this->load->model('localisation/zone');
		//$data['zones'] = $this->model_localisation_zone->getZonesByCountryId(176); // russia

		$this->load->model('shipping/rospost');
		$data['inside_post'] = $this->model_shipping_rospost->getInsidePosts();

		if($v2) {
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			
			if($v22) {
				$this->response->setOutput($this->load->view('shipping/rospost', $data));
			}
			else {
				$this->response->setOutput($this->load->view('shipping/rospost.tpl', $data));	
			}
		}
		else {
			$this->data = $data;
			$this->template = 'shipping/rospost.tpl';
			$this->children = array(
				'common/header',
				'common/footer'
			);
			$this->response->setOutput($this->render());
		}
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'shipping/rospost')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['rospost_name']) {
			$this->error['name'] = $this->language->get('error_name');
		}

		/* postcalc */

		if (!$this->request->post['rospost_postcalc_source']) {
			$this->error['source'] = $this->language->get('error_source');
		}

		if (!$this->request->post['rospost_postcalc_st']) {
			$this->error['st'] = $this->language->get('error_st');
		}

		if (!$this->request->post['rospost_postcalc_ml']) {
			$this->error['ml'] = $this->language->get('error_ml');
		}

		if (!$this->request->post['rospost_postcalc_default_from']) {
			$this->error['default_from'] = $this->language->get('error_default_from');
		}

		if (!$this->request->post['rospost_postcalc_cache_dir']) {
			$this->error['cache_dir'] = $this->language->get('error_cache_dir');
		}

		if (!$this->request->post['rospost_postcalc_servers']) {
			$this->error['servers'] = $this->language->get('error_servers');
		}

		return !$this->error;
	}

	// simple call lib PostcalcLight.
	public function get_test()	{
		$out = array();
		if($this->config->get('rospost_status')) {

			// load lib
			if(method_exists($this->load, 'library'))
				$this->load->library('rospostcalclight');
			if(!isset($this->rospostcalclight) && class_exists('RospostCalclight'))
				$this->registry->set('rospostcalclight', new RospostCalclight($this->registry));
			else 
				exit("can't load library RospostCalclight");

			// default values
			$From = 'Москва';
			$To = 'Владивосток';
			$Weight = 1000;
			$Valuation = 500;
			$Country = 'RU';

			$arrResponse = $this->rospostcalclight->postcalc_request($From, $To, $Weight, $Valuation, $Country);

			if (!is_array($arrResponse)) {
				$out = array(
					'error' => 'Произошла ошибка: ' . $arrResponse,
					'data' => '',
				);
				if(count(error_get_last())) {
					$arrError = error_get_last();
					$out['error'] .= "| Ошибка PHP, строка $arrError[line] в файле $arrError[file]:</span><div> $arrError[message]";
				}
			}
			else {
				// Status=='OK'
				$out = array(
					'error' => '',
					'data' => ''
				);
				$dt = array();
				foreach ($arrResponse['Отправления'] as $parcel) {
					$dt[] = array(
						'name' => $parcel['Название'],
						'ship' => $parcel['Доставка'],
						'time' => $parcel['СрокДоставки']
					);
				}
				$out['data'] = $dt;
			}
		}
		else {
			$this->load->language('shipping/rospost');
			$out = array(
				'error' => $this->language->get('text_module_not_ready'),
				'data' => '',
			);
		}
		$this->response->setOutput(json_encode($out));
	}

	public function get_log() {
		$out = array();
		if($this->config->get('rospost_status')) {
			// load lib
			if(method_exists($this->load, 'library'))
				$this->load->library('rospostcalclight');
			if(!isset($this->rospostcalclight) && class_exists('RospostCalclight'))
				$this->registry->set('rospostcalclight', new RospostCalclight($this->registry));
			else 
				exit("can't load library RospostCalclight");

			$data = array();

			if (isset($_GET['logfile']) && strpos($_GET['logfile'], $this->rospostcalclight->get('config_cache_dir_path') . "/postcalc_") === 0) {
				$data['head'] = "Файл журнала: " . basename($_GET['logfile']);
				$fp = fopen($_GET['logfile'], 'r');
				$data['content'] = '';
				while ($logline = fgets($fp))
					$data['content'] .= rawurldecode($logline) . "<br />";
				fclose($fp);
			}
			elseif (isset($_GET['date'])) {
				$date = $_GET['date'];
				$month = substr($date, 0, 7);
				$file_prefix = isset($_GET['errorlog']) ? 'postcalc_error_' : 'postcalc_light_';
				$logfile = $this->rospostcalclight->get('config_cache_dir_path') . "/" . $file_prefix . $month . ".log";
				if (file_exists($logfile)) {
					$data['head'] = "Дата: $date";
					$fp = fopen($logfile, 'r');
					$data['content'] = '';
					while($logline = fgets($fp))
						if(strpos($logline, $date) === 0)
							$data['content'] .= rawurldecode($logline) . "<br />";
					fclose($fp);
				} else {
					$data['head'] = '';
					$data['content'] = "Не найден файл $logfile!";
				}
			}
			else {
				$data['head'] = 'Файлы:';
				foreach (glob($this->rospostcalclight->get('config_cache_dir_path') . "/postcalc_*.log") as $logfile)
					$data['content'][] = array(
						'datafile' => rawurlencode($logfile),
						'title' => basename($logfile)
						);
			}
			$out = array(
				'error' => '',
				'data' => $data,
			);
		}
		else {
			$this->load->language('shipping/rospost');
			$out = array(
				'error' => $this->language->get('text_module_not_ready'),
				'data' => '',
			);
		}

		$this->response->setOutput(json_encode($out));
	}

	public function get_stat() {
		$out = array();
		if($this->config->get('rospost_status')) {
			$this->language->load('shipping/rospost');

			// load lib
			if(method_exists($this->load, 'library'))
				$this->load->library('rospostcalclight');
			if(!isset($this->rospostcalclight) && class_exists('RospostCalclight'))
				$this->registry->set('rospostcalclight', new RospostCalclight($this->registry));
			else 
				exit("can't load library RospostCalclight");
				
			$arrStat = $this->rospostcalclight->postcalc_get_stat_arr();
			if (!$arrStat) {
				$out = array(
				'error' => "Файлы журнала в каталоге " . $this->rospostcalclight->get('config_cache_dir') . " не обнаружены!",
				'data' => '',
				);
			}
			else {
				$data = array();
				$month = '';
				$month_current = '';
				$size_month = 0;
				$time_month = 0;
				$num_requests_month = 0;
				$num_failed_requests_month = 0;

        		uksort($arrStat, function($a, $b) { if ($a > $b) return 1; });

				foreach ($arrStat as $date => $arr_values) {
					$month = substr($date, 0, 7);
					// Начало нового месяца
					if($month != $month_current) {
						if(!isset($data[$month]['errors'])) {
							$data[$month]['errors'] = '';
						}
						// Если это не самый первый месяц, до него уже была таблица - делаем summmary.
						if ($month_current) {
							$data[$month_current]['common'] = $this->postcalc_month_summary($num_requests_month, $size_month, $time_month, $num_failed_requests_month);
							$size_month = 0;
							$time_month = 0;
							$num_requests_month = 0;
							$num_failed_requests_month = 0;
						}
						$data[$month]['month'] = $month;
						$month_current = $month;
					}
					$size = 0;
					$num_requests = 0;
					$time_elapsed = 0;
					extract($arr_values);
					$size_month += $size * $num_requests;
					$time_month += $time_elapsed * $num_requests;
					$num_requests_month += $num_requests;
					$num_failed_requests_month += $errors;
					$data[$month]['lines'][] = array(
						'date' => $date,
						'num_requests' => $num_requests,
						'time_elapsed' => $time_elapsed,
						'size' => $size
						);
					if($errors > 0) {
						$data[$month]['errors'][$date] = $errors;
					}
				}
				// для самой последней таблицы, ее summary.
				$data[$month]['common'] = $this->postcalc_month_summary($num_requests_month, $size_month, $time_month, $num_failed_requests_month);
				$out = array(
					'error' => '',
					'data' => $data,
				);
			}
		}
		else {
			$this->load->language('shipping/rospost');
			$out = array(
				'error' => $this->language->get('text_module_not_ready'),
				'data' => '',
			);
		}
		
		$this->response->setOutput(json_encode($out));
	}

	/**
	* Вспомогательная функция - делает summary после каждой таблицы с данными за месяц. 
	* Используется только в postcalc_light_stat.php.
	* 
	* @ignore
	* @param integer $num_requests_month
	* @param float $size_month
	* @param float $time_month
	* @return string
	*/
	private function postcalc_month_summary($num_requests_month, $size_month, $time_month, $num_failed_requests_month) {
		$this->load->language('shipping/rospost');
		$out = '';
		$out .= sprintf($this->language->get('text_num_requests_month'), $num_requests_month);
		// Может быть и так, что число успешных запросов равно нулю. Маленький workaround, чтобы не делить на 0.
		$num_requests_month = $num_requests_month ? $num_requests_month : 1;
		$out .= sprintf($this->language->get('text_stat_request_month'), round($size_month / $num_requests_month));
		$out .= sprintf($this->language->get('text_stat_size_month'), number_format(($size_month / 1024), 1, '.', ''));
		$out .= sprintf($this->language->get('text_stat_time_month'), number_format(($time_month / $num_requests_month), 3, '.', ''));
		$out .= sprintf($this->language->get('text_stat_num_failed_requests_month'), $num_failed_requests_month);
		return $out;
	}

	public function install() {
		$this->load->model('shipping/rospost');
		$this->model_shipping_rospost->install();
	}
	public function uninstall() {
		$this->load->model('shipping/rospost');
		$this->model_shipping_rospost->uninstall();
	}
}
?>