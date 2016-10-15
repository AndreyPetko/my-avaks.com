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


  <div id="category-content">
    <div class="container">
      <div class="row">
        <?php if($show_filter) : ?>
          <div class="col-md-3">
            <div id="filter">
              <div class="filter-head">
                Фильтр
              </div>

              <div class="filter-item">
                <div class="filter-item-title">
                  По цене
                </div>
                <div class="filter-item-open">
                  <img src="/catalog/view/theme/default/images/filter-arrow1.jpg">
                </div>

                <div class="filter-item-content">
                  <div id="slider-range"></div>
                  <p>
                    <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
                    <input type="hidden" id="min" value="<?php echo $min_price_current; ?>" name="">
                    <input type="hidden" id="max" value="<?php echo $max_price_current; ?>" name="">
                  </p>

                  <div class="filter-item-close">
                    Свернуть
                  </div>
                </div>

              </div>
              <?php foreach ($groupsFilter as $groupName => $group) { ?>
              <div class="filter-item filter-item-radio">
                <div class="filter-item-title">
                  <?php echo $groupName; ?>
                </div>
                <div class="filter-item-open">
                  <img src="/catalog/view/theme/default/images/filter-arrow1.jpg">
                </div>

                <div class="filter-item-content">
                  <div class="filter-item-content-inside">
                    <?php foreach ($group as $filter) { ?>
                    <label>
                      <input type="checkbox" <?php if($filter['checked']) { ?> checked <?php } ?> name="filters" value="<?php echo $filter['filter_id']; ?>" name="one"><?php echo $filter['name']; ?>
                    </label>
                    <?php } ?>
                  </div>
                  <div class="filter-item-close">
                    Свернуть
                  </div>

                </div>
              </div>
              <?php } ?>

              <div class="filter-buttons">
                <div id="filter-submit">
                  <img src="/catalog/view/theme/default/images/icon-show-white.png">
                  Показать
                </div>
                                  <!-- <div id="filter-refresh">
                                    <img src="/catalog/view/theme/default/images/icon-refresh.png">
                                    Обновить
                                  </div> -->
                                </div>
                              </div>
                            </div>

                          <?php endif; ?>
                          <div class="<?php if($show_filter) : ?> col-md-9 <?php else : ?> col-md-12 <?php endif; ?> ">
                            <div class="main-title">
                              <h1><?php echo $heading_title; ?></h1>
                            </div>
                            <?php if ($description) { ?>
                            <div ><?php echo $description; ?></div>
                            <?php } ?>
                            <hr>
                            <?php if ($categories) { ?>
                            <h3><?php echo $text_refine; ?></h3>

                            <div class="row">
                              <?php foreach (array_chunk($categories, ceil(count($categories) / 3)) as $categories) { ?>
                              <div class="col-sm-4">
                                <ul class="categories-list">
                                  <?php foreach ($categories as $category) { ?>
                                  <li><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>"><p><?php echo $category['name']; ?></p></a></li>
                                  <?php } ?>
                                </ul>
                              </div>
                              <?php } ?>
                            </div>
                      

                            <?php } ?>
                            <?php if ($products) { ?>
                            <div id="filter-block">
                              <?php if(!empty($checked_filter)) { ?>

                              <div class="fitler-block-item fitler-block-item-main">
                                <p>Очистить все фильтры</p>
                                <div class="clear-fitler-block-main" id="clear-fitler-block-main">
                                </div>
                              </div>
                              <?php foreach($checked_filter as $filter_item) { ?>
                              <div class="fitler-block-item ">
                                <p><?php echo $filter_item['name']; ?></p>
                                <div class="clear-fitler-block" data-filterid="<?php echo $filter_item['id']; ?>">
                                </div>
                              </div>
                              <?php } ?>

                              <?php } ?>
                            </div>

                            <div class="sort-line">
                              <div class="row">
                                <div class="col-md-4">
                                  <div class="sort-view">
                                    <div id="sort-view-tb">
                                     <img src="/catalog/view/theme/default/images/catalog-list1-b.png">
                                   </div>
                                   <div id="sort-view-sp">
                                    <img src="/catalog/view/theme/default/images/catalog-list2-g.png">
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="sort-by">
                                  <img src="/catalog/view/theme/default/images/compaire-icon-b.png">
                                  Сортировать по:

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
                              <div class="col-md-4">
                                <div class="sort-by">
                                  <img src="/catalog/view/theme/default/images/show-icon-blue.jpg">
                                  Показать по:

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
                          <div id="catalog-products">
                            <div class="row">
                             <?php foreach ($products as $product) { ?>
                             <div class="item">
                              <div class="col-md-4 col-sm-6">
                                <div class="product-item">
                                  <div class="wish-comp-item">
                                    <?php if($product['in_wishlist']) { ?>
                                    <img class="toWish" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" src="/catalog/view/theme/default/images/icon-to-wish-product-w.png">
                                    <?php } else { ?>
                                    <img class="toWish" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" src="/catalog/view/theme/default/images/icon-to-wish-product-g.png">
                                    <?php } ?>

                                    <?php if($product['in_compare']) { ?>
                                    <img class="toComp" onclick="compare.add('<?php echo $product['product_id']; ?>');" src="/catalog/view/theme/default/images/icon-to-comp-product-w.png">
                                    <?php } else { ?>
                                    <img class="toComp" onclick="compare.add('<?php echo $product['product_id']; ?>');" src="/catalog/view/theme/default/images/icon-to-comp-product-g.png">
                                    <?php } ?>
                                  </div>
                                  <a href="<?php echo $product['href']; ?>">
                                    <img class="product-item-img" src="<?php echo $product['thumb']; ?>">
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
                            <?php } ?>
                            <?php if (!$categories && !$products) { ?>
                            <p><?php echo $text_empty; ?></p>
                            <div class="buttons">
                              <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                            </div>
                            <?php } ?>

                          </div> 
                        </div>
                        <div class="pagination-div">
                          <?php echo $pagination; ?>
                        </div>

                      </div>
                    </div>
                  </div>
                </div>
              </div>


              <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
              <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
              <script>

                $(function() {
                  $( "#slider-range" ).slider({
                    range: true,
                    min: <?php echo $min_price; ?>,
                    max: <?php echo $max_price; ?>,
                    values: [ <?php echo $min_price_current; ?>, <?php echo $max_price_current; ?> ],
                    slide: function( event, ui ) {
                      $( "#amount" ).val(  ui.values[ 0 ] + "р - " + ui.values[ 1 ] + "р");
                      $('#min').val(ui.values[0]);
                      $('#max').val(ui.values[1]);
                    }
                  });
                  $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) + "р - " + $( "#slider-range" ).slider( "values", 1 ) + "р");
                });

                function updateURLParameter(url, param, paramVal) {
                  var newAdditionalURL = "";
                  var tempArray = url.split("?");
                  var baseURL = tempArray[0];
                  var additionalURL = tempArray[1];
                  var temp = "";
                  if (additionalURL) {
                    tempArray = additionalURL.split("&");
                    for (i=0; i<tempArray.length; i++){
                      if(tempArray[i].split('=')[0] != param){
                        newAdditionalURL += temp + tempArray[i];
                        temp = "&";
                      }
                    }
                  }

                  var rows_txt = temp + "" + param + "=" + paramVal;
                  return baseURL + "?" + newAdditionalURL + rows_txt;
                }


                document.addEventListener('DOMContentLoaded', function() {
                  var submit = document.getElementById('filter-submit');

                  var clearItems = document.getElementsByClassName('clear-fitler-block');

                  for (var i = clearItems.length - 1; i >= 0; i--) {
                    clearItems[i].addEventListener('click', function(){
                      filterId = this.dataset.filterid;


                      var items = document.getElementsByName('filters');
                      var filters = [];

                      for (var i = items.length - 1; i >= 0; i--) {
                        if(items[i].checked) {
                          if(items[i].value != filterId) {
                            filters.push(items[i].value);
                          }
                        }
                      }

                      var filterStr = filters.join(',');
                      var min = parseInt(document.getElementById('min').value);
                      var max = parseInt(document.getElementById('max').value);

                      newURL = updateURLParameter(window.location.href, 'filter', filterStr);
                      newURL = updateURLParameter(newURL, 'page', 1);
                      newURL = updateURLParameter(newURL, 'min', min);
                      newURL = updateURLParameter(newURL, 'max', max);

                      window.location.replace(newURL);
                    });
                  }



                  submit.addEventListener('click', function() {
                    var min = parseInt(document.getElementById('min').value);
                    var max = parseInt(document.getElementById('max').value);

                    var items = document.getElementsByName('filters');
                    var filters = [];

                    for (var i = items.length - 1; i >= 0; i--) {
                      if(items[i].checked) {
                        filters.push(items[i].value);
                      }
                    }

                    var filterStr = filters.join(',');

                    newURL = updateURLParameter(window.location.href, 'filter', filterStr);
                    newURL = updateURLParameter(newURL, 'page', 1);
                    newURL = updateURLParameter(newURL, 'min', min);
                    newURL = updateURLParameter(newURL, 'max', max);

                    window.location.replace(newURL);
                  });



                  clearAll = document.getElementById('clear-fitler-block-main');

                  clearAll.addEventListener('click', function() {
                    var min = parseInt(document.getElementById('min').value);
                    var max = parseInt(document.getElementById('max').value);

                    filterStr = '';

                    newURL = updateURLParameter(window.location.href, 'filter', filterStr);
                    newURL = updateURLParameter(newURL, 'page', 1);
                    newURL = updateURLParameter(newURL, 'min', min);
                    newURL = updateURLParameter(newURL, 'max', max);

                    window.location.replace(newURL);
                  });

                });
              </script>

              <script>
                var buttonToTab = document.getElementById('sort-view-tb');
                var buttonToList = document.getElementById('sort-view-sp');
                var productItems = document.getElementsByClassName('product-item');
                

                
                buttonToList.addEventListener('click', function(){
                 for(i=0; i<productItems.length; i++){
                  productItems[i].parentNode.classList.add('col-lg-12');
                  productItems[i].parentNode.classList.remove("col-md-4", "col-sm-6");
                  productItems[i].classList.add('product-item-list');
                  productItems[i].style.minHeight = "180px";
                  buttonToTab.getElementsByTagName('img')[0].src = "/catalog/view/theme/default/images/catalog-list1-g.png";
                  buttonToList.getElementsByTagName('img')[0].src = "/catalog/view/theme/default/images/catalog-list2-b.png";

                };

              });
                buttonToTab.addEventListener('click', function(){
                 for(i=0; i<productItems.length; i++){
                  productItems[i].parentNode.classList.add("col-md-4", "col-sm-6");
                  productItems[i].parentNode.classList.remove('col-lg-12');
                  productItems[i].classList.remove('product-item-list');
                  productItems[i].style.minHeight = "360px";
                  buttonToTab.getElementsByTagName('img')[0].src = "/catalog/view/theme/default/images/catalog-list1-b.png";
                  buttonToList.getElementsByTagName('img')[0].src = "/catalog/view/theme/default/images/catalog-list2-g.png";
                };
              });


            </script>
            <?php echo $footer; ?>
