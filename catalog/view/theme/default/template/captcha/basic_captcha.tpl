<div class="form-group required">
  <?php if (substr($route, 0, 9) == 'checkout/') { ?>
   <div class="row">
  <div class="col-xs-2">
    <p><?php echo $entry_captcha; ?></p>
  </div>
  <div class="col-xs-10">
    <input type="text" name="captcha" id="input-payment-captcha" class="form-control-avaks" />
    <img src="index.php?route=captcha/basic_captcha/captcha" alt="" />
  </div>
  </div>
  <?php } else { ?>
  <div class="row">
   <div class="col-xs-2">
   </div>
   <div class="col-xs-10">
     <p><?php echo $entry_captcha; ?></p> <img src="index.php?route=captcha/basic_captcha/captcha" alt="" />
     <input type="text" name="captcha" id="input-captcha" class="form-control-avaks" />

     <?php if ($error_captcha) { ?>
     <div class="text-danger"><?php echo $error_captcha; ?></div>
     <?php } ?>
   </div>
 </div>
 <?php } ?>
</div>
