<?php
class ControllerPaymentYandexmoney extends Controller {
	public function index() {
		
		$this->language->load('payment/yandexmoney');

		$yandexMoney = new YandexMoneyObj();
		$yandexMoney->test_mode = $this->config->get('yandexmoney_testmode');
		$yandexMoney->org_mode = ((int)$this->config->get('yandexmoney_mode') == 2);

		$this->load->model('checkout/order');		
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

        $data['procent'] = $this->config->get('yandexmoney_procent');
        $data['dka_kassa_procent_text'] = "";
        if($data['procent'])
        {
            $data['dka_kassa_procent_text'] = $this->config->get('yandexmoney_procent_text');
            $procent_count = $this->config->get('yandexmoney_procent_count');
            $total = ($order_info['total'] * ($procent_count/100)) + $order_info['total'];
            $order_info['total'] = $total;
            $data['total'] = $this->currency->format($this->tax->calculate($total, 0, $this->config->get('config_tax')));
        }
		
		$data['dka_kassa_modal_client'] = $this->config->get('yandexmoney_modal_client');
		$data['dka_kassa_modal_type'] = $this->config->get('yandexmoney_modal_type');
		$data['dka_kassa_modal_text'] = $this->config->get('yandexmoney_modal_text');
		
		$data['dka_kassa_modal_product'] = '';
        if($data['dka_kassa_modal_client'])
        {
            if($data['dka_kassa_modal_type'] == 1)
            {
                $data['dka_kassa_modal_product'] = implode(',',$this->config->get('yandexmoney_modal_product'));
            }
        }
        
		$data['dka_kassa_modal_getProduct'] = $this->url->link('payment/yandexmoney/getProduct', 'token=' . $this->session->data['token'] . '&product_id=' . $data['dka_kassa_modal_product'], 'SSL');
        
		$data['button_confirm'] = $this->language->get('button_confirm');
		$data['action'] = $yandexMoney->getFormUrl();
		$data['order_id'] = $this->session->data['order_id'];
		$data['org_mode'] = $yandexMoney->org_mode;
		$data['account'] = $this->config->get('yandexmoney_account');
		$data['shop_id'] = $this->config->get('yandexmoney_shopid');
		$data['scid'] = $this->config->get('yandexmoney_scid');
		$data['customerNumber'] =$data['order_id'].' ' . $order_info['email'];
		$data['shopSuccessURL'] = $this->url->link('checkout/success', '', 'SSL');
		$data['shopFailURL'] = $this->url->link('checkout/failure', '', 'SSL');
		$data['formcomment'] = $this->config->get('config_name');
		$data['short_dest'] = $this->config->get('config_name');
		$data['comment'] = $order_info['comment'];
		$data['sum'] = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);

		$data['method_ym'] = $this->config->get('yandexmoney_method_ym');
		$data['method_cards'] = $this->config->get('yandexmoney_method_cards');
		$data['method_cash'] = $this->config->get('yandexmoney_method_cash');
		$data['method_mobile'] = $this->config->get('yandexmoney_method_mobile');
		$data['method_wm'] = $this->config->get('yandexmoney_method_wm');
		$data['method_ab'] = $this->config->get('yandexmoney_method_ab');
		$data['method_sb'] = $this->config->get('yandexmoney_method_sb');
        
        $data['need_fio'] = $this->config->get('yandexmoney_need_fio');
        $data['need_email'] = $this->config->get('yandexmoney_need_email');
        $data['need_phone'] = $this->config->get('yandexmoney_need_phone');
        $data['need_address'] = $this->config->get('yandexmoney_need_address');

		$data['method_label'] =  $this->language->get('text_method');
		$data['method_ym_text'] =  $this->language->get('text_method_ym');
		$data['method_cards_text'] =  $this->language->get('text_method_cards');
		$data['method_cash_text'] =  $this->language->get('text_method_cash');
		$data['method_mobile_text'] =  $this->language->get('text_method_mobile');
		$data['method_wm_text'] =  $this->language->get('text_method_wm');
        $data['method_ab_text'] = $this->language->get('text_method_ab');
        $data['method_sb_text'] = $this->language->get('text_method_sb');
        
        $d = 0;
        if ($data['method_ym']){
            $checked = 0;
            if($d == 0) { $checked = 1; }
            $data['view_payment_legal'][$d] = array(
                'name'  => $data['method_ym_text'],
                'img'   => 'image/catalog/yandexmoney/yandex-money.png',
                'value' => 'PC',
                'checked' => $checked,
                'id'    => 'ym1',
            );
            $d++;
        }
        if ($data['method_cards']){
            $checked = 0;
            if($d == 0) { $checked = 1; }
            $data['view_payment_legal'][$d] = array(
                'name'  => $data['method_cards_text'],
                'img'   => 'image/catalog/yandexmoney/visa.png',
                'value' => 'AC',
                'checked' => $checked,
                'id'    => 'ym2',
            );
            $d++;
        }
        if ($data['method_cash']){
            $checked = 0;
            if($d == 0) { $checked = 1; }
            $data['view_payment_legal'][$d] = array(
                'name'  => $data['method_cash_text'],
                'img'   => 'image/catalog/yandexmoney/cash.png',
                'value' => 'GP',
                'checked' => $checked,
                'id'    => 'ym3',
            );
            $d++;
        }
        if ($data['method_mobile']){
            $checked = 0;
            if($d == 0) { $checked = 1; }
            $data['view_payment_legal'][$d] = array(
                'name'  => $data['method_mobile_text'],
                'img'   => 'image/catalog/yandexmoney/mobile_phone.png',
                'value' => 'MC',
                'checked' => $checked,
                'id'    => 'ym4',
            );
            $d++;
        }
        if ($data['method_wm']){
            $checked = 0;
            if($d == 0) { $checked = 1; }
            $data['view_payment_legal'][$d] = array(
                'name'  => $data['method_wm_text'],
                'img'   => 'image/catalog/yandexmoney/webmoney.png',
                'value' => 'WM',
                'checked' => 0,
                'id'    => 'ym5',
            );
            $d++;
        }
        if ($data['method_ab']){
            $checked = 0;
            if($d == 0) { $checked = 1; }
            $data['view_payment_legal'][$d] = array(
                'name'  => $data['method_ab_text'],
                'img'   => 'image/catalog/yandexmoney/alfa-click.png',
                'value' => 'AB',
                'checked' => $checked,
                'id'    => 'ym6',
            );
            $d++;
        }
        if ($data['method_sb']){
            $checked = 0;
            if($d == 0) { $checked = 1; }
            $data['view_payment_legal'][$d] = array(
                'name'  => $data['method_sb_text'],
                'img'   => 'image/catalog/yandexmoney/sberbank.png',
                'value' => 'SB',
                'checked' => $checked,
                'id'    => 'ym7',
            );
            $d++;
        }
        
        $e = 0;
        if ($data['method_ym']){
            $checkedE = 0;
            if($e == 0) { $checkedE = 1; }
            $data['view_payment_phys'][$e] = array(
                'name'   => $data['method_ym_text'],
                'img'    => 'image/catalog/yandexmoney/yandex-money.png',
                'value'  => 'PC',
                'checked' => $checkedE,
                'id'     => 'ym1',
            );
            $e++;
            
        }
        if ($data['method_cards']){
            $checkedE = 0;
            if($e == 0) { $checkedE = 1; }
            $data['view_payment_phys'][$e] = array(
                'name'   => $data['method_cards_text'],
                'img'    => 'image/catalog/yandexmoney/visa.png',
                'value'  => 'AC',
                'checked' => $checkedE,
                'id'     => 'ym2',
            );
            $e++;
        }
        
		$data['order_text'] =  $this->language->get('text_order');
		
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/yandexmoney.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/payment/yandexmoney.tpl', $data);
			} else {
				return $this->load->view('default/template/payment/yandexmoney.tpl', $data);
			}
        
	}

	public function callback() {
    	$ymObj = new YandexMoneyObj();
		$callbackParams = $this->request->post;
		$callbackParams = $_POST;
		$mode = $this->config->get('yandexmoney_mode');
		$ymObj->org_mode = ($mode == 2);
		$ymObj->password = $this->config->get('yandexmoney_password');
		$ymObj->shopid = $this->config->get('yandexmoney_shopid');
        //echo '<br /><pre>',print_r($callbackParams,1),'</pre><br />';
		if ($ymObj->org_mode){
            
			if ($callbackParams['action'] == 'checkOrder'){
                //echo "checkOrder";
				$code = $ymObj->checkOrder($callbackParams);
				$ymObj->sendCode($callbackParams, $code);
				$order_id = (int)$callbackParams["orderNumber"];
			}
			if ($callbackParams['action'] == 'paymentAviso'){
                //echo "paymentAviso";
				$ymObj->checkOrder($callbackParams, TRUE, TRUE);
			}
		}else{
			$check = $ymObj->individualCheck($callbackParams);
			if (!$check){
				exit;
			}else{
				$order_id = (int)$callbackParams["label"];
			}
		}

		if ($order_id){
			$this->load->model('checkout/order');
			$order_info = $this->model_checkout_order->getOrder($order_id);
			$res = $this->model_checkout_order->addOrderHistory($order_id, $this->config->get('yandexmoney_order_status_id'));	
			$order_info = $this->model_checkout_order->getOrder($order_id);
		}		
	}
	
	public function getProduct() {
		
		if (isset($this->request->get['product_id'])) {
            
			$this->load->model('catalog/product');
            
            $product_id_array = explode(',', $this->request->get['product_id']);
			$jsonProduct['product'] = array();
            
            foreach($product_id_array as $product_id){
                
                $product_info = $this->model_catalog_product->getProduct($product_id);
                
                $price = false;
                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $price = false;
                }

                $this->load->model('tool/image');
                
                $image_popup = '';
				if ($product_info['image']) {
					$image_popup = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				} else {
					$image_popup = '';
				}
                
                $image_thumb = '';
				if ($product_info['image']) {
					$image_thumb = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
				} else {
					$image_thumb = '';
				}
                
                
                $jsonProduct['product'][] = array(
                    'name' => $product_info['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                    'href' => $this->url->link('product/product', '&product_id=' . $product_id),
                    'price' => $price,
                    'popup' => $image_popup,
                    'thumb' => $image_thumb
                );
            }

			$this->response->addHeader('Content-Type: application/json; Charset=UTF-8');
			$this->response->setOutput(json_encode($jsonProduct['product']));
		}
	}
}

define("YM_PC", 'PC');
define("YM_AC", 'AC');
define("YM_GP", 'GP');
define("YM_MC", 'MC');
define("YM_WM", 'WM');
define("YM_AB", 'AB');
define("YM_SB", 'SB');

Class YandexMoneyObj {
	public $test_mode;
	public $org_mode;

	public $order_id;

	public $reciver;
	public $formcomment;
	public $short_dest;
	public $writable_targets = 'false';
	public $comment_needed = 'true';
	public $label;
	public $quickpay_form = 'shop';
	public $payment_type = '';
	public $targets;
	public $sum;
	public $comment;
	public $need_fio = 'true';
	public $need_email = 'true';
	public $need_phone = 'true';
	public $need_address = 'true';

	public $shopid;
	public $password;
	


	/*constructor*/
	public function __construct(){
		
	}

	public function getFormUrl(){
		if (!$this->org_mode){
			return $this->individualGetFormUrl();
		}else{
			return $this->orgGetFormUrl();
		}
	}

	public function individualGetFormUrl(){
		if ($this->test_mode){
			return 'https://demomoney.yandex.ru/quickpay/confirm.xml';
		}else{
			return 'https://money.yandex.ru/quickpay/confirm.xml';
		}
	}

	public function orgGetFormUrl(){
		if ($this->test_mode){
            return 'https://demomoney.yandex.ru/eshop.xml';
        } else {
            return 'https://money.yandex.ru/eshop.xml';
        }
	}

	public function checkSign($callbackParams){
		$string = $callbackParams['action'].';'.$callbackParams['orderSumAmount'].';'.$callbackParams['orderSumCurrencyPaycash'].';'.$callbackParams['orderSumBankPaycash'].';'.$callbackParams['shopId'].';'.$callbackParams['invoiceId'].';'.$callbackParams['customerNumber'].';'.$this->password;
		$md5 = strtoupper(md5($string));
		return ($callbackParams['md5']==$md5);
	}

	public function checkOrder($callbackParams, $sendCode=FALSE, $aviso=FALSE){ 
		
		if ($this->checkSign($callbackParams)){
			$code = 0;
		}else{
			$code = 1;
		}
        //echo "<script type='text/javascript'>alert('$code')</script>";
		if ($sendCode){
			if ($aviso){
				$this->sendAviso($callbackParams, $code);	
			}else{
				$this->sendCode($callbackParams, $code);	
			}
			exit;
		}else{
			return $code;
		}
	}

	public function sendCode($callbackParams, $code){
		header("Content-type: text/xml; charset=utf-8");
		$xml = '<?xml version="1.0" encoding="UTF-8"?>
			<checkOrderResponse performedDatetime="'.date("c").'" code="'.$code.'" invoiceId="'.$callbackParams['invoiceId'].'" shopId="'.$this->shopid.'"/>';
		echo $xml;
	}

	public function sendAviso($callbackParams, $code){
		header("Content-type: text/xml; charset=utf-8");
		$xml = '<?xml version="1.0" encoding="UTF-8"?>
			<paymentAvisoResponse performedDatetime="'.date("c").'" code="'.$code.'" invoiceId="'.$callbackParams['invoiceId'].'" shopId="'.$this->shopid.'"/>';
		echo $xml;
	}

	public function individualCheck($callbackParams){
		$string = $callbackParams['notification_type'].'&'.$callbackParams['operation_id'].'&'.$callbackParams['amount'].'&'.$callbackParams['currency'].'&'.$callbackParams['datetime'].'&'.$callbackParams['sender'].'&'.$callbackParams['codepro'].'&'.$this->password.'&'.$callbackParams['label'];
		$check = (sha1($string) == $callbackParams['sha1_hash']);
		if (!$check){
			header('HTTP/1.0 401 Unauthorized');
			return false;
		}
		return true;
	
	}
}


?>
