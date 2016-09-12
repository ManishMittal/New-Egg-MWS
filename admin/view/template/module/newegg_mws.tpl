<!--
/*
 * @support
 * http://www.opensourcetechnologies.com/contactus.html
 * sales@opensourcetechnologies.com
 * */
-->
<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-newegg-mws" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-newegg-mws" class="form-horizontal">
	      <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-ftp_server"><?php echo $entry_ftp_server; ?></label>
            <div class="col-sm-9">
              <input type="text" name="newegg_mws_ftp_server" value="<?php echo $newegg_mws_ftp_server; ?>" placeholder="<?php echo $entry_ftp_server; ?>" id="input-ftp_server" class="form-control" />
              <?php if ($error_newegg_mws_ftp_server) { ?>
              <div class="text-danger"><?php echo $error_newegg_mws_ftp_server; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-username"><?php echo $entry_ftp_username; ?></label>
            <div class="col-sm-9">
              <input type="text" name="newegg_mws_ftp_username" value="<?php echo $newegg_mws_ftp_username; ?>" placeholder="<?php echo $entry_ftp_username; ?>" id="input-ftp_server" class="form-control" />
              <?php if ($error_newegg_mws_ftp_username) { ?>
              <div class="text-danger"><?php echo $error_newegg_mws_ftp_username; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-password"><?php echo $entry_ftp_password; ?></label>
            <div class="col-sm-9">
              <input type="text" name="newegg_mws_ftp_password" value="<?php echo $newegg_mws_ftp_password; ?>" placeholder="<?php echo $entry_ftp_password; ?>" id="input-ftp_server" class="form-control" />
              <?php if ($error_newegg_mws_ftp_password) { ?>
              <div class="text-danger"><?php echo $error_newegg_mws_ftp_password; ?></div>
              <?php } ?>
            </div>
          </div>
          
          
          <div class="form-group">
            <label class="col-sm-12 "><?php echo $text_rule; ?></label>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-minimum-quantity-single"><?php echo $entry_minimum_quantity_single; ?></label>
            <div class="col-sm-9">
			  <input type="number" name="newegg_mws_minimum_quantity_single" value="<?php echo $newegg_mws_minimum_quantity_single;?>" class="form-control" placeholder="<?php echo $entry_minimum_quantity_single; ?>" id="input-secret"/>
			  <?php if ($error_newegg_mws_minimum_quantity_single) { ?>
              <div class="text-danger"><?php echo $error_newegg_mws_minimum_quantity_single; ?></div>
              <?php } ?>
             </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-single"><?php echo $entry_single; ?>%</label>
            <div class="col-sm-9">
			  <input type="number" name="newegg_mws_single" value="<?php echo $newegg_mws_single;?>" class="form-control" placeholder="<?php echo $entry_single; ?>" id="input-secret"/>
			  <?php if ($error_newegg_mws_single) { ?>
              <div class="text-danger"><?php echo $error_newegg_mws_single; ?></div>
              <?php } ?>
             </div>
          </div>
          					
          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-9">
              <select name="newegg_mws_status" id="input-status" class="form-control">
                <?php if ($newegg_mws_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
           <div class="form-group">
            <label class="col-sm-12 "><?php echo $text_urls; ?></label>
          </div>
          <?php foreach($urls as $url)
          {
			  ?>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="input-status"><a href="<?php echo $url['url']; ?>" target='_blank'><?php echo $url['text'];?></a></label>
				<div class="col-sm-9">	<?php echo $url['url']; ?></div>
			</div>
			<?php
		  }
		  ?>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
