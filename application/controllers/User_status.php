<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class User_status extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        is_login();
        $this->load->model('User_status_model');
        $this->load->library('form_validation');        
	$this->load->library('datatables');
    }

    public function index()
    {
        $this->template->load('template','user_status/user_status_list');
    } 
    
    public function json() {
        header('Content-Type: application/json');
        echo $this->User_status_model->json();
    }

    public function read($id) 
    {
        $row = $this->User_status_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id' => $row->id,
		'radacct_id' => $row->radacct_id,
		'username' => $row->username,
		'nasipaddress' => $row->nasipaddress,
		'framedipaddress' => $row->framedipaddress,
		'callingstationid' => $row->callingstationid,
		'timestamp' => $row->timestamp,
		'acctinputoctets' => $row->acctinputoctets,
		'acctoutputoctets' => $row->acctoutputoctets,
	    );
            $this->template->load('template','user_status/user_status_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('user_status'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('user_status/create_action'),
	    'id' => set_value('id'),
	    'radacct_id' => set_value('radacct_id'),
	    'username' => set_value('username'),
	    'nasipaddress' => set_value('nasipaddress'),
	    'framedipaddress' => set_value('framedipaddress'),
	    'callingstationid' => set_value('callingstationid'),
	    'timestamp' => set_value('timestamp'),
	    'acctinputoctets' => set_value('acctinputoctets'),
	    'acctoutputoctets' => set_value('acctoutputoctets'),
	);
        $this->template->load('template','user_status/user_status_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'radacct_id' => $this->input->post('radacct_id',TRUE),
		'username' => $this->input->post('username',TRUE),
		'nasipaddress' => $this->input->post('nasipaddress',TRUE),
		'framedipaddress' => $this->input->post('framedipaddress',TRUE),
		'callingstationid' => $this->input->post('callingstationid',TRUE),
		'timestamp' => $this->input->post('timestamp',TRUE),
		'acctinputoctets' => $this->input->post('acctinputoctets',TRUE),
		'acctoutputoctets' => $this->input->post('acctoutputoctets',TRUE),
	    );

            $this->User_status_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success 2');
            redirect(site_url('user_status'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->User_status_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('user_status/update_action'),
		'id' => set_value('id', $row->id),
		'radacct_id' => set_value('radacct_id', $row->radacct_id),
		'username' => set_value('username', $row->username),
		'nasipaddress' => set_value('nasipaddress', $row->nasipaddress),
		'framedipaddress' => set_value('framedipaddress', $row->framedipaddress),
		'callingstationid' => set_value('callingstationid', $row->callingstationid),
		'timestamp' => set_value('timestamp', $row->timestamp),
		'acctinputoctets' => set_value('acctinputoctets', $row->acctinputoctets),
		'acctoutputoctets' => set_value('acctoutputoctets', $row->acctoutputoctets),
	    );
            $this->template->load('template','user_status/user_status_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('user_status'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
		'radacct_id' => $this->input->post('radacct_id',TRUE),
		'username' => $this->input->post('username',TRUE),
		'nasipaddress' => $this->input->post('nasipaddress',TRUE),
		'framedipaddress' => $this->input->post('framedipaddress',TRUE),
		'callingstationid' => $this->input->post('callingstationid',TRUE),
		'timestamp' => $this->input->post('timestamp',TRUE),
		'acctinputoctets' => $this->input->post('acctinputoctets',TRUE),
		'acctoutputoctets' => $this->input->post('acctoutputoctets',TRUE),
	    );

            $this->User_status_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('user_status'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->User_status_model->get_by_id($id);

        if ($row) {
            $this->User_status_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('user_status'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('user_status'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('radacct_id', 'radacct id', 'trim|required');
	$this->form_validation->set_rules('username', 'username', 'trim|required');
	$this->form_validation->set_rules('nasipaddress', 'nasipaddress', 'trim|required');
	$this->form_validation->set_rules('framedipaddress', 'framedipaddress', 'trim|required');
	$this->form_validation->set_rules('callingstationid', 'callingstationid', 'trim|required');
	$this->form_validation->set_rules('timestamp', 'timestamp', 'trim|required');
	$this->form_validation->set_rules('acctinputoctets', 'acctinputoctets', 'trim|required');
	$this->form_validation->set_rules('acctoutputoctets', 'acctoutputoctets', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}

/* End of file User_status.php */
/* Location: ./application/controllers/User_status.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2018-09-02 01:40:44 */
/* http://harviacode.com */