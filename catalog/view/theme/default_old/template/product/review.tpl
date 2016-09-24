<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<table class="table table-striped table-bordered">
  <tr>
    <td style="width: 50%;"><strong><?php echo $review['author']; ?></strong></td>
    <td class="text-right"><?php echo $review['date_added']; ?></td>
  </tr>
  <tr>
    <td colspan="2"><p><?php echo $review['text']; ?></p>
      <?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($review['rating'] < $i) { ?>
      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } else { ?>
      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } ?>
      <?php } ?></td>
  </tr>
</table>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>

<div class="feedback-item">
              <div class="row">
                <div class="col-xs-3">

                  <p>Имя</p>
                  <span>11.22.1962</span>

                </div>
                <div class="col-xs-6">
                  <p>Nam quis nulla in est congue auctor ut eu justo. Integer vel metus nisi. Vivamus pellentesque urna urna. Fusce et enim ante. Donec pharetra, sapien faucibus scelerisque lobortis, magna dolor ra, sapien faucibus scelerisqu</p>
                </div>
                <div class="col-xs-3">
                  <div class="feedback-stars">
                    <img src="images/blue-star.jpg">
                    <img src="images/blue-star.jpg">
                    <img src="images/blue-star.jpg">
                    <img src="images/blue-star.jpg">
                    <img src="images/blue-star.jpg">
                  </div>
                </div>
              </div>
            </div>
