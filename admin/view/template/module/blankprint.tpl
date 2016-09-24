<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-blankprint" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  
  <div class="content" style="margin-left:10px;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-blankprint" >
            
      <?php  
      function defaultvalb($name,$val,&$blankprint_module)
      {
        if (!isset($blankprint_module["settings"]["blanks"][$name]))
          $blankprint_module["settings"]["blanks"][$name] = $val;    
      }
      
        function defaultval($name,$val,&$blankprint_module)
      {
        if (!isset($blankprint_module["settings"][$name]))
        $blankprint_module["settings"][$name] = $val;
        
      }
      defaultval('typesum','auto',$blankprint_module);
      defaultval('short_addr','on',$blankprint_module);
      defaultval('bkey','',$blankprint_module);
      defaultval('country','off',$blankprint_module);
      defaultval('opis',array(),$blankprint_module);
      
      defaultvalb('b112116','on',$blankprint_module);
      defaultvalb("b112ep","on",$blankprint_module);
      defaultvalb('b116','on',$blankprint_module);
      defaultvalb('o107','on',$blankprint_module);
      defaultvalb('b7a','on',$blankprint_module);
      defaultvalb('b7b','on',$blankprint_module);
      defaultvalb('b7p','on',$blankprint_module);
      defaultvalb('b7p2','on',$blankprint_module);
      defaultvalb('bcn23','on',$blankprint_module);
      defaultvalb('bcp71','on',$blankprint_module);
      defaultvalb('bfind','on',$blankprint_module);
      defaultvalb('b116_2','on',$blankprint_module);
      defaultvalb('b116_2_a5','on',$blankprint_module);
      defaultvalb('b112_a5','on',$blankprint_module);
         
      echo "
      <ul class='nav nav-tabs'>
            <li><a data-toggle='tab' href='#tab-profils'>Профили</a></li>
   	    <li class='active'><a data-toggle='tab' href='#tab-setting'>Настройки</a></li>
            <li><a data-toggle='tab' href='#tab-opis'>Добавить в опись</a></li>                                    
     </ul>
     <div class='tab-content'>
     <div id='tab-setting' class='tab-pane fade in active'>
     
      <table>
      <tr>
            <td>Ключ активации (Получается после покупки от printblank@nikitabatov.ru):</td>
            <td>
    <input name='blankprint_module[settings][bkey]' class='form-control' value='" . $blankprint_module['settings']['bkey'] . "' type='text' size='34'>     
            </td>
          </tr>
      <tr>
            <td>Автоподстановка наложенного платежа и объявленной стоимости:</td>
            <td>
      <input type='radio' name='blankprint_module[settings][typesum]' value='auto'" . (($blankprint_module['settings']['typesum'] == 'auto')?"checked='checked'":"") . " >Авто</input>
      <input type='radio' name='blankprint_module[settings][typesum]' value='man'" . (($blankprint_module['settings']['typesum'] == 'man')?"checked='checked'":"" ) . ">Вручную</input>
            </td>
          </tr>
          <tr>
            <td>Автоматическое сокращение адреса (улица -> ул., проспект -> пр-т.):</td>
            <td>
      <input type='radio' name='blankprint_module[settings][short_addr]' value='on'" . (($blankprint_module['settings']['short_addr'] == 'on')?"checked='checked'":"") . " >Сокращать</input>
      <input type='radio' name='blankprint_module[settings][short_addr]' value='off'" . (($blankprint_module['settings']['short_addr'] == 'off')?"checked='checked'":"" ) . ">Оставить как есть</input>
            </td>
          </tr>
           <tr>
            <td>Добавлять страну к адресу (для экспорта):</td>
            <td>
      <input type='radio' name='blankprint_module[settings][country]' value='off'" . (($blankprint_module['settings']['country'] == 'off')?"checked='checked'":"") . " >Не добавлять</input>
      <input type='radio' name='blankprint_module[settings][country]' value='on'" . (($blankprint_module['settings']['country'] == 'on')?"checked='checked'":"" ) . ">Добавлять</input>
            </td>
          </tr>
          <tr>     
            <td colspan='2' style='padding-top:20px; text-align: center; font-weight: bold;'>Какие бланки Вы используете?</td>
          </tr>
             <tr>
            <td align='right'>ф.112ЭП + ф.116 - Посылка с наложенным платежом [2xA5=A4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][b112116]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][b112116]' ". (($blankprint_module['settings']['blanks']['b112116'] == 'on')?"checked='checked'":"") . "></td>
          </tr>
          <tr>
            <td align='right'>ф.112ЭП - Прием почтового перевода [A4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][b112ep]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][b112ep]' ". (($blankprint_module['settings']['blanks']['b112ep'] == 'on')?"checked='checked'":"") . "></td>
          </tr>
          <tr>
            <td align='right'>ф.112ЭП - Прием почтового перевода [1xA5=A4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][b112_a5]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][b112_a5]' ". (($blankprint_module['settings']['blanks']['b112_a5'] == 'on')?"checked='checked'":"") . "></td>
          </tr>
          <tr>
            <td align='right'>ф.116 - Сопроводительный адрес к посылке [A4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][b116]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][b116]' ". (($blankprint_module['settings']['blanks']['b116'] == 'on')?"checked='checked'":"") . "></td>
          </tr>
          <tr>
            <td align='right'>ф.116 - Сопроводительный адрес к посылке [2xA4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][b116_2]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][b116_2]' ". (($blankprint_module['settings']['blanks']['b116_2'] == 'on')?"checked='checked'":"") . "></td>
          </tr>
          <tr>
            <td align='right'>ф.116 - Сопроводительный адрес к посылке [2xA5=2xA4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][b116_2_a5]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][b116_2_a5]' ". (($blankprint_module['settings']['blanks']['b116_2_a5'] == 'on')?"checked='checked'":"") . "></td>
          </tr>
          <tr>
            <td align='right'>ф.107 - Опись содержимого в посылке [2xA5=A4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][o107]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][o107]' ". (($blankprint_module['settings']['blanks']['o107'] == 'on')?"checked='checked'":"") . "></td>
          </tr>
          <tr>
            <td align='right'>ф.7-a - Первый класс [1xA6=A4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][b7a]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][b7a]' ". (($blankprint_module['settings']['blanks']['b7a'] == 'on')?"checked='checked'":"") . "></td>
          </tr>
          <tr>
            <td align='right'>ф.7-б - Бандероль [1xA6=A4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][b7b]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][b7b]' ". (($blankprint_module['settings']['blanks']['b7b'] == 'on')?"checked='checked'":"") . "></td>
          </tr>
         <tr>
            <td align='right'>ф.7-п - Наклейка на коробку [1xA6=A4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][b7p]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][b7p]' ". (($blankprint_module['settings']['blanks']['b7p'] == 'on')?"checked='checked'":"") . "></td>
          </tr>
           <tr>
            <td align='right'>ф.7-п - Наклейка на коробку [1xA5=A4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][b7p2]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][b7p2]' ". (($blankprint_module['settings']['blanks']['b7p2'] == 'on')?"checked='checked'":"") . "></td>
          </tr>
          <tr>
            <td align='right'>ф.CN23 - Таможенная декларация [1xA5=A4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][bcn23]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][bcn23]' ". (($blankprint_module['settings']['blanks']['bcn23'] == 'on')?"checked='checked'":"") . "></td>
            <input type='hidden' name='blankprint_module[settings][layout_id]'  value='0'>
          </tr>
          <tr>
            <td align='right'>ф.CP71 - Сопроводительный адрес к посылке за границу [1xA5=A4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][bcp71]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][bcp71]' ". (($blankprint_module['settings']['blanks']['bcp71'] == 'on')?"checked='checked'":"") . "></td>
          </tr>
          <tr>
            <td align='right'>Заявление на розыск внутренних отправлений [A4]</td>
            <input type='hidden' name='blankprint_module[settings][blanks][bfind]'  value='off'>
            <td><input type='checkbox' name='blankprint_module[settings][blanks][bfind]' ". (($blankprint_module['settings']['blanks']['bfind'] == 'on')?"checked='checked'":"") . "></td>
          </tr>
                   
      </table>
      </div>
      
      <div id='tab-opis' class='tab-pane fade'>
      <table id='myTable'>
      <tbody>
    <tr>
      <th>Наименование</th>
      <th>Кол-во, шт.</th>
      <th>Стоимость, руб.</th>
    </tr>
    ";
    foreach($blankprint_module['settings']['opis'] as $num => $str)
    {
    echo"
    <tr>
      <td><input type='text' class='form-control' name='blankprint_module[settings][opis][$num][name]' size='40' value='$str[name]'></td>
      <td> <input type='text' class='form-control' name='blankprint_module[settings][opis][$num][quantity]' size='5' style='text-align:center;' value='$str[quantity]'></td>
      <td> <input type='text' class='form-control' name='blankprint_module[settings][opis][$num][price]' size='5' style='text-align:center;' value='$str[price]'></td>
     </tr>";
    }
  echo "
      </tbody>
      </table>";?>
      <a onclick="addRow();" style="text-decoration:none;">Добавить строку</a><br>
      <a onclick="var table =  document.getElementById('myTable'); if (table.rows.length > 1) table.deleteRow(-1);" style="text-decoration:none;">Удалить строку</a>
      <? echo "</div>
      <div id='tab-profils' class='tab-pane fade'>
      <a data-toggle='tab' id='profile-add' href='#' onclick='addProfile()';>Добавить профиль</a>
       <ul id='profil-vtabs' class='nav nav-tabs'>
      ";
      foreach($blankprint_module as $num => $profile)
        {
        if (is_int($num))
            echo   "
<li> <a data-toggle='tab' href='#tab-profil-$num' id='profil-$num'>$profile[shop_name] <i class='fa fa-trash-o fa-2x' onclick='delete_tab($num)'></i></a></li>";
   }?>             
                
                  </ul>
                  <div class='tab-content' id='tab-content'>
                 
      <?php
      foreach($blankprint_module as $num => $profile)
        {
          if (is_int($num))
        echo "
      <div id='tab-profil-$num' class='tab-pane fade'>
        <table class='form'>
          <tr style='display:none;'>
            <td><label class='form-control'>Тип</label></td>
            <td>
      <input type='radio' class='JF' name='blankprint_module[$num][typejf]' value='fiz'" . (($profile['typejf'] == 'fiz')?"checked='checked'":"") . " onchange='handler($(this))'>Физическое лицо</input>
      <input type='radio' class='JF' name='blankprint_module[$num][typejf]' value='jur'" . (($profile['typejf'] == 'jur')?"checked='checked'":"" ) . " onchange='handler($(this))'>Юридическое лицо</input>
            </td>
          </tr>
          <tr>
            <td class='fiz'>ФИО</td>
            <td class='jur'>Название</td>
             <td><input class='form-control' name='blankprint_module[$num][shop_name]' value='$profile[shop_name]' type='text' size='40'></td>
          </tr>
          <tr>
            <td>Телефон</td>
            <td><input class='form-control' name='blankprint_module[$num][shop_phone]' value='$profile[shop_phone]' type='text' size='13'></td>
          </tr>
          <tr>
            <td>Индекс</td>
            <td><input class='form-control' name='blankprint_module[$num][shop_index]' value='$profile[shop_index]'  type='index' size='6'></td>
          </tr>
          <tr>
            <td>Адрес</td>
            <td><textarea class='form-control' name='blankprint_module[$num][shop_addr]' placeholder='[Улица,дом,корпус,квартира], [Населенный пункт], [Регион]'  rows='2' cols='39'>$profile[shop_addr]</textarea></td>
          </tr>
          <tr class='jur'>
            <td>ИНН</td>
            <td><input class='form-control' name='blankprint_module[$num][shop_inn]'  value='$profile[shop_inn]' type='index'></td>
          </tr>
          <tr class='jur'>
            <td>Название банка</td>
            <td><input class='form-control' name='blankprint_module[$num][shop_bank_name]' value='$profile[shop_bank_name]' type='index' size='40'></td>
          </tr>
          <tr class='jur'>
            <td>Корреспондентский счет</td>
            <td><input class='form-control' name='blankprint_module[$num][shop_bank_ks]'  value='$profile[shop_bank_ks]' type='index'></td>
          </tr>
          <tr class='jur'>
            <td>Расчетный счет</td>
            <td><input class='form-control' name='blankprint_module[$num][shop_bank_rs]'  value='$profile[shop_bank_rs]' type='index'></td>
          </tr>
          <tr class='jur'>
            <td>БИК</td>
            <td><input class='form-control' name='blankprint_module[$num][shop_bank_bik]'  value='$profile[shop_bank_bik]' type='index'></td>
          </tr>
    
     <input type='hidden' name='blankprint_module[$num][layout_id]'  value='0'>
    <tr class='fiz'>
            <td>Документ</td>
            <td><input class='form-control' name='blankprint_module[$num][shop_document_name]'  value='$profile[shop_document_name]' type='index'></td>
          </tr>
          <tr class='fiz'>
            <td>Серия</td>
            <td><input class='form-control' name='blankprint_module[$num][shop_document_seria]'  value='$profile[shop_document_seria]' type='index'></td>
          </tr>
          <tr class='fiz'>
            <td>Номер</td>
            <td><input class='form-control' name='blankprint_module[$num][shop_document_nomer]'  value='$profile[shop_document_nomer]' type='index'></td>
          </tr>
          <tr class='fiz'>
            <td>Кем выдан</td>
            <td><textarea class='form-control' name='blankprint_module[$num][shop_document_kemv]' rows='2' cols='21'>$profile[shop_document_kemv]</textarea></td>
          </tr>
          <tr class='fiz'>
            <td>Дата выдачи</td>
            <td><input class='form-control' name='blankprint_module[$num][shop_document_datav]'  value='$profile[shop_document_datav]' type='date'></td>
          </tr>               
        </table>
      </div>
      ";
        }; 
        
           
        ?> 
        
        
       </div>   
    </form>
  </div>
  </div>
  </div>
  
  <script type="text/javascript">

var profile_num = <?php echo (isset($blankprint_module)?($num+1):1);?>;

function addProfile() { 
html  = ' <div id="tab-profil-' + profile_num + '" class="tab-pane fade">';
html += '        <table class="form">'
html += '          <tr>'
html += '            <td>Тип</td>'
html += '            <td>'
html += '     <input type="radio" class="JF" name="blankprint_module[' + profile_num + '][typejf]" onchange=handler($(this)) value="fiz" checked="checked">Физическое лицо</input>'
html += '     <input type="radio" class="JF" name="blankprint_module[' + profile_num + '][typejf]" onchange=handler($(this)) value="jur">Юридическое лицо</input>'
html += '            </td>'
html += '          </tr>'
html += '          <tr>'
html += '            <td class="fiz">ФИО</td>'
html += '     <td class="jur">Название</td>'
html += '            <td><input class="form-control" name="blankprint_module[' + profile_num + '][shop_name]"  type="text"  size="40"></td>'
html += '          </tr>'
html += '          <tr>'
html += '            <td>Телефон</td>'
html += '            <td><input  class="form-control" name="blankprint_module[' + profile_num + '][shop_phone]"  type="text" size="13"></td>'
html += '          </tr>'
html += '          <tr>'
html += '            <td>Индекс</td>'
html += '            <td><input  class="form-control" name="blankprint_module[' + profile_num + '][shop_index]"   type="index" size="6"></td>'
html += '          </tr>'
html += '          <tr>'
html += '            <td>Адрес</td>'
html += '            <td><textarea  class="form-control" name="blankprint_module[' + profile_num + '][shop_addr]" placeholder="[Улица,дом,корпус,квартира], [Населенный пункт], [Регион]" rows="2" cols="39"></textarea></td>'
html += '          </tr>'
html += '          <tr class="jur">'
html += '            <td>ИНН</td>'
html += '            <td><input  class="form-control" name="blankprint_module[' + profile_num + '][shop_inn]" type="index" size="12"></td>'
html += '          </tr>'
html += '          <tr class="jur">'
html += '            <td>Название банка</td>'
html += '            <td><input  class="form-control" name="blankprint_module[' + profile_num + '][shop_bank_name]" type="index" size="40"></td>'
html += '          </tr>'
html += '          <tr class="jur">'
html += '            <td>Корреспондентский счет</td>'
html += '            <td><input  class="form-control" name="blankprint_module[' + profile_num + '][shop_bank_ks]" type="index"></td>'
html += '          </tr>'
html += '          <tr class="jur">'
html += '            <td>Расчетный счет</td>'
html += '            <td><input  class="form-control" name="blankprint_module[' + profile_num + '][shop_bank_rs]" type="index"></td>'
html += '          </tr>'
html += '          <tr class="jur">'
html += '            <td>БИК</td>'
html += '            <td><input  class="form-control" name="blankprint_module[' + profile_num + '][shop_bank_bik]" type="index"></td>'
html += '          </tr>'
html += '     <input type="hidden"  class="form-control" name="blankprint_module[' + profile_num + '][layout_id]"  value="0">'
html += '   <tr class="fiz">'
html += '            <td>Документ</td>'
html += '            <td><input  class="form-control" name="blankprint_module[' + profile_num + '][shop_document_name]" placeholder="паспорт" type="index"></td>'
html += '          </tr>'
html += '          <tr class="fiz">'
html += '            <td>Серия</td>'
html += '            <td><input  class="form-control" name="blankprint_module[' + profile_num + '][shop_document_seria]" type="index"></td>'
html += '          </tr>'
html += '          <tr class="fiz">'
html += '            <td>Номер</td>'
html += '            <td><input  class="form-control" name="blankprint_module[' + profile_num + '][shop_document_nomer]" type="index"></td>'
html += '          </tr>'
html += '          <tr class="fiz">'
html += '            <td>Кем выдан</td>'
html += '            <td><textarea  class="form-control" name="blankprint_module[' + profile_num + '][shop_document_kemv]"  rows="2" cols="21"></textarea></td>'
html += '          </tr>'
html += '          <tr class="fiz">'
html += '            <td>Дата выдачи</td>'
html += '            <td><input  class="form-control" name="blankprint_module[' + profile_num + '][shop_document_datav]" type="date"></td>'
html += '          </tr>    '           
html += '        </table>'
html += '      </div>'
  
  var form = $(html);
  $('#tab-content').prepend(form);
  
  form.find('.fiz').show();
  form.find('.jur').hide();
  
  $('#profil-vtabs').prepend('<li><a data-toggle="tab" href="#tab-profil-' + profile_num + '" id="profil-' + profile_num + '">Новый профиль <i class="fa fa-trash-o fa-2x" onclick="delete_tab(' + profile_num + ')"></i></a></li>');
  
  
  

$('.nav-tabs a:first').tab('show'); 
  
  profile_num++;
}


function delete_tab(num)
{
	$("#profil-" + num).remove();
	$("#tab-profil-" + num).remove();
}

function handler(node)
{
    var fields = node.parents('table');
    if (node.val()=="jur") {
      fields.find('.jur').show();
      fields.find('.fiz').hide();
      
    }
    else {
      fields.find('.jur').hide();
      fields.find('.fiz').show();
      
    }
}

$('.JF').each(function() {
if ($(this).is(':checked')) handler($(this));
})  
  

 
</script>

<script type="text/javascript">
function addRow(){
var num = document.getElementById('myTable').rows.length; 
var html =  '<tr>';
html +=     '<td><input type="text" name=blankprint_module[settings][opis][' + num + '][name] size="40"></td>';
html +=     '<td><input type="text" name=blankprint_module[settings][opis][' + num + '][quantity] size="5" style="text-align:center;"></td>';
html +=     '<td><input type="text" name=blankprint_module[settings][opis][' + num + '][price] size="5" style="text-align:center;"></td>';
html +=     '</tr>';

  var form = $(html);
    $('#myTable').append(form);
  }
</script> 
  
</div>
<?php echo $footer; ?>