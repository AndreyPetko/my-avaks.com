<div id="owl-demo4" class="owl-carousel owl-theme">
 <?php foreach($banners as $banner) { ?>
  <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>">
      <div class="item"><img src="<?php echo $banner['image']; ?>" ></div>
    </a>
    <?php } else { ?>
      <div class="item"><img src="<?php echo $banner['image']; ?>" ></div>
      <?php } ?>
      <?php } ?> 
</div>
