
<div id="news">
	<div class="container">
		<div class="row">
			<div class="main-title">
				<h2><?php echo $heading_title; ?></h2>
				<a href="/index.php?route=information/news">
					<div class="news-all">
						<div class="tria-right">
							Все новости
						</div>
					</div>
				</a>
			</div>
			<div class="clear"></div>
			<?php foreach ($all_news as $news) { ?>
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
					</div>
				</div>
			</div>