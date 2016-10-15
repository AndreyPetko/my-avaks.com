<?php echo $header; ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
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
	<div id="product-content">
		<div class="container">
			<div class="row">
				<div class="main-title">
					<h1><?php echo $heading_title; ?></h1>
				</div>

				<div class="thumbnails">
					<?php if ($thumb || $images) { ?>
					<div class="col-md-1 col-sm-2 col-xs-2">
						<div class="img-thumbnail-avaks">
							<?php if ($images) { ?>
							<?php foreach ($images as $image) { ?>
							<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
							<?php } ?>
							<?php } ?>
						</div>
					</div>
					<div class="col-md-5 col-sm-10 col-xs-10">
						<?php if ($thumb) { ?>
						<div class="main-image-product-avaks">
							<a  href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
						</div>
						<?php } ?>
					</div>
					<?php } ?>
				</div>

				<div class="col-md-3 col-sm-12 col-xs-12" id="product">
					<div class="top-product-info">
						<?php if ($manufacturer) { ?>
						<p><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></p>
						<?php } ?>
						<p><?php echo $text_model; ?> <?php echo $model; ?></p>
						<?php if ($reward) { ?>
						<p><?php echo $text_reward; ?> <?php echo $reward; ?></p>
						<?php } ?>

						<div class="availability <?php if($quantity_stock >= 0) : ?> avail-true <?php else : ?> avail-false <?php endif; ?> ">
							<?php echo $stock; ?>
						</div>
					</div>

					<?php if ($price) { ?>
					<div class="price">
						<?php if (!$special) { ?>

						<h2><?php echo $price; ?></h2>

						<?php } else { ?>
						<span style="text-decoration: line-through;"><?php echo $price; ?></span>

						<h2><?php echo $special; ?></h2>

						<?php } ?>
						<?php if ($tax) { ?>
						<span><?php echo $text_tax; ?> <?php echo $tax; ?></span>
						<?php } ?>
						<?php if ($points) { ?>
						<span><?php echo $text_points; ?> <?php echo $points; ?></span>
						<?php } ?>
						<span><?php if ($discounts) { ?></span>

						<hr>

						<?php foreach ($discounts as $discount) { ?>
						<?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?>
						<?php } ?>
						<?php } ?>
					</div>
					<?php } ?>





					<div class="quantity">
						<div class="form-group">
							<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
							<input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
							<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
							<br />
						</div>
						<?php if ($minimum > 1) { ?>
						<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
						<?php } ?>
					</div>
					<div class="btn-group">
						<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="order-btn"><?php echo $button_cart; ?></button>
					</div>

						<?php if ($options) { ?>
						<hr>
						<h3><?php echo $text_option; ?></h3>
						<?php foreach ($options as $option) { ?>
						<?php if ($option['type'] == 'select') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
							<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
								<option value=""><?php echo $text_select; ?></option>
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
									<?php if ($option_value['price']) { ?>
									(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
									<?php } ?>
								</option>
								<?php } ?>
							</select>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'radio') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label"><?php echo $option['name']; ?></label>
							<div id="input-option<?php echo $option['product_option_id']; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="radio">
									<label>
										<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
										<?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>
										(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
										<?php } ?>
									</label>
								</div>
								<?php } ?>
							</div>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'checkbox') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label"><?php echo $option['name']; ?></label>
							<div id="input-option<?php echo $option['product_option_id']; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="checkbox">
									<label>
										<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
										<?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>
										(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
										<?php } ?>
									</label>
								</div>
								<?php } ?>
							</div>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'image') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label"><?php echo $option['name']; ?></label>
							<div id="input-option<?php echo $option['product_option_id']; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="radio">
									<label>
										<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
										<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>
										(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
										<?php } ?>
									</label>
								</div>
								<?php } ?>
							</div>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'text') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
							<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'textarea') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
							<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'file') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label"><?php echo $option['name']; ?></label>
							<button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
							<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
						</div>
						<?php } ?>
						<?php if ($option['type'] == 'date') { ?>
						<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
							<div class="input-group date">
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
								<span class="input-group-btn">
									<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
								</span></div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'datetime') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<div class="input-group datetime">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
								</div>
								<?php } ?>
								<?php if ($option['type'] == 'time') { ?>
								<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
									<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
									<div class="input-group time">
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
										<span class="input-group-btn">
											<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
										</span></div>
									</div>
									<?php } ?>
									<?php } ?>
									<?php } ?>
							</div>
							<div class="col-md-3 col-sm-12 col-xs-12">
								<div class="product-wishlist" onclick="wishlist.add('<?php echo $product_id; ?>');">
									<?php if($in_wishlist) { ?>
									<img src="/catalog/view/theme/default/images/wishlist-icon-b.png">
									<?php } else { ?>
										<img src="/catalog/view/theme/default/images/wishlist-icon-g.png">
									<?php } ?>
									В список желаний
								</div>
								<div onclick="compare.add('<?php echo $product_id; ?>');" class="product-compaire">
									<?php if($in_compare) { ?>
										<img src="/catalog/view/theme/default/images/compaire-icon-b.png">
									<?php } else { ?>
										<img src="/catalog/view/theme/default/images/compaire-icon-g.png">
									<?php } ?>


									В список сравнений
								</div>
								<hr>
								<div class="social-likes" style="margin-bottom:20px;">
									<div class="facebook" title="Поделиться ссылкой на Facebook">Facebook</div>
									<div class="twitter" title="Поделиться ссылкой в Twitter">Twitter</div>
									<div class="vkontakte" title="Поделиться ссылкой во Вконтакте">Вконтакте</div>
									<div class="plusone" title="Поделиться ссылкой в Google+">Google+</div>
								</div>

								<div class="rating rating-product">

									<?php for ($i = 1; $i <= 5; $i++) { ?>
									<?php if ($rating < $i) { ?>
									<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
									<?php } else { ?>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
									<?php } ?>
									<?php } ?>


								</div>

								<div class="feedback-quant toMakeFeed">
									<a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> 
								</div>
								<div class="clear"></div>
								<div class="to-feedback toMakeFeed ">
									<a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
								</div>
							</div>
						</div>
						<div class="product-info-feedback">
							<div class="row">
								<div class="col-md-2">
									<ul id="product-tabs">
										<li class="product-tab-active" id="productTab1">Описание</li>
										<li id="productTab2"><?php echo $reviews; ?></li>
									</ul>
								</div>
								<div class="col-md-10">
									<div id="product-info-block">
										<?php echo $description; ?>
									</div>
									<a name="tab-review"> </a>
									<div id="feedback-block">

										<div id="review"></div>


										<div class="main-feedback">

											<div id='to-product-feedback'>
												Написать отзыв
												<div class="block"></div>
											</div>
						<!-- 	<?php if ($review_status) { ?>
							<div class="tab-pane" id="tab-review">
								<form class="form-horizontal" id="form-review">
									<div id="review"></div>
									
									<?php if ($review_guest) { ?>
									<div class="form-group required">
										<div class="col-sm-12">
											<label class="control-label" for="input-name"><?php echo $entry_name; ?>
											</label>
											<input type="text" name="name" value="" id="input-name" class="form-control" />
										</div>
									</div>
									<div class="form-group required">
										<div class="col-sm-12">
											<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
											<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
											<div class="help-block"><?php echo $text_note; ?></div>
										</div>
									</div>
									<div class="form-group required">
										<div class="col-sm-12">
											<label class="control-label"><?php echo $entry_rating; ?></label>
											&nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
											<input type="radio" name="rating" value="1" />
											&nbsp;
											<input type="radio" name="rating" value="2" />
											&nbsp;
											<input type="radio" name="rating" value="3" />
											&nbsp;
											<input type="radio" name="rating" value="4" />
											&nbsp;
											<input type="radio" name="rating" value="5" />
											&nbsp;<?php echo $entry_good; ?></div>
										</div>
											<?php echo $captcha; ?> 
										<div class="buttons clearfix">
											<div class="pull-right">
												<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
											</div>
										</div>
										<?php } else { ?>
										<?php echo $text_login; ?>
										<?php } ?>
									</form>
								</div>
								<?php } ?> -->
								<?php if ($review_status) { ?>
								<div class="feedback-content">
									<form class="form-horizontal" id="form-review">

										<?php if ($review_guest) { ?>
										<div class=" review-input">
											<div class="row">
												<div class="col-xs-2">
													<p>Имя*</p>
												</div>
												<div class="col-xs-8 review-input">
													<input type="text" name="name" value="" id="input-name" class="form-control" />
												</div>
											</div>
											<div class="row">
												<div class="col-xs-2">
													<p>Отзыв*</p>
												</div>
												<div class="col-xs-8 review-input">
													<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
												</div>
											</div>
											<div class="row">
												<div class="col-xs-2">
													<p>Ваша оценка*</p>
												</div>
												<div class="col-xs-8">
													<div class="rate">
														<div class="form-group required review-radio">
															<div class="col-sm-12">
																<p ><?php echo $entry_rating; ?></p>
																 <p><?php echo $entry_bad; ?></p>
																<input id="radio1" type="radio" name="rating" value="1" />
																<label for="radio1">1</label>
																<input id="radio2" type="radio" name="rating" value="2" />
																<label for="radio2">2</label>
																<input id="radio3" type="radio" name="rating" value="3" />
																<label for="radio3">3</label>
																<input id="radio4" type="radio" name="rating" value="4" />
																<label for="radio4">4</label>
																<input id="radio5" type="radio" name="rating" value="5" />
																<label for="radio5">5</label>
																<p><?php echo $entry_good; ?></p></div>
															</div>
														</div>
														<hr>
														<?php echo $captcha; ?> 
														
														<div class="buttons clearfix review-radio">
															<div class="pull-right">
																<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
															</div>
														</div>
													</div>
												</div>
											</div>
											<?php } else { ?>
											<?php echo $text_login; ?>
											<?php } ?>
										</form>
									</div>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			

<!-- 			<div id="stock-products">
				<div class="container">
					<div class="row">
						<div class="main-title">
							<h2>Акции</h2>
						</div>


						<div class="col-md-3 col-sm-6">
							<a href="product.html">
								<div class="product-item">
									<div class="wish-comp-item">
										<img src="images/icon-to-wish-product-g.png">
										<img src="images/icon-to-comp-product-w	.png">
									</div>
									<img src="images/tovar1.jpg">
									<p>конвертор</p>
									<div class="product-item-price">
										2500p.
									</div>
									<div class="button-buy">
										Купить
									</div>
								</div>
							</a>
						</div>


						<div class="col-md-3 col-sm-6">
							<a href="product.html">
								<div class="product-item">
									<div class="wish-comp-item">
										<img src="images/icon-to-wish-product-g.png">
										<img src="images/icon-to-comp-product-w	.png">
									</div>
									<img src="images/tovar1.jpg">
									<p>конвертор</p>
									<div class="product-item-price">
										2500p.
									</div>
									<div class="button-buy">
										Купить
									</div>
								</div>
							</a>

						</div>

						<div class="col-md-3 col-sm-6">
							<a href="product.html">
								<div class="product-item">
									<div class="wish-comp-item">
										<img src="images/icon-to-wish-product-g.png">
										<img src="images/icon-to-comp-product-w	.png">
									</div>
									<img src="images/tovar1.jpg">
									<p>конвертор</p>
									<div class="product-item-price">
										2500p.
									</div>
									<div class="button-buy">
										Купить
									</div>
								</div>
							</a>

						</div>

						<div class="col-md-3 col-sm-6">
							<a href="product.html">
								<div class="product-item">
									<div class="wish-comp-item">
										<img src="images/icon-to-wish-product-g.png">
										<img src="images/icon-to-comp-product-w	.png">
									</div>
									<img src="images/tovar1.jpg">
									<p>конвертор</p>
									<div class="product-item-price">
										2500p.
									</div>
									<div class="button-buy">
										Купить
									</div>
								</div>
							</a>

						</div>





					</div>
				</div>
			</div> -->


			<?php if ($products) { ?>
			<!-- <h3><?php echo $text_related; ?></h3> -->
			<div id="advice-products">
				<div class="container">
					<div class="row">
						<div class="main-title">
							<h2>Рекомендуемые товары</h2>
						</div>
						<?php foreach ($products as $product) { ?>
						<div class="col-md-3 col-sm-6">
							
							<div class="product-item">
								<div class="wish-comp-item">
									<img onclick="wishlist.add('<?php echo $product['product_id']; ?>');" src="/catalog/view/theme/default/images/icon-to-wish-product-g.png">
									<img onclick="compare.add('<?php echo $product['product_id']; ?>');" src="/catalog/view/theme/default/images/icon-to-comp-product-w.png">
								</div>
								<a href="<?php echo $product['href']; ?>">
									<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $heading_title; ?>" >
									<p><?php echo $product['name']; ?></p>
									<div class="product-item-price">
										<?php echo $product['price']; ?>
									</div>
								</a>
								<div class="button-buy" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
									Купить
								</div>
							</div>


						</div>
						<?php } ?>
 
    </div>
</div>
</div>
<?php } ?>

</div>
</div>
</div>


<script type="text/javascript"><!--
	$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
		$.ajax({
			url: 'index.php?route=product/product/getRecurringDescription',
			type: 'post',
			data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
			dataType: 'json',
			beforeSend: function() {
				$('#recurring-description').html('');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();

				if (json['success']) {
					$('#recurring-description').html(json['success']);
				}
			}
		});
	});
	//--></script>
	<script type="text/javascript"><!--
		$('#button-cart').on('click', function() {
			$.ajax({
				url: 'index.php?route=checkout/cart/add',
				type: 'post',
				data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
				dataType: 'json',
				beforeSend: function() {
									// $('#button-cart').button('loading');
								},
								complete: function() {
									// $('#button-cart').button('reset');
								},
								success: function(json) {
									$('.alert, .text-danger').remove();
									$('.form-group').removeClass('has-error');

									if (json['error']) {
										if (json['error']['option']) {
											for (i in json['error']['option']) {
												var element = $('#input-option' + i.replace('_', '-'));

												if (element.parent().hasClass('input-group')) {
													element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
												} else {
													element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
												}
											}
										}

										if (json['error']['recurring']) {
											$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
										}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			var cartCount = parseInt($('#cartCount').text());
            $('#cartCount').text(cartCount + 1);

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
		});
		//--></script>
		<script type="text/javascript"><!--
			$('.date').datetimepicker({
				pickTime: false
			});

			$('.datetime').datetimepicker({
				pickDate: true,
				pickTime: true
			});

			$('.time').datetimepicker({
				pickDate: false
			});

			$('button[id^=\'button-upload\']').on('click', function() {
				var node = this;

				$('#form-upload').remove();

				$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

				$('#form-upload input[name=\'file\']').trigger('click');

				if (typeof timer != 'undefined') {
					clearInterval(timer);
				}

				timer = setInterval(function() {
					if ($('#form-upload input[name=\'file\']').val() != '') {
						clearInterval(timer);

						$.ajax({
							url: 'index.php?route=tool/upload',
							type: 'post',
							dataType: 'json',
							data: new FormData($('#form-upload')[0]),
							cache: false,
							contentType: false,
							processData: false,
							beforeSend: function() {
								$(node).button('loading');
							},
							complete: function() {
								$(node).button('reset');
							},
							success: function(json) {
								$('.text-danger').remove();

								if (json['error']) {
									$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
								}

								if (json['success']) {
									alert(json['success']);

									$(node).parent().find('input').attr('value', json['code']);
								}
							},
							error: function(xhr, ajaxOptions, thrownError) {
								alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
							}
						});
					}
				}, 500);
			});
			//--></script>
			<script type="text/javascript"><!--
				$('#review').delegate('.pagination a', 'click', function(e) {
					e.preventDefault();

					$('#review').fadeOut('slow');

					$('#review').load(this.href);

					$('#review').fadeIn('slow');
				});

				$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

				$('#button-review').on('click', function() {
					$.ajax({
						url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
						type: 'post',
						dataType: 'json',
						data: $("#form-review").serialize(),
						beforeSend: function() {
											// $('#button-review').button('loading');
										},
										complete: function() {
											// $('#button-review').button('reset');
										},
										success: function(json) {
											$('.alert-success, .alert-danger').remove();

											if (json['error']) {
												$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
											}

											if (json['success']) {
												$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

												$('input[name=\'name\']').val('');
												$('textarea[name=\'text\']').val('');
												$('input[name=\'rating\']:checked').prop('checked', false);
											}
										}
									});
				});

				$(document).ready(function() {
					$('.thumbnails').magnificPopup({
						type:'image',
						delegate: 'a',
						gallery: {
							enabled:true
						}
					});
				});
			</script>
			<link href="catalog/view/javascript/jquery/magnific/magnific-popup.css" type="text/css" rel="stylesheet" media="screen">
<script src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js" type="text/javascript"></script>
			<?php echo $footer; ?>