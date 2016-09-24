</div>
<footer>
<?php if ($xds_coloring_theme_footer_map_toggle) { ?>	
<div id="footer-map" >
<div class="container">
	<div class="map-content ">
		<?php echo html_entity_decode($xds_coloring_theme_footer_map, ENT_QUOTES, 'UTF-8'); ?>
		<div class="btn-group close-map">
			<button type="button" class="btn btn-danger" onclick="toogleMap()"><i class="fa fa-times"></i> Закрыть</button>
		</div>
		<div class="glass"></div>
	</div>
	<div class="map-toogle" data-toggle="tooltip" data-trigger="hover" title="Развернуть схему проезда">
		<a id="mapToogle" onclick="toogleMap();">
			<span class="glyphicon glyphicon-map-marker"></span>
		</a>
	</div>
</div>
</div>
<?php } ?>

  <div class="container">
		<div class="footer-box">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-6 col-md-3">
        <h5><i class="fa fa-info-circle"></i><span><?php echo $text_information; ?></span></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
				<hr class="visible-xs">
      </div>
      <?php } ?>
      <div class="col-sm-6 col-md-3">
        <h5><i class="fa fa-support"></i><span><?php echo $text_service; ?></span></h5>
        <ul class="list-unstyled">
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
				<hr class="visible-xs">
      </div>
			<div class="clearfix visible-sm">&nbsp;</div>
      <div class="col-sm-6 col-md-3">
        <h5><i class="glyphicon glyphicon-pushpin"></i><span><?php echo $text_extra; ?></span></h5>
        <ul class="list-unstyled">
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
				<hr class="visible-xs">
      </div>
      <div class="col-sm-6 col-md-3">
        <h5><i class="glyphicon glyphicon-user"></i><span><?php echo $text_account; ?></span></h5>
        <ul class="list-unstyled">
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
		<div class="row">
			<div class="col-sm-12 col-md-4">
				<?php echo $powered; ?>
			</div>
			<?php if ($xds_coloring_theme_pay_icons_toggle) { ?>
			<div class="col-sm-12 col-md-8 text-right-md">
				<ul class="list-unstyled pay-icons">
					 <?php foreach ($pay_icons as $pay_icon) { ?>
					<li>
						<?php if ($pay_icon['link']) { ?>
						<a target="_blank" href="<?php echo $pay_icon['link']; ?>"><img src="<?php echo $pay_icon['image']; ?>" alt="<?php echo $pay_icon['title']; ?>" class="img-responsive" /></a>
						<?php } else { ?>
						<img src="<?php echo $pay_icon['image']; ?>" alt="<?php echo $pay_icon['title']; ?>" class="img-responsive" />
						<?php } ?>
					</li>
					<?php } ?>
				</ul>
			</div>
			<?php } ?>
		</div>
		</div>
		<span id="scroll-top-button"><i class="fa fa-arrow-circle-up"></i></span>
  </div>
</footer>

</body></html>