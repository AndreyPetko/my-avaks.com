<?php
class ControllerModuleLoginza2 extends Controller {
	private $error = array(); 
	private $data = array(); 
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
				'verisign'      => 'Verisign.com', 
				'aol'			=> 'Aol.com',	
				'steam'			=> 'Steam', 
				'openid'		=> 'OpenID'
	);
	
	private $data_nets = array(
		'google'		=> array(
								 "link_class"=>"plus", 
								 "nickname_class"=>"minus", 
								 "email_class"=>"plus", 
								 "gender_class"=>"minus", 
								 "photo_class"=>"minus", 
								 "name_class"=>"plus", 
								 "dob_class"=>"minus", 
								 "work_class"=>"minus", 
								 "address_class"=>"plus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"+", 
								 "nickname_sign"=>"-", 
								 "email_sign"=>"+", 
								 "gender_sign"=>"-", 
								 "photo_sign"=>"-", 
								 "name_sign"=>"+", 
								 "dob_sign"=>"-", 
								 "work_sign"=>"-", 
								 "address_sign"=>"Страна", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
								
								
				'yandex' 		=> array(
								 "link_class"=>"minus", 
								 "nickname_class"=>"plus", 
								 "email_class"=>"plus", 
								 "gender_class"=>"minus", 
								 "photo_class"=>"minus", 
								 "name_class"=>"minus", 
								 "dob_class"=>"minus", 
								 "work_class"=>"minus", 
								 "address_class"=>"minus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"-", 
								 "nickname_sign"=>"+", 
								 "email_sign"=>"+", 
								 "gender_sign"=>"-", 
								 "photo_sign"=>"-", 
								 "name_sign"=>"-", 
								 "dob_sign"=>"-", 
								 "work_sign"=>"-", 
								 "address_sign"=>"-", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
								
				'mailruapi' 	=> array(
								 "link_class"=>"minus", 
								 "nickname_class"=>"minus", 
								 "email_class"=>"minus", 
								 "gender_class"=>"minus", 
								 "photo_class"=>"minus", 
								 "name_class"=>"minus", 
								 "dob_class"=>"minus", 
								 "work_class"=>"minus", 
								 "address_class"=>"minus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"-", 
								 "nickname_sign"=>"-", 
								 "email_sign"=>"-", 
								 "gender_sign"=>"-", 
								 "photo_sign"=>"-", 
								 "name_sign"=>"-", 
								 "dob_sign"=>"-", 
								 "work_sign"=>"-", 
								 "address_sign"=>"-", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
								
								
								
								
								
				'mailru' 		=> array(
								 "link_class"=>"plus", 
								 "nickname_class"=>"plus", 
								 "email_class"=>"plus", 
								 "gender_class"=>"plus", 
								 "photo_class"=>"plus", 
								 "name_class"=>"plus", 
								 "dob_class"=>"plus", 
								 "work_class"=>"minus", 
								 "address_class"=>"plus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"+", 
								 "nickname_sign"=>"+", 
								 "email_sign"=>"+", 
								 "gender_sign"=>"+", 
								 "photo_sign"=>"+", 
								 "name_sign"=>"+", 
								 "dob_sign"=>"+", 
								 "work_sign"=>"-", 
								 "address_sign"=>"регион РФ", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
				'vkontakte'     => array(
								 "link_class"=>"plus", 
								 "nickname_class"=>"minus", 
								 "email_class"=>"minus", 
								 "gender_class"=>"plus", 
								 "photo_class"=>"plus", 
								 "name_class"=>"plus", 
								 "dob_class"=>"minus", 
								 "work_class"=>"minus", 
								 "address_class"=>"minus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"+", 
								 "nickname_sign"=>"-", 
								 "email_sign"=>"-", 
								 "gender_sign"=>"+", 
								 "photo_sign"=>"+", 
								 "name_sign"=>"+", 
								 "dob_sign"=>"-", 
								 "work_sign"=>"-", 
								 "address_sign"=>"-", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
				'facebook'	    => array(
								 "link_class"=>"plus", 
								 "nickname_class"=>"plus", 
								 "email_class"=>"plus", 
								 "gender_class"=>"minus", 
								 "photo_class"=>"plus", 
								 "name_class"=>"plus", 
								 "dob_class"=>"plus", 
								 "work_class"=>"minus", 
								 "address_class"=>"minus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"+", 
								 "nickname_sign"=>"+", 
								 "email_sign"=>"+", 
								 "gender_sign"=>"-", 
								 "photo_sign"=>"+", 
								 "name_sign"=>"+", 
								 "dob_sign"=>"+", 
								 "work_sign"=>"-", 
								 "address_sign"=>"-", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
							
				'odnoklassniki' => array(
								 "link_class"=>"minus", 
								 "nickname_class"=>"minus", 
								 "email_class"=>"minus", 
								 "gender_class"=>"plus", 
								 "photo_class"=>"plus", 
								 "name_class"=>"plus", 
								 "dob_class"=>"plus", 
								 "work_class"=>"minus", 
								 "address_class"=>"minus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"-", 
								 "nickname_sign"=>"-", 
								 "email_sign"=>"-", 
								 "gender_sign"=>"+", 
								 "photo_sign"=>"+", 
								 "name_sign"=>"+", 
								 "dob_sign"=>"+", 
								 "work_sign"=>"-", 
								 "address_sign"=>"-", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
								
								
				'livejournal'   => array(
								 "url"=>"plus", 
								 "link_class"=>"plus", 
								 "nickname_class"=>"minus", 
								 "email_class"=>"minus", 
								 "gender_class"=>"minus", 
								 "photo_class"=>"minus", 
								 "name_class"=>"minus", 
								 "dob_class"=>"minus", 
								 "work_class"=>"minus", 
								 "address_class"=>"minus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"+", 
								 "nickname_sign"=>"+", 
								 "email_sign"=>"-", 
								 "gender_sign"=>"-", 
								 "photo_sign"=>"-", 
								 "name_sign"=>"-", 
								 "dob_sign"=>"-", 
								 "work_sign"=>"-", 
								 "address_sign"=>"-", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"
								), 
																
								
				'twitter'       => array(
								 "link_class"=>"plus", 
								 "nickname_class"=>"plus", 
								 "email_class"=>"minus", 
								 "gender_class"=>"minus", 
								 "photo_class"=>"plus", 
								 "name_class"=>"plus", 
								 "dob_class"=>"minus", 
								 "work_class"=>"minus", 
								 "address_class"=>"minus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"plus", 
								 
								 "link_sign"=>"+", 
								 "nickname_sign"=>"+", 
								 "email_sign"=>"-", 
								 "gender_sign"=>"-", 
								 "photo_sign"=>"+", 
								 "name_sign"=>"+", 
								 "dob_sign"=>"-", 
								 "work_sign"=>"-", 
								 "address_sign"=>"-", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"+"								 
								), 
								
				'linkedin'      => array(
								 "link_class"=>"plus", 
								 "nickname_class"=>"minus", 
								 "email_class"=>"minus", 
								 "gender_class"=>"minus", 
								 "photo_class"=>"minus", 
								 "name_class"=>"plus", 
								 "dob_class"=>"minus", 
								 "work_class"=>"minus", 
								 "address_class"=>"minus", 
								 "phone_class"=>"plus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"+", 
								 "nickname_sign"=>"-", 
								 "email_sign"=>"-", 
								 "gender_sign"=>"-", 
								 "photo_sign"=>-"", 
								 "name_sign"=>"+", 
								 "dob_sign"=>"-", 
								 "work_sign"=>"-", 
								 "address_sign"=>"-", 
								 "phone_sign"=>"+", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
				'loginza'       => array(
								 "link_class"=>"minus", 
								 "nickname_class"=>"minus", 
								 "email_class"=>"plus", 
								 "gender_class"=>"plus", 
								 "photo_class"=>"plus", 
								 "name_class"=>"plus", 
								 "dob_class"=>"minus", 
								 "work_class"=>"minus", 
								 "address_class"=>"minus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"-", 
								 "nickname_sign"=>"-", 
								 "email_sign"=>"+", 
								 "gender_sign"=>"+", 
								 "photo_sign"=>"+", 
								 "name_sign"=>"+", 
								 "dob_sign"=>"-", 
								 "work_sign"=>"-", 
								 "address_sign"=>"-", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
				'myopenid'      => array(
								 "link_class"=>"minus", 
								 "nickname_class"=>"minus", 
								 "email_class"=>"minus", 
								 "gender_class"=>"minus", 
								 "photo_class"=>"minus", 
								 "name_class"=>"minus", 
								 "dob_class"=>"minus", 
								 "work_class"=>"minus", 
								 "address_class"=>"minus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"-", 
								 "nickname_sign"=>"-", 
								 "email_sign"=>"-", 
								 "gender_sign"=>"-", 
								 "photo_sign"=>"-", 
								 "name_sign"=>"-", 
								 "dob_sign"=>"-", 
								 "work_sign"=>"-", 
								 "address_sign"=>"-", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
				'webmoney'      => array(
								 "link_class"=>"plus", 
								 "nickname_class"=>"plus", 
								 "email_class"=>"minus", 
								 "gender_class"=>"minus", 
								 "photo_class"=>"minus", 
								 "name_class"=>"minus", 
								 "dob_class"=>"minus", 
								 "work_class"=>"minus", 
								 "address_class"=>"plus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"+", 
								 "nickname_sign"=>"+", 
								 "email_sign"=>"-", 
								 "gender_sign"=>"-", 
								 "photo_sign"=>"-", 
								 "name_sign"=>"-", 
								 "dob_sign"=>"-", 
								 "work_sign"=>"-", 
								 "address_sign"=>"+", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
								
								
				'rambler'       => array(
								 "nodata"=>1, 
								 
								 "link_class"=>"", 
								 "nickname_class"=>"", 
								 "email_class"=>"", 
								 "gender_class"=>"", 
								 "photo_class"=>"", 
								 "name_class"=>"", 
								 "dob_class"=>"", 
								 "work_class"=>"", 
								 "address_class"=>"", 
								 "phone_class"=>"", 
								 "im_class"=>"", 
								 "biography_class"=>"", 
								 
								 "link_sign"=>"", 
								 "nickname_sign"=>"", 
								 "email_sign"=>"", 
								 "gender_sign"=>"", 
								 "photo_sign"=>"", 
								 "name_sign"=>"", 
								 "dob_sign"=>"", 
								 "work_sign"=>"", 
								 "address_sign"=>"", 
								 "phone_sign"=>"", 
								 "im_sign"=>"", 
								 "biography_sign"=>""								 
								), 
								
				'flickr'        => array(
								 "nodata"=>1, 
								 "link_class"=>"", 
								 "nickname_class"=>"", 
								 "email_class"=>"", 
								 "gender_class"=>"", 
								 "photo_class"=>"", 
								 "name_class"=>"", 
								 "dob_class"=>"", 
								 "work_class"=>"", 
								 "address_class"=>"", 
								 "phone_class"=>"", 
								 "im_class"=>"", 
								 "biography_class"=>"", 
								 
								 "link_sign"=>"", 
								 "nickname_sign"=>"", 
								 "email_sign"=>"", 
								 "gender_sign"=>"", 
								 "photo_sign"=>"", 
								 "name_sign"=>"", 
								 "dob_sign"=>"", 
								 "work_sign"=>"", 
								 "address_sign"=>"", 
								 "phone_sign"=>"", 
								 "im_sign"=>"", 
								 "biography_sign"=>""								 
								), 
				'lastfm'        => array(
								 "link_class"=>"plus", 
								 "nickname_class"=>"plus", 
								 "email_class"=>"minus", 
								 "gender_class"=>"plus", 
								 "photo_class"=>"plus", 
								 "name_class"=>"plus", 
								 "dob_class"=>"minus", 
								 "work_class"=>"minus", 
								 "address_class"=>"plus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"+", 
								 "nickname_sign"=>"+", 
								 "email_sign"=>"-", 
								 "gender_sign"=>"+", 
								 "photo_sign"=>"+", 
								 "name_sign"=>"+", 
								 "dob_sign"=>"-", 
								 "work_sign"=>"-", 
								 "address_sign"=>"+", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
								
				'verisign'      => array(
								 "link_class"=>"vopros", 
								 "nickname_class"=>"vopros", 
								 "email_class"=>"vopros", 
								 "gender_class"=>"vopros", 
								 "photo_class"=>"vopros", 
								 "name_class"=>"vopros", 
								 "dob_class"=>"vopros", 
								 "work_class"=>"vopros", 
								 "address_class"=>"vopros", 
								 "phone_class"=>"vopros", 
								 "im_class"=>"vopros", 
								 "biography_class"=>"vopros", 
								 
								 "link_sign"=>"?", 
								 "nickname_sign"=>"?", 
								 "email_sign"=>"?", 
								 "gender_sign"=>"?", 
								 "photo_sign"=>"?", 
								 "name_sign"=>"?", 
								 "dob_sign"=>"?", 
								 "work_sign"=>"?", 
								 "address_sign"=>"?", 
								 "phone_sign"=>"?", 
								 "im_sign"=>"?", 
								 "biography_sign"=>"?"								 
								), 
								
				'aol'			=> array(
								 "link_class"=>"plus", 
								 "nickname_class"=>"minus", 
								 "email_class"=>"plus", 
								 "gender_class"=>"plus", 
								 "photo_class"=>"minus", 
								 "name_class"=>"minus", 
								 "dob_class"=>"plus", 
								 "work_class"=>"minus", 
								 "address_class"=>"plus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"+", 
								 "nickname_sign"=>"-", 
								 "email_sign"=>"+", 
								 "gender_sign"=>"+", 
								 "photo_sign"=>"-", 
								 "name_sign"=>"-", 
								 "dob_sign"=>"+", 
								 "work_sign"=>"-", 
								 "address_sign"=>"Страна", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
								
				'steam'			=> array( 
								 "link_class"=>"minus", 
								 "nickname_class"=>"minus", 
								 "email_class"=>"minus", 
								 "gender_class"=>"minus", 
								 "photo_class"=>"minus", 
								 "name_class"=>"minus", 
								 "dob_class"=>"minus", 
								 "work_class"=>"minus", 
								 "address_class"=>"minus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"-", 
								 "nickname_sign"=>"-", 
								 "email_sign"=>"-", 
								 "gender_sign"=>"-", 
								 "photo_sign"=>"-", 
								 "name_sign"=>"-", 
								 "dob_sign"=>"-", 
								 "work_sign"=>"-", 
								 "address_sign"=>"-", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
				'openid'		=> array(
								 "link_class"=>"minus", 
								 "nickname_class"=>"minus", 
								 "email_class"=>"minus", 
								 "gender_class"=>"minus", 
								 "photo_class"=>"minus", 
								 "name_class"=>"minus", 
								 "dob_class"=>"minus", 
								 "work_class"=>"minus", 
								 "address_class"=>"minus", 
								 "phone_class"=>"minus", 
								 "im_class"=>"minus", 
								 "biography_class"=>"minus", 
								 
								 "link_sign"=>"-", 
								 "nickname_sign"=>"-", 
								 "email_sign"=>"-", 
								 "gender_sign"=>"-", 
								 "photo_sign"=>"-", 
								 "name_sign"=>"-", 
								 "dob_sign"=>"-", 
								 "work_sign"=>"-", 
								 "address_sign"=>"-", 
								 "phone_sign"=>"-", 
								 "im_sign"=>"-", 
								 "biography_sign"=>"-"								 
								), 
	);
	
	public function install()
	{
		$this->load->model('module/loginza2');
		$this->model_module_loginza2->addFields();
		
		$this->load->model('extension/extension');
		$this->model_extension_extension->install('module', 'loginza2_popup');
		
		$this->load->model('user/user_group');
		
		$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'module/loginza2_popup');
		$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'module/loginza2_popup');
			
			
	}
	
	public function uninstall()
	{
		 
		$this->load->model('extension/extension');
		$this->model_extension_extension->uninstall('module', 'loginza2_popup');
	}
	
	public function index() {   
		$this->load->language('module/loginza2');

		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('module/loginza2');
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) 
		{
			foreach($this->request->post as $key=>$val)
			{
				if( is_array($val) && $key != 'loginza2_module' && $key != 'loginza2_popup_module'  )
				{
					$this->request->post[$key] = serialize($this->request->post[$key]);
				}
			}
			/*
			if( !empty( $this->request->post['loginza2_popup_module'] ) )
			{
				$this->model_module_loginza2->updateSetting('loginza2_popup_module', 
															'loginza2_popup_status', 
															1);
				
			}
			else
			{
				$this->model_module_loginza2->updateSetting('loginza2_popup', 
															'loginza2_popup_status', 
															0);
			}
			*/
			$this->model_setting_setting->editSetting('loginza2', $this->request->post);	
			
			if( isset( $this->request->post['config_google_analytics'] ) )
			{
				$this->model_module_loginza2->updateSetting('config', 
															'config_google_analytics', 
															$this->request->post['config_google_analytics']);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			if( !empty($this->request->post['stay']) )
			{
				$tab = 'link-tab-general';
				
				if( !empty($this->request->post['tab']) )
				{
					$tab = $this->request->post['tab'];
				}
				
				$this->response->redirect($this->url->link('module/loginza2', 'token=' . $this->session->data['token'].'&tab='.$tab, 'SSL'));
			}
			else
			{
				$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));			
			}
		}
				
		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		foreach($this->data['languages'] as $i=>$lang)
		{
			if( isset($lang['image']) ) // OC 2.1
				$this->data['languages'][$i]['image'] = 'view/image/flags/'.$lang['image'];
			else // OC 2.2
				$this->data['languages'][$i]['image'] = 'language/'.$lang['code'].'/'.$lang['code'].'.png';
		}
		
		if( isset( $this->request->post['loginza2_widget_name'] ) )
		{
			$this->data['loginza2_widget_name'] = $this->request->post['loginza2_widget_name'];
		}
		elseif( $this->config->has('loginza2_widget_name') )
		{
			if( !is_array($this->config->get('loginza2_widget_name')) && 
				stristr($this->config->get('loginza2_label'), '{' ) != false &&
				stristr($this->config->get('loginza2_label'), '}' ) != false &&
				stristr($this->config->get('loginza2_label'), ';' ) != false &&
				stristr($this->config->get('loginza2_label'), ':' ) != false
			)
			{
				$this->data['loginza2_widget_name'] = $this->custom_unserialize( $this->config->get('loginza2_widget_name') );
			}
			else
			$this->data['loginza2_widget_name'] = $this->config->get('loginza2_widget_name');
		}
		else
		{
			foreach($this->data['languages'] as $language)
			{
				$this->data['loginza2_widget_name'][$language['language_id']] = $this->config->get('loginza2_widget_name_default');
			}
		}
		
		if( !empty($this->request->get['tab']) )
		{
			$this->data['tab'] = $this->request->get['tab'];
		}
		else
		{
			$this->data['tab'] = 'link-tab-general';
		}
		
		
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['entry_version'] = $this->language->get('entry_version');
		$this->data['entry_show_standart_auth'] = $this->language->get('entry_show_standart_auth');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['text_showtype_notice'] = $this->language->get('text_showtype_notice');
		
		$this->data['entry_shop_folder'] = $this->language->get('entry_shop_folder');
		
		
		
		$this->data['entry_dobortype'] = $this->language->get('entry_dobortype');
		$this->data['entry_dobortype_one'] = $this->language->get('entry_dobortype_one');
		$this->data['entry_dobortype_every'] = $this->language->get('entry_dobortype_every');
		
		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_dobor'] = $this->language->get('tab_dobor');
		$this->data['tab_socseti'] = $this->language->get('tab_socseti');
		$this->data['tab_widget'] = $this->language->get('tab_widget');
		$this->data['tab_admin'] = $this->language->get('tab_admin');
		$this->data['tab_support'] = $this->language->get('tab_support');
		
		$this->data['tab_design'] = $this->language->get('tab_design');
		$this->data['text_design_notice2'] = $this->language->get('text_design_notice2');
		
		
		$this->data['text_design_col_element'] = $this->language->get('text_design_col_element');
		$this->data['text_design_col_file'] = $this->language->get('text_design_col_file');
		$this->data['text_design_col_comment'] = $this->language->get('text_design_col_comment');
		$this->data['text_design_row_loginza2_account'] = $this->language->get('text_design_row_loginza2_account');
		$this->data['text_design_notice'] = $this->language->get('text_design_notice');
		$this->data['text_design_row_loginza2_checkout'] = $this->language->get('text_design_row_loginza2_checkout');
		$this->data['text_design_row_loginza2_simple'] = $this->language->get('text_design_row_loginza2_simple');
		$this->data['text_design_row_loginza2_simplereg'] = $this->language->get('text_design_row_loginza2_simplereg');
		$this->data['text_design_row_loginza2_popup'] = $this->language->get('text_design_row_loginza2_popup');
		$this->data['text_design_row_loginza2_confirm'] = $this->language->get('text_design_row_loginza2_confirm');
		$this->data['text_design_row_loginza2_frame'] = $this->language->get('text_design_row_loginza2_frame');
		$this->data['text_design_row_loginza2_frame_success'] = $this->language->get('text_design_row_loginza2_frame_success');
		$this->data['text_design_row_module_loginza2'] = $this->language->get('text_design_row_module_loginza2');
		
		
		
		
		$this->data['entry_sig'] = $this->language->get('entry_sig');
		$this->data['entry_id'] = $this->language->get('entry_id');
		$this->data['entry_safemode'] = $this->language->get('entry_safemode');
		
		$this->data['entry_widget_header'] = $this->language->get('entry_widget_header');
		$this->data['entry_widget_notice'] = $this->language->get('entry_widget_notice');
		
		/* start update: a1 */
		
		$this->data['entry_confirm_data'] = $this->language->get('entry_confirm_data');
		$this->data['entry_confirm_data_notice'] = $this->language->get('entry_confirm_data_notice');
		$this->data['entry_confirm_firstname'] = $this->language->get('entry_confirm_firstname');
		$this->data['entry_confirm_lastname']  = $this->language->get('entry_confirm_lastname');
		$this->data['entry_confirm_email']     = $this->language->get('entry_confirm_email');
		$this->data['entry_confirm_phone']     = $this->language->get('entry_confirm_phone');
		$this->data['text_confirm_disable']    = $this->language->get('text_confirm_disable');
		$this->data['text_confirm_none']       = $this->language->get('text_confirm_none');
		$this->data['text_confirm_allways']    = $this->language->get('text_confirm_allways');
		/* end update: a1 */
		
		$this->data['col_link'] = $this->language->get('col_link');
		$this->data['col_nickname'] = $this->language->get('col_nickname');
		$this->data['col_email'] = $this->language->get('col_email');
		$this->data['col_gender'] = $this->language->get('col_gender');
		$this->data['col_photo'] = $this->language->get('col_photo');
		$this->data['col_name'] = $this->language->get('col_name');
		$this->data['col_dob'] = $this->language->get('col_dob');
		$this->data['col_work'] = $this->language->get('col_work');
		$this->data['col_address'] = $this->language->get('col_address');
		$this->data['col_phone'] = $this->language->get('col_phone');
		$this->data['col_im'] = $this->language->get('col_im');
		$this->data['col_biography'] = $this->language->get('col_biography');
		
		$this->data['entry_admin'] = $this->language->get('entry_admin');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['entry_widget_name'] = $this->language->get('entry_widget_name');
		
		$this->data['entry_popup_name']	= $this->language->get('entry_popup_name');
		$this->data['tab_popup']	= $this->language->get('tab_popup');
		$this->data['text_popup_notice']	= $this->language->get('text_popup_notice');
		
		$this->data['entry_format']	= $this->language->get('entry_format');
		$this->data['entry_label']	= $this->language->get('entry_label');
		
		$this->data['entry_save_to_addr']	= $this->language->get('entry_save_to_addr');
		$this->data['text_customer_addr']	= $this->language->get('text_customer_addr');
		$this->data['text_customer_only']	= $this->language->get('text_customer_only');
		
		$this->data['entry_admin_header']	= $this->language->get('entry_admin_header');
		$this->data['entry_admin_customer']	= $this->language->get('entry_admin_customer');
		$this->data['entry_admin_customer_list']	= $this->language->get('entry_admin_customer_list');
		$this->data['entry_admin_order']	= $this->language->get('entry_admin_order');
		$this->data['entry_admin_order_list']	= $this->language->get('entry_admin_order_list');
		
		$this->data['text_format_table']	= $this->language->get('text_format_table');
		$this->data['text_format_button']	= $this->language->get('text_format_button');
		$this->data['text_format_icons']	= $this->language->get('text_format_icons');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		
		$this->data['entry_widget_layout'] = $this->language->get('entry_widget_layout');
		$this->data['entry_widget_position'] = $this->language->get('entry_widget_position');
		$this->data['entry_widget_status'] = $this->language->get('entry_widget_status');
		$this->data['entry_widget_sort_order'] = $this->language->get('entry_widget_sort_order');
		
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_country'] = $this->language->get('text_country');
		$this->data['text_regions'] = $this->language->get('text_regions');
		
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->data['entry_showtype'] = $this->language->get('entry_showtype');
		$this->data['entry_widget_showtype'] = $this->language->get('entry_widget_showtype');
		$this->data['text_showtype_window'] = $this->language->get('text_showtype_window');
		$this->data['text_showtype_redirect'] = $this->language->get('text_showtype_redirect');
		
		$this->data['text_frame'] = $this->language->get('text_frame');
		$this->data['text_contact'] = $this->language->get('text_contact');
		
		$this->data['entry_widget_after'] = $this->language->get('entry_widget_after');
		$this->data['text_widget_after_show'] = $this->language->get('text_widget_after_show');
		$this->data['text_widget_after_hide'] = $this->language->get('text_widget_after_hide');
		
		$this->data['filter_notice'] = $this->language->get('filter_notice');
		$this->data['filter_header'] = $this->language->get('filter_header');
		$this->data['entry_widget_format'] = $this->language->get('entry_widget_format');
		 
		$this->data['col_socnet'] = $this->language->get('col_socnet');
		$this->data['col_data'] = $this->language->get('col_data');
		$this->data['col_enable'] = $this->language->get('col_enable');
		
		$this->data['col_sort_order'] = $this->language->get('col_sort_order');
		
		
	
		
		$this->data['entry_default'] = $this->language->get('entry_default');
		
		$this->data['button_save_and_go'] = $this->language->get('button_save_and_go');
		$this->data['button_save_and_stay'] = $this->language->get('button_save_and_stay');
		
		if( !empty( $this->session->data['success'] ) )
		{
			$this->session->data['success'] = 0;
			$this->data['success'] = $this->language->get('text_success');
		}
		else
		{
			$this->data['success'] = '';
		}
		
		if (isset($this->request->post['loginza2_shop_folder'])) 
		{
			$this->data['loginza2_shop_folder'] = $this->request->post['loginza2_shop_folder'];
		} 
		else
		{ 
			$this->data['loginza2_shop_folder'] = $this->config->get('loginza2_shop_folder');
		}
		
		if (isset($this->request->post['loginza2_status'])) {
			$this->data['loginza2_status'] = $this->request->post['loginza2_status'];
		} elseif ($this->config->get('loginza2_status')) { 
			$this->data['loginza2_status'] = $this->config->get('loginza2_status');
		} else {
			$this->data['loginza2_status'] = 0;
		}
		
		
		if( isset( $this->request->post['loginza2_popup_name'] ) )
		{
			$this->data['loginza2_popup_name'] = $this->request->post['loginza2_popup_name'];
		}
		elseif( $this->config->has('loginza2_popup_name') )
		{
			if( !is_array($this->config->get('loginza2_popup_name')) && 
				stristr($this->config->get('loginza2_popup_name'), '{' ) != false &&
				stristr($this->config->get('loginza2_popup_name'), '}' ) != false &&
				stristr($this->config->get('loginza2_popup_name'), ';' ) != false &&
				stristr($this->config->get('loginza2_popup_name'), ':' ) != false
			)
			{
				$this->data['loginza2_popup_name'] = $this->custom_unserialize( $this->config->get('loginza2_popup_name') );
			}
			else
			$this->data['loginza2_popup_name'] = $this->config->get('loginza2_popup_name');
		}
		else
		{
			foreach($this->data['languages'] as $language)
			{
				if( isset($language['directory']) )
					$directory = $language['directory'];
				else
					$directory = $language['code'];
				
				$Lang = new Language( $directory );
				$Lang->load('module/loginza2');
				
			
				$this->data['loginza2_popup_name'][$language['language_id']] = $Lang->get('loginza2_popup_name_default');
			}
		}
		
		
		if (isset($this->request->post['loginza2_popups'])) {
			$this->data['loginza2_popups'] = $this->request->post['loginza2_popups'];
		} elseif ($this->config->get('loginza2_popups')) { 
		
			if( !is_array($this->config->get('loginza2_popups')) && 
				stristr($this->config->get('loginza2_popups'), '{' ) != false &&
				stristr($this->config->get('loginza2_popups'), '}' ) != false &&
				stristr($this->config->get('loginza2_popups'), ';' ) != false &&
				stristr($this->config->get('loginza2_popups'), ':' ) != false
			)
			{
				$this->data['loginza2_popups'] = $this->custom_unserialize( $this->config->get('loginza2_popups') );
			}
			else
			{
				$this->data['loginza2_popups'] = $this->config->get('loginza2_popups');
			}
			
		} else {
			$this->data['loginza2_popups'] = array();
		}
		
	   	   
		   
		
		if (isset($this->request->post['loginza2_save_to_addr'])) {
			$this->data['loginza2_save_to_addr'] = $this->request->post['loginza2_save_to_addr'];
		} elseif ($this->config->get('loginza2_save_to_addr')) { 
			$this->data['loginza2_save_to_addr'] = $this->config->get('loginza2_save_to_addr');
		} else {
			$this->data['loginza2_save_to_addr'] = '';
		}
		
		if (isset($this->request->post['loginza2_widget_format'])) {
			$this->data['loginza2_widget_format'] = $this->request->post['loginza2_widget_format'];
		} elseif ($this->config->get('loginza2_widget_format')) { 
			$this->data['loginza2_widget_format'] = $this->config->get('loginza2_widget_format');
		} else {
			$this->data['loginza2_widget_format'] = 'button';
		}
		
		
		if (isset($this->request->post['loginza2_show_standart_auth'])) {
			$this->data['loginza2_show_standart_auth'] = $this->request->post['loginza2_show_standart_auth'];
		} elseif ($this->config->has('loginza2_show_standart_auth')) { 
			$this->data['loginza2_show_standart_auth'] = $this->config->get('loginza2_show_standart_auth');
		} else {
			$this->data['loginza2_show_standart_auth'] = 0;
		}
		
		if (isset($this->request->post['loginza2_showtype'])) {
			$this->data['loginza2_showtype'] = $this->request->post['loginza2_showtype'];
		} elseif ($this->config->has('loginza2_showtype')) { 
			$this->data['loginza2_showtype'] = $this->config->get('loginza2_showtype');
		} else {
			$this->data['loginza2_showtype'] = 'window';
		}
		
		
		
		if (isset($this->request->post['loginza2_sort'])) {
			$this->data['loginza2_sort'] = $this->request->post['loginza2_sort'];
		} elseif ($this->config->has('loginza2_sort')) { 
			$this->data['loginza2_sort'] = $this->custom_unserialize( $this->config->get('loginza2_sort') );
		} else {
			$this->data['loginza2_sort'] = array();
		}
		
		if (isset($this->request->post['loginza2_dobortype'])) {
			$this->data['loginza2_dobortype'] = $this->request->post['loginza2_dobortype'];
		} elseif ($this->config->has('loginza2_dobortype')) { 
			$this->data['loginza2_dobortype'] = $this->config->get('loginza2_dobortype');
		} else {
			$this->data['loginza2_dobortype'] = 'one';
		}
		
		
		
		
		if (isset($this->request->post['loginza2_widget_showtype'])) {
			$this->data['loginza2_widget_showtype'] = $this->request->post['loginza2_widget_showtype'];
		} elseif ($this->config->has('loginza2_widget_showtype')) { 
			$this->data['loginza2_widget_showtype'] = $this->config->get('loginza2_widget_showtype');
		} else {
			$this->data['loginza2_widget_showtype'] = 'window';
		}
		
		if (isset($this->request->post['loginza2_modules'])) {
			$this->data['loginza2_modules'] = $this->request->post['loginza2_modules'];
		} elseif ($this->config->get('loginza2_modules')) { 
		
			if( !is_array($this->config->get('loginza2_modules')) && 
				stristr($this->config->get('loginza2_modules'), '{' ) != false &&
				stristr($this->config->get('loginza2_modules'), '}' ) != false &&
				stristr($this->config->get('loginza2_modules'), ';' ) != false &&
				stristr($this->config->get('loginza2_modules'), ':' ) != false
			)
			{
				$this->data['loginza2_modules'] = $this->custom_unserialize( $this->config->get('loginza2_modules') );
			}
			else
			{
				$this->data['loginza2_modules'] = $this->config->get('loginza2_modules');
			}
			
		} else {
			$this->data['loginza2_modules'] = array();
		}
		
		if (isset($this->request->post['loginza2_safemode'])) {
			$this->data['loginza2_safemode'] = $this->request->post['loginza2_safemode'];
		} elseif ($this->config->get('loginza2_safemode')) { 
			$this->data['loginza2_safemode'] = $this->config->get('loginza2_safemode');
		} else {
			$this->data['loginza2_safemode'] = '';
		}
		
		if (isset($this->request->post['loginza2_widget_sig'])) {
			$this->data['loginza2_widget_sig'] = $this->request->post['loginza2_widget_sig'];
		} elseif ($this->config->get('loginza2_widget_sig')) { 
			$this->data['loginza2_widget_sig'] = $this->config->get('loginza2_widget_sig');
		} else {
			$this->data['loginza2_widget_sig'] = '';
		}
		
		
		
		if (isset($this->request->post['loginza2_default'])) {
			$this->data['loginza2_default'] = $this->request->post['loginza2_default'];
		} elseif ($this->config->get('loginza2_default')) { 
			$this->data['loginza2_default'] = $this->config->get('loginza2_default');
		} else {
			$this->data['loginza2_default'] = '';
		}
		
		if (isset($this->request->post['loginza2_widget_after'])) {
			$this->data['loginza2_widget_after'] = $this->request->post['loginza2_widget_after'];
		} elseif ($this->config->get('loginza2_widget_after')) { 
			$this->data['loginza2_widget_after'] = $this->config->get('loginza2_widget_after');
		} else {
			$this->data['loginza2_widget_after'] = '';
		}
		
		if (isset($this->request->post['loginza2_widget_id'])) {
			$this->data['loginza2_widget_id'] = $this->request->post['loginza2_widget_id'];
		} elseif ($this->config->get('loginza2_widget_id')) { 
			$this->data['loginza2_widget_id'] = $this->config->get('loginza2_widget_id');
		} else {
			$this->data['loginza2_widget_id'] = '';
		}
		
		
		$this->data['socnets_list'] = $this->socnets;
		
		
		
		if (isset($this->request->post['loginza2_widget_status'])) {
			$this->data['loginza2_widget_status'] = $this->request->post['loginza2_widget_status'];
		} elseif ($this->config->get('loginza2_widget_status')) { 
			$this->data['loginza2_widget_status'] = $this->config->get('loginza2_widget_status');
		} else {
			$this->data['loginza2_widget_status'] = 0;
		}
		
		if (isset($this->request->post['loginza2_popup_status'])) {
			$this->data['loginza2_popup_status'] = $this->request->post['loginza2_popup_status'];
		} elseif ($this->config->get('loginza2_popup_status')) { 
			$this->data['loginza2_popup_status'] = $this->config->get('loginza2_popup_status');
		} else {
			$this->data['loginza2_popup_status'] = 0;
		}
		
		
		/* start update: a1 */ 
		if (isset($this->request->post['loginza2_confirm_firstname_status'])) {
			$this->data['loginza2_confirm_firstname_status'] = $this->request->post['loginza2_confirm_firstname_status'];
		} elseif ($this->config->get('loginza2_confirm_firstname_status')) { 
			$this->data['loginza2_confirm_firstname_status'] = $this->config->get('loginza2_confirm_firstname_status');
		} else {
			$this->data['loginza2_confirm_firstname_status'] = 0;
		}
		
		if (isset($this->request->post['loginza2_confirm_lastname_status'])) {
			$this->data['loginza2_confirm_lastname_status'] = $this->request->post['loginza2_confirm_lastname_status'];
		} elseif ($this->config->get('loginza2_confirm_lastname_status')) { 
			$this->data['loginza2_confirm_lastname_status'] = $this->config->get('loginza2_confirm_lastname_status');
		} else {
			$this->data['loginza2_confirm_lastname_status'] = 0;
		}
		
		if (isset($this->request->post['loginza2_confirm_email_status'])) {
			$this->data['loginza2_confirm_email_status'] = $this->request->post['loginza2_confirm_email_status'];
		} elseif ($this->config->get('loginza2_confirm_email_status')) { 
			$this->data['loginza2_confirm_email_status'] = $this->config->get('loginza2_confirm_email_status');
		} else {
			$this->data['loginza2_confirm_email_status'] = 0;
		}
		
		if (isset($this->request->post['loginza2_confirm_telephone_status'])) {
			$this->data['loginza2_confirm_telephone_status'] = $this->request->post['loginza2_confirm_telephone_status'];
		} elseif ($this->config->get('loginza2_confirm_telephone_status')) { 
			$this->data['loginza2_confirm_telephone_status'] = $this->config->get('loginza2_confirm_telephone_status');
		} else {
			$this->data['loginza2_confirm_telephone_status'] = 0;
		}
		
		/* end update: a1 */ 
		
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		/* start update: c1 */
		$this->data['entry_confirm_company'] = $this->language->get('entry_confirm_company');
		$this->data['entry_confirm_address_1'] = $this->language->get('entry_confirm_address_1');
		$this->data['entry_confirm_postcode'] = $this->language->get('entry_confirm_postcode');
		$this->data['entry_confirm_city'] = $this->language->get('entry_confirm_city');
		$this->data['entry_confirm_zone'] = $this->language->get('entry_confirm_zone');
		$this->data['entry_confirm_country'] = $this->language->get('entry_confirm_country');
		$this->data['text_required'] = $this->language->get('text_required');
		
		if (isset($this->request->post['loginza2_confirm_company_status'])) {
			$this->data['loginza2_confirm_company_status'] = $this->request->post['loginza2_confirm_company_status'];
		} elseif ($this->config->get('loginza2_confirm_company_status')) { 
			$this->data['loginza2_confirm_company_status'] = $this->config->get('loginza2_confirm_company_status');
		} else {
			$this->data['loginza2_confirm_company_status'] = 0;
		}
		
		if (isset($this->request->post['loginza2_confirm_address_1_status'])) {
			$this->data['loginza2_confirm_address_1_status'] = $this->request->post['loginza2_confirm_address_1_status'];
		} elseif ($this->config->get('loginza2_confirm_address_1_status')) { 
			$this->data['loginza2_confirm_address_1_status'] = $this->config->get('loginza2_confirm_address_1_status');
		} else {
			$this->data['loginza2_confirm_address_1_status'] = 0;
		}
		
		if (isset($this->request->post['loginza2_confirm_postcode_status'])) {
			$this->data['loginza2_confirm_postcode_status'] = $this->request->post['loginza2_confirm_postcode_status'];
		} elseif ($this->config->get('loginza2_confirm_postcode_status')) { 
			$this->data['loginza2_confirm_postcode_status'] = $this->config->get('loginza2_confirm_postcode_status');
		} else {
			$this->data['loginza2_confirm_postcode_status'] = 0;
		}
		
		if (isset($this->request->post['loginza2_confirm_city_status'])) {
			$this->data['loginza2_confirm_city_status'] = $this->request->post['loginza2_confirm_city_status'];
		} elseif ($this->config->get('loginza2_confirm_city_status')) { 
			$this->data['loginza2_confirm_city_status'] = $this->config->get('loginza2_confirm_city_status');
		} else {
			$this->data['loginza2_confirm_city_status'] = 0;
		}
		
		if (isset($this->request->post['loginza2_confirm_zone_status'])) {
			$this->data['loginza2_confirm_zone_status'] = $this->request->post['loginza2_confirm_zone_status'];
		} elseif ($this->config->get('loginza2_confirm_zone_status')) { 
			$this->data['loginza2_confirm_zone_status'] = $this->config->get('loginza2_confirm_zone_status');
		} else {
			$this->data['loginza2_confirm_zone_status'] = 0;
		}
		
		if (isset($this->request->post['loginza2_confirm_country_status'])) {
			$this->data['loginza2_confirm_country_status'] = $this->request->post['loginza2_confirm_country_status'];
		} elseif ($this->config->get('loginza2_confirm_country_status')) { 
			$this->data['loginza2_confirm_country_status'] = $this->config->get('loginza2_confirm_country_status');
		} else {
			$this->data['loginza2_confirm_country_status'] = 0;
		}
		
		if (isset($this->request->post['loginza2_confirm_firstname_required'])) {
			$this->data['loginza2_confirm_firstname_required'] = $this->request->post['loginza2_confirm_firstname_required'];
		} else { 
			$this->data['loginza2_confirm_firstname_required'] = $this->config->get('loginza2_confirm_firstname_required');
		}
		
		
		$this->data['data_nets'] = $this->data_nets;
		
		$loginza2_methods = array();
		
		if (isset($this->request->post['loginza2_methods'])) {
			$loginza2_methods = $this->request->post['loginza2_methods'];
		} elseif( $this->config->has('loginza2_methods') ) 
		{ 
			if( stristr($this->config->get('loginza2_methods'), '{' ) != false &&
				stristr($this->config->get('loginza2_methods'), '}' ) != false &&
				stristr($this->config->get('loginza2_methods'), ';' ) != false &&
				stristr($this->config->get('loginza2_methods'), ':' ) != false )
			{
				$loginza2_methods = $this->custom_unserialize( $this->config->get('loginza2_methods') );
			}
			else
			{
				$loginza2_methods = $this->config->get('loginza2_methods');
			}
			
		} 
		else 
		{
			$i = 0;
			foreach($this->socnets as $key=>$val)
			{
				$i++;
				$loginza2_methods[$key] = array(
					"enable" => "y",
					"sort" => $i
				);
			}
		}
		
		$loginza2_methods = $this->model_module_loginza2->sortMethods($loginza2_methods);
		
		foreach( $loginza2_methods as $key=>$method )
		{
			$method['name'] = $this->language->get('entry_'.$key);
			$method['url'] = $this->language->get('url_'.$key);
			
			$this->data['loginza2_methods'][$key] = $method;
		}

		
		
		
		if (isset($this->request->post['loginza2_confirm_lastname_required'])) {
			$this->data['loginza2_confirm_lastname_required'] = $this->request->post['loginza2_confirm_lastname_required'];
		} else { 
			$this->data['loginza2_confirm_lastname_required'] = $this->config->get('loginza2_confirm_lastname_required');
		}
		
		if (isset($this->request->post['loginza2_confirm_email_required'])) {
			$this->data['loginza2_confirm_email_required'] = $this->request->post['loginza2_confirm_email_required'];
		} else { 
			$this->data['loginza2_confirm_email_required'] = $this->config->get('loginza2_confirm_email_required');
		}
		
		if (isset($this->request->post['loginza2_confirm_telephone_required'])) {
			$this->data['loginza2_confirm_telephone_required'] = $this->request->post['loginza2_confirm_telephone_required'];
		} else { 
			$this->data['loginza2_confirm_telephone_required'] = $this->config->get('loginza2_confirm_telephone_required');
		}
		
		if (isset($this->request->post['loginza2_confirm_company_required'])) {
			$this->data['loginza2_confirm_company_required'] = $this->request->post['loginza2_confirm_company_required'];
		} else { 
			$this->data['loginza2_confirm_company_required'] = $this->config->get('loginza2_confirm_company_required');
		}
		
		if (isset($this->request->post['loginza2_confirm_address_1_required'])) {
			$this->data['loginza2_confirm_address_1_required'] = $this->request->post['loginza2_confirm_address_1_required'];
		} else { 
			$this->data['loginza2_confirm_address_1_required'] = $this->config->get('loginza2_confirm_address_1_required');
		}
		
		if (isset($this->request->post['loginza2_confirm_postcode_required'])) {
			$this->data['loginza2_confirm_postcode_required'] = $this->request->post['loginza2_confirm_postcode_required'];
		} else { 
			$this->data['loginza2_confirm_postcode_required'] = $this->config->get('loginza2_confirm_postcode_required');
		}
		
		if (isset($this->request->post['loginza2_confirm_city_required'])) {
			$this->data['loginza2_confirm_city_required'] = $this->request->post['loginza2_confirm_city_required'];
		} else { 
			$this->data['loginza2_confirm_city_required'] = $this->config->get('loginza2_confirm_city_required');
		}
		
		if (isset($this->request->post['loginza2_confirm_zone_required'])) {
			$this->data['loginza2_confirm_zone_required'] = $this->request->post['loginza2_confirm_zone_required'];
		} else { 
			$this->data['loginza2_confirm_zone_required'] = $this->config->get('loginza2_confirm_zone_required');
		}
		
		
		if (isset($this->request->post['loginza2_confirm_country_required'])) {
			$this->data['loginza2_confirm_country_required'] = $this->request->post['loginza2_confirm_country_required'];
		} else { 
			$this->data['loginza2_confirm_country_required'] = $this->config->get('loginza2_confirm_country_required');
		}
		
		/* 
		lastname
		email
		phone
		company
		address_1		
		postcode
		city
		zone_id
		country_id
		end update: c1 */
		
		if (isset($this->request->post['loginza2_format'])) {
			$this->data['loginza2_format'] = $this->request->post['loginza2_format'];
		} elseif ($this->config->get('loginza2_format')) { 
			$this->data['loginza2_format'] = $this->config->get('loginza2_format');
		} else {
			$this->data['loginza2_format'] = 'table';
		}
		
		if (isset($this->request->post['loginza2_label'])) {
			$this->data['loginza2_label'] = $this->request->post['loginza2_label'];
		} elseif ($this->config->get('loginza2_label')) { 
			$this->data['loginza2_label'] = $this->custom_unserialize($this->config->get('loginza2_label'));
		} else {
			$this->data['loginza2_label'] = array();
		}
		
		if (isset($this->request->post['loginza2_admin_customer'])) {
			$this->data['loginza2_admin_customer'] = $this->request->post['loginza2_admin_customer'];
		} elseif ($this->config->has('loginza2_admin_customer')) { 
			$this->data['loginza2_admin_customer'] = $this->config->get('loginza2_admin_customer');
		} else {
			$this->data['loginza2_admin_customer'] = 1;
		}
		
		if (isset($this->request->post['loginza2_admin_customer_list'])) {
			$this->data['loginza2_admin_customer_list'] = $this->request->post['loginza2_admin_customer_list'];
		} elseif ($this->config->has('loginza2_admin_customer_list')) { 
			$this->data['loginza2_admin_customer_list'] = $this->config->get('loginza2_admin_customer_list');
		} else {
			$this->data['loginza2_admin_customer_list'] = 1;
		}
		
		if (isset($this->request->post['loginza2_admin_order'])) {
			$this->data['loginza2_admin_order'] = $this->request->post['loginza2_admin_order'];
		} elseif ($this->config->has('loginza2_admin_order')) { 
			$this->data['loginza2_admin_order'] = $this->config->get('loginza2_admin_order');
		} else {
			$this->data['loginza2_admin_order'] = 1;
		}
		
		if (isset($this->request->post['loginza2_admin_order_list'])) {
			$this->data['loginza2_admin_order_list'] = $this->request->post['loginza2_admin_order_list'];
		} elseif ($this->config->has('loginza2_admin_order_list')) { 
			$this->data['loginza2_admin_order_list'] = $this->config->get('loginza2_admin_order_list');
		} else {
			$this->data['loginza2_admin_order_list'] = 1;
		}
		
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/loginza2', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/loginza2', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['loginza2_admin'])) {
			$this->data['loginza2_admin'] = $this->request->post['loginza2_admin'];
		} else {
			$this->data['loginza2_admin'] = $this->config->get('loginza2_admin');
		}	
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
				
				
		
		$this->data['header'] = $this->load->controller('common/header');
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/loginza2.tpl', $this->data));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/loginza2')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		foreach( $this->socnets as $socnet=>$label )
		{
			if( empty( $this->request->post['loginza2_methods'][$socnet]['enable'] ) )
			{
				$this->request->post['loginza2_methods'][$socnet]['enable'] = 'n';
			}
		}
		
		
		if( !empty( $this->request->post['loginza2_sort'] ) )
		{
			$this->request->post['loginza2_sort'] = serialize($this->request->post['loginza2_sort']);
		}
		
		
		
		if( !empty( $this->request->post['loginza2_widget_id'] ) )
		{
			$this->request->post['loginza2_widget_id'] = trim($this->request->post['loginza2_widget_id']);
		}
		
		if( !empty( $this->request->post['loginza2_widget_sig'] ) )
		{
			$this->request->post['loginza2_widget_sig'] = trim($this->request->post['loginza2_widget_sig']);
		}
		
		
		
		if (!$this->error) {
			
			
			$VERSION = VERSION;
			$VERSION = str_replace(".", "", $VERSION);
		
			if( strlen($VERSION) == 3 )
			{
				$VERSION .= '0';
			}
			elseif( strlen($VERSION) > 4 )
			{
				$VERSION = substr($VERSION, 0, 4);
			}
			
			if( $VERSION <= 1500 )
			{
				if( $this->request->post['loginza2_modules'] )
				{
					$ar = array();
					foreach( $this->request->post['loginza2_modules'] as $key=>$val )
					{
						foreach($val as $k=>$v)
						{
							$this->request->post['loginza2_'.$key.'_'.$k] = $v;
							
						}
						
						$ar[] = $key;
					}
					
					$this->request->post['loginza2_module'] = implode(",", $ar);
				}
				else
				{
					//$this->request->post['loginza2_module'] = '';
				}
			}
			else
			{
				if( !empty( $this->request->post['loginza2_modules'] ) )
				{
					$this->request->post['loginza2_module'] = $this->request->post['loginza2_modules'];
				}
				else
				{
					//$this->request->post['loginza2_module'] = '';
				}
			}
			
			
			if( $VERSION <= 1500 )
			{
				if( $this->request->post['loginza2_popups'] )
				{
					$ar = array();
					foreach( $this->request->post['loginza2_popups'] as $key=>$val )
					{
						foreach($val as $k=>$v)
						{
							$this->request->post['loginza2_'.$key.'_'.$k] = $v;
							
						}
						
						$ar[] = $key;
					}
					
					$this->request->post['loginza2_popup_module'] = implode(",", $ar);
				}
				else
				{
					//$this->request->post['loginza2_popup_module'] = '';
				}
			}
			else
			{
				if( !empty( $this->request->post['loginza2_popups'] ) )
				{
					for($i=0; $i<count($this->request->post['loginza2_popups']); $i++ )
					{
						$this->request->post['loginza2_popups'][$i]['position']   = 'content_top';
						$this->request->post['loginza2_popups'][$i]['sort_order'] = 1;
					}
					
					$this->request->post['loginza2_popup_module'] = $this->request->post['loginza2_popups'];
				}
				else
				{
					//$this->request->post['loginza2_popup_module'] = '';
				}
			}
			
			
			
			
			if( empty($this->request->post['loginza2_admin_customer']) )
			$this->request->post['loginza2_admin_customer'] = 0;
			
			if( empty($this->request->post['loginza2_admin_customer_list']) )
			$this->request->post['loginza2_admin_customer_list'] = 0;
			
			if( empty($this->request->post['loginza2_admin_order']) )
			$this->request->post['loginza2_admin_order'] = 0;
			
			if( empty($this->request->post['loginza2_admin_order_list']) )
			$this->request->post['loginza2_admin_order_list'] = 0;
			
			if( empty($this->request->post['loginza2_show_standart_auth']) )
			$this->request->post['loginza2_show_standart_auth'] = 0;
			
			//if( !empty($this->request->post['loginza2_module']) )
			//$this->request->post['loginza2_module'] = serialize( $this->request->post['loginza2_module'] );
			
			if( !empty($this->request->post['loginza2_methods']) )
			$this->request->post['loginza2_methods'] = serialize( $this->request->post['loginza2_methods'] );
			
			if( !empty($this->request->post['loginza2_label']) )
			$this->request->post['loginza2_label'] = serialize( $this->request->post['loginza2_label'] );
			
			
			//$code = '<!-- start loginza --><script src="/catalog/view/javascript/jquery/loginza2-widget.js" type="text/javascript"></script><!-- end loginza -->';
			
			$this->request->post = $this->model_module_loginza2->makeCode($this->request->post, $this->socnets);
		/*
			if( $this->request->post['loginza2_showtype']=='window' && $this->config->get('loginza2_showtype')!='window' )
			{ 
				$this->request->post['config_google_analytics'] = $this->config->get('config_google_analytics').$code;
			}
			elseif( $this->request->post['loginza2_showtype']=='window' && $this->config->get('loginza2_showtype')=='window' )
			{
				//none
			}
			elseif( $this->request->post['loginza2_showtype']!='window' && $this->config->get('loginza2_showtype')=='window' )
			{
				$this->request->post['config_google_analytics'] = str_replace($code, "", 
																  $this->config->get('config_google_analytics'));
			}
			elseif( $this->request->post['loginza2_showtype']!='window' && !$this->config->get('loginza2_showtype')!='window' )
			{
				//none
			}
		*/
			return true;
		} else {
			return false;
		}	
	}
	
	private function custom_unserialize($s)
	{
		if( is_array($s) ) return $s;
	
		if(
			stristr($s, '{' ) != false &&
			stristr($s, '}' ) != false &&
			stristr($s, ';' ) != false &&
			stristr($s, ':' ) != false
		){
			return unserialize($s);
		}else{
			return $s;
		}

	}

}
?>