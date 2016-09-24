<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-yandex" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <button type="button" class="btn btn-warning" data-toggle="modal" data-target=".bs-settings-modal-lg"><i class="fa fa-cog"></i> Дополнительно</button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  
  <div class="container-fluid">
  <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
  <?php } ?>
  <div class="panel panel-default">
	<div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>

    <div class="panel-body">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-yandex" class="form-horizontal">
            <div class="row">
                  <div class="col-sm-12">
                      <?php if ($yandexmoney_status) { ?>
						  <div class="col-sm-2 col-md-2 col-lg-2 info-tab-ok text-center" title="Включен" data-toggle="tooltip">
							  <i class="fa fa-check-square-o image-green"></i>
							  <input type="radio" name="yandexmoney_status" value="1" checked="checked" />
							  <?php echo $text_yes; ?>&nbsp;
							  <input type="radio" name="yandexmoney_status" value="0" />
							  <?php echo $text_no; ?>
						  </div>
                      <?php } else { ?>
						  <div class="col-sm-2 col-md-2 col-lg-2 info-tab-er text-center" title="Отключен" data-toggle="tooltip">
							  <i class="fa fa-check-square-o image-red"></i>
							  <input type="radio" name="yandexmoney_status" value="1"  />
							  <?php echo $text_yes; ?>&nbsp;
							  <input type="radio" name="yandexmoney_status" value="0" checked="checked"/>
							  <?php echo $text_no; ?>
						  </div>
                      <?php } ?>
                      
					  <?php if ($yandexmoney_testmode) { ?>
						  <div class="col-sm-2 col-md-2 col-lg-2 info-tab-in text-center" title="В режиме тестирования" data-toggle="tooltip">
							  <i class="fa fa-wrench image-blue"></i>
							  <input type="radio" name="yandexmoney_testmode" value="1" checked="checked" />
							  <?php echo $text_yes; ?>&nbsp;
							  <input type="radio" name="yandexmoney_testmode" value="0" />
							  <?php echo $text_no; ?>
						  </div>
                      <?php } else { ?>
						  <div class="col-sm-2 col-md-2 col-lg-2 info-tab-ok text-center" title="Находится в боевом режиме" data-toggle="tooltip">
							  <i class="fa fa-thumbs-o-up image-green"></i>
							  <input type="radio" name="yandexmoney_testmode" value="1"  />
							  <?php echo $text_yes; ?>&nbsp;
							  <input type="radio" name="yandexmoney_testmode" value="0" checked="checked"/>
							  <?php echo $text_no; ?>
						  </div>
                      <?php } ?>

                      <div class="col-sm-7 col-md-6 col-lg-5 info-tab-ot text-center" title="Режим работы" data-toggle="tooltip">
                          <select name="yandexmoney_mode" id="yandexmoney_mode" onchange="yandex_validate_mode();" class="form-control">
						  	<option value="1"<?php if ($yandexmoney_mode == 1 or !$yandexmoney_mode){?> selected<?php } ?>><?php echo $entry_mode1; ?></option>
						    <option value="2"<?php if ($yandexmoney_mode == 2){?> selected<?php } ?>><?php echo $entry_mode2; ?></option>
						  </select> 
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="col-sm-12 box-info-site">
                      
                  <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-merchant"><?php echo $entry_methods; ?></label>
                <div class="col-sm-10 payment-method">
                   <div class="well well-sm" style="height: 150px; overflow: auto;">
                      
                      <div class="checkbox">
                        <label>
                            <input type="checkbox" name="yandexmoney_method_ym" value="1" id="ym_method_1"<?php if ($yandexmoney_method_ym){?> checked <?php } ?> />
                            <?php echo $entry_method_ym; ?>
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                            <input type="checkbox" name="yandexmoney_method_cards" value="1" id="ym_method_2" <?php if ($yandexmoney_method_cards){?> checked <?php } ?>/>
                            <?php echo $entry_method_cards; ?>
                        </label>
                      </div>
                      <div class="org">
                          <div class="checkbox">
                            <label>
                                <input type="checkbox" name="yandexmoney_method_cash" value="1" id="ym_method_3" <?php if ($yandexmoney_method_cash){?> checked <?php } ?>/>
                                <?php echo $entry_method_cash; ?>
                            </label>
                          </div>
                          <div class="checkbox">
                            <label>
                                <input type="checkbox" name="yandexmoney_method_mobile" value="1" id="ym_method_4" <?php if ($yandexmoney_method_mobile){?> checked <?php } ?>/>
                                <?php echo $entry_method_mobile; ?>
                            </label>
                          </div>
                          <div class="checkbox">
                            <label>
                                <input type="checkbox" name="yandexmoney_method_wm" value="1" id="ym_method_5"<?php if ($yandexmoney_method_wm){?> checked <?php } ?> />
                                <?php echo $entry_method_wm; ?>
                            </label>
                          </div>
                          <div class="checkbox">
                            <label>
                                <input type="checkbox" name="yandexmoney_method_ab" value="1" id="ym_method_6"<?php if ($yandexmoney_method_ab){?> checked <?php } ?> />
                                <?php echo $entry_method_ab; ?>
                            </label>
                          </div>
                          <div class="checkbox">
                            <label>
                                <input type="checkbox" name="yandexmoney_method_sb" value="1" id="ym_method_7"<?php if ($yandexmoney_method_sb){?> checked <?php } ?> />
                                <?php echo $entry_method_sb; ?>
                            </label>
                          </div>
                       </div>
                    </div>
                    <?php if ($error_methods) { ?>
					<span class="error"><?php echo $error_methods; ?></span>
				    <?php } ?>
                  
                  
                   
				<div class="org">

				</div>
				   
                </div>
            </div> 
            
            <div class="form-group individ">
                <label class="col-sm-2 control-label" for="input-merchant"></label>
                <div class="col-sm-10">
                    <?php echo $text_welcome1;?>  
                </div>
            </div> 
            
            <div class="form-group org">
                <label class="col-sm-2 control-label" for="input-merchant"></label>
                <div class="col-sm-10">
                    <?php echo $text_welcome2;?>      
                </div>
            </div> 
            
            <div class="form-group individ">
                <label class="col-sm-2 control-label" for="input-merchant"><?php echo $text_params;?></label>
                <div class="col-sm-10">
				<table style="border: 1px black solid;">
				  <tr>
						<td style="border: 1px black solid; padding: 5px;"><?php echo $text_param_name?></td>
						<td style="border: 1px black solid; padding: 5px;"><?php echo $text_param_value?></td>
				  </tr>
				  <tr>
						<td style="border: 1px black solid; padding: 5px;"><?php echo $text_aviso1?></td>
						<td style="border: 1px black solid; padding: 5px;"><?php echo $callback_url?></td>
				   </tr>
				</table>  
                </div>
            </div> 
            
            <div class="form-group org">
                <label class="col-sm-2 control-label" for="input-merchant"><?php echo $text_params;?></label>
                <div class="col-sm-10">
                    <table style="border: 1px black solid;">
				  <tr>
						<td style="border: 1px black solid; padding: 5px;"><?php echo $text_param_name?></td>
						<td style="border: 1px black solid; padding: 5px;"><?php echo $text_param_value?></td>
				  </tr>
				  <tr>
						<td style="border: 1px black solid; padding: 5px;"><?php echo $text_aviso2?></td>
						<td style="border: 1px black solid; padding: 5px;"><?php echo $callback_url?></td>
				   </tr>
				   <tr>
						<td style="border: 1px black solid; padding: 5px;">checkURL</td>
						<td style="border: 1px black solid; padding: 5px;"><?php echo $check_url?></td>
				   </tr>
				   <tr>
						<td style="border: 1px black solid; padding: 5px;">successURL</td>
						<td style="border: 1px black solid; padding: 5px;"><?php echo $shopSuccessURL?></td>
				   </tr>
				   <tr>
						<td style="border: 1px black solid; padding: 5px;">failURL</td>
						<td style="border: 1px black solid; padding: 5px;"><?php echo $shopFailURL?></td>
				   </tr>
				</table>  
                </div>
            </div> 
            
            <div class="form-group required individ">
                <label class="col-sm-2 control-label" for="input-account"><span data-toggle="tooltip" title="<?php echo $entry_account; ?>"><?php echo $entry_account; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="yandexmoney_account" value="<?php echo $yandexmoney_account; ?>" placeholder="<?php echo $entry_account; ?>" id="input-account" class="form-control" />
                <?php if ($error_account) { ?>
					<span class="error"><?php echo $error_account; ?></span>
                <?php } ?> 
                </div>
            </div>
            
            <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-password"><span data-toggle="tooltip" title="<?php echo $entry_password; ?>"><?php echo $entry_password; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="yandexmoney_password" value="<?php echo $yandexmoney_password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                <?php if ($error_password) { ?>
					<span class="error"><?php echo $error_password; ?></span>
                <?php } ?> 
                </div>
            </div> 
            
            <div class="form-group individ">
                <label class="col-sm-2 control-label" for="input-field"><span data-toggle="tooltip"><?php echo $entry_field; ?></span></label>
                <div class="col-sm-10">
                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                      
                      <div class="checkbox">
                        <label>
                            <input type="checkbox" name="yandexmoney_need_fio" value="1" <?php if ($yandexmoney_need_fio){?> checked <?php } ?> />
                            ФИО
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                            <input type="checkbox" name="yandexmoney_need_email" value="1" <?php if ($yandexmoney_need_email){?> checked <?php } ?> />
                            E-mail
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                            <input type="checkbox" name="yandexmoney_need_phone" value="1" <?php if ($yandexmoney_need_phone){?> checked <?php } ?> />
                            Телефон
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                            <input type="checkbox" name="yandexmoney_need_address" value="1" <?php if ($yandexmoney_need_address){?> checked <?php } ?> />
                            Адрес
                        </label>
                      </div>
                    </div>
                </div>
            </div>
            
            <div class="form-group required org">
                <label class="col-sm-2 control-label" for="input-shopid"><span data-toggle="tooltip" title="<?php echo $entry_shopid; ?>"><?php echo $entry_shopid; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="yandexmoney_shopid" value="<?php echo $yandexmoney_shopid; ?>" placeholder="<?php echo $entry_shopid; ?>" id="input-shopid" class="form-control" />
                <?php if ($error_shopid) { ?>
					<span class="error"><?php echo $error_shopid; ?></span>
                <?php } ?> 
                </div>
            </div> 
            
            <div class="form-group required org">
                <label class="col-sm-2 control-label" for="input-scid"><span data-toggle="tooltip" title="<?php echo $entry_scid; ?>"><?php echo $entry_scid; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="yandexmoney_scid" value="<?php echo $yandexmoney_scid; ?>" placeholder="<?php echo $entry_scid; ?>" id="input-scid" class="form-control" />
                <?php if ($error_scid) { ?>
					<span class="error"><?php echo $error_scid; ?></span>
                <?php } ?> 
                </div>
            </div>
            
            <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $entry_total2; ?>"><?php echo $entry_total; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="yandexmoney_total" value="<?php echo $yandexmoney_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" class="form-control" />
                </div>
            </div>
            
            <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-order-status-id"><?php echo $entry_order_status; ?></label>
                <div class="col-sm-10">
                    <select name="yandexmoney_order_status_id" id="input-order-status-id" class="form-control">
                    <?php foreach ($order_statuses as $order_status) { ?>
                    <?php if ($order_status['order_status_id'] == $yandexmoney_order_status_id) { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                    </select>
                </div>
            </div>
            
            <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-geo-zone-id"><?php echo $entry_geo_zone; ?></label>
                <div class="col-sm-10">
                    <select name="yandexmoney_geo_zone_id" id="input-geo-zone-id" class="form-control">
                    <option value="0"><?php echo $text_all_zones; ?></option>
                    <?php foreach ($geo_zones as $geo_zone) { ?>
                    <?php if ($geo_zone['geo_zone_id'] == $yandexmoney_geo_zone_id) { ?>
                    <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                    </select>
                </div>
            </div> 
            
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-merchant"><span data-toggle="tooltip" title="<?php echo $entry_sort_order; ?>"><?php echo $entry_sort_order; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="yandexmoney_sort_order" value="<?php echo $yandexmoney_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-merchant" class="form-control" />
                </div>
            </div>  
                     
                      <fieldset>
                          <legend>Всплывающее модальное окно для клиента</legend> 
                              <div class="form-group">
                                  <label class="col-sm-2 control-label" for="status-modal-client">Всплывающее окно</label>
                                  <div class="col-sm-10">
                                      <select name="yandexmoney_modal_client" id="status-modal-client" class="form-control">
                                          <?php if ($yandexmoney_modal_client) { ?>
                                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                          <option value="0"><?php echo $text_disabled; ?></option>
                                          <?php } else { ?>
                                          <option value="1"><?php echo $text_enabled; ?></option>
                                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                          <?php } ?>
                                      </select>
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-sm-2 control-label" for="type-modal-client">Тип информации в окне</label>
                                  <div class="col-sm-10">
                                      <select name="yandexmoney_modal_type" id="type-modal-client" class="form-control" onchange="yandex_modal_product();">
                                          <?php if ($yandexmoney_modal_type) { ?>
                                          <option value="1" selected="selected">Информационное сообщение и товар</option>
                                          <option value="0">Информационное сообщение</option>
                                          <?php } else { ?>
                                          <option value="1">Информационное сообщение и товар</option>
                                          <option value="0" selected="selected">Информационное сообщение</option>
                                          <?php } ?>
                                      </select>
                                  </div>
                              </div>
                              <div class="form-group modal-product">
                                  <label class="col-sm-2 control-label" for="product-modal-client">Ввведите наименование продукта для отображения</label>
                                  <div class="col-sm-10">
                                      <input name="yandexmoney_modal_product_input" id="product-modal-client" class="form-control" />
                                      <div id="product-show" class="well well-sm" style="height: 150px; overflow: auto;">
                                          <?php foreach ($yandexmoney_modal_products as $yandexmoney_modal_product) { ?>
                                          <div id="product-show<?php echo $yandexmoney_modal_product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $yandexmoney_modal_product['name']; ?>
                                              <input type="hidden" name="yandexmoney_modal_product[]" value="<?php echo $yandexmoney_modal_product['product_id']; ?>" />
                                          </div>
                                          <?php } ?>
                                      </div>
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-sm-2 control-label" for="input-modal-info-text"><?php echo $entry_modal_info_text; ?></label>
                                  <div class="col-sm-10">
                                      <textarea name="yandexmoney_modal_text" rows="5" placeholder="" id="input-modal-info-text" class="form-control"><?php echo $yandexmoney_modal_text; ?></textarea>
                                  </div>
                              </div>        
                      </fieldset>
                  </div>
              </div>
            
	  <div class="modal fade bs-settings-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content modal-settings">
                        <div class="settings-content">
                            <div class="row settings-header">
                                <div class="col-sm-10 pull-left">
                                    <h2>Настройки модуля <?php echo $dkaModuleName; ?></h2>
                                </div>
                                <div class="col-sm-2">
                                    <button type="button" form="form-html" data-toggle="modal" data-target=".bs-settings-modal-lg" title="Закрыть" class="btn btn-primary pull-right">Закрыть</button>
                                </div>
                            </div>
                                <fieldset>
                                  <legend>Проценты</legend> 
                                  <div class="form-group">
                                      <label class="col-sm-3 control-label" for="input-procent">Проценты за метод оплаты</label>
                                      <div class="col-sm-9">
                                          <select name="yandexmoney_procent" id="input-procent" class="form-control">
                                              <?php if ($yandexmoney_procent) { ?>
                                              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                              <option value="0"><?php echo $text_disabled; ?></option>
                                              <?php } else { ?>
                                              <option value="1"><?php echo $text_enabled; ?></option>
                                              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                              <?php } ?>
                                          </select>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-3 control-label" for="input-procent-text">Описание для покупателя</label>
                                      <div class="col-sm-9">
                                          <input type="text" name="yandexmoney_procent_text" value="<?php echo $yandexmoney_procent_text; ?>" id="input-procent-text" class="form-control" />
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-3 control-label" for="input-procent-count">Количество процентов за операцию</label>
                                      <div class="col-sm-9">
                                          <input type="text" name="yandexmoney_procent_count" value="<?php echo $yandexmoney_procent_count; ?>" id="input-procent-count" class="form-control" />
                                      </div>
                                  </div>
                                </fieldset>
                                <fieldset>
                                  <legend>Настройки модуля</legend> 
                                  <div class="form-group">
                                      <label class="col-sm-3 control-label" for="input-status">Проверка обновления</label>
                                      <div class="col-sm-7">
                                          <select name="yandexmoney_update" id="input-status" class="form-control">
                                              <?php if ($yandexmoney_update || strlen(trim($yandexmoney_update)) < 1) { ?>
                                              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                              <option value="0"><?php echo $text_disabled; ?></option>
                                              <?php } else { ?>
                                              <option value="1"><?php echo $text_enabled; ?></option>
                                              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                              <?php } ?>
                                          </select>
                                      </div>
                                      <div class="col-sm-2">
                                          <button type="button" class="btn btn-info" onclick="get_updateModule();"><i class="fa fa-refresh"></i> Проверить</button>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-3 control-label" for="input-status">Отображать обновление в модальном окне</label>
                                      <div class="col-sm-9">
                                          <select name="yandexmoney_update_modal" id="input-status" class="form-control">
                                              <?php if ($yandexmoney_update_modal || strlen(trim($yandexmoney_update_modal)) < 1) { ?>
                                              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                              <option value="0"><?php echo $text_disabled; ?></option>
                                              <?php } else { ?>
                                              <option value="1"><?php echo $text_enabled; ?></option>
                                              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                              <?php } ?>
                                          </select>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-3 control-label" for="input-status">Отображать копирайт</label>
                                      <div class="col-sm-9">
                                          <select name="yandexmoney_copyright" id="input-status" class="form-control">
                                              <?php if ($yandexmoney_copyright || strlen(trim($yandexmoney_copyright)) < 1) { ?>
                                              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                              <option value="0"><?php echo $text_disabled; ?></option>
                                              <?php } else { ?>
                                              <option value="1"><?php echo $text_enabled; ?></option>
                                              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                              <?php } ?>
                                          </select>
                                      </div>
                                  </div>
                              </fieldset> 
                            
                        </div>
                    </div>
                  </div>
              </div>
              
      </form>
      <div class="row">
                  <?php if ($yandexmoney_copyright || strlen(trim($yandexmoney_copyright)) < 1) { ?>
                  <div class="col-sm-12 box-info-module-yaWebmaster text-center">
                      <?php
                          echo "Версия: " . $dkaModuleMajorVersion . "." . $dkaModuleMinorVersion . "." . $dkaModuleBuildVersion . " (" . $dkaModuleDateRelease . ") <a href='http://dreamclever.ru' target='_blank'>Dream K & A Develop</a>";
                      ?>
                  <div class="col-sm-12 box-info-module-yaWebmaster text-center" id="updateFooter">
                  </div>
                  <?php } ?>
                  </div>
       </div>
       <div class="modal fade" id="bs-info-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
           <div class="modal-dialog modal-lg">
               <div class="modal-content">
                        
               </div>
       	   </div>
       </div>
       <div id="progressModal" class="modal fade bs-progress-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
           <div class="modal-dialog modal-xs text-center modal-vertical-centered">
           		<i class="fa fa-spinner fa-spin fa-5x" style="color: #fff;"></i>
       	   </div>
       </div>
    </div>
  </div>
  
  
  
  </div>
  
</div>
<style type="text/css">
    .image-green{ color: green; font-size: 34px; }
    .image-red{ color: red; font-size: 34px; }
    .image-yellow{ color: yellow; font-size: 34px; }
    .image-orange{ color: orange; font-size: 34px; }
    .image-blue{ color: blue; font-size: 34px; }
    .image-gray{ color: dimgray; font-size: 34px; }
    
    
    .info-tab-ok{  box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.8); border-top: 3px solid green; position: relative; top: 5px; margin: 0 3px; padding: 0; padding-top: 3px; min-height: 40px;}
    .info-tab-ok:hover{ position: relative; top: 1px; cursor: pointer;}
    .info-tab-er{  box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.8); border-top: 3px solid red; position: relative; top: 5px; margin: 0 3px; padding: 0; padding-top: 3px; min-height: 40px;}
    .info-tab-er:hover{ position: relative; top: 1px; cursor: pointer;}
    .info-tab-in{  box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.8); border-top: 3px solid dodgerblue; position: relative; top: 5px; margin: 0 3px; padding: 0; padding-top: 3px; min-height: 40px;}
    .info-tab-in:hover{ position: relative; top: 1px; cursor: pointer;}
	.info-tab-ot{  box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.8); border-top: 3px solid orange; position: relative; top: 5px; margin: 0 3px; padding: 2px 2px; min-height: 40px;}
    .info-tab-ot:hover{ position: relative; top: 0px; cursor: pointer;}
    
    .box-info-site{border: 2px solid #8a8a8a; z-index: 1; height: auto; background-color: #fff; padding: 10px 5px; }
    .dka-tab-date{font-size: 14px; position: relative; bottom: 10px;}
    .tcy-orange{ border-top: 3px solid orange; }
    .tcy-yellow{ border-top: 3px solid yellow; }
    .tcy-green{ border-top: 3px solid green; }
    .tcy-blue{ border-top: 3px solid blue; }
    
    .section{ border: 1px solid gray; border-top: 3px solid dodgerblue; padding: 4px; margin: 5px 0px; border-radius: 2px; }
    .site-page-info{ font: 400 12px/1.42857 "Open Sans",Helvetica,Arial,sans-serif; }
    .data_list_small { padding: 0; border-top: solid 1px #ddd; margin: 8px 0 10px 0; }
    .data_list_small li { border-color: -moz-use-text-color -moz-use-text-color #ddd; border-image: none; border-style: none none dashed;
    border-width: medium medium 1px; margin: 0; padding: 3px 0; position: relative; }
    .data_list_small li { display: block; position: relative; }
    .data_label { color: #777; }
    .data_label_header { font-weight: 600; text-transform: uppercase; }
    .data_list_small .data_value { line-height: 25px; padding: 0; position: absolute; right: 0; top: 0; }
    
    .data_list li { background-color: #fff; border: 1px solid #ddd; display: block; margin-bottom: -1px; padding: 10px 15px; position: relative; }
    
    .div-section-off { display: none; }
    .sitemap-info:hover { cursor: pointer; }

    .modal-vertical-centered { transform: translate(0, 50%) !important; -ms-transform: translate(0, 50%) !important; /* IE 9 */ -webkit-transform: translate(0, 50%) !important; /* Safari and Chrome */ }
    
    .search-update { margin-bottom: 0; padding: 0; }

    .modal-settings{ padding: 5px; }
    .settings-content{ padding: 15px; border: 3px solid #bbb; border-radius: 4px; }
    .settings-header{ border-bottom: 2px solid #bbb; margin: 0 1px 30px 1px }
    .first-settings { border: 2px solid #eee; }

    .first-settings h1 { margin: 160px 0; color: darkgrey; z-index: 10; background-color: transparent; position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
	
</style>
<script type="text/javascript">
	function yandex_validate_mode(){
		var yandex_mode = $("#yandexmoney_mode").val();
		if (yandex_mode == 1){
			$(".individ").show();
			$(".org").hide();
		}else{
			$(".org").show();
			$(".individ").hide();
		}
	}
	
	function yandex_modal_product(){
		var yandex_product = $("#type-modal-client").val();
        $(".modal-product").show();
		if (yandex_product == 1){
			//get_SelectProduct();
		}else{
			$(".modal-product").hide();
		}
	}
	
	function refreshData()
    {            
        //Поиск обновления модуля
        <?php if ($yandexmoney_update || strlen(trim($yandexmoney_update)) < 1) { ?>
        get_updateModule();
        <?php } ?>
    }
    
    $("#btnRefresh").click(function() {
        refreshData();
    });
	
	$( document ).ready(function() {
        refreshData();
		yandex_validate_mode();
		yandex_modal_product();
	});      
        
/*  ----------------------------------------------------- */
/*  *****************  Обновление модуля  **************  */
/*  ----------------------------------------------------- */
var xmlModuleUpdate = <?php echo "\"" . str_replace('&amp;', '&', $dkaModuleUpdate) . "\""; ?>;
function get_updateModule()
{
	$(".search-update").hide();
	var dka_name = '<?php echo $dkaModuleNameUID; ?>';
	$.ajax({
		url: xmlModuleUpdate + '&dka_name=' +dka_name,
		dataType: 'json',
		success: function(json) {
			var updateVersion = 0;
			<?php if ($yandexmoney_update_modal || strlen(trim($yandexmoney_update_modal)) < 1) { ?>
			if(json['fullVersion'] > '<?php echo $dkaModuleMajorVersion . $dkaModuleMinorVersion . $dkaModuleBuildVersion; ?>')
            {
                var updateText = [];
                
                updateText.push("<div class='settings-content'>\
                                <div class='row'>\
                                <div class='col-sm-3 text-center'><img src='" + json['logo'] + "' /></div>\
                                <div class='col-sm-9'>\
                                    <h2><i class='fa fa-refresh'></i> Новая версия модуля</h2><hr />\
                                    <p>Вы можете обновиться до последней версии модуля <strong>" + json['name'] + " " + json['majorVersion'] + "." + json['minorVersion'] + "." + json['buildVersion'] + "</strong></p>\
                                    <p>Дата релиза <strong>" + json['date'] + "</strong></p>\
                                </div>\
                                </div>"
                );
                if(json['info'].length > 0)
                {
                    updateText.push("<hr class='hr-dka-def' /><h4>Информация</h4>\
                        <div class='row'>\
                        <div class='col-sm-12'>\
                        " + json['info'] + "\
                        </div>\
                        </div>"
                    );
                }
                if(json['changelog'].length > 0)
                {
                    updateText.push("<hr class='hr-dka-def' /><h4>Изменения</h4>\
                        <div class='row'>\
                        <div class='col-sm-12'>\
                        " + json['changelog'] + "\
                        </div>\
                        </div>"
                    );
                }
                if(json['downloadUrl'].length > 0)
                {
                    updateText.push("<hr class='hr-dka-def'  />\
                        <div class='row'>\
                        <div class='col-sm-12'>\
                        <p class='text-center' style='margin: 20px 0;'><a href='" + json['downloadUrl'] + "' class='alert alert-success'>Перейти на страницу загрузки модуля</a></p>\
                        </div>\
                        </div>"
                    );
                }
                updateText.push("</div>");
				$('#bs-info-modal-lg .modal-content').html(updateText.join('')); 
				$('#bs-info-modal-lg').modal();   
            }
            if(json['news'])
			{
				$('#bs-info-modal-lg .modal-content').html("<div class='settings-content'><h2 class='text-center'><i class='fa fa-refresh'></i> Уважаемый клиент</h2><p class='text-center' style='margin: 20px 0;'>" + json['addinginfo'] + "</p></div>"); 
				$('#bs-info-modal-lg').modal();   
			}
            <?php } else { ?>
                
			if(json['fullVersion'] > '<?php echo $dkaModuleMajorVersion . $dkaModuleMinorVersion . $dkaModuleBuildVersion; ?>')
			{
				$('#updateFooter').html("Доступно обновление до версии <strong>" + json['majorVersion'] + "." + json['minorVersion'] + "." + json['buildVersion'] + "</strong>");
            }
            <?php } ?>
        }
	}).always(function() { });
        
}
        
/*  ----------------------------------------------------- */
/*  ****************  Получение продуктов  *************  */
/*  ----------------------------------------------------- */
$('input[name=\'yandexmoney_modal_product_input\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=payment/yandexmoney/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'yandexmoney_modal_product_input\']').val('');
		
		$('#product-show' + item['value']).remove();
		
		$('#product-show').append('<div id="product-show' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="yandexmoney_modal_product[]" value="' + item['value'] + '" /></div>');	
	}	
});

$('#product-show').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
</script>

<script type="text/javascript"><!--
$('#input-modal-info-text').summernote({height: 300});
//--></script> 

<?php echo $footer; ?>