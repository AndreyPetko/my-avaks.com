<script src="https://loginza.ru/js/widget.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/loginza2.css" />
<?php /* ==================== Крупные значки таблицей ======================= */ ?>
<?php if( $loginza2_format == 'table' ) { ?>
	<div class="simplecheckout-block-heading simple_loginza2_table_content">	
		#loginza2_label#
		<div align=center class="simple_loginza2_table_links">
		<iframe src="https://loginza.ru/api/widget?overlay=loginza<?php 
		if( $loginza2_default ) 
		echo '&provider='.$loginza2_default;  
		?>&token_url=#domain#<?php 
		echo urlencode('/index.php?route=account/loginza2'); 
		?>&providers_set=<?php echo $providers; ?>&lang=#lang#" 
		style="width:359px;height:180px;" scrolling="no" frameborder="no"></iframe>
		</div>
	</div>
<?php } ?>
<?php /* ====================  / END Крупные значки таблицей ======================= */ ?>

<?php /* ==================== Кнопка Логинзы ============== */ ?>
<?php if( $loginza2_format == 'button' ) { ?>
	<div class="simplecheckout-block-heading simple_loginza2_button_content">
			#loginza2_label#	
			<div  class="simple_loginza2_button_links">
				<a class="<?php echo $classname; ?>" href="https://loginza.ru/api/widget?token_url=#domain#<?php 
				echo urlencode('/index.php?route=account/loginza2'); 
				?><?php if( $loginza2_default ) 
				echo '&provider='.$loginza2_default;
				?>&providers_set=<?php echo $providers; ?>&lang=#lang#">
				<img src="https://loginza.ru/img/sign_in_button_gray.gif" 
				alt="#loginza2_label#" />
				</a>
			</div>
	</div>	  
<?php } ?>
<?php /* ====================  / END Кнопка Логинзы ============== */ ?>		  

<?php /* ==================== Маленькие иконки ============== */ ?>
		  
		  <?php if( $loginza2_format == 'icons' ) { 
		  ?>
		  <div class="simplecheckout-block-heading simple_loginza2_icons_content">
			#loginza2_label#
		  
		  
		  <div class="simple_loginza2_icons_links">
		  <?php foreach( $res_socnets as $row ) { ?>
		  <a  class="<?php echo $classname; ?>"  target=_blank  href="https://loginza.ru/api/widget?token_url=#domain#<?php 
			echo urlencode('/index.php?route=account/loginza2'); 
			?>&provider=<?php echo $row['name']; ?>&lang=#lang#"
			><img src="/image/loginza/icons/<?php echo $row['name']; ?>.png" alt="<?php echo $row['label']; ?>"
			></a>&nbsp;
			
		  <?php } ?>
		  </div>
</div>		  
		<?php } ?>
<?php /* ==================== / END Маленькие иконки ============== */ ?>