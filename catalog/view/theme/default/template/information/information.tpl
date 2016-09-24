<?php echo $header ?>

<div class="container">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
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