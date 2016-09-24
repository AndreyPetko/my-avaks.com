<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
	<h1><?php echo $heading_title; ?></h1>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-4 col-md-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
     
      <?php if ($products) { ?>
			<div class="well well-sm">
				<div class="row">
					<div class="col-lg-3 col-md-4 col-sm-3 col-xs-4">
						<div class="btn-group btn-group-justified">
						<div class="btn-group">
							<button type="button" id="list-view" class="btn btn-default">
								<i class="fa fa-th-list"></i><span class="hidden-xs hidden-sm"> <?php echo $button_list; ?></span>
							</button>
						</div>
						<div class="btn-group">
							<button type="button" id="grid-view" class="btn btn-default">
								<i class="fa fa-th-large"></i><span class="hidden-xs hidden-sm"> <?php echo $button_grid; ?></span>
							</button>
						</div>
						</div>
					</div>		
					<div class="col-lg-5 col-md-5 col-sm-5 col-xs-4">
						<div class="input-group">
							<span class="input-group-addon" ><i class="fa fa-sort"></i><span class="hidden-xs hidden-sm hidden-md"> <?php echo $text_sort; ?></span></span>
							<select id="input-sort" class="form-control" onchange="location = this.value;">
								<?php foreach ($sorts as $sorts) { ?>
								<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
								<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>	
					<div class="col-lg-4 col-md-3 col-sm-4 col-xs-4">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-eye"></i><span class="hidden-xs hidden-sm hidden-md"> <?php echo $text_limit; ?></span></span>
							<select id="input-limit" class="form-control" onchange="location = this.value;">
								<?php foreach ($limits as $limits) { ?>
								<?php if ($limits['value'] == $limit) { ?>
								<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
				</div>	
			</div>

      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb thumbnail ">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive center-block" /></a></div>
            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <p class="description"><?php echo $product['description']; ?></p>
                
               
                
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-old">&nbsp;<?php echo $product['price']; ?>&nbsp;</span> <span class="price-new"><?php echo $product['special']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
									<br />
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
								<?php if ($product['rating']) { ?>
								<p class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <i class="fa fa-star"></i>
                  <?php } else { ?>
                  <i class="fa fa-star active"></i>
                  <?php } ?>
                  <?php } ?>
									&nbsp;&nbsp;<a href="<?php echo $product['href']; ?>"><?php echo $product['reviews']; ?> отзывов</a>
								</p>
								<?php } else { ?>
								<p class="rating">
									<i class="fa fa-star-o"></i>
                  <i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									<i class="fa fa-star-o"></i>
									&nbsp;&nbsp;<?php echo $product['reviews']; ?> отзывов</a>
								</p>
								<?php } ?>
								<div class="btn-group">
									<?php if (($product['quantity'] <= 0) and $disable_cart_button){ ?>
									<button class="btn btn-addtocart" type="button" disabled><?php echo $disable_cart_button_text; ?></button>
									<?php } else { ?>
									<button class="btn btn-addtocart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
									<?php } ?>
									<button class="btn btn-addtocart" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
									<button class="btn btn-addtocart" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
								</div>
              </div>
            </div>
						<div class="clearfix"></div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>

			<?php if (isset($thumb) && isset($description)) { ?>
				<?php if ($thumb || $description) { ?>
				<div class="well red-links" style="margin-top: 20px">
					<?php if ($thumb) { ?>
					<div class="pull-left"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" style="margin: 0 10px 5px 0" /></div>
					<?php } ?>
					<?php if ($description) { ?>
					<?php echo $description; ?>
					<?php } ?>
					<div class="clearfix"></div>
				</div>
				<?php } ?>
			<?php } ?>
			
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