<?php 
class ControllerPaymentYandexMoney extends Controller {
	private $error = array(); 

	public function index() {
		
		$data['dkaModuleName'] = "DKA Yandex.Kassa";
        $data['dkaModuleNameUID'] = "dka_kassa";
        $data['dkaModuleMajorVersion'] = "1";
        $data['dkaModuleMinorVersion'] = "1"; 
        $data['dkaModuleBuildVersion'] = "2";
        $data['dkaModuleDateRelease'] = "10.10.2015";
        $data['dkaModuleAddressUpdate'] = 'http://dreamclever.ru/updates/dka_update.xml';
        $data['dkaModuleUpdate'] = $this->url->link('payment/yandexmoney/check_dka_update', 'token=' . $this->session->data['token'] . '&dkaModuleAddressUpdate=' . $data['dkaModuleAddressUpdate'], 'SSL');
		
		$this->language->load('payment/yandexmoney');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
        $this->load->model('catalog/product');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('yandexmoney', $this->request->post);				
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		
		$url = new Url(HTTP_CATALOG, $this->config->get('config_secure') ? HTTP_CATALOG : HTTPS_CATALOG);

		$urlCheck_url = str_replace("http://", "https://", $url->link('payment/yandexmoney/callback', 'check=1', 'SSL'));
		$data['check_url'] = $urlCheck_url;
		$urlCallback_url = str_replace("http://", "https://", $url->link('payment/yandexmoney/callback', '', 'SSL'));
		$data['callback_url'] = $urlCallback_url;
		$data['shopSuccessURL'] = $url->link('checkout/success', '', 'SSL');
		$data['shopFailURL'] = $url->link('checkout/failure', '', 'SSL');
		
		$data['heading_title'] =    $this->language->get('heading_title');

		$data['text_payment'] = $this->language->get('text_pay');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
        $data['text_edit'] = $this->language->get('text_edit');
		$data['text_welcome1'] = $this->language->get('text_welcome1');
		$data['text_welcome2'] = $this->language->get('text_welcome2');
		$data['text_params'] = $this->language->get('text_params');
		$data['text_param_name'] = $this->language->get('text_param_name');
		$data['text_param_value'] = $this->language->get('text_param_value');
		$data['text_aviso1'] = $this->language->get('text_aviso1');
		$data['text_aviso2'] = $this->language->get('text_aviso2');
		
		$data['entry_testmode'] = $this->language->get('entry_testmode');
		$data['entry_modes'] = $this->language->get('entry_modes');
		$data['entry_mode1'] = $this->language->get('entry_mode1');
		$data['entry_mode2'] = $this->language->get('entry_mode2');
		$data['entry_methods'] = $this->language->get('entry_methods');
		$data['entry_method_ym'] = $this->language->get('entry_method_ym');
		$data['entry_method_cards'] = $this->language->get('entry_method_cards');
		$data['entry_method_cash'] = $this->language->get('entry_method_cash');
		$data['entry_method_mobile'] = $this->language->get('entry_method_mobile');
		$data['entry_method_wm'] = $this->language->get('entry_method_wm');
		$data['entry_method_ab'] = $this->language->get('entry_method_ab');
		$data['entry_method_sb'] = $this->language->get('entry_method_sb');

		$data['entry_shopid'] = $this->language->get('entry_shopid');
		$data['entry_scid'] = $this->language->get('entry_scid');
		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_total2'] = $this->language->get('entry_total2');

		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_account'] = $this->language->get('entry_account');
        $data['entry_field'] = "Поля запроса для оплаты через Яндекс";
        $data['entry_modal_info_text'] = "Информационное сообщение для клиента";
        
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
        $data['token'] = $this->session->data['token'];
        
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['account'])) { 
			$data['error_account'] = $this->error['account'];
		} else {
			$data['error_account'] = '';
		}
		if (isset($this->error['methods'])) { 
			$data['error_methods'] = $this->error['methods'];
		} else {
			$data['error_methods'] = '';
		}
		if (isset($this->error['account'])) { 
			$data['error_account'] = $this->error['account'];
		} else {
			$data['error_account'] = '';
		}
		if (isset($this->error['password'])) { 
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
		}
		if (isset($this->error['shopid'])) { 
			$data['error_shopid'] = $this->error['shopid'];
		} else {
			$data['error_shopid'] = '';
		}
		if (isset($this->error['scid'])) { 
			$data['error_scid'] = $this->error['scid'];
		} else {
			$data['error_scid'] = '';
		}
		
        $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_payment'),
			'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('payment/yandexmoney', 'token=' . $this->session->data['token'], 'SSL')
		);
		
		
        $data['action'] = $this->url->link('payment/yandexmoney', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
        
        $data['dkaSelectProduct'] = $this->url->link('payment/yandexmoney/select_product', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['yandexmoney_testmode'])) {
			$data['yandexmoney_testmode'] = $this->request->post['yandexmoney_testmode'];
		} else {
			$data['yandexmoney_testmode'] = $this->config->get('yandexmoney_testmode');
		}
	
		if (isset($this->request->post['yandexmoney_account'])) {
			$data['yandexmoney_account'] = $this->request->post['yandexmoney_account'];
		} else {
			$data['yandexmoney_account'] = $this->config->get('yandexmoney_account');
		}

		if (isset($this->request->post['yandexmoney_method_ym'])) {
			$data['yandexmoney_method_ym'] = $this->request->post['yandexmoney_method_ym'];
		} else {
			$data['yandexmoney_method_ym'] = $this->config->get('yandexmoney_method_ym');
		}

		if (isset($this->request->post['yandexmoney_method_cards'])) {
			$data['yandexmoney_method_cards'] = $this->request->post['yandexmoney_method_cards'];
		} else {
			$data['yandexmoney_method_cards'] = $this->config->get('yandexmoney_method_cards');
		}
		
		if (isset($this->request->post['yandexmoney_method_cash'])) {
			$data['yandexmoney_method_cash'] = $this->request->post['yandexmoney_method_cash'];
		} else {
			$data['yandexmoney_method_cash'] = $this->config->get('yandexmoney_method_cash');
		}

		if (isset($this->request->post['yandexmoney_method_mobile'])) {
			$data['yandexmoney_method_mobile'] = $this->request->post['yandexmoney_method_mobile'];
		} else {
			$data['yandexmoney_method_mobile'] = $this->config->get('yandexmoney_method_mobile');
		}

		if (isset($this->request->post['yandexmoney_method_wm'])) {
			$data['yandexmoney_method_wm'] = $this->request->post['yandexmoney_method_wm'];
		} else {
			$data['yandexmoney_method_wm'] = $this->config->get('yandexmoney_method_wm');
		}

		if (isset($this->request->post['yandexmoney_method_ab'])) {
			$data['yandexmoney_method_ab'] = $this->request->post['yandexmoney_method_ab'];
		} else {
			$data['yandexmoney_method_ab'] = $this->config->get('yandexmoney_method_ab');
		}

		if (isset($this->request->post['yandexmoney_method_sb'])) {
			$data['yandexmoney_method_sb'] = $this->request->post['yandexmoney_method_sb'];
		} else {
			$data['yandexmoney_method_sb'] = $this->config->get('yandexmoney_method_sb');
		}

		if (isset($this->request->post['yandexmoney_mode'])) {
			$data['yandexmoney_mode'] = $this->request->post['yandexmoney_mode'];
		} else {
			$data['yandexmoney_mode'] = $this->config->get('yandexmoney_mode');
		}

		if (isset($this->request->post['yandexmoney_password'])) {
			$data['yandexmoney_password'] = $this->request->post['yandexmoney_password'];
		} else {
			$data['yandexmoney_password'] = $this->config->get('yandexmoney_password');
		}

		if (isset($this->request->post['yandexmoney_shopid'])) {
			$data['yandexmoney_shopid'] = $this->request->post['yandexmoney_shopid'];
		} else {
			$data['yandexmoney_shopid'] = $this->config->get('yandexmoney_shopid');
		}
		
		
		if (isset($this->request->post['yandexmoney_scid'])) {
			$data['yandexmoney_scid'] = $this->request->post['yandexmoney_scid'];
		} else {
			$data['yandexmoney_scid'] = $this->config->get('yandexmoney_scid');
		}
		
		if (isset($this->request->post['yandexmoney_total'])) {
			$data['yandexmoney_total'] = $this->request->post['yandexmoney_total'];
		} else {
			$data['yandexmoney_total'] = $this->config->get('yandexmoney_total'); 
		} 
				
		if (isset($this->request->post['yandexmoney_order_status_id'])) {
			$data['yandexmoney_order_status_id'] = $this->request->post['yandexmoney_order_status_id'];
		} else {
			$data['yandexmoney_order_status_id'] = $this->config->get('yandexmoney_order_status_id'); 
		} 

		$this->load->model('localisation/order_status');
		
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		if (isset($this->request->post['yandexmoney_geo_zone_id'])) {
			$data['yandexmoney_geo_zone_id'] = $this->request->post['yandexmoney_geo_zone_id'];
		} else {
			$data['yandexmoney_geo_zone_id'] = $this->config->get('yandexmoney_geo_zone_id'); 
		} 		
		
		$this->load->model('localisation/geo_zone');
										
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		if (isset($this->request->post['yandexmoney_status'])) {
			$data['yandexmoney_status'] = $this->request->post['yandexmoney_status'];
		} else {
			$data['yandexmoney_status'] = $this->config->get('yandexmoney_status');
		}
		
		if (isset($this->request->post['yandexmoney_sort_order'])) {
			$data['yandexmoney_sort_order'] = $this->request->post['yandexmoney_sort_order'];
		} else {
			$data['yandexmoney_sort_order'] = $this->config->get('yandexmoney_sort_order');
		}
        
        if (isset($this->request->post['yandexmoney_procent'])) {
			$data['yandexmoney_procent'] = $this->request->post['yandexmoney_procent'];
		} else {
			$data['yandexmoney_procent'] = $this->config->get('yandexmoney_procent');
		}
        
        if (isset($this->request->post['yandexmoney_procent_text'])) {
			$data['yandexmoney_procent_text'] = $this->request->post['yandexmoney_procent_text'];
		} else {
			$data['yandexmoney_procent_text'] = $this->config->get('yandexmoney_procent_text');
		}
        
        if (isset($this->request->post['yandexmoney_procent_count'])) {
			$data['yandexmoney_procent_count'] = $this->request->post['yandexmoney_procent_count'];
		} else {
			$data['yandexmoney_procent_count'] = $this->config->get('yandexmoney_procent_count');
		}
		
		if (isset($this->request->post['yandexmoney_update'])) {
			$data['yandexmoney_update'] = $this->request->post['yandexmoney_update'];
		} else {
			$data['yandexmoney_update'] = $this->config->get('yandexmoney_update');
		}
        
        if (isset($this->request->post['yandexmoney_update_modal'])) {
			$data['yandexmoney_update_modal'] = $this->request->post['yandexmoney_update_modal'];
		} else {
			$data['yandexmoney_update_modal'] = $this->config->get('yandexmoney_update_modal');
		}
        
        if (isset($this->request->post['yandexmoney_copyright'])) {
			$data['yandexmoney_copyright'] = $this->request->post['yandexmoney_copyright'];
		} else {
			$data['yandexmoney_copyright'] = $this->config->get('yandexmoney_copyright');
		}  
        
        if (isset($this->request->post['yandexmoney_need_fio'])) {
			$data['yandexmoney_need_fio'] = $this->request->post['yandexmoney_need_fio'];
		} else {
			$data['yandexmoney_need_fio'] = $this->config->get('yandexmoney_need_fio');
		}
        
        if (isset($this->request->post['yandexmoney_need_email'])) {
			$data['yandexmoney_need_email'] = $this->request->post['yandexmoney_need_email'];
		} else {
			$data['yandexmoney_need_email'] = $this->config->get('yandexmoney_need_email');
		}
        
        if (isset($this->request->post['yandexmoney_need_phone'])) {
			$data['yandexmoney_need_phone'] = $this->request->post['yandexmoney_need_phone'];
		} else {
			$data['yandexmoney_need_phone'] = $this->config->get('yandexmoney_need_phone');
		} 
        
        if (isset($this->request->post['yandexmoney_need_address'])) {
			$data['yandexmoney_need_address'] = $this->request->post['yandexmoney_need_address'];
		} else {
			$data['yandexmoney_need_address'] = $this->config->get('yandexmoney_need_address');
		} 
            
        if (isset($this->request->post['yandexmoney_modal_client'])) {
			$data['yandexmoney_modal_client'] = $this->request->post['yandexmoney_modal_client'];
		} else {
			$data['yandexmoney_modal_client'] = $this->config->get('yandexmoney_modal_client');
		}
		
		if (isset($this->request->post['yandexmoney_modal_type'])) {
			$data['yandexmoney_modal_type'] = $this->request->post['yandexmoney_modal_type'];
		} else {
			$data['yandexmoney_modal_type'] = $this->config->get('yandexmoney_modal_type');
		}
		
		if (isset($this->request->post['yandexmoney_modal_text'])) {
			$data['yandexmoney_modal_text'] = $this->request->post['yandexmoney_modal_text'];
		} else {
			$data['yandexmoney_modal_text'] = $this->config->get('yandexmoney_modal_text');
		}
		
		if (isset($this->request->post['yandexmoney_modal_product'])) {
			$data['yandexmoney_modal_product'] = $this->request->post['yandexmoney_modal_product'];
		} else {
			$data['yandexmoney_modal_product'] = $this->config->get('yandexmoney_modal_product');
		}
		
		// Downloads
		$this->load->model('catalog/product');

		if (isset($this->request->post['yandexmoney_modal_product'])) {
			$product_shows = serialize($this->request->post['yandexmoney_modal_product']);
		} else{
			$product_shows = $this->config->get('yandexmoney_modal_product');
		}

		$data['yandexmoney_modal_products'] = array();
        
        if(count($product_shows)){
            foreach ($product_shows as $product_show) {
                $product_info = $this->model_catalog_product->getProduct($product_show);

                if ($product_info) {
                    $data['yandexmoney_modal_products'][] = array(
                        'product_id' => $product_show,
                        'name'        => $product_info['name']
                    );
                }
                
            }
        }

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
				
        $this->response->setOutput($this->load->view('payment/yandexmoney.tpl', $data));
		//$this->response->setOutput($this->render());
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'payment/yandexmoney')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['yandexmoney_password']) {
			$this->error['password'] = $this->language->get('error_password');
		}
		if (!$this->request->post['yandexmoney_account'] && $this->request->post['yandexmoney_mode']==1) {
			$this->error['account'] = $this->language->get('error_account');
		}
		
		if (!$this->request->post['yandexmoney_shopid'] && $this->request->post['yandexmoney_mode']==2) {
			$this->error['shopid'] = $this->language->get('error_shopid');
		}
		if (!$this->request->post['yandexmoney_scid'] && $this->request->post['yandexmoney_mode']==2) {
			$this->error['scid'] = $this->language->get('error_scid');
		}
		

		if (!isset($this->request->post['yandexmoney_method_ym']) && !isset($this->request->post['yandexmoney_method_cards']) && !isset($this->request->post['yandexmoney_method_cash']) and !isset($this->request->post['yandexmoney_method_mobile']) and !isset($this->request->post['yandexmoney_method_wm'])  ) {
			$this->error['methods'] = $this->language->get('error_methods');
		}

		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	// функция, для курления

    public function get_dkaCurl($url,$headers) {
        $handle=curl_init();
        curl_setopt($handle, CURLOPT_URL, $url);
        curl_setopt($handle, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($handle, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
        $response=curl_exec($handle);
        $code=curl_getinfo($handle, CURLINFO_HTTP_CODE);
        return array("code"=>$code,"response"=>$response);
    }
    
    /*-----------------------------------------------------*/
	/*       Автокомплит получение товаров		        */
	/*---------------------------------------------------*/
    public function autocomplete() {
        $this->load->model('catalog/product');
        
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/download');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_catalog_product->getProducts($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'product_id' => $result['product_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}
        
        //echo '<br /><pre>',print_r($results,1),'</pre><br />';

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
    
    /*-----------------------------------------------------*/
	/*       Проверка обновления		        */
	/*---------------------------------------------------*/
	public function check_dka_update(){
        if (isset($this->request->get['dkaModuleAddressUpdate'])) {
			$data['dkaModuleAddressUpdate'] = $this->request->get['dkaModuleAddressUpdate'];
            $dka_name = $this->request->get['dka_name'];
			
            $result = $this->get_dkaCurl($data['dkaModuleAddressUpdate'], array());
            $xml=new SimpleXMLElement($result['response']);
            $searchUpdates = $xml->xpath('update');
            $data['update_info'] = array();
			
			
			foreach($searchUpdates as $searchUpdate){
				if($dka_name == (string)$searchUpdate->attributes()->id)
				{
					$data['update_info']=
					array(
					'id'           => (string)$searchUpdate->attributes()->id,
					'nameAttr'     => (string)$searchUpdate->attributes()->name,
					'date'         => (string)$searchUpdate->date,
					'name'         => (string)$searchUpdate->name,
					'majorVersion' => (string)$searchUpdate->MajorVersion,
					'minorVersion' => (string)$searchUpdate->MinorVersion,
					'buildVersion' => (string)$searchUpdate->BuildVersion,
					'fullVersion'  => (string)$searchUpdate->MajorVersion . (string)$searchUpdate->MinorVersion . (string)$searchUpdate->BuildVersion,
					'news'         => (string)$searchUpdate->news,
                    'logo'         => (string)$searchUpdate->logo,
                    'img'          => (string)$searchUpdate->img,
					'updateUrl'    => (string)$searchUpdate->updateUrl,
					'downloadUrl'  => (string)$searchUpdate->downloadUrl,    
					'info'         => (string)$searchUpdate->info,
					'changelog'    => (string)$searchUpdate->changelog,
					'addinginfo'   => (string)$searchUpdate->addinginfo,
					);
				}
			}
            
            //echo '<br /><pre>',print_r($data['update_info'],1),'</pre><br />';
            
        $this->response->addHeader('Content-Type: application/json; Charset=UTF-8');
        $this->response->setOutput(json_encode($data['update_info']));
        // конец
		}         
    }
    
    public function select_product()
    {
        $this->load->model('catalog/product');
        
        $filter_name = null;
        $filter_model = null;
		$filter_price = null;
		$filter_quantity = null;
		$filter_status = null;
		$sort = 'pd.name';
        $order = 'ASC';
        $page = 1;

		$data['products'] = array();
        $limit_admin = 100;
		$filter_data = array(
			'filter_name'	  => $filter_name,
			'filter_model'	  => $filter_model,
			'filter_price'	  => $filter_price,
			'filter_quantity' => $filter_quantity,
			'filter_status'   => $filter_status,
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $limit_admin,
			'limit'           => $limit_admin
		);

		$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

		$results = $this->model_catalog_product->getProducts($filter_data);

		foreach ($results as $result) {

			$data['products'][] = array(
				'product_id' => $result['product_id'],
				'name'       => $result['name'],
				'model'      => $result['model'],
				'price'      => $result['price'],
			);
		}
		
            
        //echo '<br /><pre>',print_r($data['update_info'],1),'</pre><br />';
            
        $this->response->addHeader('Content-Type: application/json; Charset=UTF-8');
        $this->response->setOutput(json_encode($data));
        // конец
		}         
}
?>