<div class="beforeSocial"></div>
		<div id='socialBlock'>
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6 socialBlockItem">
						<!-- <script type="text/javascript" src="//vk.com/js/api/openapi.js?122"></script> -->

						<!-- VK Widget -->
						<div id="vk_groups"></div>
						<script type="text/javascript">
							VK.Widgets.Group("vk_groups", {mode: 0, width: "220", height: "290", color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 117882417);
						</script>
					</div>
					<!-- </div> -->
					<div class="col-lg-3 col-md-6 socialBlockItem">
						<div id="ok_group_widget"></div>
						<script>
							!function (d, id, did, st) {
								var js = d.createElement("script");
								js.src = "https://connect.ok.ru/connect.js";
								js.onload = js.onreadystatechange = function () {
									if (!this.readyState || this.readyState == "loaded" || this.readyState == "complete") {
										if (!this.executed) {
											this.executed = true;
											setTimeout(function () {
												OK.CONNECT.insertGroupWidget(id,did,st);
											}, 0);
										}
									}}
									d.documentElement.appendChild(js);
								}(document,"ok_group_widget","53156864590004","{width:250,height:290}");
							</script>
						</div>

						<div class="col-lg-3 col-md-6 socialBlockItem">
							<a href=""><img src="/catalog/view/theme/default/images/social-fb-img.jpg"></a>
							<a href=""><img src="/catalog/view/theme/default/images/social-tw-img.jpg"></a>
							<a href=""><img src="/catalog/view/theme/default/images/social-insta-img.jpg"></a>
						</div>
						<div class="col-lg-3 col-md-6 socialBlockItem">
							<a href=""><img src="/catalog/view/theme/default/images/social-google-img.jpg"></a>
							<a href=""><img src="/catalog/view/theme/default/images/social-mail-img.jpg"></a>
							<!-- <img src="/catalog/view/theme/default/images/social-insta-img.jpg"> -->	
							<div class="col-md-3 social youtube">
								<script src="https://apis.google.com/js/platform.js"></script>
								<div class="g-ytsubscribe" data-channel="avaksofficial" data-layout="full" data-count="default"></div>
							</div>
						</div>
					</div>

				</div>

			</div>
<div id="toTop"><img src="/catalog/view/theme/default/images/arrow-social-footer1.png"></div>
<div id="footer">
	<div id="footer-social">
		<div class="footer-social-inside">
			<div class="footer-social-item">
				<a href="" target="_blank">
					<div class="top-social-item">
						<img src="/catalog/view/theme/default/images/icon-vk-g.png">
					</div>
				</a>
				<a href="" target="_blank">
					<div class="top-social-item">
						<img src="/catalog/view/theme/default/images/icon-fb-g.png">
					</div>
				</a>
				<a href="" target="_blank">
					<div class="top-social-item">
						<img src="/catalog/view/theme/default/images/icon-ok-g.png">
					</div>
				</a>
				<a href="" target="_blank">
					<div class="top-social-item">
						<img src="/catalog/view/theme/default/images/icon-insta-g.png">
					</div>
				</a>
			</div>
			<div id="footer-social-middle">
			</div>
			<div class="footer-social-item">
				<a href="" target="_blank">
					<div class="top-social-item">
						<img src="/catalog/view/theme/default/images/icon-mail-g.png">
					</div>
				</a>
				<a href="" target="_blank">
					<div class="top-social-item">
						<img src="/catalog/view/theme/default/images/icon-google-g.png">
					</div>
				</a>
				<a href="" target="_blank">
					<div class="top-social-item">
						<img src="/catalog/view/theme/default/images/icon-tw-g.png">
					</div>
				</a>
				<a href="" target="_blank">
					<div class="top-social-item">
						<img src="/catalog/view/theme/default/images/icon-yout-g.png">
					</div>
				</a>
			</div>
		</div>
	</div>
	<div class="footer-content">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="footer-content-item-head">
						<h6>Информация</h6>
					</div>
					<ul>
						<?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
					</ul>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="footer-content-item-head">
						<h6>Служба поддержки</h6>
					</div>
					<ul>
					<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="footer-content-item-head">
						<h6>Дополнительно</h6>
					</div>
					<ul>
						<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="footer-content-item-head">
						<h6>Личный кабинет</h6>
					</div>
					<ul>
						<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="footer-bottom">
		<div class="container">
			<p>Информация, представленная на сайте www.avaks.tv не является публичной офертой</p>
			<ul>
				<?php foreach ($payments as $key => $payment) { ?>
					<li><a href=""><img src="/image/<?php echo $payment['image'] ?>"></a></li>
				<?php } ?>
				<!-- // <li><a href=""><img src="/catalog/view/theme/default/images/mastercard-48x32.png"></a></li> -->
				<!-- <li><a href=""><img src="/catalog/view/theme/default/images/visa-48x32.png"></a></li> -->
				<!-- <li><a href=""><img src="/catalog/view/theme/default/images/webmoney-48x32.png"></a></li> -->
				<!-- <li><a href=""><img src="/catalog/view/theme/default/images/sberbank-48x32.png"></a></li> -->
				<!-- <li><a href=""><img src="/catalog/view/theme/default/images/paypal-48x32.png"></a></li> -->
				<!-- <li><a href=""><img src="/catalog/view/theme/default/images/mts-48x32.gif"></a></li> -->
			</ul>
		</div>
	</div>
</div>
<link rel="stylesheet" href="/catalog/view/theme/default/owl-carousel/owl.carousel.css">
<link rel="stylesheet" href="/catalog/view/theme/default/owl-carousel/owl.theme.css">
<script src="/catalog/view/theme/default/owl-carousel/owl.carousel.js"></script>
<link href="catalog/view/theme/coloring/assets/share/social-likes_birman.css" type="text/css" rel="stylesheet" media="screen">
</body>
</html>