<?php
if (defined('VERSION') && '2.' == substr(VERSION, 0, 2)) {
	$productSelectorPrefix = '#product';
} else {
	$productSelectorPrefix = '.product-info';
}
?>












function occmAjaxPostAdd(uri, dataSet) {
	$("#occm-form-container").find("input[type=text]").removeClass("error-in-input-text");
	$.ajax({
		url: uri,
		type: 'post',
		data: $(dataSet),
		dataType: 'json',
		success: function(json) {
			var printR = function(o, printR) {
				var c = 0;
				if ('object' == typeof o) {
					for (var i in o) {
						c += printR(o[i], printR);
					}
				} else if ('string' == typeof o) {
					alert(o);
					c++;
				}
				return c;
			};
			if (json['error']) {
				if ('string' == typeof json["error"]) {
					if ("undefined" != typeof json["addErrorClass"] && json["addErrorClass"].length) {
						for (var i in json["addErrorClass"]) {
							$("#occm-form-container").find(json["addErrorClass"][i]).addClass("error-in-input-text");
						}
					}
					alert(json['error']);
				} else if ("object" == typeof json['error']) {
					if (printR(json['error'], printR)) {
						$.colorbox.close();
					} else {
						alert("Unexpected error, please, contact administrator <?php echo $z->c('config_email') ?>");
					}
				} else {
					alert("Unexpected error, please, contact administrator <?php echo $z->c('config_email') ?>");
				}
			} else if (json['success']) {
				alert(json['success']);
				$.colorbox.close();
			} else {
				alert("Unexpected error, please, contact administrator <?php echo $z->c('config_email') ?>");
			}
		}
	});
}
(function() {
	$(document).ready(function() {
		if (!$.colorbox) {
			$("#button-cart").after('<script src="catalog/view/javascript/occm/jquery.colorbox-min.js" type="text/javascript"></script>');
			$("#button-cart").after('<link href="catalog/view/javascript/occm/colorbox.css" rel="stylesheet" media="screen" />');
		}
		$("#button-cart").after('<input type="button" value="<?php echo $z->l('Buy one click') ?>" class="btn btn-primary btn-lg btn-block button occm-button" />');
		$("input.occm-button").click(function() {
			$.ajax({
				url: '<?php echo $z->url->link('module/occm/add','','SSL') ?>',
				type: 'post',
				data: $('<?php echo $productSelectorPrefix ?> input[type=\'text\'], <?php echo $productSelectorPrefix ?> input[type=\'hidden\'], <?php echo $productSelectorPrefix ?> input[type=\'radio\']:checked, <?php echo $productSelectorPrefix ?> input[type=\'checkbox\']:checked, <?php echo $productSelectorPrefix ?> select, <?php echo $productSelectorPrefix ?> textarea'),
				dataType: 'json',
				success: function(json) {
					$('.success, .warning, .attention, information, .error, .text-danger').remove();
					if (json['error']) {
						if (json['error']['option']) {
							for (i in json['error']['option']) {
								<?php if (defined('VERSION') && '2.' == substr(VERSION, 0, 2)) { ?>
									$('#input-option' + i).after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
								<?php } else { ?>
									$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
								<?php } ?>
							}
						}
						if (json['error']['profile']) {
							$('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
						}
					} else if (1 == json['success']) {
						$.colorbox({
							href: "<?php echo $z->url->link('module/occm','','SSL') ?>" + "&product_id=" + $("#button-cart").closest("div").find("input[name=product_id]").val(),
							onComplete:function() {
								$.colorbox.resize();
							}
							});
					} else if (2 == json['success']) {
						if (confirm('<?php echo $z->l('Confirm buy one click') ?>')) {
							occmAjaxPostAdd('<?php echo htmlspecialchars_decode($z->url->link('module/occm/add','&occ_customer=1','SSL')) ?>', '<?php echo $productSelectorPrefix ?> input[type=\'text\'], <?php echo $productSelectorPrefix ?> input[type=\'hidden\'], <?php echo $productSelectorPrefix ?> input[type=\'radio\']:checked, <?php echo $productSelectorPrefix ?> input[type=\'checkbox\']:checked, <?php echo $productSelectorPrefix ?> select, <?php echo $productSelectorPrefix ?> textarea');
							alert('Ваш заказ успешно оформлен');
						}
					}
				}
			});
			return false;
		});
	});
	$(document).on("click", "#occm-button-confirm", function() {
		occmAjaxPostAdd('<?php echo $z->url->link('module/occm/add','','SSL') ?>', '[name^=\'occ_customer\'], <?php echo $productSelectorPrefix ?> input[type=\'text\'], <?php echo $productSelectorPrefix ?> input[type=\'hidden\'], <?php echo $productSelectorPrefix ?> input[type=\'radio\']:checked, <?php echo $productSelectorPrefix ?> input[type=\'checkbox\']:checked, <?php echo $productSelectorPrefix ?> select, <?php echo $productSelectorPrefix ?> textarea');
		return false;
	});
})();