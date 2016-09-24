<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right" id="control-buttons">
				<a onclick="apply()" class="btn btn-success" data-toggle="tooltip" title="Применить" data-placement="bottom"><i class="fa fa-check"></i></a>
        <button type="submit" form="form-xds-coloring-theme" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary" data-placement="bottom"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-warning" data-placement="bottom"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default alert-helper">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-xds-coloring-theme" class="form-horizontal">
					<div class="row">
						<div class="col-lg-2 col-md-3" id="column-1">
							<ul class="nav nav-pills nav-stacked">
								<li class="active"><a href="#tab-main-menu" data-toggle="pill">Главное меню</a></li>
								<li><a href="#tab-help-menu" data-toggle="pill">Меню помощи</a></li>
								<li><a href="#tab-header-category-menu" data-toggle="pill">Меню категорий</a></li>
								<li><a href="#tab-header-contacts" data-toggle="pill">Контакты в шапке</a></li>
								<li><a href="#tab-footer-map" data-toggle="pill">Карта в подвале</a></li>
								<li><a href="#tab-pay-icons" data-toggle="pill">Иконки плат. систем</a></li>
								<li><a href="#tab-home-page" data-toggle="pill">Главная страница</a></li>
								<li><a href="#tab-category-page" data-toggle="pill">Страница категории</a></li>
								<li><a href="#tab-product-page" data-toggle="pill">Страница товара</a></li>
								<li><a href="#tab-general-settings" data-toggle="pill">Общие настройки</a></li>
							</ul>
						</div>
						<hr class="hidden-lg hidden-md">
						<div class="col-lg-10 col-md-9" style="border-left: 1px solid #eee;" id="column-2">
							<div class="tab-content">
								<div class="tab-pane active" id="tab-main-menu">
									<div class="form-group">
										<label class="col-sm-2 control-label">Включить</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_main_menu_toggle" value="1" <?php if ($xds_coloring_theme_main_menu_toggle) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_main_menu_toggle" value="0" <?php if (!$xds_coloring_theme_main_menu_toggle) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Пункты меню</label>
										<div class="col-sm-10">
											<table id="main-menu-items" class="table table-bordered">
												<thead>
													<tr>
														<td class="nowrap"><i class="fa fa-edit fa14"></i>&nbsp;&nbsp;Текст</td>
														<td class="nowrap"><i class="fa fa-link fa14"></i>&nbsp;&nbsp;Ссылка</td>
														<td class="nowrap"><i class="fa fa-sort fa14"></i>&nbsp;&nbsp;Сортировка</td>
														<td></td>
													</tr>
												</thead>
												<tbody>
												<?php $item_row_main = 0; ?>
												<?php foreach ($xds_coloring_theme_main_menu_items as $xds_coloring_theme_main_menu_item) { ?>
													<tr id="item-row-main<?php echo $item_row_main; ?>">
														<td class="text-left">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group pull-left">
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
																<input class="form-control" type="text" name="xds_coloring_theme_main_menu_item[<?php echo $item_row_main; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_main_menu_item['title'][$language['language_id']]; ?>" />
															</div>
															<?php } ?>
														</td>
														<td class="text-left">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group pull-left">
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
																	<input class="form-control" type="text" name="xds_coloring_theme_main_menu_item[<?php echo $item_row_main; ?>][link][<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_main_menu_item['link'][$language['language_id']]; ?>" />
															</div>
															<?php } ?>
														</td>
														<td class="text-left">
															<input  class="form-control" type="text" name="xds_coloring_theme_main_menu_item[<?php echo $item_row_main; ?>][sort]" value="<?php echo $xds_coloring_theme_main_menu_item['sort']; ?>" />
														</td>
														<td class="text-right">
															<a class="btn btn-danger" onclick="$('#item-row-main<?php echo $item_row_main; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
														</td>
													</tr>
												<?php $item_row_main++; ?>
												<?php } ?>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="3"></td>
														<td class="text-right"><a class="btn btn-primary" onclick="addItemMain();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="tab-help-menu">
									<div class="form-group">
										<label class="col-sm-2 control-label">Включить</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_help_menu_toggle" value="1" <?php if ($xds_coloring_theme_help_menu_toggle) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_help_menu_toggle" value="0" <?php if (!$xds_coloring_theme_help_menu_toggle) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Сместить влево</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_help_menu_left" value="1" <?php if ($xds_coloring_theme_help_menu_left) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_help_menu_left" value="0" <?php if (!$xds_coloring_theme_help_menu_left) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Заголовок меню</label>
										<div class="col-sm-10">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group">
												<span class="input-group-addon">
													<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
												</span>
												<input name="xds_coloring_theme_help_menu_text[<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_help_menu_text[$language['language_id']]; ?>" class="form-control" />
											</div>
											<?php } ?>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Пункты меню</label>
										<div class="col-sm-10">
											<table id="help-menu-items" class="table table-bordered">
												<thead>
													<tr>
														<td class="nowrap"><i class="fa fa-edit fa14"></i>&nbsp;&nbsp;Текст</td>
														<td class="nowrap"><i class="fa fa-link fa14"></i>&nbsp;&nbsp;Ссылка</td>
														<td class="nowrap"><i class="fa fa-sort fa14"></i>&nbsp;&nbsp;Сортировка</td>
														<td></td>
													</tr>
												</thead>
												<tbody>
												<?php $item_row_help = 0; ?>
												<?php foreach ($xds_coloring_theme_help_menu_items as $xds_coloring_theme_help_menu_item) { ?>
													<tr id="item-row-help<?php echo $item_row_help; ?>">
														<td class="text-left">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group pull-left">
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
																<input class="form-control" type="text" name="xds_coloring_theme_help_menu_item[<?php echo $item_row_help; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_help_menu_item['title'][$language['language_id']]; ?>" />
															</div>
															<?php } ?>
														</td>
														<td class="text-left">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group pull-left">
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
																	<input class="form-control" type="text" name="xds_coloring_theme_help_menu_item[<?php echo $item_row_help; ?>][link][<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_help_menu_item['link'][$language['language_id']]; ?>" />
															</div>
															<?php } ?>
														</td>
														<td class="text-left">
															<input  class="form-control" type="text" name="xds_coloring_theme_help_menu_item[<?php echo $item_row_help; ?>][sort]" value="<?php echo $xds_coloring_theme_help_menu_item['sort']; ?>" />
														</td>
														<td class="text-right">
															<a class="btn btn-danger" onclick="$('#item-row-help<?php echo $item_row_help; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
														</td>
													</tr>
												<?php $item_row_help++; ?>
												<?php } ?>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="3"></td>
														<td class="text-right"><a class="btn btn-primary" onclick="addItemHelp();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
								
								<div class="tab-pane" id="tab-header-category-menu">
									<div class="form-group">
										<label class="col-sm-2 control-label">Маска при наведении (затемнение зраницы)</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_category_mask_toggle" value="1" <?php if ($xds_coloring_theme_category_mask_toggle) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_category_mask_toggle" value="0" <?php if (!$xds_coloring_theme_category_mask_toggle) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Включить дополнительные ссылки в меню категорий</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_add_cat_links_toggle" value="1" <?php if ($xds_coloring_theme_add_cat_links_toggle) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_add_cat_links_toggle" value="0" <?php if (!$xds_coloring_theme_add_cat_links_toggle) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Дополнительные ссылки в меню категорий</label>
										<div class="col-sm-10">
											<table id="category-links-items" class="table table-bordered">
												<thead>
													<tr>
														<td class="nowrap"><i class="fa fa-edit fa14"></i>&nbsp;&nbsp;Текст</td>
														<td class="nowrap"><i class="fa fa-link fa14"></i>&nbsp;&nbsp;Ссылка</td>
														<td class="nowrap"><i class="fa fa-sort fa14"></i>&nbsp;&nbsp;Сортировка</td>
														<td></td>
													</tr>
												</thead>
												<tbody>
												<?php $item_row_cat_links = 0; ?>
												<?php foreach ($xds_coloring_theme_add_cat_links_items as $xds_coloring_theme_add_cat_links_item) { ?>
													<tr id="item-row-cat-links<?php echo $item_row_cat_links; ?>">
														<td class="text-left">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group pull-left">
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
																<input class="form-control" type="text" name="xds_coloring_theme_add_cat_links_item[<?php echo $item_row_cat_links; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_add_cat_links_item['title'][$language['language_id']]; ?>" />
															</div>
															<?php } ?>
														</td>
														<td class="text-left">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group pull-left">
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
																	<input class="form-control" type="text" name="xds_coloring_theme_add_cat_links_item[<?php echo $item_row_cat_links; ?>][link][<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_add_cat_links_item['link'][$language['language_id']]; ?>" />
															</div>
															<?php } ?>
														</td>
														<td class="text-left">
															<input  class="form-control" type="text" name="xds_coloring_theme_add_cat_links_item[<?php echo $item_row_cat_links; ?>][sort]" value="<?php echo $xds_coloring_theme_add_cat_links_item['sort']; ?>" />
														</td>
														<td class="text-right">
															<a class="btn btn-danger" onclick="$('#item-row-cat-links<?php echo $item_row_cat_links; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
														</td>
													</tr>
												<?php $item_row_cat_links++; ?>
												<?php } ?>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="3"></td>
														<td class="text-right"><a class="btn btn-primary" onclick="addItemCatLinks();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
								
								<div class="tab-pane" id="tab-header-contacts">
									<div class="form-group">
										<label class="col-sm-2 control-label">Включить</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_contact_main_toggle" value="1" <?php if ($xds_coloring_theme_contact_main_toggle) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_contact_main_toggle" value="0" <?php if (!$xds_coloring_theme_contact_main_toggle) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Основной номер телефона</label>
										<div class="col-sm-10">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group">
												<span class="input-group-addon">
													<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
												</span>
												<input name="xds_coloring_theme_contact_main_phone[<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_contact_main_phone[$language['language_id']]; ?>" class="form-control" />
											</div>
											<?php } ?>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Подсказка под номером</label>
										<div class="col-sm-10">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group">
												<span class="input-group-addon">
													<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
												</span>
												<input name="xds_coloring_theme_contact_hint[<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_contact_hint[$language['language_id']]; ?>" class="form-control" />
											</div>
											<?php } ?>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Включить дополнительные контакты</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_contact_add_toggle" value="1" <?php if ($xds_coloring_theme_contact_add_toggle) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_contact_add_toggle" value="0" <?php if (!$xds_coloring_theme_contact_add_toggle) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Номера телефонов</label>
										<div class="col-sm-10">
											<table id="header-contacts-items" class="table table-bordered">
												<thead>
													<tr>
														<td class="nowrap"><i class="fa fa-image fa14"></i>&nbsp;&nbsp;Иконка</td>
														<td class="nowrap"><i class="fa fa-phone fa14"></i>&nbsp;&nbsp;Номер телефона</td>
														<td class="nowrap"><i class="fa fa-sort fa14"></i>&nbsp;&nbsp;Сортировка</td>
														<td></td>
													</tr>
												</thead>
												<tbody>
												<?php $cont_item_row = 0; ?>
												<?php foreach ($xds_coloring_theme_header_contacts as $xds_coloring_theme_header_contact) { ?>
													<tr id="item-row-cont<?php echo $cont_item_row; ?>">
														<td class="text-left">
															<a href="" id="thumb-image-cont<?php echo $cont_item_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $xds_coloring_theme_header_contact['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="xds_coloring_theme_header_contact[<?php echo $cont_item_row; ?>][image]" value="<?php echo $xds_coloring_theme_header_contact['image']; ?>" id="input-image-cont<?php echo $cont_item_row; ?>" />
														</td>
														<td class="text-left">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group pull-left">
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
																<input class="form-control" type="text" name="xds_coloring_theme_header_contact[<?php echo $cont_item_row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_header_contact['title'][$language['language_id']]; ?>" />
															</div>
															<?php } ?>
														</td>
														<td class="text-left">
															<input  class="form-control" type="text" name="xds_coloring_theme_header_contact[<?php echo $cont_item_row; ?>][sort]" value="<?php echo $xds_coloring_theme_header_contact['sort']; ?>" />
														</td>
														<td class="text-right">
															<a class="btn btn-danger" onclick="$('#item-row-cont<?php echo $cont_item_row; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
														</td>
													</tr>
												<?php $cont_item_row++; ?>
												<?php } ?>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="3"></td>
														<td class="text-right"><a class="btn btn-primary" onclick="addItemCont();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Почта для связи</label>
										<div class="col-sm-10">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group">
												<span class="input-group-addon">
													<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
												</span>
												<input name="xds_coloring_theme_contact_email[<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_contact_email[$language['language_id']]; ?>" class="form-control" />
											</div>
											<?php } ?>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">График работы магазина</label>
										<div class="col-sm-10">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group">
												<span class="input-group-addon">
													<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
												</span>
												<textarea name="xds_coloring_theme_schedule[<?php echo $language['language_id']; ?>]" rows="1" class="form-control"><?php echo $xds_coloring_theme_schedule[$language['language_id']]; ?></textarea>
											</div>
											<?php } ?>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Дополнительные контакты</label>
										<div class="col-sm-10">
											<table id="header-add-contacts-items" class="table table-bordered">
												<thead>
													<tr>
														<td class="nowrap"><i class="fa fa-image fa14"></i>&nbsp;&nbsp;Иконка</td>
														<td class="nowrap"><i class="fa fa-edit fa14"></i>&nbsp;&nbsp;Текст</td>
														<td class="nowrap"><i class="fa fa-link fa14"></i>&nbsp;&nbsp;Ссылка</td>
														<td class="nowrap"><i class="fa fa-sort fa14"></i>&nbsp;&nbsp;Сортировка</td>
														<td></td>
													</tr>
												</thead>
												<tbody>
												<?php $add_cont_item_row = 0; ?>
												<?php foreach ($xds_coloring_theme_additional_contacts as $xds_coloring_theme_additional_contact) { ?>
													<tr id="item-row-add-cont<?php echo $add_cont_item_row; ?>">
														<td class="text-left">
															<a href="" id="thumb-image-add-cont<?php echo $add_cont_item_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $xds_coloring_theme_additional_contact['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="xds_coloring_theme_additional_contact[<?php echo $add_cont_item_row; ?>][image]" value="<?php echo $xds_coloring_theme_additional_contact['image']; ?>" id="input-image-add-cont<?php echo $add_cont_item_row; ?>" />
														</td>
														<td class="text-left">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group pull-left">
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
																<input class="form-control" type="text" name="xds_coloring_theme_additional_contact[<?php echo $add_cont_item_row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_additional_contact['title'][$language['language_id']]; ?>" />
															</div>
															<?php } ?>
														</td>
														<td class="text-left">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group pull-left">
																<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
																<input class="form-control" type="text" name="xds_coloring_theme_additional_contact[<?php echo $add_cont_item_row; ?>][link][<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_additional_contact['link'][$language['language_id']]; ?>" />
															</div>
															<?php } ?>
														</td>
														<td class="text-left">
															<input  class="form-control" type="text" name="xds_coloring_theme_additional_contact[<?php echo $add_cont_item_row; ?>][sort]" value="<?php echo $xds_coloring_theme_additional_contact['sort']; ?>" />
														</td>
														<td class="text-right">
															<a class="btn btn-danger" onclick="$('#item-row-add-cont<?php echo $add_cont_item_row; ?>').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a>
														</td>
													</tr>
												<?php $add_cont_item_row++; ?>
												<?php } ?>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="4"></td>
														<td class="text-right"><a class="btn btn-primary" onclick="addItemContAdd();" data-toggle="tooltip" title="Добавить"><i class="fa fa-plus-circle"></i></a></td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
								
								
								<div class="tab-pane" id="tab-home-page">

									<div class="form-group">
										<label class="col-sm-2 control-label">Схема главной страницы</label>
										<div class="col-sm-10">
										
											<a class="btn btn-default collapsed" data-toggle="collapse" href="#collapseOne">
												<span class="ch_show"><i class="fa fa-eye"></i>&nbsp; Показать</span>
												<span class="ch_hidd"><i class="fa fa-eye-slash"></i>&nbsp; Скрыть</span>&nbsp;
												<i class="fa fa-angle-up arr"></i>
											</a>
											
											<div id="collapseOne" class="panel-collapse collapse">
												<br>
													<div class="well">
														<div class="row">
															<div class="col-xs-12 ch_block"><div class="thumbnail"><b></b><span>Шапка сайта<br>(header)</span></div></div>
														</div>
														<div class="row">
															<div class="col-xs-3 ch_block"><div class="thumbnail"><b></b><span>Область меню категорий</span></div></div>
															<div class="col-xs-9 ch_block"><div class="thumbnail"><b></b><span>Верх страницы<br>(content_top)</span></div></div>
														</div>
														<div class="row">
															<div class="col-xs-3 ch_block"><div class="thumbnail"><b></b><span>Левая колонка<br>(column_left)</span></div></div>
															<div class="col-xs-6 ch_block"><div class="thumbnail"><b></b><span>Низ страницы<br>(content_bottom)</span></div></div>
															<div class="col-xs-3 ch_block"><div class="thumbnail"><b></b><span>Правая колонка<br>(column_right)</span></div></div>
														</div>
														<div class="row">
															<div class="col-xs-3 ch_block new_pos"><div class="thumbnail"><b></b><span>Позиция 1</span></div></div>
															<div class="col-xs-9 ch_block new_pos"><div class="thumbnail"><b></b><span>Позиция 2</span></div></div>
														</div>
														<div class="row">
															<div class="col-xs-9 ch_block new_pos"><div class="thumbnail"><b></b><span>Позиция 3</span></div></div>
															<div class="col-xs-3 ch_block new_pos"><div class="thumbnail"><b></b><span>Позиция 4</span></div></div>
														</div>
														<div class="row">
															<div class="col-xs-12 ch_block new_pos"><div class="thumbnail"><b></b><span>Позиция 5</span></div></div>
														</div>
														<div class="row">
															<div class="col-xs-12 ch_block"><div class="thumbnail" style="margin-bottom:0;"><b></b><span>Подвал сайта<br>(footer)</span></div></div>
														</div>
									
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Дополнительные модули</label>
										<div class="col-sm-10">
											<table id="new-home-module" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<td class="nowrap"><i class="fa fa-puzzle-piece fa14"></i>&nbsp;&nbsp;Модуль</td>
														<td class="nowrap"><i class="fa fa-crosshairs fa14"></i>&nbsp;&nbsp;Позиция</td>
														<td class="nowrap"><i class="fa fa-sort fa14"></i>&nbsp;&nbsp;Сортировка</td>
														<td></td>
													</tr>
												</thead>
												<tbody>
													<?php $new_home_module_row = 0; ?>
													<?php foreach ($xds_coloring_theme_new_home_layout_modules as $xds_coloring_theme_new_home_layout_module) { ?>
													<tr id="new-home-module-row<?php echo $new_home_module_row; ?>">
														<td>
															<select name="xds_coloring_theme_new_home_layout_module[<?php echo $new_home_module_row; ?>][code]" class="form-control">
																<?php foreach ($xds_coloring_theme_new_home_extensions as $extension) { ?>
																<?php if (!$extension['module']) { ?>
																<?php if ($extension['code'] == $xds_coloring_theme_new_home_layout_module['code']) { ?>
																<option value="<?php echo $extension['code']; ?>" selected="selected"><?php echo $extension['name']; ?></option>
																<?php } else { ?>
																<option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
																<?php } ?>
																<?php } else { ?>
																<optgroup label="<?php echo $extension['name']; ?>">
																<?php foreach ($extension['module'] as $module) { ?>
																<?php if ($module['code'] == $xds_coloring_theme_new_home_layout_module['code']) { ?>
																<option value="<?php echo $module['code']; ?>" selected="selected"><?php echo $module['name']; ?></option>
																<?php } else { ?>
																<option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
																<?php } ?>
																<?php } ?>
																</optgroup>
																<?php } ?>
																<?php } ?>
															</select>
														</td>
														<td>
															<select name="xds_coloring_theme_new_home_layout_module[<?php echo $new_home_module_row; ?>][position]" class="form-control">
																<?php if ($xds_coloring_theme_new_home_layout_module['position'] == 'position_1') { ?>
																<option value="position_1" selected="selected">Позиция 1</option>
																<?php } else { ?>
																<option value="position_1">Позиция 1</option>
																<?php } ?>
																<?php if ($xds_coloring_theme_new_home_layout_module['position'] == 'position_2') { ?>
																<option value="position_2" selected="selected">Позиция 2</option>
																<?php } else { ?>
																<option value="position_2">Позиция 2</option>
																<?php } ?>
																<?php if ($xds_coloring_theme_new_home_layout_module['position'] == 'position_3') { ?>
																<option value="position_3" selected="selected">Позиция 3</option>
																<?php } else { ?>
																<option value="position_3">Позиция 3</option>
																<?php } ?>
																<?php if ($xds_coloring_theme_new_home_layout_module['position'] == 'position_4') { ?>
																<option value="position_4" selected="selected">Позиция 4</option>
																<?php } else { ?>
																<option value="position_4">Позиция 4</option>
																<?php } ?>
																<?php if ($xds_coloring_theme_new_home_layout_module['position'] == 'position_5') { ?>
																<option value="position_5" selected="selected">Позиция 5</option>
																<?php } else { ?>
																<option value="position_5">Позиция 5</option>
																<?php } ?>
															</select>
														</td>
														<td>
															<input type="text" name="xds_coloring_theme_new_home_layout_module[<?php echo $new_home_module_row; ?>][sort_order]" value="<?php echo $xds_coloring_theme_new_home_layout_module['sort_order']; ?>" placeholder="" class="form-control" />
														</td>
														<td>
															<button type="button" onclick="$('#new-home-module-row<?php echo $new_home_module_row; ?>').remove();" data-toggle="tooltip" title="удалить" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
														</td>
													</tr>
													<?php $new_home_module_row++; ?>
													<?php } ?>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="3"></td>
														<td><button type="button" onclick="addNewHomeModule();" data-toggle="tooltip" title="добавить" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
									
								</div>
								<div class="tab-pane" id="tab-footer-map">
									<div class="form-group">
										<label class="col-sm-2 control-label">Включить</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_footer_map_toggle" value="1" <?php if ($xds_coloring_theme_footer_map_toggle) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_footer_map_toggle" value="0" <?php if (!$xds_coloring_theme_footer_map_toggle) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Код карты</label>
										<div class="col-sm-10">
											<textarea name="xds_coloring_theme_footer_map" rows="10" class="form-control"><?php echo $xds_coloring_theme_footer_map; ?></textarea>
										</div>
									</div>
								</div>
								
								<div class="tab-pane" id="tab-pay-icons">
									<div class="form-group">
										<label class="col-sm-2 control-label">Включить</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_pay_icons_toggle" value="1" <?php if ($xds_coloring_theme_pay_icons_toggle) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_pay_icons_toggle" value="0" <?php if (!$xds_coloring_theme_pay_icons_toggle) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Баннер</label>
										<div class="col-sm-10">
											<select name="xds_coloring_theme_pay_icons_banner_id" class="form-control">
												<option value="-99">-- Выбрать --</option>
												<?php foreach ($banners as $banner) { ?>
												<?php if ($banner['banner_id'] == $xds_coloring_theme_pay_icons_banner_id) { ?>
												<option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
												<?php } ?>
												<?php } ?>
											</select>
										</div>
									</div>
								</div>
								
								<div class="tab-pane" id="tab-category-page">
									<div class="form-group">
										<label class="col-sm-2 control-label">Подкатегории в левой колонке</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_left_subcategory" value="1" <?php if ($xds_coloring_theme_left_subcategory) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_left_subcategory" value="0" <?php if (!$xds_coloring_theme_left_subcategory) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Положение блока описания категории</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_category_description_position" value="1" <?php if ($xds_coloring_theme_category_description_position) { echo 'checked'; } ?> /> Верх
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_category_description_position" value="0" <?php if (!$xds_coloring_theme_category_description_position) { echo 'checked';} ?> /> Низ
											</label>
										</div>
									</div>
								</div>
								
								<div class="tab-pane" id="tab-product-page">
									<div class="form-group">
										<label class="col-sm-2 control-label">Выключить короткое описание товара</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_product_short_description" value="1" <?php if ($xds_coloring_theme_product_short_description) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_product_short_description" value="0" <?php if (!$xds_coloring_theme_product_short_description) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Выключить краткие аттрибуты товара</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_product_short_attributes" value="1" <?php if ($xds_coloring_theme_product_short_attributes) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_product_short_attributes" value="0" <?php if (!$xds_coloring_theme_product_short_attributes) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Выключить социальные кнопки</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_product_social_likes" value="1" <?php if ($xds_coloring_theme_product_social_likes) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_product_social_likes" value="0" <?php if (!$xds_coloring_theme_product_social_likes) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Позиция связанных (рекомендуемых) товаров</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_related_product_position" value="1" <?php if ($xds_coloring_theme_related_product_position) { echo 'checked'; } ?> /> Под описанием товара
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_related_product_position" value="0" <?php if (!$xds_coloring_theme_related_product_position) { echo 'checked';} ?> /> Над описанием товара
											</label>
										</div>
									</div>
								</div>
								
								<div class="tab-pane" id="tab-general-settings">
									<div class="form-group">
										<label class="col-sm-2 control-label">Отключить кнопку "Купить", если товара нет в наличи</label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_disable_cart_button" value="1" <?php if ($xds_coloring_theme_disable_cart_button) { echo 'checked'; } ?> /> Да
											</label>
											<label class="radio-inline">
												<input type="radio" name="xds_coloring_theme_disable_cart_button" value="0" <?php if (!$xds_coloring_theme_disable_cart_button) { echo 'checked';} ?> /> Нет
											</label>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Текст на отключенной кнопке</label>
										<div class="col-sm-10">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group">
												<span class="input-group-addon">
													<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
												</span>
												<input name="xds_coloring_theme_disable_cart_button_text[<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_disable_cart_button_text[$language['language_id']]; ?>" class="form-control" />
											</div>
											<?php } ?>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Текст на кнопке левой колонки</label>
										<div class="col-sm-10">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group">
												<span class="input-group-addon">
													<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
												</span>
												<input name="xds_coloring_theme_col_left_button_text[<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_col_left_button_text[$language['language_id']]; ?>" class="form-control" />
											</div>
											<?php } ?>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label class="col-sm-2 control-label">Текст на кнопке правой колонки</label>
										<div class="col-sm-10">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group">
												<span class="input-group-addon">
													<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
												</span>
												<input name="xds_coloring_theme_col_right_button_text[<?php echo $language['language_id']; ?>]" value="<?php echo $xds_coloring_theme_col_right_button_text[$language['language_id']]; ?>" class="form-control" />
											</div>
											<?php } ?>
										</div>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</form>
      </div>
			<div class="panel-footer">
        2015 © <a href="http://xds.by/" target="_blank">Xds.by</a>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">

var new_home_module_row = <?php echo $new_home_module_row; ?>;

function addNewHomeModule() {
	html  = '<tr id="new-home-module-row' + new_home_module_row + '">';
	html += '  <td><select name="xds_coloring_theme_new_home_layout_module[' + new_home_module_row + '][code]" class="form-control">';
	<?php foreach ($xds_coloring_theme_new_home_extensions as $extension) { ?>    
	<?php if (!$extension['module']) { ?>
	html += '    <option value="<?php echo $extension['code']; ?>"><?php echo addslashes($extension['name']); ?></option>';
	<?php } else { ?>
	html += '    <optgroup label="<?php echo addslashes($extension['name']); ?>">';
	<?php foreach ($extension['module'] as $module) { ?>
	html += '      <option value="<?php echo $module['code']; ?>"><?php echo addslashes($module['name']); ?></option>';
	<?php } ?>
	html += '    </optgroup>';
	<?php } ?>
	<?php } ?>
    html += '  </select></td>'; 
	html += '  <td><select name="xds_coloring_theme_new_home_layout_module[' + new_home_module_row + '][position]" class="form-control">';
    html += '    <option value="position_1">Позиция 1</option>';
    html += '    <option value="position_2">Позиция 2</option>';
    html += '    <option value="position_3">Позиция 3</option>';
    html += '    <option value="position_4">Позиция 4</option>';
		html += '    <option value="position_5">Позиция 5</option>';
    html += '  </select></td>';
	html += '  <td><input type="text" name="xds_coloring_theme_new_home_layout_module[' + new_home_module_row + '][sort_order]" value="" placeholder="" class="form-control" /></td>';
	html += '  <td><button type="button" onclick="$(\'#new-home-module-row' + new_home_module_row + '\').remove();" data-toggle="tooltip" title="удалить" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#new-home-module tbody').append(html);
	
	new_home_module_row++;
}

</script>



<script type="text/javascript">
	function apply(){
		$(".alert").remove();
		$.post($("#form-xds-coloring-theme").attr('action'), $("#form-xds-coloring-theme").serialize(), function(html) {
			var $success = $(html).find(".alert-success, .alert-danger");
			if ($success.length > 0) {
				$(".alert-helper").before($success);
			}
		});
	}
</script>
<script type="text/javascript">
			$(window).scroll(function(){
					if ($(window).scrollTop() > 100){
							$("#control-buttons").addClass("stick");
					} else {
							$("#control-buttons").removeClass("stick");
					}
			});
</script>
<script type="text/javascript">
var item_row_help = <?php echo $item_row_help; ?>;

function addItemHelp() {
  html  = '<tr id="item-row-help' + item_row_help + '">';
  html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="xds_coloring_theme_help_menu_item[' + item_row_help + '][title][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';	
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control"  type="text" name="xds_coloring_theme_help_menu_item[' + item_row_help + '][link][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="xds_coloring_theme_help_menu_item[' + item_row_help + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#item-row-help' + item_row_help  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#help-menu-items tbody').append(html);;
	
	item_row_help++;
}
</script>
<script type="text/javascript">
var item_row_main = <?php echo $item_row_main; ?>;

function addItemMain() {
  html  = '<tr id="item-row-main' + item_row_main + '">';
  html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="xds_coloring_theme_main_menu_item[' + item_row_main + '][title][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control"  type="text" name="xds_coloring_theme_main_menu_item[' + item_row_main + '][link][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="xds_coloring_theme_main_menu_item[' + item_row_main + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#item-row-main' + item_row_main  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#main-menu-items tbody').append(html);;
	
	item_row_main++;
}
</script>
<script type="text/javascript">
var cont_item_row = <?php echo $cont_item_row; ?>;

function addItemCont() {
  html  = '<tr id="item-row-cont' + cont_item_row + '">';
	html += '<td class="text-left"><a href="" id="thumb-image-cont' + cont_item_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="xds_coloring_theme_header_contact[' + cont_item_row + '][image]" value="" id="input-image-cont' + cont_item_row + '" /></td>';
  html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="xds_coloring_theme_header_contact[' + cont_item_row + '][title][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="xds_coloring_theme_header_contact[' + cont_item_row + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#item-row-cont' + cont_item_row  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#header-contacts-items tbody').append(html);;
	
	cont_item_row++;
}
</script>
<script type="text/javascript">
var add_cont_item_row = <?php echo $add_cont_item_row; ?>;

function addItemContAdd() {
  html  = '<tr id="item-row-add-cont' + add_cont_item_row + '">';
	html += '<td class="text-left"><a href="" id="thumb-image-add-cont' + add_cont_item_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>"  /></a><input type="hidden" name="xds_coloring_theme_additional_contact[' + add_cont_item_row + '][image]" value="" id="input-image-add-cont' + add_cont_item_row + '" /></td>';
  html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="xds_coloring_theme_additional_contact[' + add_cont_item_row + '][title][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="xds_coloring_theme_additional_contact[' + add_cont_item_row + '][link][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="xds_coloring_theme_additional_contact[' + add_cont_item_row + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#item-row-add-cont' + add_cont_item_row  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#header-add-contacts-items tbody').append(html);;
	
	add_cont_item_row++;
}
</script>
<script type="text/javascript">
var item_row_cat_links = <?php echo $item_row_cat_links; ?>;

function addItemCatLinks() {
  html  = '<tr id="item-row-cat-links' + item_row_cat_links + '">';
  html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control" type="text" name="xds_coloring_theme_add_cat_links_item[' + item_row_cat_links + '][title][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '<input class="form-control"  type="text" name="xds_coloring_theme_add_cat_links_item[' + item_row_cat_links + '][link][<?php echo $language['language_id']; ?>]" value="" />';
	html += '</div>';
	<?php } ?>
	html += '</td>';
	html += '<td class="text-left"><input class="form-control" type="text" name="xds_coloring_theme_add_cat_links_item[' + item_row_cat_links + '][sort]" size="1" value="" /></td>';
	html += '<td class="text-right"><a class="btn btn-danger" onclick="$(\'#item-row-cat-links' + item_row_cat_links  + '\').remove();" data-toggle="tooltip" title="Удалить"><i class="fa fa-trash-o"></i></a></td>';
	html += '</tr>'; 
	
	$('#category-links-items tbody').append(html);;
	
	item_row_cat_links++;
}
</script>
<script type="text/javascript">
$(function(){
	$('#column-2').css({'min-height': $('#column-1').innerHeight()});
});
</script>
<?php echo $footer; ?>