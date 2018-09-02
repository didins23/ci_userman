<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class User_inet_model extends CI_Model
{

    public $table = 'tbl_user_inet';
    public $table2 = 'radcheck';
    public $id = 'id_userinet';
    public $order = 'DESC';

    function __construct()
    {
        parent::__construct();
    }

    // datatables
    function json() {
        $this->datatables->select('id_userinet,nama,ni_username,password,profil');
        $this->datatables->from('tbl_user_inet');
        //add this line for join
        $this->datatables->join('radusergroup', 'tbl_user_inet.profil = radusergroup.username');
        //$this->datatables->join('table2', 'tbl_user_inet.field = table2.field');
        $this->datatables->add_column('action', anchor(site_url('user_inet/read/$1'),'<i class="fa fa-eye" aria-hidden="true"></i>', array('class' => 'btn btn-danger btn-sm'))." 
            ".anchor(site_url('user_inet/update/$1'),'<i class="fa fa-pencil-square-o" aria-hidden="true"></i>', array('class' => 'btn btn-danger btn-sm'))." 
                ".anchor(site_url('user_inet/delete/$1'),'<i class="fa fa-trash-o" aria-hidden="true"></i>','class="btn btn-danger btn-sm" onclick="javasciprt: return confirm(\'Are You Sure ?\')"'), 'id_userinet');
        return $this->datatables->generate();
    }

    // get all
    function get_all()
    {
        $this->db->order_by($this->id, $this->order);
        return $this->db->get($this->table)->result();
    }

    // get data by id
    function get_by_id($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get($this->table)->row();
    }
    
    // get total rows
    function total_rows($q = NULL) {
        $this->db->like('id_userinet', $q);
	$this->db->or_like('nama', $q);
	$this->db->or_like('ni_username', $q);
	$this->db->or_like('password', $q);
	$this->db->or_like('profil', $q);
	$this->db->from($this->table);
        return $this->db->count_all_results();
    }

    // get data with limit and search
    function get_limit_data($limit, $start = 0, $q = NULL) {
        $this->db->order_by($this->id, $this->order);
        $this->db->like('id_userinet', $q);
	$this->db->or_like('nama', $q);
	$this->db->or_like('ni_username', $q);
	$this->db->or_like('password', $q);
	$this->db->or_like('profil', $q);
	$this->db->limit($limit, $start);
        return $this->db->get($this->table)->result();
    }

    // insert data
    function insert($data)
    {
        $this->db->insert($this->table, $data);
    }

    // update data
    function update($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->table, $data);
    }

    // delete data
/*    function delete($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete($this->table);
    }
*/
        function insert_radcheck()
    {

        
         $insertme_profile = array(
        'username' =>$this->input->post('ni_username',TRUE),
        'attribute'=> 'User-Profile',
        'op' => ':=',
        'value' => $this->input->post('profil',TRUE),
        'id_userinet' => $this->db->insert_id(), 

        );
         $insertme_userpass = array(
        'username' =>$this->input->post('ni_username',TRUE),
        'attribute'=> 'User-Password',
        'op' => '==',
        'value' => $this->input->post('password',TRUE), 
        'id_userinet' => $this->db->insert_id(),

        );
        $this->db->insert($this->table2, $insertme_profile);
        $this->db->insert($this->table2, $insertme_userpass);


    }

    function update_radcheck()
   {


        $data2 = array(
       'username' =>$this->input->post('ni_username',TRUE),
       'attribute'=> 'User-Profile',
       'op' => ':=',
       'value' => $this->input->post('profil',TRUE), 

        );
       $ni = $this->input->post('ni_username');
       $this->db->where('username', $ni);
       $this->db->where('attribute', 'User-Profile');
       $this->db->update($this->table2, $data2);

   }

    function update_radcheck_pass()
   {


        $data3 = array(
       'username' =>$this->input->post('ni_username',TRUE),
       'attribute'=> 'User-Password',
       'op' => '==',
       'value' => $this->input->post('password',TRUE), 

        );
       $ni = $this->input->post('ni_username');
       $this->db->where('username', $ni);
       $this->db->where('attribute', 'User-Password');
       $this->db->update($this->table2, $data3);

   }

   function delete($id)
   {
    $sql = "DELETE tbl_user_inet , radcheck FROM tbl_user_inet
            INNER JOIN
            radcheck ON radcheck.id_userinet = tbl_user_inet.id_userinet
            WHERE
            tbl_user_inet.id_userinet = ?;";

        $this->db->query($sql, array($id));
    }

}

/* End of file User_inet_model.php */
/* Location: ./application/models/User_inet_model.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2018-09-01 22:06:02 */
/* http://harviacode.com */