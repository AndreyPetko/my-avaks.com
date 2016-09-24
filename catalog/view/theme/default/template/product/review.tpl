<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<!-- <table class="table table-striped table-bordered">
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
  </table> -->

<div class="feedback-item">
    <div class="row">
      <div class="col-xs-3">
        <p><?php echo $review['author']; ?></p>
        <span><?php echo $review['date_added']; ?></span>
      </div>
      <div class="col-xs-6">
        <p><?php echo $review['text']; ?></p>
      </div>
      <div class="col-xs-3">
        <div class="feedback-stars">
         <?php for ($i = 1; $i <= 5; $i++) { ?>
         <?php if ($review['rating'] < $i) { ?>
         <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
         <?php } else { ?>
         <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
         <?php } ?>
         <?php } ?>
       </div>
     </div>
   </div>
 </div>
  <?php } ?>
  <div class="text-right"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <p style="line-height:30px;"><?php echo $text_no_reviews; ?></p>
  <?php } ?>


