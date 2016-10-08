<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title><?php echo $title; ?></title>
	<base href="<?php echo $base; ?>" />
	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	<?php if ($keywords) { ?>
	<meta name="keywords" content= "<?php echo $keywords; ?>" />
	<?php } ?>
	<link rel="stylesheet" href="/catalog/view/theme/default/bootstrap-jq/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/catalog/view/theme/default/css/style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="/catalog/view/theme/default/bootstrap-jq/jquery.js"></script>
	<script src="/catalog/view/theme/default/js/main.js"></script>
	<script src="http://vk.com/js/api/openapi.js" type="text/javascript"></script>
	<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>
	<?php foreach ($scripts as $script) { ?>
	<script src="<?php echo $script; ?>" type="text/javascript"></script>
	<?php } ?>
	<?php foreach ($analytics as $analytic) { ?>
	<?php echo $analytic; ?>
	<?php } ?>
	<!-- <link href="catalog/view/theme/coloring/assets/share/social-likes_birman.css" type="text/css" rel="stylesheet" media="screen"> -->
	<script src="catalog/view/theme/default/js/social-likes.min.js" type="text/javascript"></script>
	<link href="catalog/view/theme/default/css/font-awesome.css" rel="stylesheet">

</head>
<body>
	<div id="header">
		<div id="top-head">
			<div class="container">
				<div class="top-social">
					<a href="https://vk.com/avaks503737" target="_blank">
						<div class="top-social-item">
							<img src="/catalog/view/theme/default/images/icon-vk-g.png">
						</div>
					</a>
					<a href="https://www.facebook.com/avaksshop/" target="_blank">
						<div class="top-social-item">
							<img src="/catalog/view/theme/default/images/icon-fb-g.png">
						</div>
					</a>
					<a href="https://ok.ru/group/53156864590004?st._aid=ExternalGroupWidget_OpenGroup" target="_blank">
						<div class="top-social-item">
							<img src="/catalog/view/theme/default/images/icon-ok-g.png">
						</div>
					</a>
					<a href="https://www.instagram.com/avaks_shop/" target="_blank">
						<div class="top-social-item">
							<img src="/catalog/view/theme/default/images/icon-insta-g.png">
						</div>
					</a>
					<a href="http://my.mail.ru/community/avaks-shop/" target="_blank">
						<div class="top-social-item">
							<img src="/catalog/view/theme/default/images/icon-mail-g.png">
						</div>
					</a>
					<a href="https://plus.google.com/102836413814359745133" target="_blank">
						<div class="top-social-item">
							<img src="/catalog/view/theme/default/images/icon-google-g.png">
						</div>
					</a>
					<a href="https://twitter.com/AvaksCompany?ref_src=twsrc%5Etfw" target="_blank">
						<div class="top-social-item">
							<img src="/catalog/view/theme/default/images/icon-tw-g.png">
						</div>
					</a>
					<a href="https://www.youtube.com/user/avaksofficial" target="_blank">
						<div class="top-social-item">
							<img src="/catalog/view/theme/default/images/icon-yout-g.png">
						</div>
					</a>
				</div>
				<div class="top-account">
					<!-- <a href="">
						<div class="top-account-item">
							Вход
						</div>
					</a>
					<a href="">
						<div class="top-account-item">
							Регистрация
						</div>
					</a> -->
					<?php if ($logged) { ?>
					<a href="<?php echo $logout; ?>"><div class="top-account-item"><?php echo $text_logout; ?></div></a>
					<a href="<?php echo $account; ?>"><div class="top-account-item"><?php echo $text_account; ?></div></a>
					
					
					
					
					<?php } else { ?>
					<a href="<?php echo $register; ?>"><div class="top-account-item"><?php echo $text_register; ?></div></a>
					<a href="<?php echo $login; ?>"><div class="top-account-item"><?php echo $text_login; ?></div></a>
					<?php } ?>
				</div>

			</div>
		</div>
		<div id="main-head">
			<div class="container">
				<div class="row">

					<div class="col-md-3">
						<a href="<?php echo $home; ?>">
							<img src="/catalog/view/theme/default/images/logo-avaks.jpg">
						</a>
					</div>
					<div class="col-md-5 col-md-offset-1">
						<div class="phone">
							<div class="phone-line">
								<div class="phone-item">
									<img src="/catalog/view/theme/default/images/phone-2.png">
									8-3812-50-37-37
								</div>
								<div class="phone-item">
									<img src="/catalog/view/theme/default/images/phone-6.png">
									+7-953-393-65-22
								</div>
							</div>
							<div class="phone-line">
								<div class="phone-item">
									<img src="/catalog/view/theme/default/images/phone-3.png">
									+7-913-610-34-93
								</div>
								<div class="phone-item">
									<img src="/catalog/view/theme/default/images/phone-5.png">
									+7-3812-438-248
								</div>
							</div>
							<div class="phone-line">
								<div class="phone-item">
									<img src="/catalog/view/theme/default/images/phone-1.png">
									avaks503737
								</div>
								<div class="phone-item">
									<img src="/catalog/view/theme/default/images/phone-4.png">
									503737@mail.ru
								</div>
							</div>
						</div>
						<!-- <div id="search">
							<input type="text" placeholder="Поиск">
							<button type="submit"><img src="/catalog/view/theme/default/images/icon-search.png"></button>

						</div> -->
						<?php echo $search; ?>
					</div>
					<div class="col-md-2 col-md-offset-1">
						<div class="clock-item">
							<div class="clock-img">
								<img src="/catalog/view/theme/default/images/icon-clock.png">
							</div>
							<div class="clock-txt">
								С 10:00 до 19:00<br>
								Воскресенье : Выходной</div>
							</div>
							<div class="cart-icons">

								<a href="<?php echo $wishlist; ?>">
									<div class='cart-icons-item'>
										<img class='cart-icons-img' src="/catalog/view/theme/default/images/wishlist-icon-g.png">
										<span id="wish"><?php echo $wishCount ?></spans>
									</div>
								</a>
								<a href="/index.php?route=product/compare" >
									<div class='cart-icons-item'>
										<img class='cart-icons-img' src="/catalog/view/theme/default/images/compaire-icon-g.png">
										<span id="compare"><?php echo $compareCount ?></span>
									</div>
								</a>
								<?php echo $cart; ?>
							</div>
						</div>
					</div>

				</div>

			</div>

		</div>
		<div id="nav">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div id="catalog-button">
							Категории
							<div class="menu-div"><div></div><div></div><div></div></div>
						</div>
						<div id="catalog-button-mob">
							Категории
							<div class="menu-div"><div></div><div></div><div></div></div>
						</div>
						<div id="mobile-menu">
						<?php foreach ($categories as $key => $cat): ?>
									<a href="<?php echo $cat['href'] ?>">
										<div class="category-menu-item" >
											<p><?php echo $cat['name'] ?></p>
											
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
								<a href="http://avaks.tv/index.php?route=product/category&path=163">
									<div class="category-menu-item-premium">
										<p>Хиты продаж</p>
										<div class="category-arrow-premium">
											<img src="/catalog/view/theme/default/images/prem2-g.png">
										</div>
										<div class="catalog-tria"></div>
									</div>
								</a>
								<a href="http://avaks.tv/index.php?route=product/category&path=164">
									<div class="category-menu-item-premium">
										<p>Распродажа</p>
										<div class="category-arrow-premium">
											<img src="/catalog/view/theme/default/images/prem3-g.png">
										</div>
										<div class="catalog-tria"></div>
									</div>
								</a>
								<a href="http://avaks.tv/index.php?route=product/category&path=165">
									<div class="category-menu-item-premium">
										<p>Товар дня</p>
										<div class="category-arrow-premium">
											<img src="/catalog/view/theme/default/images/prem4-g.png">
										</div>
										<div class="catalog-tria"></div>
									</div>
								</a>
								<div id="mobMenuClose">
									Свернуть категории
								</div>
							</div>
						</div>
						
					<!-- </div> -->
					<div id="mainMenu">
						<div id="submenu2">
							<div id="submenuUl2">
								<?php foreach ($categories as $key => $category): ?>
									<?php if ($category['children']): ?>
										<ul  class="child-list" id="children2-<?php echo $key ?>">
											<?php foreach ($category['children'] as $child): ?>
												<li><a href="<?php echo $child['href'] ?>"><?php echo $child['name'] ?></a></li>
											<?php endforeach ?>
										</ul>
									<?php endif ?>

								<?php endforeach ?>
							</div>
							<a href="">
								<div id="submenuImg">
									<!-- 	<h4><?php echo $cat['name'] ?> </h4> -->
									<!-- <img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>"  /> -->
								</div>
							</a>
						</div>
						<div class="">
							<div id="category-menu2">
								<?php foreach ($categories as $key => $cat): ?>
									<a href="<?php echo $cat['href'] ?>">
										<div class="category-menu-item2" data-key="<?php echo $key ?>" >
											<p><?php echo $cat['name'] ?></p>
											<?php if ($cat['children']): ?>
												<div class="category-arrow"></div>
											<?php endif ?>
										</div>
									</a>
								<?php endforeach ?>

								<div class="category-menu-premium">
									<a href="">
										<div class="category-menu-item-premium">
											<p>Акции</p>
											<div class="category-arrow-premium">
												<img src="/catalog/view/theme/default/images/prem1-g.png">
											</div>
											<div class="catalog-tria"></div>
										</div>
									</a>
									<a href="">
										<div class="category-menu-item-premium">
											<p>Хиты продаж</p>
											<div class="category-arrow-premium">
												<img src="/catalog/view/theme/default/images/prem2-g.png">
											</div>
											<div class="catalog-tria"></div>
										</div>
									</a>
									<a href="">
										<div class="category-menu-item-premium">
											<p>Распродажа</p>
											<div class="category-arrow-premium">
												<img src="/catalog/view/theme/default/images/prem3-g.png">
											</div>
											<div class="catalog-tria"></div>
										</div>
									</a>
									<a href="">
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
					</div>
					<div class="col-md-9">
						<ul class="super-menu-top">
							<a href="/index.php?route=information/information&information_id=4"><li>О нас</li></a>
							<a href=""><li>Оплата</li></a>
							<a href="/index.php?route=information/information&information_id=6"><li>Доставка</li></a>
							<a href=""><li>Гарантия</li></a>
							<a href="/index.php?route=information/contact"><li>Контакты</li></a>
							<a href="index.php?route=information/contact"><li>Обратная связь</li></a>
						</ul>
					</div>
				</div>
			</div>
		</div>
