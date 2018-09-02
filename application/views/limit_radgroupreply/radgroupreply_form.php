<div class="content-wrapper">
    
    <section class="content">
        <div class="box box-warning box-solid">
            <div class="box-header with-border">
                <h3 class="box-title">INPUT DATA RADGROUPREPLY</h3>
            </div>
            <form action="<?php echo $action; ?>" method="post">
            
<table class='table table-bordered>'        

	    <tr><td width='200'>Groupname <?php echo form_error('groupname') ?></td><td><input type="text" class="form-control" name="groupname" id="groupname" placeholder="Groupname" value="<?php echo $groupname; ?>" /></td></tr>
	    <tr><td width='200'>Attribute <?php echo form_error('attribute') ?></td><td><input type="text" class="form-control" name="attribute" id="attribute" placeholder="Attribute" value="<?php echo $attribute; ?>" /></td></tr>
	    <tr><td width='200'>Op <?php echo form_error('op') ?></td><td><input type="text" class="form-control" name="op" id="op" placeholder="Op" value="<?php echo $op; ?>" /></td></tr>
	    <tr><td width='200'>Value <?php echo form_error('value') ?></td><td><input type="text" class="form-control" name="value" id="value" placeholder="Value" value="<?php echo $value; ?>" /></td></tr>
	    <tr><td></td><td><input type="hidden" name="id" value="<?php echo $id; ?>" /> 
	    <button type="submit" class="btn btn-danger"><i class="fa fa-floppy-o"></i> <?php echo $button ?></button> 
	    <a href="<?php echo site_url('limit_radgroupreply') ?>" class="btn btn-info"><i class="fa fa-sign-out"></i> Kembali</a></td></tr>
	</table></form>        </div>
</div>
</div>