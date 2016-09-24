<?php echo $header; ?><?php echo $column_left; ?>
<div id="content"> <!-- div id="content" -->
  <div class="page-header"><!-- div class="page-header" -->
    <div class="container-fluid">
      <div class="pull-right">
	  
        <a href="javascript: $('#stay_field').attr('value', '0'); $('#form').submit();" 
		data-toggle="tooltip" 
		title="<?php echo $button_save_and_go; ?>" 
		class="btn btn-primary"><i class="fa fa-save"></i></a>
		
        <a href="javascript: $('#stay_field').attr('value', '1'); $('#form').submit();" 
		data-toggle="tooltip"  
		title="<?php echo $button_save_and_stay; ?>" 
		class="btn btn-primary"><i class="fa fa-pencil"></i></a>
		
        <a href="<?php echo $cancel; ?>" 
		data-toggle="tooltip" 
		title="<?php echo $button_cancel; ?>" 
		class="btn btn-default"><i class="fa fa-reply"></i></a>
	  </div>
		 
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div><!-- div class="page-header" -->

  <div class="container-fluid"><!-- div class="container-fluid" -->
  
    <?php if ( !empty($error_warning) ) { ?>
	
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
	
    <?php } ?>
	
	<?php if( !empty($success) ) { ?>	
    <div class="alert alert-success"><i class="fa fa-info-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
	<?php }  ?>

	
    <div class="panel panel-default"> <!--  class="panel panel-default" -->
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body"> <!--  class="panel-body" -->
	  
	<ul class="nav nav-tabs">
	
            <li class="active"  id="link-tab-general" 
			><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li id="link-tab-dobor" 
			><a href="#tab-dobor" data-toggle="tab"><?php echo $tab_dobor; ?></a></li>
            <li id="link-tab-socseti" 
			><a href="#tab-socseti" data-toggle="tab"><?php echo $tab_socseti; ?></a></li>
           <!--
            <li id="link-tab-widget" 
			><a href="#tab-widget" data-toggle="tab"><?php echo $tab_widget; ?></a></li>
		   <li id="link-tab-popup" 
			><a href="#tab-popup" data-toggle="tab"><?php echo $tab_popup; ?></a></li>
			-->
            <li id="link-tab-dobor" 
			><a href="#tab-dobor" data-toggle="tab"><?php echo $tab_dobor; ?></a></li>
           
            <li id="link-tab-design" 
			><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
            <li id="link-tab-support" 
			><a href="#tab-support" data-toggle="tab"><?php echo $tab_support; ?></a></li>
			
      </ul>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form"
	 class="form-horizontal"
	>
	<input type="hidden" name="stay" id="stay_field" value="1">
	
<div class="tab-content"><!--  class="tab-content" -->
	
	  <style>
	  .clist 
	  {
		border-top:  1px #ccc solid;
		border-left:  1px #ccc solid;
	  }
	  
	  .clist td
	  {
		padding: 5px;
		border-right: 1px #ccc solid;
		border-bottom: 1px #ccc solid;
	  }
	  
	  .plus
	  {
		background: green;
		text-align: center;
	  }
	  
	  .minus
	  {
		background: #F58C6C;
		text-align: center;
	  }
	  
	  .vopros
	  {
		text-align: center;
	  }
	  </style>
	  
	<script>
		function set_tab()
		{
			if( $('#link-tab-general').attr('class') == 'selected' )
			{
				document.getElementById('hiddentab').value = 'link-tab-general';
			}
			
			if( $('#link-tab-dobor').attr('class') == 'selected' )
			{
				document.getElementById('hiddentab').value = 'link-tab-dobor';
			}
			
			if( $('#link-tab-socseti').attr('class') == 'selected' )
			{
				document.getElementById('hiddentab').value = 'link-tab-socseti';
			}
			
			if( $('#link-tab-widget').attr('class') == 'selected' )
			{
				document.getElementById('hiddentab').value = 'link-tab-widget';
			}
			
			if( $('#link-tab-popup').attr('class') == 'selected' )
			{
				document.getElementById('hiddentab').value = 'link-tab-popup';
			}
			
			if( $('#link-tab-design').attr('class') == 'selected' )
			{
				document.getElementById('hiddentab').value = 'link-tab-design';
			}
			
			if( $('#link-tab-support').attr('class') == 'selected' )
			{
				document.getElementById('hiddentab').value = 'link-tab-support';
			}
		}
		
			function show_showtype_block()
			{
				if( document.getElementById('loginza2_format_table').checked )
				{
					document.getElementById('showtype_block').style.display = 'none';
					document.getElementById('default_provider_block').style.display = 'block';
				}
				else if( document.getElementById('loginza2_format_button').checked )
				{
					document.getElementById('showtype_block').style.display = 'block';
					document.getElementById('default_provider_block').style.display = 'block';
				}
				else if( document.getElementById('loginza2_format_icons').checked )
				{
					document.getElementById('showtype_block').style.display = 'block';
					document.getElementById('default_provider_block').style.display = 'none';
				}
			}
	
	$.fn.tabs = function() {
	var selector = this;
	
	this.each(function() {
		var obj = $(this); 
		
		$(obj.attr('href')).hide();
		
		$(obj).click(function() {
			$(selector).removeClass('selected');
			
			$(selector).each(function(i, element) {
				$($(element).attr('href')).hide();
			});
			
			$(this).addClass('selected');
			
			$($(this).attr('href')).show();
			
			return false;
		});
	});

	$(this).show();
	
	$(this).first().click();
};
	</script>
		
	  <div id="tab-general" class="tab-pane active" >
	  
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_version; ?>
			</label>
            <div class="col-sm-10" style="padding-top: 9px;">2.3
			</div>
			
        </div>
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_status; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_status" class="form-control" >
                  <?php if ( $loginza2_status ) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0" ><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected" ><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
			</div>
			
        </div>
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_format; ?>
			</label>
            <div class="col-sm-10">
				<table>
				<tr>
					<td width=200>
					
						<table>
						<tr>
							<td>
								<input type="radio"
									onClick="show_showtype_block()"
									name="loginza2_format" 
									value="table" 
									id="loginza2_format_table"
									<?php if( $loginza2_format=='table' ) { ?> checked <?php } ?>
								>
							</td>
							<td style="padding-top: 2px; padding-left: 5px;">
								<label for="loginza2_format_table"><?php echo $text_format_table; ?></label>
							</td>
						</tr>
						</table>
					</td>
					
					<td width=200>
					
					
						<table>
						<tr>
							<td>
								<input type="radio" name="loginza2_format" 
									onClick="show_showtype_block()"
									value="button" 
									id="loginza2_format_button"
									<?php if( $loginza2_format=='button' ) { ?> checked <?php } ?> 
								>
							</td>
							<td style="padding-top: 2px; padding-left: 5px;">
								<label for="loginza2_format_button"><?php echo $text_format_button; ?></label>
							</td>
						</tr>
						</table>
					
					</td>
					
					<td width=200>
					
						<table>
						<tr>
							<td>
								<input type="radio" name="loginza2_format" 
										onClick="show_showtype_block()"
										value="icons" id="loginza2_format_icons"
										<?php if( $loginza2_format=='icons' ) { ?> checked <?php } ?>
									>
							</td>
							<td style="padding-top: 2px; padding-left: 5px;">
								<label for="loginza2_format_icons"><?php echo $text_format_icons; ?></label>
							</td>
						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td valign=top><img src="/image/loginza/table.gif"></td>
					<td valign=top><img src="/image/loginza/button.gif"></td>
					<td valign=top><img src="/image/loginza/icons.gif"></td>
				</tr>
				</table>
			</div>
			
        </div>
	  
	  
		<div id="showtype_block" style="display: none;">
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_showtype; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_showtype" class="form-control" >
					<option value="window"
					<?php if( $loginza2_showtype=='window' ) { ?> selected <?php } ?>
					><?php echo $text_showtype_window; ?></option>
					<option value="redirect"
					<?php if( $loginza2_showtype=='redirect' ) { ?> selected <?php } ?>
					><?php echo $text_showtype_redirect; ?></option>
				</select>
				<div><i><?php echo $text_showtype_notice; ?></i></div>
			</div>
			
        </div>
		</div>
		
		<div id="default_provider_block" style="display: none;">
		
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_default; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_default" class="form-control" >
					<option value=""><?php echo $text_none; ?></option>
					<?php foreach($socnets_list as $value=>$label) { ?>
						<option value="<?php echo $value; ?>"
						<?php if( $value==$loginza2_default ) echo 'selected'; ?>
						
						><?php echo $label; ?></option>
					<?php } ?>
                </select>
			</div>			
        </div>
		<script>
			show_showtype_block();
		</script>
		
		</div>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_label; ?>
			</label>
            <div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
					<p>
					<input type="text" class="form-control"  name="loginza2_label[<?php echo $language['language_id']; ?>]" value="<?php if( !empty($loginza2_label[ $language['language_id'] ]) ) echo $loginza2_label[ $language['language_id'] ]; ?>">&nbsp;<img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
					</p>
				<?php } ?>
			</div>			
        </div>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_save_to_addr; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_save_to_addr" class="form-control" >
					<option value="customer_only"
					<?php if( $loginza2_save_to_addr=='customer_only' ) { ?> selected <?php } ?>
					><?php echo $text_customer_only; ?></option>
					<option value="customer_addr"
					<?php if( $loginza2_save_to_addr=='customer_addr' ) { ?> selected <?php } ?>
					><?php echo $text_customer_addr; ?></option>
				</select>
			</div>			
        </div>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_shop_folder; ?>
			</label>
            <div class="col-sm-10">
				<input type="text" name="loginza2_shop_folder"  class="form-control" 
						value="<?php echo $loginza2_shop_folder; ?>" />
			</div>			
        </div>
		
	  </div>
	  <div id="tab-dobor" class="tab-pane" >
		<p><?php echo $entry_confirm_data; ?></p>
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_dobortype; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_dobortype" class="form-control">
					<option value="one"
						<?php if( $loginza2_dobortype == 'one' ) { ?> selected <?php } ?>
					><?php   echo $entry_dobortype_one; ?></option>
					<option value="every"
						<?php if( $loginza2_dobortype == 'every' ) { ?> selected <?php } ?>
					><?php echo $entry_dobortype_every; ?></option>
				</select>
			</div>			
        </div>
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_firstname; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_confirm_firstname_status" class="form-control">
                  <?php if ( $loginza2_confirm_firstname_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_firstname_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                </select>
				<input type="checkbox" name="loginza2_confirm_firstname_required" value="1"
				id="loginza2_confirm_firstname_required"
				<?php if( $loginza2_confirm_firstname_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_firstname_required"><?php echo $text_required;?></label>
			</div>			
        </div>
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_lastname; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_confirm_lastname_status" class="form-control">
                <?php if ( $loginza2_confirm_lastname_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_lastname_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_lastname_required" value="1"
				id="loginza2_confirm_lastname_required"
				<?php if( $loginza2_confirm_lastname_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_lastname_required"><?php echo $text_required;?></label>
			</div>			
        </div>
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_email; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_confirm_email_status" class="form-control">
                <?php if ( $loginza2_confirm_email_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_email_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                </select>
				<input type="checkbox" name="loginza2_confirm_email_required" value="1"
				id="loginza2_confirm_email_required"
				<?php if( $loginza2_confirm_email_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_email_required"><?php echo $text_required;?></label>
			</div>			
        </div>
		
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_phone; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_confirm_telephone_status" class="form-control">
                 <?php if ( $loginza2_confirm_telephone_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_telephone_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_telephone_required" value="1"
				id="loginza2_confirm_telephone_required"
				<?php if( $loginza2_confirm_telephone_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_telephone_required"><?php echo $text_required;?></label>
			</div>			
        </div>
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_company; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_confirm_company_status" class="form-control">
                 <?php if ( $loginza2_confirm_company_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_company_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_company_required" value="1"
				id="loginza2_confirm_company_required"
				<?php if( $loginza2_confirm_company_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_company_required"><?php echo $text_required;?></label>
			</div>			
        </div>
		
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_postcode; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_confirm_postcode_status" class="form-control">
                 <?php if ( $loginza2_confirm_postcode_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_postcode_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_postcode_required" value="1"
				id="loginza2_confirm_postcode_required"
				<?php if( $loginza2_confirm_postcode_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_postcode_required"><?php echo $text_required;?></label>
			</div>			
        </div>
		
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_country; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_confirm_country_status" class="form-control">
                 <?php if ( $loginza2_confirm_country_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_country_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_country_required" value="1"
				id="loginza2_confirm_country_required"
				<?php if( $loginza2_confirm_country_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_country_required"><?php echo $text_required;?></label>
			</div>			
        </div>
		
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_zone; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_confirm_zone_status" class="form-control">
                 <?php if ( $loginza2_confirm_zone_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_zone_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_zone_required" value="1"
				id="loginza2_confirm_zone_required"
				<?php if( $loginza2_confirm_zone_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_zone_required"><?php echo $text_required;?></label>
			</div>			
        </div>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_city; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_confirm_city_status" class="form-control">
                 <?php if ( $loginza2_confirm_city_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_city_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_city_required" value="1"
				id="loginza2_confirm_city_required"
				<?php if( $loginza2_confirm_city_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_city_required"><?php echo $text_required;?></label>
			</div>			
        </div>
		
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_confirm_address_1; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_confirm_address_1_status" class="form-control">
                 <?php if ( $loginza2_confirm_address_1_status == 1  ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" selected="selected" ><?php echo $text_confirm_none; ?></option>
					<option value="2" ><?php echo $text_confirm_allways; ?></option>
                  <?php } elseif( $loginza2_confirm_address_1_status == 2 ) { ?>
					<option value="0"><?php echo $text_confirm_disable; ?></option>
					<option value="1" ><?php echo $text_confirm_none; ?></option>
					<option value="2" selected="selected" ><?php echo $text_confirm_allways; ?></option>
				  <?php } else { ?>
					<option value="0" selected="selected"><?php echo $text_confirm_disable; ?></option>
					<option value="1"><?php echo $text_confirm_none; ?></option>
					<option value="2"><?php echo $text_confirm_allways; ?></option>
				  <?php } ?>
                 </select>
				<input type="checkbox" name="loginza2_confirm_address_1_required" value="1"
				id="loginza2_confirm_address_1_required"
				<?php if( $loginza2_confirm_address_1_required ) { ?>
				checked
				<?php } ?>
				><label for="loginza2_confirm_address_1_required"><?php echo $text_required;?></label>
			</div>			
        </div>
		
		
	  </div>
	  <div id="tab-socseti" class="tab-pane" >
	  
	  <b><?php echo $filter_header; ?></b><br>
		<i><?php echo $filter_notice; ?></i>
		<br><br>
		<table class="clist" cellpadding=0 cellspacing=0>
		<tr>
			<td></td>
			<td></td>
			<td colspan=12 align=center><b><?php echo $col_data; ?></b></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
            <td><b><?php echo $col_socnet; ?></b></td>
            <td><b>URL</b></td>
            <td><b><?php echo $col_link; ?></b></td>
			<td><b><?php echo $col_nickname; ?></b></td>   
            <td><b><?php echo $col_email; ?></b></td>
            <td><b><?php echo $col_gender; ?></b></td>
            <td><b><?php echo $col_photo; ?></b></td>
            <td><b><?php echo $col_name; ?></b></td>
            <td><b><?php echo $col_dob; ?></b></td>
            <td><b><?php echo $col_work; ?></b></td>
            <td><b><?php echo $col_address; ?></b></td>
            <td><b><?php echo $col_phone; ?></b></td>
            <td><b><?php echo $col_im; ?></b></td>
            <td><b><?php echo $col_biography; ?></b></td>
            <td><b><?php echo $col_enable; ?></b></td>
            <td><b><?php echo $col_sort_order; ?></b></td>
        </tr>
		
		<?php foreach( $loginza2_methods as $key=>$method ) { ?>
		
		<tr>
            <td><?php echo $method['name']; ?></td>
            <td><a href="<?php echo $method['url']; ?>" target=_blank><?php echo $method['url']; ?></a></td>     
<?php if( !empty( $data_nets[$key]['nodata'] ) ) { ?>
<td colspan=12>Не работало в момент тестирования</td>
<?php } else { ?>
			
            <td class="<?php echo $data_nets[$key]['link_class']; ?>">
			<?php echo $data_nets[$key]['link_sign']; ?></td>                    
            <td class="<?php echo $data_nets[$key]['nickname_class']; ?>"><?php echo $data_nets[$key]['nickname_sign']; ?></td>          
            <td class="<?php echo $data_nets[$key]['email_class']; ?>"><?php echo $data_nets[$key]['email_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['gender_class']; ?>"><?php echo $data_nets[$key]['gender_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['photo_class']; ?>"><?php echo $data_nets[$key]['photo_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['name_class']; ?>"><?php echo $data_nets[$key]['name_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['dob_class']; ?>"><?php echo $data_nets[$key]['dob_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['work_class']; ?>"><?php echo $data_nets[$key]['work_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['address_class']; ?>"><?php echo $data_nets[$key]['address_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['phone_class']; ?>"><?php echo $data_nets[$key]['phone_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['im_class']; ?>"><?php echo $data_nets[$key]['im_sign']; ?></td>
            <td class="<?php echo $data_nets[$key]['biography_class']; ?>"><?php echo $data_nets[$key]['biography_sign']; ?></td>	
<?php } ?>			
            <td align=center><input type="checkbox" name="loginza2_methods[<?php echo $key; ?>][enable]" value="y"
				<?php if( isset($method['enable']) && $method['enable']=='y' ) { ?>
				checked
				<?php } ?>
			></td>
			
            <td align=center><input type="text" name="loginza2_methods[<?php echo $key; ?>][sort]" value="<?php 
			if( isset($method['sort']) ) echo $method['sort']; 	?>"  style="width: 20px;" ></td>
        </tr>
		
		<?php } ?>
		
        </table>		
	  </div>
	  <!-- /////////////////////////////////////////////////////////////////////////////// -->
	  
	  <? /*<div id="tab-widget" class="tab-pane" >
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_widget_status; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_widget_status" class="form-control" >
                  <?php if ($loginza2_widget_status) { ?>
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
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_widget_name; ?>
			</label>
            <div class="col-sm-10">
	  		<?php foreach ($languages as $language) { ?>
			<p>
			<input type="text" class="form-control" name="loginza2_widget_name[<?php echo $language['language_id']; ?>]" value="<?php if( !empty($loginza2_widget_name[ $language['language_id'] ]) ) echo $loginza2_widget_name[ $language['language_id'] ]; ?>">&nbsp;<img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
			</p>
			<?php } ?>
			</div>			
        </div>
		
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_widget_format; ?>
			</label>
            <div class="col-sm-10">
	  		
				<table>
				<tr>
					<td width=200><input type="radio" name="loginza2_widget_format" 
					value="button" 
					onClick="show_widget_showtype_block()"
					id="loginza2_widget_format_button"
					<?php if( $loginza2_widget_format=='button' ) { ?> checked <?php } ?> 
					><label for="loginza2_widget_format_button"><?php echo $text_format_button; ?></label></td>
					
					<td width=200><input type="radio" name="loginza2_widget_format" 
					onClick="show_widget_showtype_block()"
					value="icons" id="loginza2_widget_format_icons"
					<?php if( $loginza2_widget_format=='icons' ) { ?> checked <?php } ?>
					><label for="loginza2_widget_format_icons"><?php echo $text_format_icons; ?></label></td>
				</tr>
				<tr>
					<td valign=top><img src="/image/loginza/button.gif"></td>
					<td valign=top><img src="/image/loginza/icons.gif"></td>
				</tr>
				</table>
			</div>			
        </div>
	  
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_widget_after; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_widget_after" class="form-control">
					<option value="show"
					<?php if( $loginza2_widget_after=='show' ) { ?> selected <?php } ?>
					><?php echo $text_widget_after_show; ?></option>
					<option value="hide"
					<?php if( $loginza2_widget_after=='hide' ) { ?> selected <?php } ?>
					><?php echo $text_widget_after_hide; ?></option>
				</select>
			</div>			
        </div>
		
	   	   <?php /*
	  <br><br>
	  <style>
	  .list
	  {
		border-left: 1px #ccc solid;
		border-top: 1px #ccc solid;
	  }
	  .list td
	  {
		padding: 10px;
		border-right: 1px #ccc solid;
		border-bottom: 1px #ccc solid;
	  }
	  </style>
	   <table id="module" class="list" width="100%">
          <thead>
            <tr>
              <td class="left"><b><?php echo $entry_widget_layout; ?></b></td>
              <td class="left"><b><?php echo $entry_widget_position; ?></b></td>
              <td class="left"><b><?php echo $entry_widget_status; ?></b></td>
              <td class="right"><b><?php echo $entry_widget_sort_order; ?></b></td>
              <td></td>
            </tr>
          </thead>
          <?php $module_row = 0; ?>
          <?php foreach ($loginza2_modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
              <td class="left"><select name="loginza2_modules[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="loginza2_modules[<?php echo $module_row; ?>][position]">
                  <?php if ($module['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                  <?php } else { ?>
                  <option value="content_top"><?php echo $text_content_top; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'content_bottom') { ?>
                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                  <?php } else { ?>
                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="loginza2_modules[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="loginza2_modules[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="btn btn-primary"
			  ><span><?php echo $button_remove; ?></span></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="4"></td>
              <td class="left"><a onclick="addModule();" class="btn btn-primary"><span><?php
			  echo $button_add_module; ?></span></a></td>
            </tr>
          </tfoot>
        </table>
	  </div>
		*/ ?>
	  <!-- /////////////////////////////////////////////////////////////////////////////// -->
	  
	  
	  
		<?php /*
	  <div id="tab-popup" class="tab-pane" >
	  
	  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_widget_status; ?>
			</label>
            <div class="col-sm-10">
				<select name="loginza2_popup_status" class="form-control">
                  <?php if ($loginza2_popup_status) { ?>
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
            <label class="col-sm-2 control-label" for="input-access-secret">
				<?php echo $entry_popup_name; ?>
			</label>
            <div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
				<p>
					<input type="text" class="form-control"  
					name="loginza2_popup_name[<?php echo $language['language_id']; ?>]" 
					value="<?php if( !empty($loginza2_popup_name[ $language['language_id'] ]) ) echo $loginza2_popup_name[ $language['language_id'] ]; ?>" >&nbsp;<img 
					src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" />
				</p>
				<?php } ?>
			</div>
        </div>
		
	  <br><br>
	   <table id="popup" class="list" width=100%>
          <thead>
            <tr>
              <td class="left"><b><?php echo $entry_widget_layout; ?></b></td>
              <td class="left"><b><?php echo $entry_widget_status; ?></b></td>
              <td></td>
            </tr>
          </thead>
          <?php $popup_row = 0; ?>
          <?php foreach ($loginza2_popups as $popup) { ?>
          <tbody id="popup-row<?php echo $popup_row; ?>">
            <tr>
              <td class="left"><select name="loginza2_popups[<?php echo $popup_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $popup['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="loginza2_popups[<?php echo $popup_row; ?>][status]">
                  <?php if ($popup['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="left"><a onclick="$('#popup-row<?php echo $popup_row; ?>').remove();" class="btn btn-primary"
			  ><span><?php echo $button_remove; ?></span></a></td>
            </tr>
          </tbody>
          <?php $popup_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="2"></td>
              <td class="left"><a onclick="addPopup();" class="btn btn-primary"><span><?php echo $button_add_module; ?></span></a></td>
            </tr>
          </tfoot>
        </table>
	  </div>
		*/ ?>
	  <!-- /////////////////////////////////////////////////////////////////////////////// -->
	  
	  
	  <!-- /////////////////////////////////////////////////////////////////////////////// -->
	  
	  
	  
	  <div id="tab-design" class="tab-pane" >
	  <p><?php echo $text_design_notice2; ?></p>
	  
		<table class="list">
		<thead>
		<tr>
			<td class="left" width=33%><b><?php echo $text_design_col_element; ?></b></td>
			<td class="left" width=33%><b><?php echo $text_design_col_file; ?></b></td>
			<td class="left" width=34%><b><?php echo $text_design_col_comment; ?></b></td>
		</tr>
		</thead>
		<tr>
			<td class="left"><?php echo $text_design_row_loginza2_account; ?></td>
			<td class="left">/admin/view/template/loginza2_blocks/loginza2_account.tpl</td>
			<td class="left"><?php echo $text_design_notice; ?></td>
		</tr>
		<tr>
			<td class="left"><?php echo $text_design_row_loginza2_checkout; ?></td>
			<td class="left">/admin/view/template/loginza2_blocks/loginza2_checkout.tpl</td>
			<td class="left"><?php echo $text_design_notice; ?></td>
		</tr>
		<tr>
			<td class="left"><?php echo $text_design_row_loginza2_simple; ?></td>
			<td class="left">/admin/view/template/loginza2_blocks/loginza2_simple.tpl</td>
			<td class="left"><?php echo $text_design_notice; ?></td>
		</tr>
		<tr>
			<td class="left"><?php echo $text_design_row_loginza2_simplereg; ?></td>
			<td class="left">/admin/view/template/loginza2_blocks/loginza2_simplereg.tpl</td>
			<td class="left"><?php echo $text_design_notice; ?></td>
		</tr>
		<tr>
			<td class="left"><?php echo $text_design_row_loginza2_popup; ?></td>
			<td class="left">/catalog/view/theme/default/template/module/loginza2_popup.tpl</td>
			<td class="left"></td>
		</tr>
		<tr>
			<td class="left"><?php echo $text_design_row_loginza2_confirm; ?></td>
			<td class="left">/admin/view/template/loginza2_blocks/loginza2_confirm.tpl</td>
			<td class="left"><?php echo $text_design_notice; ?></td>
		</tr>
		<tr>
			<td class="left"><?php echo $text_design_row_loginza2_frame; ?></td>
			<td class="left">/catalog/view/theme/default/template/account/loginza2_frame.tpl</td>
			<td class="left"></td>
		</tr>
		<tr>
			<td class="left"><?php echo $text_design_row_loginza2_frame_success; ?></td>
			<td class="left">/catalog/view/theme/default/template/account/loginza2_frame_success.tpl</td>
			<td class="left"></td>
		</tr>
		<tr>
			<td class="left"><?php echo $text_design_row_module_loginza2; ?></td>
			<td class="left">/catalog/view/theme/default/template/module/loginza2.tpl</td>
			<td class="left"></td>
		</tr>
		</table>
	  </div>
	  <div id="tab-support" class="tab-pane" >
	  
			<p><?php echo $text_frame; ?></p>
			<iframe width=100% height=700 src="http://softpodkluch.ru/faq/loginza.html" border=0 frameborder="0" style="border: 1px #ccc solid;"></iframe>
			<?php echo $text_contact; ?>
	  </div>

</div><!--  class="tab-content" -->
    </form>
	</div> <!--  class="panel-body" -->
	</div> <!--  class="panel panel-default" -->
  </div><!-- div class="container-fluid" -->
</div> <!-- div id="content" -->
<?php /*
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="loginza2_modules[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="loginza2_modules[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="loginza2_modules[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="loginza2_modules[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="btn btn-primary"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}

var popup_row = <?php echo $popup_row; ?>;

function addPopup() {	
	html  = '<tbody id="popup-row' + popup_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="loginza2_popups[' + popup_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="loginza2_popups[' + popup_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="left"><a onclick="$(\'#popup-row' + popup_row + '\').remove();" class="btn btn-primary"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#popup tfoot').before(html);
	
	popup_row++;
}
//--></script> 
*/ ?>
<?php echo $footer; ?>