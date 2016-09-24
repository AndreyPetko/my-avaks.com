<?php  
class ControllerModuleLoginza2 extends Controller {
	private $socnets = array(
				'google'		=> 'Google', 
				'yandex' 		=> 'Yandex', 
				'mailru' 	=> 'OpenID.mail.ru', 
				'mailruapi' 		=> 'Mail.ru', 
				'vkontakte'     => 'ВКонтакте', 
				'facebook'	    => 'FaceBook', 
				'odnoklassniki' => 'Одноклассники', 
				'livejournal'   => 'LiveJournal.com', 
				'twitter'       => 'Twitter',  
				'linkedin'      => 'LinkedIN', 
				'loginza'       => 'Loginza', 
				'myopenid'      => 'MyOpenID', 
				'webmoney'      => 'WebMoney', 
				'rambler'       => 'Rambler',  
				'flickr'        => 'Flickr', 
				'lastfm'        => 'Last.FM', 
				'last.fm'       => 'Last.FM', 
				'verisign'      => 'Verisign.com', 
				'aol'			=> 'Aol.com',	
				'steam'			=> 'Steam', 
				'openid'		=> 'OpenID'
	);
	
	private $data;
	
	public function index() {
		
		if( $this->customer->isLogged() && $this->config->get('loginza2_widget_after')=='hide' ) return;
		
		$this->language->load('module/loginza2');
		
		$loginza2_widget_name = $this->config->get('loginza2_widget_name');		
		
		if( !is_array($loginza2_widget_name) && 
				stristr($this->config->get('loginza2_label'), '{' ) != false &&
				stristr($this->config->get('loginza2_label'), '}' ) != false &&
				stristr($this->config->get('loginza2_label'), ';' ) != false &&
				stristr($this->config->get('loginza2_label'), ':' ) != false )
		{
			$loginza2_widget_name = unserialize($loginza2_widget_name);
		}
		
    	$this->data['heading_title'] = $loginza2_widget_name[ $this->config->get('config_language_id') ];
		
		
		$this->data['entry_email'] = $this->language->get('entry_email');		
		$this->data['entry_password'] = $this->language->get('entry_password');		
		$this->data['text_login'] = $this->language->get('text_login');		
		$this->data['text_register'] = $this->language->get('text_register');		
		$this->data['text_forgotten'] = $this->language->get('text_forgotten');		
		
		$this->data['text_register'] = $this->language->get('text_register');
    	$this->data['text_login'] = $this->language->get('text_login');
		$this->data['text_logout'] = $this->language->get('text_logout');
		$this->data['text_forgotten'] = $this->language->get('text_forgotten');
		$this->data['text_account'] = $this->language->get('text_account');
		$this->data['text_edit'] = $this->language->get('text_edit');
		$this->data['text_password'] = $this->language->get('text_password');
		$this->data['text_wishlist'] = $this->language->get('text_wishlist');
		$this->data['text_order'] = $this->language->get('text_order');
		$this->data['text_download'] = $this->language->get('text_download');
		$this->data['text_return'] = $this->language->get('text_return');
		$this->data['text_transaction'] = $this->language->get('text_transaction');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');
		
		$this->data['register'] = $this->url->link('account/register', '', 'SSL');
    	$this->data['login'] = $this->url->link('account/login', '', 'SSL');
		$this->data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['edit'] = $this->url->link('account/edit', '', 'SSL');
		$this->data['password'] = $this->url->link('account/password', '', 'SSL');
		$this->data['wishlist'] = $this->url->link('account/wishlist');
		$this->data['order'] = $this->url->link('account/order', '', 'SSL');
		$this->data['download'] = $this->url->link('account/download', '', 'SSL');
		$this->data['return'] = $this->url->link('account/return', '', 'SSL');
		$this->data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');
		$this->data['action'] = $this->url->link('account/login', '', 'SSL');
		
		$this->data['loginza2_widget_format'] = $this->config->get('loginza2_widget_format');	
		$this->data['loginza2_widget_default'] = $this->config->get('loginza2_widget_default');	
		
		$this->data['loginza2_shop_folder'] = $this->config->get('loginza2_shop_folder');	
		
		if( $this->data['loginza2_shop_folder'] ) 
		$this->data['loginza2_shop_folder'] = $this->data['loginza2_shop_folder'].'/';
		
		if( $this->config->get('loginza2_showtype')=='window' )
		{
			$this->data['classname'] = 'loginza';	
		}
		else
		{
			$this->data['classname'] = '';
		}
		
		
		if( isset($this->session->data['loginza2_confirmdata_show']) )
		{
			$this->data['loginza2_confirmdata_show'] = $this->session->data['loginza2_confirmdata_show'];
			unset($this->session->data['loginza2_confirmdata_show']);
		}
		
		$this->data['logged'] = $this->customer->isLogged();
		
		if( !$this->config->has('loginza2_methods') )
		{
			$res_socnets = array();
			$res_socnets2 = array();
		
			foreach($this->socnets as $socnet=>$label)
			{			
				$vr = $this->config->get('loginza2_'.$socnet);
			
				if( $vr == 'y' ) 
				{
					$this->data['res_socnets'][] = array( 'name'=>$socnet, 
										'label'=>$label );
					$res_socnets2[] = $socnet;
				}
			}
		}
		else
		{
			$loginza2_methods = unserialize( $this->config->get('loginza2_methods') );
			
			$loginza2_methods = $this->sortMethods($loginza2_methods);
			
			foreach($loginza2_methods as $key=>$method)
			{
				if( $method['enable'] == 'y' ) 
				{
					$this->data['res_socnets'][] = array( 'name'  => $key, 
													  'label' => $this->socnets[$key] );
					$res_socnets2[] = $key;
				}
			}
		}
		
		if( !empty($res_socnets2) )
		$this->data['providers'] = implode(",", $res_socnets2);
			
		$this->session->data['loginza2_lastlink'] = $_SERVER['REQUEST_URI'];
		
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
			$this->data['lang'] = $lang_hash[ strtolower($this->config->get('config_language')) ];
		}
		else
		{
			$this->data['lang'] = '';
		}

		
		$this->data['loginza2_confirm_block'] = '';
		
		 if( !$this->customer->isLogged() ) 
		 {
			if( !empty($this->session->data['loginza2_confirmdata']) && 
				!empty( $this->data['loginza2_confirmdata_show'] ) )
			{
				$data = unserialize( $this->session->data['loginza2_confirmdata'] );
	
				$loginza2_confirm_block = $this->config->get('loginza2_confirm_block');
				$loginza2_confirm_block = str_replace("#divframe_height#", (300-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block );
	
				$loginza2_confirm_block = str_replace("#frame_height#", (320-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block);
	
				$loginza2_confirm_block = str_replace("#lastlink#", $this->session->data['loginza2_lastlink'], $loginza2_confirm_block);
	
				$loginza2_confirm_block = str_replace("#frame_url#", $this->url->link( 'account/loginza2/frame' ), $loginza2_confirm_block);
	
				$this->data['loginza2_confirm_block'] = $loginza2_confirm_block;
			} 
		}
		
		if(  version_compare(VERSION, '2.2.0.0') >= 0 )
		{
			$this->response->setOutput($this->load->view('module/loginza2', $this->data));
		}
		else
		{
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/loginza2.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/loginza2.tpl', $this->data);
			} else {
				return $this->load->view('default/template/module/loginza2.tpl', $this->data);
			}
				
		}
		
		
	}
	
	public function sortMethods($loginza2_methods)
	{
		$sortable_arr = array();
		
		foreach($loginza2_methods as $key=>$val)
		{
			$val['k'] = $key;
			$sortable_arr[] = $val;
		}
		
		usort($sortable_arr, array($this, "cmp"));
		
		$sorted_loginza2_methods = array();
		
		foreach($sortable_arr as $key=>$val)
		{
			$sorted_loginza2_methods[ $val['k'] ] = $val;
		}
		
		return $sorted_loginza2_methods;
	}
	
	protected function cmp($a, $b)
	{
		if($a['sort'] == $b['sort']) {
			return 0;
		}
	
		return ($a['sort'] < $b['sort']) ? -1 : 1;
	}
	
	public function country() 
	{
		$json = array();
		
		$this->load->model('localisation/country');

    	$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);
		
		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']		
			);
		}
		
		$this->response->setOutput(json_encode($json));
	}
}
?>