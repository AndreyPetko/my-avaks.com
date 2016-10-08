
 <style>
    #cart .dropdown-menu table{
      margin-top: -7px;
      width: 300px;
    }
    .text-right a{
      width: 47%;
margin-left: 1%;
font-size: 12px;
float: left;
display: block;
text-align: center;
    }
      .text-right a img{
        margin-right: 5px;
      }
 </style>

 <div id="cart">
  <a href="<?php echo $cart; ?>">
<!--   <button> -->
 	<div class='cart-icons-item'>
 		<img class='cart-icons-img' src="/catalog/view/theme/default/images/cart-icon-g.png">
 		<span id="cartCount"><?php echo $text_items; ?></span>
 	</div>
<!--   </button>
 --> </a> 
  <!-- <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading;?>" class="btn btn-inverse btn-block btn-lg dropdown-toggle"> <img src="catalog/view/theme/default/images/icon_cart.png" width="44" height="32"><span id="cart-total"><?php echo $text_items; ?></span></button> -->
  <ul class="dropdown-menu pull-right buttonCart">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table table-striped">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center" style="width: 20%;"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>" ><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"  /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-right">x <?php echo $product['quantity']; ?></td>
          <td class="text-right cart-price"><?php echo $product['total']; ?></td>
          <!-- <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs">х</button></td> -->
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
        <!--   <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs cart-remove-button"><img src="catalog/view/theme/default/images/icon_close.png" width="12" height="12"></button></td> -->
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div>
        <table class="table table-bordered cart-sum">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right "><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <p class="text-right"><a href="<?php echo $checkout; ?>"><strong><img src="/catalog/view/theme/default/images/icon-checkout.png"> <?php echo $text_checkout; ?></strong></a>&nbsp;&nbsp;&nbsp;<a href="<?php echo $cart; ?>"><strong><img src="catalog/view/theme/default/images/cart-icon-g.png" width="22" height="16">В корзину</strong></a></p>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
 <script>
 var cartUtka = document.getElementById('cart');
 var buttonCart = cartUtka.getElementsByClassName('cart-icons-item')[0];
 var buttonCartUl = cartUtka.getElementsByClassName('buttonCart')[0];
 buttonCart.addEventListener('mouseover', function(){
 	buttonCartUl.style.display = "block";
 });
 buttonCart.addEventListener('mouseout', function(){
 	buttonCartUl.style.display = "none";
 });
 buttonCartUl.addEventListener('mouseover', function(){
 	buttonCartUl.style.display = "block";
 });
buttonCartUl.addEventListener('mouseout', function(){
	buttonCartUl.style.display = "none";
 });
 	
 </script>