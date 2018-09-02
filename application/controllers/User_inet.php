<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class User_inet extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        is_login();
        $this->load->model('User_inet_model');
        $this->load->library('form_validation');        
	$this->load->library('datatables');
    }

    public function index()
    {
        $this->template->load('template','user_inet/tbl_user_inet_list');
    } 
    
    public function json() {
        header('Content-Type: application/json');
        echo $this->User_inet_model->json();
    }

    public function read($id) 
    {
        $row = $this->User_inet_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id_userinet' => $row->id_userinet,
		'nama' => $row->nama,
		'ni_username' => $row->ni_username,
		'password' => $row->password,
		'profil' => $row->profil,
	    );
            $this->template->load('template','user_inet/tbl_user_inet_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('user_inet'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('user_inet/create_action'),
	    'id_userinet' => set_value('id_userinet'),
	    'nama' => set_value('nama'),
	    'ni_username' => set_value('ni_username'),
	    'password' => set_value('password'),
	    'profil' => set_value('profil'),
	);
        $this->template->load('template','user_inet/tbl_user_inet_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'nama' => $this->input->post('nama',TRUE),
		'ni_username' => $this->input->post('ni_username',TRUE),
		'password' => $this->input->post('password',TRUE),
		'profil' => $this->input->post('profil',TRUE),
	    );

            $this->User_inet_model->insert($data);
            $this->User_inet_model->insert_radcheck();
            $this->session->set_flashdata('message', 'Create Record Success 2');
            redirect(site_url('user_inet'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->User_inet_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('user_inet/update_action'),
		'id_userinet' => set_value('id_userinet', $row->id_userinet),
		'nama' => set_value('nama', $row->nama),
		'ni_username' => set_value('ni_username', $row->ni_username),
		'password' => set_value('password', $row->password),
		'profil' => set_value('profil', $row->profil),
	    );

            $data2 = array(
        'username' =>set_value('ni_username', $row->ni_username),
        'attribute'=> 'User-Profile',
        'op' => ':=',
        'value' => set_value('profil', $row->profil),
        'id_userinet' => set_value('id_userinet', $row->id_userinet),

        );
            $data3 = array(
        'username' =>set_value('ni_username', $row->ni_username),
        'attribute'=> 'User-Password',
        'op' => '==',
        'value' =>set_value('password', $row->password),
        'id_userinet' => set_value('id_userinet', $row->id_userinet),
    );


            $this->template->load('template','user_inet/tbl_user_inet_form', $data);
            $this->template->load('template','user_inet/tbl_user_inet_form', $data2);
            $this->template->load('template','user_inet/tbl_user_inet_form', $data3);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('user_inet'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id_userinet', TRUE));
        } else {
            $data = array(
		'nama' => $this->input->post('nama',TRUE),
		'ni_username' => $this->input->post('ni_username',TRUE),
		'password' => $this->input->post('password',TRUE),
		'profil' => $this->input->post('profil',TRUE),
	    );

            $this->User_inet_model->update($this->input->post('id_userinet', TRUE), $data);
            $this->User_inet_model->update_radcheck();
            $this->User_inet_model->update_radcheck_pass();
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('user_inet'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->User_inet_model->get_by_id($id);

        if ($row) {
            $this->User_inet_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('user_inet'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('user_inet'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('nama', 'nama', 'trim|required');
	$this->form_validation->set_rules('ni_username', 'ni username', 'trim|required');
	$this->form_validation->set_rules('password', 'password', 'trim|required');
	$this->form_validation->set_rules('profil', 'profil', 'trim|required');

	$this->form_validation->set_rules('id_userinet', 'id_userinet', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel()
    {
        $this->load->helper('exportexcel');
        $namaFile = "tbl_user_inet.xls";
        $judul = "tbl_user_inet";
        $tablehead = 0;
        $tablebody = 1;
        $nourut = 1;
        //penulisan header
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0,pre-check=0");
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header("Content-Disposition: attachment;filename=" . $namaFile . "");
        header("Content-Transfer-Encoding: binary ");

        xlsBOF();

        $kolomhead = 0;
        xlsWriteLabel($tablehead, $kolomhead++, "No");
	xlsWriteLabel($tablehead, $kolomhead++, "Nama");
	xlsWriteLabel($tablehead, $kolomhead++, "Ni Username");
	xlsWriteLabel($tablehead, $kolomhead++, "Password");
	xlsWriteLabel($tablehead, $kolomhead++, "Profil");

	foreach ($this->User_inet_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
	    xlsWriteLabel($tablebody, $kolombody++, $data->nama);
	    xlsWriteLabel($tablebody, $kolombody++, $data->ni_username);
	    xlsWriteLabel($tablebody, $kolombody++, $data->password);
	    xlsWriteLabel($tablebody, $kolombody++, $data->profil);

	    $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

}

/* End of file User_inet.php */
/* Location: ./application/controllers/User_inet.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2018-09-01 22:06:02 */
/* http://harviacode.com */