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
    <?php $class = 'col-sm-4 col-md-6'; ?>
		<?php $news_class_image = 'col-sm-12'; ?>
		<?php $news_class_content = 'col-sm-12'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-9'; ?>
		<?php $news_class_image = 'col-lg-3 col-md-4 col-sm-12'; ?>
		<?php $news_class_content = 'col-lg-9 col-md-8 col-sm-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
		<?php $news_class_image = 'col-lg-2 col-md-3 col-sm-4'; ?>
		<?php $news_class_content = 'col-lg-10 col-md-9 col-sm-8'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

    <?php foreach ($all_news as $news) { ?>
		<div class="panel panel-default">
			
			<div class="panel-body">
				<div class="row">
					
				<div class="col-lg-12">
					<h3 style="margin: 0 0 20px 0"><a href="<?php echo $news['view']; ?>"><?php echo $news['title']; ?></a></h3>
				</div>
				
				<div class="<?php echo $news_class_image; ?>">
				<?php if ($news['image']) { ?>
				<a href="<?php echo $news['view']; ?>"><img src="<?php echo $news['image']; ?>" alt="<?php echo $news['title']; ?>" class="img-responsive" style="margin-bottom: 10px;"></a>
				<?php } ?>
				</div>
				<div class="<?php echo $news_class_content; ?>">
					
					<p><?php echo $news['description']; ?></p>
					<p><i class="fa fa-calendar"></i> <?php echo $news['date_added']; ?></p>
					<p><a href="<?php echo $news['view']; ?>" class="btn btn-default"><?php echo $text_view; ?></a></p>
					
				</div>
				

				</div>
			</div>

		</div>
		<?php } ?>
		
		<div class="well well-sm">
				<div class="row">
					<div class="col-md-6 text-left"><?php echo $pagination; ?></div>
					<div class="col-md-6 text-right-md"><div style="padding: 6px 0;"><?php echo $results; ?></div></div>
				</div>
			</div>
		
	  <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 