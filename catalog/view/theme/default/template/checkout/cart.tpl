<?php echo $header; ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
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
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
     <div class="main-title"> <h1><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        &nbsp;(<?php echo $weight; ?>)
        <?php } ?>
      </h1></div>
<div class="row">
<div class="col-sm-9">

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-center"><?php echo $column_image; ?></td>
                <td class="text-left"><?php echo $column_name; ?></td>
                <td class="text-left"><?php echo $column_model; ?></td>
                <td class="text-left"><?php echo $column_quantity; ?></td>
                <td class="text-right"><?php echo $column_price; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-center"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?></td>
                <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?></td>
                <td class="text-left"><?php echo $product['model']; ?></td>
                <td class="text-left"><div class="input-group btn-block" style="min-width: 140px; max-width:200px">
                    <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary"><i style="color:white;" class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right"><?php echo $product['price']; ?></td>
                <td class="text-right"><?php echo $product['total']; ?></td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $vouchers) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $vouchers['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
</div>
<div class="col-sm-3">
<form action="/index.php?route=checkout/cart/order" method="POST">

      <div class="form-group">
        <label for="name">Имя</label>
        <input type="text" required class="form-control" name="firstname" value="<?php if(isset($user['lastname'])) echo $user['firstname'] ?>"/>
      </div>

      <div class="form-group">
        <label for="name">Фамилия</label>
        <input type="text" required class="form-control" name="lastname" value="<?php if(isset($user['lastname'])) echo $user['lastname'] ?>"/>
      </div>


      <div class="form-group">
        <label for="name">Email</label>
        <input type="text" required class="form-control" name="email" value="<?php if(isset($user['email'])) echo $user['email'] ?>"/>
      </div>


      <div class="form-group">
        <label for="name">Номер телефона</label>
        <input type="text" required class="form-control" name="telephone" value="<?php if(isset($user['lastname'])) echo $user['telephone'] ?>"/>
      </div>


      <div class="form-group">
        <label for="name">Город</label>
        <input type="text" required class="form-control" name="city" value="<?php if(isset($user['city'])) echo $user['city'] ?>"/>
      </div>

      <div class="form-group">
        <label for="name">Адрес</label>
        <input type="text" required class="form-control" name="address" value="<?php if(isset($user['address'])) echo $user['address'] ?>"/>
      </div>


<!--       <div class="form-group">
        <label for="name">Способ оплаты</label>
        <input type="text" class="form-control" name="payment_method" value=""/>
      </div> -->


      <div class="form-group">
        <label for="name">Способ оплаты</label>
        <select class="form-control" name="payment_method">
            <option value="Банковская карта">Банковская карта</option>
            <option value="Яндекс.Деньги">Яндекс.Деньги</option>
            <option value="Оплата телефоном">Оплата телефоном</option>
            <option value="WebMoney">WebMoney</option>
            <option value="AlphaClick">AlphaClick</option>
            <option value="Сбербанк онлайн">Сбербанк онлайн</option>
        </select>
      </div>

      <div class="form-group">
        <label for="name">Метод покупки</label>
        <select class="form-control" name="shipping_method">
            <option value="Самовывоз из магазина">Самовывоз из магазина</option>
            <option value="Доставка почтой России">Доставка почтой России</option>
            <option value="Доставка по городу">Доставка по городу</option>
            <option value="Доставка с фиксированной стоимостью доставки">Доставка с фиксированной стоимостью доставки</option>
        </select>
      </div>


      <div class="form-group">
        <label>Комментарий</label>
        <textarea class="form-control" name="comment"></textarea>
      </div>

      <br />
      </div>
</div>
      <div class="row">
       <!--  <div class="col-sm-4 col-sm-offset-8"> -->
       <!--    <table class="table table-bordered"> -->
            <?php foreach ($totals as $total) { ?>
             <div class="cart-total-row">
         <div><?php echo $total['text']; ?></div>
        <div><strong><?php echo $total['title']; ?>:</strong></div>

        </div>
            <!-- <tr>
              <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
            </tr> -->
            <?php } ?>
         <!--  </table> -->
        <!-- </div> -->

      </div>
      <div class="buttons">
        <!-- <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_shopping; ?></a></div> -->
        <!-- <div class="pull-right"><a href="" id="add-order" class="btn btn-primary"><?php echo $button_checkout; ?></a></div> -->
        <div class="pull-right" style="margin-right: -15px;">
          <button class="btn btn-primary">Создать заказ</button>
        </div>
      </div>

      </form>





      

      <script>
      $(document).ready(function() {
          $('#add-order').click(function(e) {
              e.preventDefault();
              
          });
      });
      </script>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
