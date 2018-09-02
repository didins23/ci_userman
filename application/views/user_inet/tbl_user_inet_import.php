<div class="content-wrapper">
    
    <section class="content">
        <div class="box box-warning box-solid">
            <div class="box-header with-border">
                <h3 class="box-title">IMPORT DATA USER</h3>
            </div>
          
	

		<?php echo form_open_multipart('Import_Excel/upload');?>
  		<input type="file" name="file"/>
  		<input type="submit" value="Upload file" class="btn btn-danger">
		<td></td><tr>
	    <a href="<?php echo site_url('user_inet') ?>" class="btn btn-info"><i class="fa fa-sign-out"></i> Kembali</a>
	    </tr>			

</section>
</div>
<?php echo $this->session->flashdata('msg'); ?> 