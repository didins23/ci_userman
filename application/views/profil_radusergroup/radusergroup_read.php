<!doctype html>
<html>
    <head>
        <title>harviacode.com - codeigniter crud generator</title>
        <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css') ?>"/>
        <style>
            body{
                padding: 15px;
            }
        </style>
    </head>
    <body>
        <h2 style="margin-top:0px">Radusergroup Read</h2>
        <table class="table">
	    <tr><td>Username</td><td><?php echo $username; ?></td></tr>
	    <tr><td>Groupname</td><td><?php echo $groupname; ?></td></tr>
	    <tr><td>Priority</td><td><?php echo $priority; ?></td></tr>
	    <tr><td></td><td><a href="<?php echo site_url('profil_radusergroup') ?>" class="btn btn-default">Cancel</a></td></tr>
	</table>
        </body>
</html>