<?php 
if( !empty($this->request->get['loginza2close']) )
{
	$this->session->data['loginza2_confirmdata_show'] = 0;
}

if( !empty($this->session->data['loginza2_confirmdata']) && 
	!empty($this->session->data['loginza2_confirmdata_show']) )
{
	$data = unserialize( $this->session->data['loginza2_confirmdata'] );
	
	$loginza2_confirm_block = $this->config->get('loginza2_confirm_block');
	
	
	$loginza2_confirm_block = str_replace("#divframe_height#", (300-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block );
	
	$loginza2_confirm_block = str_replace("#frame_height#", (320-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block);
	
	if( strstr($this->session->data['loginza2_lastlink'], "?") )
	$loginza2_confirm_block = str_replace("#lastlink#", $this->session->data['loginza2_lastlink'].'&loginza2close=1', $loginza2_confirm_block);
	else
	$loginza2_confirm_block = str_replace("#lastlink#", $this->session->data['loginza2_lastlink'].'?loginza2close=1', $loginza2_confirm_block);
	
	
	$loginza2_confirm_block = str_replace("#frame_url#", $this->url->link( 'account/loginza2/frame' ), $loginza2_confirm_block);
	
	echo $loginza2_confirm_block;
}
 elseif( empty($this->request->get['loginza2close']) ) { ?>

<? if( $show_cookie ) { ?>
<div>
<style>
#loginza2Overlay {
    background: none repeat scroll 0 0 #fff;
    height: 100%;
    position: fixed;
    width: 100%; 
	left: 0;
    overflow: hidden;
    top: 0;
    z-index: 99;
}

#loginza2PopUp {
    background: none repeat scroll 0 0 #fff;
    border: 1px solid #DFDFDF;
	box-shadow: 0px 0px 10px #DFDFDF;
    z-index: 999;
	
	position: fixed;
	width: 517px;
	height: 292px;
	
	-moz-border-radius: 15px;
	border-radius: 15px;
	padding-top: 28px;
}

#loginza2PopUp .header
{
	text-align: center;
	padding: 0px;
	font-size: 30px;
	line-height: 28px;
	margin: 0px;
}

#loginza2PopUp .skipp
{
	padding-top: 5px;

}

#loginza2PopUp .skiplink
{
	color: #000;
	text-decoration: none;
	font-size: 25px;
}

</style>
<div id="loginza2Overlay" style="display: none; opacity: 0.9;"></div>
<div id="loginza2PopUp" style="display: none;">
<p class="header"><? echo $heading_title; ?></p>
<p style="height: 4px;"></p>
<p align=center style="margin: 0px;">
<iframe src="http://loginza.ru/api/widget?overlay=loginza<?php 
		if( $loginza2_default ) 
		echo '&provider='.$loginza2_default;  
		?>&token_url=<?php echo $domain; ?><?php 
		echo urlencode( $loginza2_shop_folder.'/index.php?route=account/loginza2'); 
		?>&providers_set=<?php echo $providers; ?>&lang=<?php echo $lang; ?>" 
		style="width:359px;height:180px;" scrolling="no" frameborder="no"></iframe>
</p>
<p align=center class="skipp"><i><a href="javascript: closeLoginza2PopUp();" class="skiplink"><?php echo $text_skip; ?></a></i></p>
</div>
<script>
function show_loginza2_popup()
{
	var otstup1 = ($(window).width() - 517)/2;
	var otstup2 = ($(window).height() - 320)/2;
	
	document.getElementById('loginza2PopUp').style.left    = otstup1+'px';
	document.getElementById('loginza2PopUp').style.top     = otstup2+'px';
	document.getElementById('loginza2PopUp').style.display = 'block';
	document.getElementById('loginza2Overlay').style.display = 'block';
}

function closeLoginza2PopUp()
{
	document.getElementById('loginza2PopUp').style.display = 'none';
	document.getElementById('loginza2Overlay').style.display = 'none';
	setCookie('show_loginza2_popup','1');
}

function setCookie( c_name, value, exdays )
{
	var exdate=new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
	document.cookie=c_name + "=" + c_value;
}


show_loginza2_popup();
</script>
</div>
<? } ?>
<? } ?>
