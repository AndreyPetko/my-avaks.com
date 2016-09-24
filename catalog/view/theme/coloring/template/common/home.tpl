<?php echo $header; ?>
<div class="container">
	<div class="row">
		<div class="col-md-3"><div id="menu-home-helper"></div></div>
		<div class="col-md-9"><?php echo $content_top; ?></div>
	</div>
	<div class="row">
		<?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-4 col-md-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-8 col-md-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div class="<?php echo $class; ?>">
			<?php echo $content_bottom; ?>
		</div>
		<?php echo $column_right; ?>
	</div>
	<?php if ($new_modules_1 || $new_modules_2) { ?>
	<div class="row">
		<?php if ($new_modules_1) { ?>
		<?php $class1 = 'col-sm-8 col-md-9'; ?>
		<?php } else { ?>
		<?php $class1 = 'col-sm-12'; ?>
		<?php } ?>
		<?php if ($new_modules_1) { ?>
		<div class="col-sm-4 col-md-3" id="home_position_1">
			<?php foreach ($new_modules_1 as $new_module) { ?>
			<?php echo $new_module['module']; ?>
			<?php } ?>
		</div>
		<?php } ?>
		<?php if ($new_modules_2) { ?>
		<div class="<?php echo $class1; ?>" id="home_position_2">
			<?php foreach ($new_modules_2 as $new_module) { ?>
			<?php echo $new_module['module']; ?>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
	<?php } ?>
	<?php if ($new_modules_3 || $new_modules_4) { ?>
	<div class="row">
		<?php if ($new_modules_4) { ?>
		<?php $class2 = 'col-sm-8 col-md-9'; ?>
		<?php } else { ?>
		<?php $class2 = 'col-sm-12'; ?>
		<?php } ?>
		<?php if ($new_modules_3) { ?>
		<div class="<?php echo $class2; ?>" id="home_position_3">
			<?php foreach ($new_modules_3 as $new_module) { ?>
			<?php echo $new_module['module']; ?>
			<?php } ?>
		</div>
		<?php } ?>
		<?php if ($new_modules_4) { ?>
		<div class="col-sm-4 col-md-3" id="home_position_4">
			<?php foreach ($new_modules_4 as $new_module) { ?>
			<?php echo $new_module['module']; ?>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
	<?php } ?>
	<?php if ($new_modules_5) { ?>
	<div class="row">
		<div class="col-sm-12" id="home_position_5">
			<?php foreach ($new_modules_5 as $new_module) { ?>
			<?php echo $new_module['module']; ?>
			<?php } ?>
		</div>
	</div>
	<?php } ?>

	<div class="panel panel-default box-news">
		<div class="panel-heading">
			<i class="fa fa-newspaper-o"></i>&nbsp;&nbsp;Социальные сети
		</div>
		<div class="panel-body">
			<div class="row">
				<?php if ($social['vk']) { ?>
				<div class="col-md-3 social">
					<script type="text/javascript" src="//vk.com/js/api/openapi.js?121"></script>

					<!-- VK Widget -->
					<div id="vk_groups"></div>
					<script type="text/javascript">
						VK.Widgets.Group("vk_groups", {mode: 0, width: "220", height: "250", color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 117882417);
					</script>
				</div>
				<?php } ?>


				<?php if($social['ok']) { ?>
				<div class="col-md-3 social">
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
							}(document,"ok_group_widget","53156864590004","{width:250,height:250}");
						</script>
					</div>
					<?php } ?>


					<?php if($social['google']) { ?>
					<div class="col-md-3 social google">
						<!-- Вставьте этот тег в заголовке страницы или непосредственно перед закрывающим тегом основной части. -->
						<script src="https://apis.google.com/js/platform.js" async defer>
							{lang: 'ru'}
						</script>

						<!-- Поместите этот тег туда, где должна отображаться виджет. -->
						<div class="g-person" data-width="250" data-href="https://plus.google.com/102836413814359745133" data-rel="author"></div>
					</div>
					<?php } ?>


					<?php if($social['youtube']) { ?>
					<div class="col-md-3 social youtube">
						<script src="https://apis.google.com/js/platform.js"></script>
						<div class="g-ytsubscribe" data-channel="avaksofficial" data-layout="full" data-count="default"></div>
					</div>
					<?php } ?>

					<?php if($social['facebook']) { ?>
					<div id="fb-root"></div>
					<script>(function(d, s, id) {
						var js, fjs = d.getElementsByTagName(s)[0];
						if (d.getElementById(id)) return;
						js = d.createElement(s); js.id = id;
						js.src = "//connect.facebook.net/ru_RU/sdk.js#xfbml=1&version=v2.6";
						fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'));</script>



					<div class="col-md-3 social">
						<div class="fb-page" data-href="https://www.facebook.com/avaksshop/" data-tabs="timeline" data-width="230" data-height="250" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/avaksshop/"><a href="https://www.facebook.com/avaksshop/">Avaks Shop</a></blockquote></div></div>
					</div>

					<?php } ?>


					<?php if($social['mail']) { ?>
					<div class="col-md-3 social">
						<a target="_blank" class="mrc__plugin_groups_widget" href="https://connect.mail.ru/groups_widget?max_sub=50&group=avaks-shop&width=230&height=250&show_subscribers=true&color=000&button_background=378e64&background=fff&domain=http://new-avaks.com/" rel="{'group' : 'avaks-shop', 'width' : '230', 'height' : '250', 'show_subscribers' : 'true', 'background' : 'fff', 'color' : '000', 'button_background' : '378e64', 'domain' : 'http://new-avaks.com/', 'use_https' : 'true', 'max_sub' : '50'}">Группы</a>
						<script src="https://connect.mail.ru/js/loader.js" type="text/javascript" charset="UTF-8"></script>
					</div>

					<?php } ?>


					<?php if($social['twitter']) { ?>
					<div class="col-md-3 social">
						<a class="twitter-timeline" href="https://twitter.com/AvaksCompany" data-widget-id="731461927109578752">Твиты от @AvaksCompany</a> <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
					</div>
					<?php } ?>

					<?php if($social['instagram']) { ?>
					<div class="col-md-3 social instagram">
						<!-- виджет инстаграм -->
						<iframe src="http://instagramm.ru/instagram-widget-na-sait/iframe/?type=0&imageW=2&imageH=3&bg=&thumbnailSize=100&border=0&padding=5&typetext=avaks_shop&uid=3229649040&head_show=1&head_bg=457094" style="height:375px;width:238px;border:0 none;"></iframe>
					</div>
					<?php } ?>


				</div>
			</div>
		</div>


	</div>
	<script type="text/javascript">$(function(){$('#menu-home-helper').css({'min-height': $('#menu-list').outerHeight() - 20});});</script>
	<?php echo $footer; ?>