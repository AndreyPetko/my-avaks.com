<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
    <HEAD>
    <META charset="utf-8">

<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<link href="view/javascript/bootstrap/opencart/opencart.css" type="text/css" rel="stylesheet">
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet">
<link href="view/javascript/summernote/summernote.css" rel="stylesheet">
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<script src="view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen">
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="screen">
<script src="view/javascript/common.js" type="text/javascript"></script>
    </HEAD>
<BODY>
          <div class="col-sm-12">	
		<form name="printblank" method="post" target="_blank" action="../system/blankprint/index.php">
			<div class="col-sm-6" style="width:40%">
			<input name="products" class="form-control" type="hidden" value=<?php echo str_replace(" ","&@",serialize($products))?>>
			<input name="bkey" type="hidden" value=<?php echo $bkey; ?>>
				
				<h3>Интернет-магазин</h3>
				<select id="profiles" class="form-control"> 
				</select>
				<div class="form-group">
					<input class="form-control" name="shop_name" type="hidden" size="40">
					<input class="form-control" name="shop_phone" type="hidden" size="10" >
				</div>
				<div class="form-group">
					<input class="form-control" name="shop_index" type="hidden" size="6" >
					<input class="form-control" name="shop_addr" rows="3" type="hidden">
				</div>
				<div class="fiz">
	
					<input class="form-control" name="shop_document_name" type="hidden" size="13">
					<input class="form-control" name="shop_document_seria" type="hidden" > 
					<input class="form-control" name="shop_document_nomer" type="hidden" >
					<input class="form-control" name="shop_document_kemv" rows="2" type="hidden">
					<input class="form-control" name="shop_document_datav"  size="13" type="hidden">
				</div>
				<input type='hidden' name='layout_id'  value='0'>
				<div class="jur">
	
					<input class="form-control" name="shop_inn" type="hidden" size="15">
					<input class="form-control" name="shop_bank_name" type="hidden" size="25"> 
					<input class="form-control" name="shop_bank_ks" type="hidden" size="15">
					<input class="form-control" name="shop_bank_rs" type="hidden" size="15">
					<input class="form-control" name="shop_bank_bik" type="hidden" size="15">
				</div>
				
				<h3>Покупатель</h3> 	
				<div>
					<label>ФИО</label>
					<input class="form-control" name="client_name" type="text" size="40" value="<?php echo $client_name; ?>">
					<label>Телефон</label>
					<input class="form-control" name="client_phone" type="text" size="10" value="<?php echo $client_phone; ?>">
				</div>
				<div>
					<label for="index">Индекс</label>
					<input class="form-control" name="client_index" type="index" size="6" value="<?php echo $client_index; ?>">
					<label for="addres">Адрес</label>
					<textarea class="form-control" name="client_addr" rows="3" ><?php echo $client_addr; ?></textarea>
				</div>			
				<div>
					<label >Сумма наложенного платежа, руб.</label>
					<input class="form-control" name="sum_nal" type="text" size="10">
					<label >Сумма объявленной ценности, руб.</label>
					<input class="form-control" name="sum_ob" type="text" size="10">
				</div>	
			</div>
			<div class="col-sm-6">
			<h3>Печать бланков</h3> 
				<div class="btn-group" role="group" >
					<div id="blanks_btns">
				</div>
			</div>
		</form>
     </div>
<script type="text/javascript" >
$(document).ready(function() {
var settings = <?php echo json_encode($settings);?>;
var profiles = <?php echo json_encode($profiles);?>;
if (settings['typesum'] == 'auto')
{
	document.getElementsByName("sum_nal")[0].value = <?php echo ((int)round($sum_nal)); ?>;
	document.getElementsByName("sum_ob")[0].value = <?php echo ((int)round($sum_ob)); ?>;
	
}
    $.each(profiles, function(i,v) {
    if ($.isNumeric(i))
		$('#profiles').append('<option value="' + i + '">' + ((v.typejf == 'fiz') ? "Физ. лицо: ":"Юр. лицо: ") + v.shop_name + '</option>');
	})
$('#profiles').change(function() {
var v = $('#profiles').val();
if ((v != null) && ($.isNumeric(v)))
{if (profiles[v]['typejf'] == 'fiz') {$('.jur').hide(); $('.fiz').show();} else {$('.jur').show(); $('.fiz').hide();}}
else {$('.jur').hide(); $('.fiz').show();}

if (v) {$.each(profiles[v], function(k,vv) {if (k != 'typejf')  {document.getElementsByName(k)[0].value = vv;}})
}
});



var n = { 
 		b112116:"ф.112ЭП + ф.116 - Посылка с наложенным платежом [2xA5=A4]",
		 b112ep:"ф.112ЭП - Прием почтового перевода [A4]",
		 b112_a5:"ф.112ЭП - Прием почтового перевода [1xA5=A4]",
		 b116:"ф.116 - Сопроводительный адрес к посылке [A4]",
		 b116_2:"ф.116 - Сопроводительный адрес к посылке [2xA4]",
		 b116_2_a5:"ф.116 - Сопроводительный адрес к посылке [2xA5=2xA4]",
		 o107:"ф.107 - Опись содержимого в посылке [2xA5=A4]",
		 b7a:"ф.7-a - Первый класс [1xA6=A4]",
		 b7b:"ф.7-б - Бандероль [1xA6=A4]",
		 b7p:"ф.7-п - Наклейка на коробку [1xA6=A4]",				
		 b7p2:"ф.7-п - Наклейка на коробку [1xA5=A4]",
		 bcn23:"ф.CN23 - Таможенная декларация [1xA5=A4]",
		 bcp71:"ф.CP71 - Сопроводительный адрес к посылке за границу [1xA5=A4]",
		 bfind:"Заявление на розыск внутренних отправлений [A4]"}; 


function reverseForIn(obj, f) {
  var arr = [];
  for (var key in obj) {
    // add hasOwnPropertyCheck if needed
    arr.push(key);
  }
  for (var i=arr.length-1; i>=0; i--) {
    f.call(obj, arr[i]);
  }
}

reverseForIn(settings['blanks'], function(key){ 
if (this[key] == 'on')
	$('#blanks_btns').append('<button class="btn btn-default" name="blank_type" value="' + key + '" type="submit" style="margin-bottom:3%;">' + n[key] + '</button><br>');
});


$('#profiles').change();
if (profiles.length == 0) {alert("Заполните профиль интернет-магазина в настройках модуля: Дополнения -> Модули -> Почта России - Печать почтовых бланков");}

});
</script>
</BODY>
</HTML>