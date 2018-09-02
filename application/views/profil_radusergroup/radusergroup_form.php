<div class="content-wrapper">
    
    <section class="content">
        <div class="box box-warning box-solid">
            <div class="box-header with-border">
                <h3 class="box-title">INPUT DATA RADUSERGROUP</h3>
            </div>
            <form action="<?php echo $action; ?>" method="post">
            
<table class='table table-bordered>'        

	    <tr><td width='200'>Username <?php echo form_error('username') ?></td><td><input type="text" class="form-control" name="username" id="username" placeholder="Username" value="<?php echo $username; ?>" /></td></tr>
	    <tr><td width='200'>Groupname <?php echo form_error('groupname') ?></td><td><input type="text" class="form-control" name="groupname" id="groupname" placeholder="Groupname" value="<?php echo $groupname; ?>" /></td></tr>
	    <tr><td width='200'>Priority <?php echo form_error('priority') ?></td><td><input type="text" class="form-control" name="priority" id="priority" placeholder="Priority" value="<?php echo $priority; ?>" /></td></tr>
	    <tr><td></td><td><input type="hidden" name="id_group" value="<?php echo $id_group; ?>" /> 
	    <button type="submit" class="btn btn-danger"><i class="fa fa-floppy-o"></i> <?php echo $button ?></button> 
	    <a href="<?php echo site_url('profil_radusergroup') ?>" class="btn btn-info"><i class="fa fa-sign-out"></i> Kembali</a></td></tr>
	</table></form>        </div>
</div>
</div>