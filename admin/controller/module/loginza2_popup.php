<?php
class ControllerModuleLoginza2popup extends Controller {

	public function index() 
	{
		$this->response->redirect(HTTPS_SERVER . 'index.php?route=module/loginza2&token=' . $this->session->data['token']);
	}
	
	public function install()
	{
		$this->response->redirect(HTTPS_SERVER . 'index.php?route=extension/module/install&token='.$this->session->data['token'].
		'&extension=loginza2');
	}
	
	public function uninstall()
	{
		$this->response->redirect(HTTPS_SERVER . 'index.php?route=extension/module/uninstall&token='.$this->session->data['token'].
		'&extension=loginza2');
	}
}

?>