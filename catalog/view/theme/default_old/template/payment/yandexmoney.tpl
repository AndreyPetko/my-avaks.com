<style>
.dka-product .product-list .product-thumb .button-group {
    border-left: none;
}
.dka-product .button-group {
    border-left: none;
	margin-right: 10px;
}
.dka-product .product-thumb .button-group {
    background-color: #fff;
    border-top: none;
}
</style>
<?php if ($procent){?>
<div class="row">
    <div class="col-sm-9">
        <h2 class="pull-left"><?php echo $dka_kassa_procent_text; ?></h2>
    </div>
    <div class="col-sm-3">
        <h2 class="pull-right"><?php echo $total; ?></h2>
    </div>
</div>
<?php }?>
<?php if ($org_mode){?>
	<form method="POST" action="<?php echo $action; ?>">
	     <div class="buttons">
		   <h3><?php echo $method_label; ?></h3>
		   <div class="row">
               <div class="col-sm-6">
                   <?php for($i = 0; $i < count($view_payment_legal); $i++) { ?>
                    <div class="row auto-yandex-row">
                       <div class="col-sm-2">
		                   <img src="<?php echo $view_payment_legal[$i]['img'] ?>" alt="" class="yandex-pc">
		               </div>
                       <div class="col-sm-1 text-right">
		                   <input type="radio" name="paymentType" value="<?php echo $view_payment_legal[$i]['value'] ?>" <?php if($view_payment_legal[$i]['checked']){ echo "checked"; } ?> id="<?php echo $view_payment_legal[$i]['id'] ?>">
		               </div>
		               <div class="col-sm-5">
		                   <label for="<?php echo $view_payment_legal[$i]['id'] ?>"><?php echo $view_payment_legal[$i]['name'] ?></label>
		               </div>
                   </div>
                   <?php } ?>
               </div>
		       
		   </div>
		   
		   <input type="hidden" name="shopid" value="<?php echo $shop_id;?>">
		   <input type="hidden" name="scid" value="<?php echo $scid;?>">
		   <input type="hidden" name="orderNumber" value="<?php echo $order_id;?>">
		   <input type="hidden" name="sum" value="<?php echo $sum;?>" data-type="number" >
		   <input type="hidden" name="customerNumber" value="<?php echo $customerNumber; ?>" >
		   <input type="hidden" name="shopSuccessURL" value="<?php echo $shopSuccessURL; ?>" >
		   <input type="hidden" name="shopFailURL" value="<?php echo $shopFailURL; ?>" >
		   <input type="hidden" name="cms_name" value="opencart" >
		  
			<div class="row">
                <div class="col-sm-12 text-center">
                    <input type="submit" name="submit-button" value="<?php echo $button_confirm; ?>" class="button btn btn-success">    
                </div>
			</div>
	   </div>
	</form>

<?php }else{ ?>
	<form method="POST" action="<?php echo $action; ?>">
	   <input type="hidden" name="receiver" value="<?php echo $account; ?>">
	   <input type="hidden" name="formcomment" value="<?php echo $formcomment;?>">
	   <input type="hidden" name="short-dest" value="<?php echo $short_dest;?>">
	   <input type="hidden" name="writable-targets" value="false">
	   <input type="hidden" name="comment-needed" value="true">
	   <input type="hidden" name="label" value="<?php echo $order_id;?>">
	   <input type="hidden" name="quickpay-form" value="shop">
	   <div class="buttons">
		   <h3><?php echo $method_label; ?></h3>
		   
		   <div class="row">
               <div class="col-sm-6">
                   <?php for($i = 0; $i < count($view_payment_phys); $i++) { ?>
                    <div class="row auto-yandex-row">
                       <div class="col-sm-2">
		                   <img src="<?php echo $view_payment_phys[$i]['img'] ?>" alt="" class="yandex-pc">
		               </div>
                       <div class="col-sm-1 text-right">
		                   <input type="radio" name="paymentType" value="<?php echo $view_payment_phys[$i]['value'] ?>" <?php if($view_payment_phys[$i]['checked']){ echo "checked"; } ?> id="<?php echo $view_payment_phys[$i]['id'] ?>">
		               </div>
		               <div class="col-sm-5">
		                   <label for="<?php echo $view_payment_phys[$i]['id'] ?>"><?php echo $view_payment_phys[$i]['name'] ?></label>
		               </div>
                   </div>
                   <?php } ?>
               </div>
		       
		   </div>
		  
		   <input type="hidden" name="targets" value="<?php echo $order_text;?> <?php echo $order_id;?>">
		   <input type="hidden" name="sum" value="<?php echo $sum;?>" data-type="number" >
		   <input type="hidden" name="comment" value="<?php echo $comment; ?>" >
		   <input type="hidden" name="need-fio" value="<?php if ($need_fio) { echo 'true'; }else{ echo 'false'; } ?>" >
		   <input type="hidden" name="need-email" value="<?php if ($need_email) { echo 'true'; }else{ echo 'false'; } ?>" >
		   <input type="hidden" name="need-phone" value="<?php if ($need_phone) { echo 'true'; }else{ echo 'false'; } ?>">
		   <input type="hidden" name="need-address" value="<?php if ($need_address) { echo 'true'; }else{ echo 'false'; } ?>">
	   
			<div class="row">
                <div class="col-sm-12 text-center">
                    <input type="submit" name="submit-button" value="<?php echo $button_confirm; ?>" class="button btn btn-success">    
                </div>
			</div>
	   </div>
	</form>
<?php } ?>
<div class="modal fade" id="bs-info-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
           <div class="modal-dialog modal-lg">
               <div class="modal-content">
                        
               </div>
       	   </div>
</div>



<script type="text/javascript">
	var xmlGetProduct = <?php echo "\"" . str_replace('&amp;', '&', $dka_kassa_modal_getProduct) . "\""; ?>;
	var htmlModal = [];
    $( document ).ready(function() {
		<?php if($dka_kassa_modal_client) { ?>
        $('#bs-info-modal-lg').modal();
		htmlModal.push(<?php echo "'" . html_entity_decode($dka_kassa_modal_text, ENT_QUOTES, 'UTF-8') . "'"; ?>);
		<?php if($dka_kassa_modal_type) { ?>
		get_ProductModal();
		<?php }else{ ?>
		$('#bs-info-modal-lg .modal-content').html("<div>" + htmlModal.join('') + "</div>");
		<?php } ?>
		<?php } ?>
	});
		
	// Получение продуктов
    
    function get_ProductModal()
    {
        $.ajax({
            url: xmlGetProduct,
            dataType: 'json',
            success: function(json) {
                
                $.each(json, function(key, val){
                    
                    htmlModal.push('<div class="row dka-product">\
                                    <div class="product-layout product-list col-xs-12">\
                                    <div class="product-thumb transition">\
                                    <div class="image">\
                                    <a href="' + json[key].href + '" target="_blank"><img src="'+json[key].thumb+'" class="img-responsive" /></a>\
                                        </div>\
                                    <div class="caption">\
                                    <h4><a href="' + json[key].href + '" target="_blank">' + json[key].name + '</a></h4>\
                                    <p>' + json[key].description + '</p>\
                                    <h4 class="price pull-right">' + json[key].price + '</h4>\
                                        </div>\
                                    <div class="button-group"><a class="btn btn-primary pull-right" href="' + json[key].href + '" target="_blank">Подробнее...</a></div></div></div></div>');
                      
							});
                
				
				/*
				var html = "";
				for(var i = 0; i < json.products.length; i++)
				{
					html += "<option value='" + json.products[i].product_id + "'>" + "ID: " + json.products[i].product_id + " " + json.products[i].name + " (Цена: " + json.products[i].price + ") </option>";
				}
				$('#product-modal-client').html(html);
				$(".modal-product").show();
				*/
				$('#bs-info-modal-lg .modal-content').html("<div>" + htmlModal.join('') + "</div>");
            }
        }).always(function() {
		});
        
    }

</script>
            
          