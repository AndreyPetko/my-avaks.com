<?php  
class ControllerModuleNews extends Controller {
	public function index() {
		$this->language->load('module/news');
		$this->load->model('extension/news');
		$this->load->model('tool/xdsimage');

		
		$filter_data = array(
			'page' => 1,
			'limit' => 2,
			'start' => 0,
		);
		
		$this->document->addStyle('catalog/view/theme/coloring/stylesheet/news.css');
	 
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['all_news_link'] = $this->url->link('information/news');
		$data['all_news_text'] = $this->language->get('all_news_text');
	 
		$all_news = $this->model_extension_news->getAllNews($filter_data);
	 
		$data['all_news'] = array();
	 
		foreach ($all_news as $news) {
			$data['all_news'][] = array (
				'title' 		=> html_entity_decode($news['title'], ENT_QUOTES),
				'description' 	=> (strlen(strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES))) > 220 ? mb_substr(strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES)), 0, 220) . '...' : strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES))),
				'view' 			=> $this->url->link('information/news/news', 'news_id=' . $news['news_id']),
				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($news['date_added'])),
				'image' => $this->model_tool_xdsimage->resize($news['image'], 240, 140)
			);
		}
		
		
	 
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/news.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/news.tpl', $data);
		} else {
			return $this->load->view('default/template/module/news.tpl', $data);
		}
	}
}