<?php
class ControllerModuleBlankPrint extends Controller {
  private $error = array(); 


public function formBlankPrint()
{
	$full = array(" город", "улица", "набережная", "проспект", "поселок", "переулок", "район", "набережная", "площадь", "бульвар", "шоссе", " дом", "корпус", "строение", "квартира","область");
	$short = array(" г.", "ул.", "наб.", "пр-кт.", "п.", "пер.", "р-он.", "наб.", "пл.", "б-р.", "ш.", " д.", "корп.", "стр.", "кв.","обл.");
	
	
	$this->load->model('sale/order');
	$order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);
	$from_module = $this->config->get('blankprint_module');
	
	if (isset($from_module))
	{
	if (isset($from_module['settings']))
		{
			$settings = $from_module['settings'];
			$data['settings'] = $settings;
			$data['bkey'] =  $settings['bkey'];
		}
		
		$profiles = array();
		foreach ($from_module as $key=>$value) {
		if (is_int($key))
		{
			$profiles[$key] = array_map('html_entity_decode', $value);
			if ($settings['short_addr'] == 'on') $profiles[$key]['shop_addr'] = str_ireplace($full, $short,$profiles[$key]['shop_addr']);
		}}
		
	$data['profiles'] = $profiles;
	
	} else 
	{
		$data['profiles']= array();
		$data['settings']= array();
	}
	
	$p = $this->model_sale_order->getOrderProducts($this->request->get['order_id']);
	
	$products = array();

	foreach($p as $product)
		{
		$products[] = array(
			'name' => $product['name'],
	   		'quantity' => $product['quantity'] ,
	   		'price' => $product['price']
			);
		}

	if (isset($settings['opis']))
		$data['products'] = array_merge($products, $settings['opis']);
	else
		$data['products'] = $products;

	//var_dump($order_info);
	$data['client_name'] = trim($order_info['payment_lastname']) . ' ' . trim($order_info['payment_firstname']);
	$data['client_index'] = $order_info['payment_postcode'];
	
	if ($settings['country'] == 'off')
		$data['client_addr'] = trim( $order_info['payment_address_1'] . $order_info['payment_address_2'] . ', ' . $order_info['payment_city'] . ', ' . $order_info['payment_zone']);
	else
	$data['client_addr'] = trim( str_replace(',','',$order_info['payment_address_1']) . str_replace(',','',$order_info['payment_address_2']) . ', ' . str_replace(',','',$order_info['payment_city']) . ' ' . str_replace(',','',$order_info['payment_zone']) . ', ' . str_replace(',','',$order_info['payment_country']));
	
	if ($settings['short_addr'] == 'on') $data['client_addr'] = str_ireplace($full, $short,$data['client_addr']);
		
	$data['client_phone'] = $order_info['telephone'];
	
	$pr_total = 0;
	foreach ($data['products'] as $product)
		$pr_total += $product['price'] * $product['quantity'];
		
	if ($settings['typesum'] == 'auto')
	{
		$data['sum_ob'] =  $order_info['total'];
		$data['sum_nal'] = $order_info['total'];
		
	}
	else 
	{
		$data['sum_ob'] =  0;
		$data['sum_nal'] = 0;
	}
	
	
	
	$this->response->setOutput($this->load->view('module/blankprint_form.tpl', $data));
	
	
}	
	
	
 public function index() {   

		$this->load->language('module/blankprint');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('blankprint', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/blankprint', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/blankprint', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['blankprint_module'])) {
			$data['blankprint_module'] = $this->request->post['blankprint_module'];
		} elseif ($this->config->get('blankprint_module')) { 
			$data['blankprint_module'] = $this->config->get('blankprint_module');
		}	
		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/blankprint.tpl', $data));
	}

  private function validate() {
    if (!$this->user->hasPermission('modify', 'module/blankprint')) {
      $this->error['warning'] = $this->language->get('error_permission');
    }

    if (!$this->error) {
      return true;
    } else {
      return false;
    } 
  }
}
?>