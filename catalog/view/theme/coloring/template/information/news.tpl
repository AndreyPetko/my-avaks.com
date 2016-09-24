<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
		<?php $breadcount = count($breadcrumbs) - 1; ?>
    <?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
		<?php if ($key != $breadcount) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } else {?>
		<li class="active"><?php echo $breadcrumb['text']; ?></li>
		<?php } ?>
    <?php } ?>
  </ul>
	<h1><?php echo $heading_title; ?></h1>
	
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      
	  <?php if ($image) { ?>
	  <div class="main-image">
	  <a href="<?php echo $original_image; ?>" target="_blank"><img src="<?php echo $image; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive"/></a>
		
	  </div>
		
		
	  <?php } ?>
	  <div class="article red-links" style="margin-bottom: 20px;"><?php echo $description; ?></div>
			<div class="social-likes">
				<div class="facebook" title="Поделиться ссылкой на Фейсбуке">Facebook</div>
				<div class="twitter" title="Поделиться ссылкой в Твиттере">Twitter</div>
				<div class="mailru" title="Поделиться ссылкой в Моём мире">Мой мир</div>
				<div class="vkontakte" title="Поделиться ссылкой во Вконтакте">Вконтакте</div>
				<div class="odnoklassniki" title="Поделиться ссылкой в Одноклассниках">Одноклассники</div>
				<div class="plusone" title="Поделиться ссылкой в Гугл-плюсе">Google+</div>
				<div class="pinterest" title="Поделиться картинкой на Пинтересте" data-media="">Pinterest</div>
		</div>
	  </div>
    <?php echo $column_right; ?></div><?php echo $content_bottom; ?>
</div>
<script>
$(document).ready(function() {
	$('.main-image').magnificPopup({
		type:'image',
		delegate: 'a'
	});
});
</script>
<?php echo $footer; ?> 