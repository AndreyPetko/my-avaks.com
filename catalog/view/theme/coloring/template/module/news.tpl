<div class="panel panel-default box-news">
  <div class="panel-heading">
		<i class="fa fa-newspaper-o"></i>&nbsp;&nbsp;<?php echo $heading_title; ?>
		<a class="all-news" href="<?php echo $all_news_link; ?>"><?php echo $all_news_text; ?></a>
	</div>
	<div class="panel-body">

		<?php $i = 0; ?>
		<?php foreach ($all_news as $news) { ?>
		<?php if ($i) {echo "<hr>";}?>
		<div class="row record">
			
			
			<?php if ($news['image']) {?>
				<div class="col-lg-2 col-md-3 col-sm-4 record-image">
					<a href="<?php echo $news['view']; ?>"><img src="<?php echo $news['image']; ?>" ="<?php echo $news['title']; ?>" title="<?php echo $news['title']; ?>"></a>
				</div>
			<?php } ?>

			

			<div class="col-lg-10 col-md-9 col-sm-8 record-caption">
			<h4 class="name">
					<a href="<?php echo $news['view']; ?>" ><?php echo $news['title']; ?></a>
				</h4>
				<div class="date">
					<i class="fa fa-calendar"></i>&nbsp;&nbsp;<?php echo $news['date_added']; ?>
				</div>
				
				<div class="descripton">
					<?php echo $news['description']; ?> <a class="more" href="<?php echo $news['view']; ?>">→</a>
				</div>
				
				
				
			</div>

		</div>
		<?php $i++; ?>
		<?php } ?>

	</div>
</div>
