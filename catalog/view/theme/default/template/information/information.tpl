<?php echo $header ?>

<div class="container">
	<div id="breadcrumps">
    <a href="<?php echo $home; ?>">
      <img src="/catalog/view/theme/default/images/home-icon-bread.jpg">
      Главная
    </a>
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <a href="<?php echo $breadcrumb['href']; ?>">
      <img src="/catalog/view/theme/default/images/breadcr-arrow.jpg">
      <?php echo $breadcrumb['text']; ?>
    </a>
    <?php } ?>
  </div>
		<div class="row">
			<?php $class = 'col-sm-12'; ?>

			<div id="content" class="<?php echo $class; ?>">
				<?php echo $content_top; ?>
				<h1><?php echo $heading_title; ?></h1>
				<?php echo $description; ?>
				<?php echo $content_bottom; ?>
			</div>
			<?php echo $column_right; ?>
		</div>
	</div>


	<?php echo $footer ?>