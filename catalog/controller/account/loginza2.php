<?php
class ControllerAccountLoginza2 extends Controller {
	private $error = array();
	private $data = array();

	/*
		google, yandex, mailruapi, mailru, vkontakte, facebook, odnoklassniki, livejournal, twitter, linkedin, loginza, myopenid, webmoney, rambler, flickr, lastfm, verisign, aol, steam, openid 
	*/
	private $socnets = array(
				'google.com'=>'google', 
				'yandex.ru'=>'yandex', 
				'openid.mail.ru'=>'mailruapi', 
				'http://mail.ru/'=>'mailru',
				'vk.com'=>'vkontakte', 
				'facebook.com'=>'facebook', 
				'odnoklassniki'=>'odnoklassniki', 
				'livejournal.com'=>'livejournal', 
				'twitter.com'=>'twitter', 
				'linkedin'=>'linkedin',
				'loginza.ru'=>'loginza', 
				'myopenid.com'=>'myopenid', 
				'webmoney'=>'wmkeeper.com', 
				'rambler'=>'rambler',   //?
				'flickr'=>'flickr',     //?
				'last.fm'=>'last.fm',    
				'verisign'=>'verisign', //?
				'aol'=>'aol.com',       
				'steam'=>'steamcommunity.com',    
				'openid'=>'openid'  
	);
	
	/* start metka: a1 */
	public function getLink($data)
	{
		$link = '';
		
		$identity_list = array(
			"mailru"=>1,
			"vkontakte"=>1,
			"facebook"=>1,
			"livejournal"=>1,
			"twitter"=>1,
			"linkedin"=>1,
			"wmkeeper.com"=>1,
			"last.fm"=>1,
			"aol.com"=>1
		);
		
		if( !empty($identity_list[ $data['provider'] ]) )
		{
			$link = $data['identity'];
		}
		
		return $link;
	}
	/* end metka: a1 */
		
	
	public function index() {	
		if ($this->customer->isLogged()) {
			$this->response->redirect($this->session->data['loginza2_lastlink']);
		}
		
		if( empty( $this->request->post['token'] ) )
		{
			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}
		//echo "metka-1<br>";
		$TOKEN = $this->request->post['token'];
		
		if( $this->config->get('loginza2_safemode') && $this->config->get('loginza2_widget_id') && $this->config->get('loginza2_widget_sig') )
		{
			$ID = $this->config->get('loginza2_widget_id');
			$SIG = $this->config->get('loginza2_widget_sig');
			$SIG = md5($TOKEN.$SIG);
			
			$url = "http://loginza.ru/api/authinfo?token=".$TOKEN."&id=".$ID."&sig=".$SIG;
		}
		else
		{
			$url = "http://loginza.ru/api/authinfo?token=".$TOKEN;
		}
		
		//echo "metka-2<br>";
		
		
		if( extension_loaded('curl') )
		{
			$c = curl_init($url);
			curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
			$page = curl_exec($c);
			curl_close($c);
		}
		else
		{
			$page = file_get_contents($url);
		}
		
		//echo "metka-3<br>";
		
		if( empty($page) )
		{
			exit('error connection');
		}
		
		//echo "metka-4<br>";
		
		$arr = json_decode($page, true);
		
		
	/* * /
		foreach($arr as $key=>$val)
		{
			//echo $key." - ".$val."<br>";
				
						//echo "1===";
			if( is_array($val) )
			{
						//echo "2===";
				foreach($val as $k=>$v)
				{
						//echo "3===";
					//echo '-'.$k." - ".$v."<br>";
					if(  is_array( $v ) )
					{
						//echo "4===";
						foreach($v as $k1=>$v1)
						{
						//echo "5===";
							//echo "--".$k1." - ".$v1."<br>";
						}
					}
					
				}
			}
		}
		////echo "<hr>".$arr['provider'];
		
		exit();
	/* */	
		//echo "metka-5<br>";
		
		if( !empty($arr['error_type']) )
		{
			exit($arr['error_type']." - ".$arr['error_message']);
		}
		
		if( empty($arr['identity']) ) exit('not identity');
		
		$provider = '';
		
		foreach($this->socnets as $search=>$net)
		{
			if( strstr($arr['provider'], $search) )
			{
				$provider = $net;
				break;
			}
		}
		
		//echo "metka-6<br>";
		
		$data = array(
			'identity'  => $arr['identity'],
			'firstname' => '',
			'lastname'  => '',
			'email'     => '',
			'telephone'	=> '',
			'data'		=> serialize($arr),
			'provider'  => $provider
		);
		
		/* start metka: a1 */
		$data['link'] = $this->getLink($data);
		/* end metka: a1 */
		
		//echo "metka-7<br>";
		
		if( !empty( $arr['name']['first_name'] ) )
		{
			$data['firstname'] = $arr['name']['first_name'];
		}
		
		if( !empty( $arr['name']['last_name'] ) )
		{
			$data['lastname'] = $arr['name']['last_name'];
		}
		
		if( !empty( $arr['email'] ) )
		{
			$data['email'] = $arr['email'];
		}
		
		if( !empty( $arr['phone']['preferred'] ) )
		{
			$data['telephone'] = $ar['phone']['preferred'];
		}
		elseif( !empty( $arr['phone']['mobile'] ) )
		{
			$data['telephone'] = $arr['phone']['mobile'];
		}
		elseif( !empty( $arr['phone']['home'] ) )
		{
			$data['telephone'] = $arr['phone']['home'];
		}
		elseif( !empty( $arr['phone']['work'] ) )
		{
			$data['telephone'] = $arr['phone']['work'];
		}
		elseif( !empty( $arr['phone']['fax'] ) )
		{
			$data['telephone'] = $arr['phone']['fax'];
		}
		
		//echo "metka-8<br>";
		
		if( empty( $arr['name']['first_name'] ) && 
			empty( $arr['name']['last_name'] ) &&  
			!empty( $arr['name']['full_name'] ) )
		{
			$ar = explode(" ", $arr['name']['full_name']);
			
			$data['firstname'] = $ar[0];
			if( !empty($ar[1]) )
			$data['lastname']  = $ar[1]; 
		}
		
		/* kin insert metka: c1 */
		$data['company'] = '';
		$data['address_1'] = '';
		$data['postcode'] = '';
		$data['city'] = '';
		$data['zone'] = '';
		$data['country'] = '';
		/* end kin metka: c1 */
		
		$this->load->model('account/loginza2');
		
		//echo "metka-9<br>";
		
		
		$this->session->data['loginza2_lastlink'] = str_replace("&loginza2close=1", "", 
																$this->session->data['loginza2_lastlink']);
		$this->session->data['loginza2_lastlink'] = str_replace("&amp;loginza2close=1", "", 
																$this->session->data['loginza2_lastlink']);
		
		if( $customer_id = $this->model_account_loginza2->checkNew( $data ) )
		{
			$approved = $this->model_account_loginza2->checkApproved( $customer_id );
		
			if( $this->config->get('loginza2_dobortype') != 'every' )
			{
				if( !$approved )
				{
					$this->response->redirect($this->url->link('account/success'));
				}
			
				$this->session->data['customer_id'] = $customer_id;
				$this->session->data['loginza2_confirmdata_show'] = 0;
				$this->response->redirect( $this->session->data['loginza2_lastlink'] );
			}
			else
			{
				if( $confirm_data = $this->isNeedConfirm( $data ) )
				{
					$data['customer_id'] = $customer_id;
					$confirm_data['data'] = $data;
					$this->session->data['loginza2_confirmdata'] = serialize($confirm_data);
					$this->session->data['loginza2_confirmdata_show'] = 1;
					$this->response->redirect( $this->session->data['loginza2_lastlink'] );
				}
				else
				{
					if( !$approved )
					{
						$this->response->redirect($this->url->link('account/success'));
					}
			
					$this->session->data['customer_id'] = $customer_id;
					$this->session->data['loginza2_confirmdata_show'] = 0;
					$this->response->redirect( $this->session->data['loginza2_lastlink'] );
				}
			}
		}
		else
		{
		//echo "metka-11<br>";
			if( $confirm_data = $this->isNeedConfirm( $data ) )
			{
		//echo "metka-12<br>";
				$confirm_data['data'] = $data;
				$this->session->data['loginza2_confirmdata'] = serialize($confirm_data);
				$this->session->data['loginza2_confirmdata_show'] = 1;
				$this->response->redirect( $this->session->data['loginza2_lastlink'] );
			}
			else
			{
		//echo "metka-13<br>";
				$this->session->data['loginza2_confirmdata'] = '';
				$this->session->data['loginza2_confirmdata_show'] = '';
				
				
				list($customer_id, $approved) = $this->model_account_loginza2->addCustomer( $data );
				
				if($approved)
				{
					$this->session->data['customer_id'] = $customer_id;	
					$this->response->redirect( $this->session->data['loginza2_lastlink'] );
				}
				else
				{
					$this->response->redirect($this->url->link('account/success'));
				}
			}
		}
	}
	
	
	
	
	
	public function frame()
	{
		$this->language->load('account/loginza2');
		$this->load->model('account/loginza2');
		
		$loginza2_data = unserialize( $this->session->data['loginza2_confirmdata'] );
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && 
			$data = $this->validate($loginza2_data['data'])) 
		{
			$this->session->data['loginza2_confirmdata'] = '';
			list($customer_id, $appoved) = $this->model_account_loginza2->addCustomer( $data );
			
			if( $appoved )
			{
				$this->session->data['customer_id'] = $customer_id;	
			}
			
			$this->response->redirect( $this->url->link('account/loginza2/success', 'appoved='.$appoved, 'SSL') );
		}
		
		$this->data['action'] = $this->url->link('account/loginza2/frame', '', 'SSL');
		
		$this->data['header'] = $this->language->get('header');
		$this->data['header_notice'] = $this->language->get('header_notice');
		$this->data['entry_firstname'] = $this->language->get('entry_firstname');
		$this->data['entry_lastname'] = $this->language->get('entry_lastname');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_telephone'] = $this->language->get('entry_telephone');
		$this->data['text_none'] = $this->language->get('text_none');
		
		/* kin insert metka: c1 */
		$this->data['entry_company'] = $this->language->get('entry_company');
		$this->data['entry_address_1'] = $this->language->get('entry_address_1');
		$this->data['entry_postcode'] = $this->language->get('entry_postcode');
		$this->data['entry_city'] = $this->language->get('entry_city');
		$this->data['entry_zone'] = $this->language->get('entry_zone');
		$this->data['entry_country'] = $this->language->get('entry_country');
		
		$this->data['text_select'] = $this->language->get('text_select');
		
		$this->data['firstname_required'] = $this->config->get('loginza2_confirm_firstname_required');
		$this->data['lastname_required']  = $this->config->get('loginza2_confirm_lastname_required');
		$this->data['email_required']     = $this->config->get('loginza2_confirm_email_required');
		$this->data['telephone_required'] = $this->config->get('loginza2_confirm_telephone_required');
		$this->data['company_required']   = $this->config->get('loginza2_confirm_company_required');
		$this->data['postcode_required']  = $this->config->get('loginza2_confirm_postcode_required');
		$this->data['country_required']   = $this->config->get('loginza2_confirm_country_required');
		$this->data['zone_required']      =	$this->config->get('loginza2_confirm_zone_required');
		$this->data['city_required']      = $this->config->get('loginza2_confirm_city_required');
		$this->data['address_1_required'] = $this->config->get('loginza2_confirm_address_1_required');
		
		$old_dobor = array();
		
		if( $this->config->get('loginza2_dobortype') == 'every' )
		{
			$old_dobor = $this->model_account_loginza2->getOldDoborData( $loginza2_data );
		}
		
		
		$this->load->model('localisation/country');
    	$this->data['countries'] = $this->model_localisation_country->getCountries();

		if( isset($this->request->post['company']) )
		{
			$this->data['company'] = $this->request->post['company'];
		}
		elseif( !empty( $old_dobor['company'] ) )
		{
			$this->data['company'] = $old_dobor['company'];
		}
		else
		{
			$this->data['company'] = '';
		}
		
		if( isset($loginza2_data['company']) )
		{
			$this->data['is_company'] = 1;
		}
		else
		{
			$this->data['is_company'] = 0;
		}
		
		if( isset($this->request->post['address_1']) )
		{
			$this->data['address_1'] = $this->request->post['address_1'];
		}
		elseif( !empty( $old_dobor['address_1'] ) )
		{
			$this->data['address_1'] = $old_dobor['address_1'];
		}
		else
		{
			$this->data['address_1'] = '';
		}
		
		if( isset($loginza2_data['address_1']) )
		{
			$this->data['is_address_1'] = 1;
		}
		else
		{
			$this->data['is_address_1'] = 0;
		}
		
		if( isset($this->request->post['postcode']) )
		{
			$this->data['postcode'] = $this->request->post['postcode'];
		}
		elseif( !empty( $old_dobor['postcode'] ) )
		{
			$this->data['postcode'] = $old_dobor['postcode'];
		}
		else
		{
			$this->data['postcode'] = '';
		}
		
		if( isset($loginza2_data['postcode']) )
		{
			$this->data['is_postcode'] = 1;
		}
		else
		{
			$this->data['is_postcode'] = 0;
		}
		
		if( isset($this->request->post['city']) )
		{
			$this->data['city'] = $this->request->post['city'];
		}
		elseif( !empty( $old_dobor['city'] ) )
		{
			$this->data['city'] = $old_dobor['city'];
		}
		else
		{
			$this->data['city'] = '';
		}
		
		if( isset($loginza2_data['city']) )
		{
			$this->data['is_city'] = 1;
		}
		else
		{
			$this->data['is_city'] = 0;
		}
		
		if( isset($this->request->post['zone']) )
		{
			$this->data['zone'] = $this->request->post['zone'];
		}
		elseif( !empty( $old_dobor['zone'] ) )
		{
			$this->data['zone'] = $old_dobor['zone'];
		}
		else
		{
			$this->data['zone'] = '';
		}
		
		if( isset($loginza2_data['zone']) )
		{
			$this->data['is_zone'] = 1;
		}
		else
		{
			$this->data['is_zone'] = 0;
		}
		
		
		if( isset($this->request->post['country']) )
		{
			$this->data['country'] = $this->request->post['country'];
		}
		elseif( !empty( $old_dobor['country'] ) )
		{
			$this->data['country'] = $old_dobor['country'];
		}
		else
		{
			$this->data['country'] = $this->config->get('config_country_id');
		}
		
		if( isset($loginza2_data['country']) )
		{
			$this->data['is_country'] = 1;
		}
		else
		{
			$this->data['is_country'] = 0;
		}
		
		if( !empty( $this->error['company'] ) )
		{
			$this->data['error_company'] = $this->error['company'];
		}
		else
		{
			$this->data['error_company'] = '';
		}
		
		if( !empty( $this->error['address_1'] ) )
		{
			$this->data['error_address_1'] = $this->error['address_1'];
		}
		else
		{
			$this->data['error_address_1'] = '';
		}
		
		if( !empty( $this->error['postcode'] ) )
		{
			$this->data['error_postcode'] = $this->error['postcode'];
		}
		else
		{
			$this->data['error_postcode'] = '';
		}
		
		if( !empty( $this->error['city'] ) )
		{
			$this->data['error_city'] = $this->error['city'];
		}
		else
		{
			$this->data['error_city'] = '';
		}
		
		if( !empty( $this->error['zone'] ) )
		{
			$this->data['error_zone'] = $this->error['zone'];
		}
		else
		{
			$this->data['error_zone'] = '';
		}
		
		if( !empty( $this->error['country'] ) )
		{
			$this->data['error_country'] = $this->error['country'];
		}
		else
		{
			$this->data['error_country'] = '';
		}
		
		/* 
		company
		address_1
		address_2
		postcode
		city
		zone_id
		country_id
		end kin metka: c1 */
		
		$this->data['text_submit'] = $this->language->get('text_submit');
		
		
		
		if( !empty($this->request->post['firstname']) )
		{
			$this->data['firstname'] = $this->request->post['firstname'];
		}
		elseif( !empty($loginza2_data['firstname']) )
		{
			$this->data['firstname'] = $loginza2_data['firstname'];
		}
		elseif( !empty( $old_dobor['firstname'] ) )
		{
			$this->data['firstname'] = $old_dobor['firstname'];
		}
		else
		{
			$this->data['firstname'] = '';
		}
		
		if( isset($loginza2_data['firstname']) )
		{
			$this->data['is_firstname'] = 1;
		}
		else
		{
			$this->data['is_firstname'] = 0;
		}
		
		if( !empty($this->request->post['lastname']) )
		{
			$this->data['lastname'] = $this->request->post['lastname'];
		}
		elseif( !empty($loginza2_data['lastname']) )
		{
			$this->data['lastname'] = $loginza2_data['lastname'];
		}
		elseif( !empty( $old_dobor['lastname'] ) )
		{
			$this->data['lastname'] = $old_dobor['lastname'];
		}
		else
		{
			$this->data['lastname'] = '';
		}
		
		if( isset($loginza2_data['lastname']) )
		{
			$this->data['is_lastname'] = 1;
		}
		else
		{
			$this->data['is_lastname'] = 0;
		}
		
		if( !empty($this->request->post['email']) )
		{
			$this->data['email'] = $this->request->post['email'];
		}
		elseif( !empty($loginza2_data['email']) )
		{
			$this->data['email'] = $loginza2_data['email'];
		}
		elseif( !empty( $old_dobor['email'] ) )
		{
			$this->data['email'] = $old_dobor['email'];
		}
		else
		{
			$this->data['email'] = '';
		}
		
		if( isset($loginza2_data['email']) )
		{
			$this->data['is_email'] = 1;
		}
		else
		{
			$this->data['is_email'] = 0;
		}
		
		if( !empty($this->request->post['telephone']) )
		{
			$this->data['telephone'] = $this->request->post['telephone'];
		}
		elseif( !empty($loginza2_data['telephone']) )
		{
			$this->data['telephone'] = $loginza2_data['telephone'];
		}
		elseif( !empty( $old_dobor['telephone'] ) )
		{
			$this->data['telephone'] = $old_dobor['telephone'];
		}
		else
		{
			$this->data['telephone'] = '';
		}
		
		if( isset($loginza2_data['telephone']) )
		{
			$this->data['is_telephone'] = 1;
		}
		else
		{
			$this->data['is_telephone'] = 0;
		}
		
		if( !empty( $this->error['firstname'] ) )
		{
			$this->data['error_firstname'] = $this->error['firstname'];
		}
		else
		{
			$this->data['error_firstname'] = '';
		}
		
		if( !empty( $this->error['lastname'] ) )
		{
			$this->data['error_lastname'] = $this->error['lastname'];
		}
		else
		{
			$this->data['error_lastname'] = '';
		}
		
		if( !empty( $this->error['email'] ) )
		{
			$this->data['error_email'] = $this->error['email'];
		}
		else
		{
			$this->data['error_email'] = '';
		}
		
		if( !empty( $this->error['telephone'] ) )
		{
			$this->data['error_telephone'] = $this->error['telephone'];
		}
		else
		{
			$this->data['error_telephone'] = '';
		}
		
		//-------------------------
		if(  version_compare(VERSION, '2.2.0.0') >= 0 )
		{
			$this->response->setOutput($this->load->view('account/loginza2_frame', $this->data));
		}
		else
		{
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/loginza2_frame.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/loginza2_frame.tpl', $this->data));
			} else {
				$this->response->setOutput($this->load->view('default/template/account/loginza2_frame.tpl', $this->data));
			}
		}
	}
	
	public function success()
	{
		$this->language->load('account/loginza2');
		$this->data['header'] = $this->language->get('header');
		
		if( !empty($this->request->get['approved']) )
		{
			$this->data['success'] = $this->language->get('success');
		}
		else
		{
			$this->data['success'] = $this->language->get('success_approved');
		}

		
		
		if(  version_compare(VERSION, '2.2.0.0') >= 0 )
		{
			$this->response->setOutput($this->load->view('account/loginza2_frame_success', $this->data));
		}
		else
		{
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/loginza2_frame_success.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/loginza2_frame_success.tpl', $this->data));
			} else {
				$this->response->setOutput($this->load->view('default/template/account/loginza2_frame_success.tpl', $this->data));
			}
		}
		
		
	}
	
	
  	private function validate($data) {
    	
		if( isset( $this->request->post['firstname'] ) && 
			empty( $this->request->post['firstname'] ) &&
			$this->config->get('loginza2_confirm_firstname_required') 
		)
		{
			$this->error['firstname'] = $this->language->get('error_firstname');
		}
		
		if( isset( $this->request->post['lastname'] ) && 
			empty( $this->request->post['lastname'] ) &&
			$this->config->get('loginza2_confirm_lastname_required')  
		)
		{
			$this->error['lastname'] = $this->language->get('error_lastname');
		}
		
		if( isset( $this->request->post['email'] ) && 
			empty( $this->request->post['email'] ) &&
			$this->config->get('loginza2_confirm_email_required') 
		)
		{
			$this->error['email'] = $this->language->get('error_email');
		}
		elseif( 
			!empty( $this->request->post['email'] ) && 
			!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'] ) &&
			$this->config->get('loginza2_confirm_firstname_required') 
		)
		{
			$this->error['email'] = $this->language->get('error_email2');
		}
		
		if( isset( $this->request->post['telephone'] ) && 
			empty( $this->request->post['telephone'] ) &&
			$this->config->get('loginza2_confirm_telephone_required') )
		{
			$this->error['telephone'] = $this->language->get('error_telephone');
		}
		
		if( isset( $this->request->post['company'] ) && 
			empty( $this->request->post['company'] ) &&
			$this->config->get('loginza2_confirm_company_required') )
		{
			$this->error['company'] = $this->language->get('error_company');
		}
		
		if( isset( $this->request->post['address_1'] ) && 
			empty( $this->request->post['address_1'] ) &&
			$this->config->get('loginza2_confirm_address_1_required') )
		{
			$this->error['address_1'] = $this->language->get('error_address_1');
		}
		
		if( isset( $this->request->post['postcode'] ) && 
			empty( $this->request->post['postcode'] ) &&
			$this->config->get('loginza2_confirm_postcode_required') )
		{
			$this->error['postcode'] = $this->language->get('error_postcode');
		}
		
		if( isset( $this->request->post['city'] ) && 
			empty( $this->request->post['city'] ) &&
			$this->config->get('loginza2_confirm_city_required') )
		{
			$this->error['city'] = $this->language->get('error_city');
		}
		
		if( isset( $this->request->post['zone'] ) && 
			empty( $this->request->post['zone'] ) &&
			$this->config->get('loginza2_confirm_zone_required') )
		{
			$this->error['zone'] = $this->language->get('error_zone');
		}
		
		if( isset( $this->request->post['country'] ) && 
			empty( $this->request->post['country'] ) &&
			$this->config->get('loginza2_confirm_country_required') )
		{
			$this->error['country'] = $this->language->get('error_country');
		}
		
    	if (!$this->error) {
			if( !empty($this->request->post['firstname']) )
			{
				$data['firstname'] = $this->request->post['firstname'];
			}
			
			if( !empty($this->request->post['lastname']) )
			{
				$data['lastname']  = $this->request->post['lastname'];
			}
						
			if( !empty($this->request->post['email']) )
			{
				$data['email']  = $this->request->post['email'];
			}
						
			if( !empty($this->request->post['telephone']) )
			{
				$data['telephone']  = $this->request->post['telephone'];
			}
			
			if( !empty($this->request->post['company']) )
			{
				$data['company']  = $this->request->post['company'];
			}
			
			if( !empty($this->request->post['address_1']) )
			{
				$data['address_1']  = $this->request->post['address_1'];
			}
			
			if( !empty($this->request->post['postcode']) )
			{
				$data['postcode']  = $this->request->post['postcode'];
			}
			
			if( !empty($this->request->post['city']) )
			{
				$data['city']  = $this->request->post['city'];
			}
			
			if( !empty($this->request->post['zone']) )
			{
				$data['zone']  = $this->request->post['zone'];
			}
			
			if( !empty($this->request->post['country']) )
			{
				$data['country']  = $this->request->post['country'];
			}
			
			
      		return $data;
    	} else {
      		return false;
    	}  	
  	}
	
	
	protected function isNeedConfirm($data)
	{
		$confirm_data = array();
		
		if( $this->config->get('loginza2_confirm_firstname_status') == 2 || (
			$this->config->get('loginza2_confirm_firstname_status') == 1 && empty($data['firstname'])
			) )
		{
			$confirm_data['firstname'] = $data['firstname'];
		}
		
		if( $this->config->get('loginza2_confirm_lastname_status') == 2 || (
			$this->config->get('loginza2_confirm_lastname_status') == 1 && empty($data['lastname'])
		) )
		{
			$confirm_data['lastname'] = $data['lastname'];
		}
		
		if( $this->config->get('loginza2_confirm_email_status') == 2 || (
			$this->config->get('loginza2_confirm_email_status') == 1 && empty($data['email'])
			) )
		{
			$confirm_data['email'] = $data['email'];
		}
		
		if( $this->config->get('loginza2_confirm_telephone_status') == 2 || (
			$this->config->get('loginza2_confirm_telephone_status') == 1 && empty($data['telephone'])
		) )
		{
			$confirm_data['telephone'] = $data['telephone'];
		}
		
		/* kin insert metka: c1 */
		if( $this->config->get('loginza2_confirm_company_status') == 2 || (
			$this->config->get('loginza2_confirm_company_status') == 1 && empty($data['company'])
		) )
		{
			$confirm_data['company'] = '';
		}
		
		if( $this->config->get('loginza2_confirm_address_1_status') == 2 || (
			$this->config->get('loginza2_confirm_address_1_status') == 1 && empty($data['address_1'])
		) )
		{
			$confirm_data['address_1'] = '';
		}
		
		if( $this->config->get('loginza2_confirm_postcode_status') == 2 || (
			$this->config->get('loginza2_confirm_postcode_status') == 1 && empty($data['postcode'])
		) )
		{
			$confirm_data['postcode'] = '';
		}
		
		if( $this->config->get('loginza2_confirm_city_status') == 2 || (
			$this->config->get('loginza2_confirm_city_status') == 1 && empty($data['city'])
		) )
		{
			$confirm_data['city'] = '';
		}
		
		if( $this->config->get('loginza2_confirm_zone_status') == 2 || (
			$this->config->get('loginza2_confirm_zone_status') == 1 && empty($data['zone'])
		) )
		{
			$confirm_data['zone'] = '';
		}
		
		if( $this->config->get('loginza2_confirm_country_status') == 2 || (
			$this->config->get('loginza2_confirm_country_status') == 1 && empty($data['country'])
		) )
		{
			$confirm_data['country'] = '';
		}
		/* end kin metka: c1 */
		
		
		if( !$confirm_data )
		{	
			return false;
		}
		else
		{		
			return $confirm_data;
		}
	}
	
	public function showcode($ar)
	{
		$LOGINZA2_DATA = array();
		$LOGINZA2_DATA['code'] = '';
		if( !empty($ar['format']) )
		$LOGINZA2_DATA['format'] = $this->config->get('loginza2_format_'.$ar['format']);
		else
		$LOGINZA2_DATA['format'] = $this->config->get('loginza2_format');
		
		if( !$this->config->get('loginza2_status') ) return $LOGINZA2_DATA;
		if( $this->customer->isLogged() ) return $LOGINZA2_DATA;
		
		$STR = 'account';
		
		if( $this->request->get['route'] == 'checkout/login' ) $STR = 'checkout';
		elseif( $this->request->get['route'] == 'account/register' ) $STR = 'register';
				
		
		if( !empty($this->request->get['loginza2close']) )
		{
			$this->session->data['loginza2_confirmdata_show'] = 0;
		}
		
		$http = 'http://';
		if( ( isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ) || 
			!empty($_SERVER['HTTPS']) )
		{
			$http = 'https://';
		}
	
		$this->session->data['loginza2_lastlink'] = $http.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->session->data['loginza2_lastlink'] = str_replace("checkout/login", "checkout/checkout", $this->session->data['loginza2_lastlink']);
		$this->session->data['loginza2_lastlink'] = str_replace("simplecheckout_login", "simplecheckout", $this->session->data['loginza2_lastlink']);


		if( !empty($this->session->data['loginza2_confirmdata']) && 
			!empty($this->session->data['loginza2_confirmdata_show']) )
		{
			$data = unserialize( $this->session->data['loginza2_confirmdata'] );
	
			$loginza2_confirm_block = $this->config->get('loginza2_confirm_block');
	
			$loginza2_confirm_block = str_replace("#divframe_height#", (340-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block );
	
			$loginza2_confirm_block = str_replace("#frame_height#", (360-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block);
	
			if( strstr($this->session->data['loginza2_lastlink'], "?") )
				$loginza2_confirm_block = str_replace("#lastlink#", $this->session->data['loginza2_lastlink'].'&loginza2close=1', $loginza2_confirm_block);
			else
				$loginza2_confirm_block = str_replace("#lastlink#", $this->session->data['loginza2_lastlink'].'?loginza2close=1', $loginza2_confirm_block);
	
			$loginza2_confirm_block = str_replace("#frame_url#", $this->url->link( 'account/loginza2/frame' ), $loginza2_confirm_block);
	
			$LOGINZA2_DATA['code'] .= $loginza2_confirm_block;
		}
		
		$loginza2_code = $this->config->get('loginza2_'.$STR.'_code');
		
		
		$lang_hash = array(
			"ru"=>"ru",
			"uk"=>"uk",
			"ua"=>"uk",
			"be"=>"be",
			"fr"=>"fr",
			"en"=>"en"
		);

		if( !empty($lang_hash[ strtolower($this->config->get('config_language')) ]) )
		{
			$loginza2_code = str_replace("#lang#", 
							$lang_hash[ strtolower($this->config->get('config_language')) ], 
							$loginza2_code);
		}
		else
		{
			$loginza2_code = str_replace("&lang=#lang#", "", $loginza2_code);
		}


		$loginza2_label = '';
		if( 
			$this->config->get('loginza2_label') && !is_array( $this->config->get('loginza2_label') ) &&
			stristr($this->config->get('loginza2_label'), '{' ) != false &&
			stristr($this->config->get('loginza2_label'), '}' ) != false &&
			stristr($this->config->get('loginza2_label'), ';' ) != false &&
			stristr($this->config->get('loginza2_label'), ':' ) != false
		)
		{
			$loginza2_label = unserialize($this->config->get('loginza2_label'));
		}
		else
		{
			$loginza2_label = $this->config->get('loginza2_label');
		}
	
	
		if( !empty($loginza2_label[ $this->config->get('config_language_id') ]) )
			$loginza2_code = str_replace("#loginza2_label#", 
								'<div class="'.$STR.'_loginza2_'.$this->config->get('loginza2_format').'_header">'.$loginza2_label[ $this->config->get('config_language_id') ]."</div>", 
								$loginza2_code );
		else
			$loginza2_code = str_replace("#loginza2_label#", "", $loginza2_code );
		
		$loginza2_code = str_replace("#domain#", 
								urlencode( preg_replace("/\/$/", "", $http.$_SERVER['HTTP_HOST']) ), 
								$loginza2_code 
								);
		
		$LOGINZA2_DATA['code'] .= $loginza2_code;
		
		return $LOGINZA2_DATA;
	}
}
?>