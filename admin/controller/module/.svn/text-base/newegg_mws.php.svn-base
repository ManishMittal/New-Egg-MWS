<?php
/*
 * @support
 * http://www.opensourcetechnologies.com/contactus.html
 * sales@opensourcetechnologies.com
 * */
class ControllerModuleNewEggMWS extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/newegg_mws');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('newegg_mws', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_rule'] = $this->language->get('text_rule');
		$data['text_urls'] = $this->language->get('text_urls');
		
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_ftp_server'] = $this->language->get('entry_ftp_server');
		$data['entry_ftp_username'] = $this->language->get('entry_ftp_username');
		$data['entry_ftp_password'] = $this->language->get('entry_ftp_password');
		
		$data['entry_minimum_quantity_single'] = $this->language->get('entry_minimum_quantity_single');
		$data['entry_single'] = $this->language->get('entry_single');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		if(HTTP_CATALOG) 
		{
			$http=HTTP_CATALOG;
		}
		else
		{
			$http=HTTPS_CATALOG;
		}
		$data['urls'][]=array(
		'url'=>$http.'MarketplaceWebService/cron_newegg_mws.php',
		'text'=>$this->language->get('text_cron')
		);

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
				
		if (isset($this->error['newegg_mws_ftp_server'])) {
			$data['error_newegg_mws_ftp_server'] = $this->error['newegg_mws_ftp_server'];
		} else {
			$data['error_newegg_mws_ftp_server'] = '';
		}
		if (isset($this->error['newegg_mws_ftp_username'])) {
			$data['error_newegg_mws_ftp_username'] = $this->error['newegg_mws_ftp_username'];
		} else {
			$data['error_newegg_mws_ftp_username'] = '';
		}
		if (isset($this->error['newegg_mws_ftp_password'])) {
			$data['error_newegg_mws_ftp_password'] = $this->error['newegg_mws_ftp_password'];
		} else {
			$data['error_newegg_mws_ftp_password'] = '';
		}
		
				
		if (isset($this->error['newegg_mws_minimum_quantity_single'])) {
			$data['error_newegg_mws_minimum_quantity_single'] = $this->error['newegg_mws_minimum_quantity_single'];
		} else {
			$data['error_newegg_mws_minimum_quantity_single'] = '';
		}
		
		if (isset($this->error['newegg_mws_single'])) {
			$data['error_newegg_mws_single'] = $this->error['newegg_mws_single'];
		} else {
			$data['error_newegg_mws_single'] = '';
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
			'href' => $this->url->link('module/newegg_mws', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/newegg_mws', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['newegg_mws_status'])) {
			$data['newegg_mws_status'] = $this->request->post['newegg_mws_status'];
		} else {
			$data['newegg_mws_status'] = $this->config->get('newegg_mws_status');
		}
				
		if (isset($this->request->post['newegg_mws_ftp_server'])) {
			$data['newegg_mws_ftp_server'] = $this->request->post['newegg_mws_ftp_server'];
		} else {
			$data['newegg_mws_ftp_server'] = $this->config->get('newegg_mws_ftp_server');
		}
		
		if (isset($this->request->post['newegg_mws_ftp_username'])) {
			$data['newegg_mws_ftp_username'] = $this->request->post['newegg_mws_ftp_username'];
		} else {
			$data['newegg_mws_ftp_username'] = $this->config->get('newegg_mws_ftp_username');
		}
		
		if (isset($this->request->post['newegg_mws_ftp_password'])) {
			$data['newegg_mws_ftp_password'] = $this->request->post['newegg_mws_ftp_password'];
		} else {
			$data['newegg_mws_ftp_password'] = $this->config->get('newegg_mws_ftp_password');
		}
		if (isset($this->request->post['newegg_mws_minimum_quantity_single'])) {
			$data['newegg_mws_minimum_quantity_single'] = $this->request->post['newegg_mws_minimum_quantity_single'];
		} else {
			$data['newegg_mws_minimum_quantity_single'] = $this->config->get('newegg_mws_minimum_quantity_single');
		}
		
		if (isset($this->request->post['newegg_mws_single'])) {
			$data['newegg_mws_single'] = $this->request->post['newegg_mws_single'];
		} else {
			$data['newegg_mws_single'] = $this->config->get('newegg_mws_single');
		}
		
		if (isset($this->request->post['newegg_mws_sort_order'])) {
			$data['newegg_mws_sort_order'] = $this->request->post['newegg_mws_sort_order'];
		} else {
			$data['newegg_mws_sort_order'] = $this->config->get('newegg_mws_sort_order');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/newegg_mws.tpl', $data));
	}

	protected function validate() {
		
		if (!$this->user->hasPermission('modify', 'module/newegg_mws')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['newegg_mws_ftp_password']) {
			$this->error['newegg_mws_ftp_password'] = $this->language->get('error_newegg_mws_ftp_password');
		}
		if (!$this->request->post['newegg_mws_ftp_server']) {
			$this->error['newegg_mws_ftp_server'] = $this->language->get('error_newegg_mws_ftp_server');
		}
		if (!$this->request->post['newegg_mws_ftp_username']) {
			$this->error['newegg_mws_ftp_username'] = $this->language->get('error_newegg_mws_ftp_username');
		}
		
		
		if (!$this->request->post['newegg_mws_minimum_quantity_single']) {
			$this->error['newegg_mws_minimum_quantity_single'] = $this->language->get('error_newegg_mws_minimum_quantity_single');
		}
		
		if (!$this->request->post['newegg_mws_minimum_quantity_single']) {
			$this->error['newegg_mws_minimum_quantity_single'] = $this->language->get('error_newegg_mws_minimum_quantity_single');
		}
		if (!$this->request->post['newegg_mws_single']) {
			$this->error['newegg_mws_single'] = $this->language->get('error_newegg_mws_single');
		}
		return !$this->error;
	}
}
