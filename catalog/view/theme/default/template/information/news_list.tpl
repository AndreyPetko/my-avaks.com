<?php echo $header; ?>
<div class="container">
	<div id="breadcrumps">
		<a href="/">
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
	<div class="row"><?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			<h1><?php echo $heading_title; ?></h1>
			<!-- <table class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<th></th>
						<th><?php echo $text_title; ?></th>
						<th><?php echo $text_description; ?></th>
						<th><?php echo $text_date; ?></th>
						<th class="text-right"></th>
					</tr>
				</thead>
				<tbody> -->
					<?php foreach ($all_news as $news) { ?>
					<!-- <tr>
						<td style="vertical-align:middle" class="text-center"><img src="<?php echo $news['image']; ?>" /></td>
						<td style="vertical-align:middle"><?php echo $news['title']; ?></td>
						<td style="vertical-align:middle"><?php echo $news['description']; ?></td>
						<td style="vertical-align:middle"><?php echo $news['date_added']; ?></td>
						<td style="vertical-align:middle" class="text-right"><a href="<?php echo $news['view']; ?>"><?php echo $text_view; ?></a></td>
					</tr> -->
						<div class="col-sm-3">
					<div class="news-item">
						<a href="<?php echo $news['view']; ?>">
							<div class="news-img">
								<?php if($news['image']) { ?>
									<img src="<?php echo $news['image']; ?>" ?>
									<?php } else { ?>
										<img src="/catalog/view/theme/default/images/index_13.jpg">
										<?php } ?>
									</div>
									<div class="news-bottom">
										<div class="news-name">
											<p><?php echo $news['title']; ?></p>
										</div>
										<div class="news-txt">
											<p><?php echo $news['description']; ?></p>
										</div>

										<div class="date">
											<?php echo $news['date_added']; ?>
										</div>
										<div class="btn-more">
											Читать дальше
										</div>
									</div>
								</a>
							</div>
						</div>
					<?php } ?>
			<!-- 	</tbody>
			</table> -->
			<div class="pagination-div">
				<?php echo $pagination; ?>
			</div>
			<?php echo $content_bottom; ?></div>
			<?php echo $column_right; ?></div>
		</div>
		<?php echo $footer; ?> 