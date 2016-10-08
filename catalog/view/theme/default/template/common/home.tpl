<?php echo $header; ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<input type="hidden" id="categories-input" value='<?php echo json_encode($categories); ?>'>

<div id="first-content">
	<div class="container">
		<div class="row">
			<div id="mainMenuIndex">

				<div id="submenu">
					<div id="submenuUl">
						<?php foreach ($categories as $key => $category): ?>
							<?php if ($category['children']): ?>
								<ul  class="child-list" id="children-<?php echo $key ?>">
									<?php foreach ($category['children'] as $childKey => $child): ?>
										<li data-childid="<?php echo $child['id'] ?>" class="child-item"><img src=""><a href="<?php echo $child['href'] ?>"><?php echo $child['name'] ?></a></li>
									<?php endforeach ?>
								</ul>
							<?php endif ?>

						<?php endforeach ?>
					</div>
					<a href="">
						<div id="submenuImg">
								<!-- <h4><?php echo $cat['name'] ?> </h4> -->
								<?php foreach ($categories as $key => $category): ?>
									<?php if ($category['children']): ?>
								<?php foreach ($category['children'] as $childKey => $child): ?>
									<img id="child-img-<?php echo $child['id']; ?>" class="child-images" style="display: none;" src="<?php echo HTTP_SERVER . 'image/' . $child['image'] ?>" />
								<?php endforeach ?>
									<?php endif ?>

						<?php endforeach ?>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<div id="category-menu">
						<?php foreach ($categories as $key => $cat): ?>
							<a href="<?php echo $cat['href'] ?>">
								<div class="category-menu-item" data-key="<?php echo $key ?>" >
									<p><?php echo $cat['name'] ?></p>
									<?php if ($cat['children']): ?>
										<div class="category-arrow"></div>
									<?php endif ?>
								</div>
							</a>
						<?php endforeach ?>

						<div class="category-menu-premium">
							<a href="/index.php?route=product/special">
								<div class="category-menu-item-premium">
									<p>Акции</p>
									<div class="category-arrow-premium">
										<img src="/catalog/view/theme/default/images/prem1-g.png">
									</div>
									<div class="catalog-tria"></div>
								</div>
							</a>
							<a href="/index.php?route=product/category&path=163">
								<div class="category-menu-item-premium">
									<p>Хиты продаж</p>
									<div class="category-arrow-premium">
										<img src="/catalog/view/theme/default/images/prem2-g.png">
									</div>
									<div class="catalog-tria"></div>
								</div>
							</a>
							<a href="/index.php?route=product/category&path=164">
								<div class="category-menu-item-premium">
									<p>Распродажа</p>
									<div class="category-arrow-premium">
										<img src="/catalog/view/theme/default/images/prem3-g.png">
									</div>
									<div class="catalog-tria"></div>
								</div>
							</a>
							<a href="/index.php?route=product/category&path=165">
								<div class="category-menu-item-premium">
									<p>Товар дня</p>
									<div class="category-arrow-premium">
										<img src="/catalog/view/theme/default/images/prem4-g.png">
									</div>
									<div class="catalog-tria"></div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<?php echo $content_top; ?>

				<div class="advantages">
					<a href="/index.php?route=information/information&information_id=6">
						<div class="adv-item">
							<img src="/catalog/view/theme/default/images/adv1-g.png">
							<h5>Доставка</h5>
						</div>
					</a>
					<a href="">
						<div class="adv-item">
							<img src="/catalog/view/theme/default/images/adv2-g.png">
							<h5>Поддержка</h5>
						</div>
					</a>
					<a href="">
						<div class="adv-item">
							<img src="/catalog/view/theme/default/images/adv3-g.png">
							<h5>Защита</h5>
						</div>
					</a>
					<a href="">
						<div class="adv-item">
							<img src="/catalog/view/theme/default/images/adv4-g.png">
							<h5>Гарантия</h5>
						</div>
					</a>
					<a href="">
						<div class="adv-item">
							<img src="/catalog/view/theme/default/images/adv5-g.png">
							<h5>Оплата</h5>
						</div>
					</a>
				</div>

				<?php echo $column_right; ?>
			</div>
		</div>

	</div>
</div>
<?php echo $content_bottom; ?>



<div class="manufact-slider">
	<div class="container">
		<div id="owl-demo" class="owl-carousel owl-theme">
		<?php foreach ($manufacturers as $manufacturer) { ?>
			<div class="item"><img src="image/<?php echo $manufacturer['image']  ?>"></div>
		<?php } ?>
			<!-- <div class="item"><img src="/catalog/view/theme/default/images/partners1.png"></div> -->
			<!-- <div class="item"><img src="/catalog/view/theme/default/images/partners2.png"></div> -->
			<!-- <div class="item"><img src="/catalog/view/theme/default/images/partners3.jpg"></div> -->

    </div>

    <div class="customNavigation">
    	<a class=" prev"><img src="/catalog/view/theme/default/images/arrowL1.png"></a>
    	<a class=" next"><img src="/catalog/view/theme/default/images/arrowR1.png"></a>
    </div>

</div>
</div>


<?php echo $footer; ?>