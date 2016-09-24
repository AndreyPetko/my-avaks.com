<?php  
class ControllerModuleLoginza2popup extends Controller {
	private $data;
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
	
	public function index() 
	{
		if( $this->customer->isLogged() ) return;
		
		
		if( empty( $_COOKIE['show_loginza2_popup'] ) )
		{
			$this->data['show_cookie'] = 1;
		}
		else
		{
			$this->data['show_cookie'] = 0;
		}
		
		
		
		$this->language->load('module/loginza2');
		$this->data['text_skip'] = $this->language->get('text_skip');
		
		$loginza2_popup_name = $this->config->get('loginza2_popup_name');		
		
		if( !is_array($loginza2_popup_name) && 
				stristr($this->config->get('loginza2_popup_name'), '{' ) != false &&
				stristr($this->config->get('loginza2_popup_name'), '}' ) != false &&
				stristr($this->config->get('loginza2_popup_name'), ';' ) != false &&
				stristr($this->config->get('loginza2_popup_name'), ':' ) != false )
		{
			$loginza2_popup_name = unserialize($loginza2_popup_name);
		}
		
    	$this->data['heading_title'] = $loginza2_popup_name[ $this->config->get('config_language_id') ];
		
		$this->data['loginza2_default'] = $this->config->get('loginza2_default');
		$this->data['loginza2_shop_folder'] = $this->config->get('loginza2_shop_folder');
	
		$http = 'http://';
		if( ( isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ) || 
		  !empty($_SERVER['HTTPS']) )
		{
			$http = 'https://';
		}
		
		$lang_hash = array(
			"ru"=>"ru",
			"uk"=>"uk",
			"ua"=>"uk",
			"be"=>"be",
			"fr"=>"fr",
			"en"=>"en"
		);
		
		$this->data['lang'] = $lang_hash[ strtolower($this->config->get('config_language')) ];
		
	
		$this->data['domain'] = urlencode( preg_replace("/\/$/", "", $http.$_SERVER['HTTP_HOST']) );
		
		
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

		if(  version_compare(VERSION, '2.2.0.0') >= 0 )
		{
			$this->response->setOutput($this->load->view('module/loginza2_popup', $this->data));
		}
		else
		{
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/loginza2_popup.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/loginza2_popup.tpl', $this->data);
		} else {
			return $this->load->view('default/template/module/loginza2_popup.tpl', $this->data);
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