<?php if (!$logged) { ?>
<style>
.loginzabox
{
	border: 1px solid #ddd;
	margin-bottom: 20px;    
	border-radius: 4px 4px 4px 4px;
}

.loginzabox h3
{
	margin: 0px;
	color: #888888;
}

.loginzabox .loginzahead
{
	border-radius: 4px 4px 0px 0px;
	background: none repeat scroll 0 0 #eeeeee;
	border-bottom: 1px solid #ddd;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 20px;
	padding-right: 20px;
}

.loginzabox .loginzabody
{
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 20px;
	padding-right: 20px;
}

.loginzaform td
{
	padding-top: 5px;
}

</style>
<div  class="loginzabox">
<div class="loginzahead">
 <h3><?php echo $heading_title; ?></h3>
</div>
<div class="loginzabody">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	<table class="loginzaform">
		<tr>
			<td><?php echo $entry_email; ?></td>
		</tr>
		<tr>
			<td><input type="text" class="form-control col-sm-3" name="email" value=""></td>
		</tr>
		<tr>
			<td><?php echo $entry_password; ?></td>
		</tr>
		<tr>
			<td><input type="password" class="form-control col-sm-3" name="password"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="<?php echo $text_login; ?>" class="btn btn-primary" />
			</td>
		</tr>
	</table>
	
	
<?php if( $loginza2_widget_format == 'button' ) { ?>
<br>
<div class="content widget_account_loginza_button_content">		
			<div class="widget_account_button_right">
				
					<a href="http://loginza.ru/api/widget?token_url=<? echo urlencode(HTTP_SERVER.'index.php?route=account/loginza2'); 
					?><? if( $loginza2_widget_default ) 
					echo '&provider='.$loginza2_widget_default;
					?>&providers_set=<? echo $providers; ?><?php if($lang) echo '&lang='.$lang; ?>" class="<?php echo $classname; ?>">
					<img src="http://loginza.ru/img/sign_in_button_gray.gif" /></a>
			</div>
</div>			
<br>
<? } ?>		  
<? if( $loginza2_widget_format == 'icons' ) { ?>  
		<div class="widget_account_icons_links">
		  <? foreach( $res_socnets as $row ) { ?>
				<a  class="<?php echo $classname; ?>" href="https://loginza.ru/api/widget?token_url=<? 
				echo urlencode(HTTP_SERVER.'index.php?route=account/loginza2'); 
				?>&provider=<?php echo $row['name']; ?><?php if($lang) echo '&lang='.$lang; ?>"
				><img src="/image/loginza/icons/<? echo $row['name']; ?>.png" 
				alt="<? echo $row['label']; ?>"
				></a>&nbsp;
		  <? } ?>
		</div>		  
<? } ?>	
	</form>
    <ul>
      <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a> / <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
      <li><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></li>
    </ul>
    
</div>

</div>
    <?php } 
	
	echo $loginza2_confirm_block;
	?>
<? /*






<style>
.widget_account_icons_links
{
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 15px;
	float: left;
}
</style>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
      <?php if (!$logged) { ?>
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td><?php echo $entry_email; ?></td>
		</tr>
		<tr>
			<td><input type="text" name="email" value=""></td>
		</tr>
		<tr>
			<td><?php echo $entry_password; ?></td>
		</tr>
		<tr>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="<?php echo $text_login; ?>" class="button" />
			</td>
		</tr>
	</table>
	
	
<?php if( $loginza2_widget_format == 'button' ) { ?>
<br>
<div class="content widget_account_loginza_button_content">		
			<div class="widget_account_button_right">
				
					<a href="http://loginza.ru/api/widget?token_url=<? echo urlencode(HTTP_SERVER.'index.php?route=account/loginza2'); 
					?><? if( $loginza2_widget_default ) 
					echo '&provider='.$loginza2_widget_default;
					?>&providers_set=<? echo $providers; ?><?php if($lang) echo '&lang='.$lang; ?>" class="<?php echo $classname; ?>">
					<img src="http://loginza.ru/img/sign_in_button_gray.gif" /></a>
			</div>
</div>			
<? } ?>		  
<? if( $loginza2_widget_format == 'icons' ) { ?>  
		<div class="widget_account_icons_links">
		  <? foreach( $res_socnets as $row ) { ?>
				<a  class="<?php echo $classname; ?>" href="https://loginza.ru/api/widget?token_url=<? 
				echo urlencode(HTTP_SERVER.'index.php?route=account/loginza2'); 
				?>&provider=<?php echo $row['name']; ?><?php if($lang) echo '&lang='.$lang; ?>"
				><img src="/image/loginza/icons/<? echo $row['name']; ?>.png" 
				alt="<? echo $row['label']; ?>"
				></a>&nbsp;
		  <? } ?>
		</div>		  
<? } ?>	
	</form>
    <ul>
      <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a> / <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
      <li><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></li>
    </ul>
    <?php } ?>
    
	<?php if ($logged) { ?>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
      <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
    </ul>
    <?php } ?>
  </div>
</div>
*/ ?>