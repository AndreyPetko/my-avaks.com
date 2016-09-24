<?php echo $header; ?>
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

  <h2><?php echo $heading_title; ?></h2>
  <?php if ($products) { ?>

  <div class="row">
    <?php foreach ($products as $product) { ?>
    <div class="item">
      <div class="col-md-3 col-sm-6">
        <div class="product-item">
          <div class="wish-comp-item">
            <img onclick="wishlist.add('<?php echo $product['product_id']; ?>');" src="/catalog/view/theme/default/images/icon-to-wish-product-g.png">
            <img onclick="compare.add('<?php echo $product['product_id']; ?>');" src="/catalog/view/theme/default/images/icon-to-comp-product-w.png">
          </div>
          <a href="<?php echo $product['href']; ?>">
            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $heading_title; ?>"  class='product-item-img'>
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
    </div>
    
    <?php } ?>
  </div>
  <div class="pagination-div">
    <?php echo $pagination; ?>
  </div>
  <?php } else { ?>
  <p><?php echo $text_empty; ?></p>
  <div class="buttons">
    <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>