<div class="hit">
  <div class="main-title">
    <h2>Хит продаж</h2>
  </div>
  <div id="owl-demo2" class="owl-carousel owl-theme">
    <?php foreach ($products as $product) { ?>
    <div class="item">
      <div class="col-md-3 col-sm-6">

        <div class="product-item">
         <?php if($product['isShares']) { ?>
           <div class="premium-product">
            <div class="left-tria-prem"></div>
              <p>Акция</p>
              <img src="catalog/view/theme/default/images/prem1-w.png" "="">
           </div>
          <?php } ?>
         <div class="wish-comp-item">
          <?php if($product['in_wishlist']) { ?>
          <img class="toWish" onclick="wishlist.remove('<?php echo $product['product_id']; ?>');" src="/catalog/view/theme/default/images/icon-to-wish-product-w.png">
          <?php } else { ?>
          <img class="toWish" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" src="/catalog/view/theme/default/images/icon-to-wish-product-g.png">
          <?php } ?>

          <?php if($product['in_compare']) { ?>
          <img class="toComp" onclick="compare.remove('<?php echo $product['product_id']; ?>');" src="/catalog/view/theme/default/images/icon-to-comp-product-w.png">
          <?php } else { ?>
          <img class="toComp" onclick="compare.add('<?php echo $product['product_id']; ?>');" src="/catalog/view/theme/default/images/icon-to-comp-product-g.png">
          <?php } ?>
        </div>
        <a href="<?php echo $product['href']; ?>">
          <img src="<?php echo $product['thumb']; ?>" class='product-item-img'>
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

<div class="customNavigation">
  <a class=" prev2"><img src="/catalog/view/theme/default/images/arrowL1.png"></a>
  <a class=" next2"><img src="/catalog/view/theme/default/images/arrowR1.png"></a>
</div>

</div>

