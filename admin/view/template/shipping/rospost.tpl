<?php echo $header; ?>

<?php if($v2) { ?>
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button id="save_and_stay" data-toggle="tooltip" title="<?php echo $button_save_and_stay; ?>" class="btn btn-success"><i class="fa fa-save"></i></button>
				<button type="submit" form="form-rospost" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit_rospost; ?></h3>
			</div>
			<div class="panel-body">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-rospost" class="form-horizontal">
					<ul id="tbs" class="nav nav-tabs">
						<li class="active"><a href="#tab-option" data-toggle="tab"><?php echo $tab_option; ?></a></li>
						<li><a href="#tab-history" data-toggle="tab"><?php echo $tab_history; ?></a></li>
						<li><a href="#tab-server" data-toggle="tab"><?php echo $tab_server; ?></a></li>
						<li><a href="#tab-log" data-toggle="tab"><?php echo $tab_log; ?></a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab-option">
							<div class="clearfix"><span class="small pull-right"><?php echo $text_postcalc_copy; ?></span></div>
							<fieldset>
								<legend><?php echo $text_options_common; ?>
								</legend>

								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-name"><span data-toggle="tooltip" title="<?php echo $entry_name_tooltip; ?>"><?php echo $entry_name; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_name" value="<?php if (isset($rospost_name)) echo $rospost_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
										<?php if ($error_name) { ?>
										<div class="text-danger"><?php echo $error_name; ?></div>
										<?php } ?>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-state"><span data-toggle="tooltip" title="<?php echo $entry_status; ?>"><?php echo $entry_status; ?></span></label>
									<div class="col-sm-10">
										<select name="rospost_status" id="input-state" class="form-control">
											<?php if ($rospost_status) { ?>
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
									<label class="col-sm-2 control-label" for="input-sort"><span data-toggle="tooltip" title="<?php echo $entry_sort_order; ?>"><?php echo $entry_sort_order; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_sort_order" value="<?php echo $rospost_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort" class="form-control" />
									</div>
								</div>

							</fieldset>

							<fieldset>
								<legend><?php echo $text_options_calc_view; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-cost"><span data-toggle="tooltip" title="<?php echo $entry_cost_tooltip; ?>"><?php echo $entry_cost; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_cost" value="<?php if (isset($rospost_cost)) echo $rospost_cost; ?>" placeholder="<?php echo $entry_cost; ?>" id="input-cost" class="form-control" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-rate"><span data-toggle="tooltip" title="<?php echo $entry_rate_tooltip; ?>"><?php echo $entry_rate; ?></span></label>
									<div class="col-sm-10">
										<textarea name="rospost_rate" rows="5" placeholder="<?php echo $entry_rate; ?>" id="input-rate" class="form-control"><?php echo $rospost_rate; ?></textarea>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_only_costtype_tooltip;?>" data-toggle="tooltip"><?php echo $entry_only_costtype; ?></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input name="rospost_postcalc_only_costtype" value="1"<?php if (isset($rospost_postcalc_only_costtype) && $rospost_postcalc_only_costtype == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
											<label class="radio-inline">
												<input name="rospost_postcalc_only_costtype" value="0"<?php if (isset($rospost_postcalc_only_costtype) && $rospost_postcalc_only_costtype == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_only_costtype)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
										</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_hide_from_tooltip;?>" data-toggle="tooltip"><?php echo $entry_hide_from; ?></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input name="rospost_postcalc_hide_from" value="1"<?php if (isset($rospost_postcalc_hide_from) && $rospost_postcalc_hide_from == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
											<label class="radio-inline">
												<input name="rospost_postcalc_hide_from" value="0"<?php if (isset($rospost_postcalc_hide_from) && $rospost_postcalc_hide_from == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_hide_from)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
										</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_hide_to_tooltip;?>" data-toggle="tooltip"><?php echo $entry_hide_to; ?></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input name="rospost_postcalc_hide_to" value="1"<?php if (isset($rospost_postcalc_hide_to) && $rospost_postcalc_hide_to == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
											<label class="radio-inline">
												<input name="rospost_postcalc_hide_to" value="0"<?php if (isset($rospost_postcalc_hide_to) && $rospost_postcalc_hide_to == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_hide_to)) { ?> checked="checked"<?php } }?> type="radio" /> <?php echo $text_no; ?></label>
										</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_allow_detail_title_tooltip;?>" data-toggle="tooltip"><?php echo $entry_allow_detail_title; ?></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input name="rospost_postcalc_allow_detail_title" value="1"<?php if (isset($rospost_postcalc_allow_detail_title) && $rospost_postcalc_allow_detail_title == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
											<label class="radio-inline">
												<input name="rospost_postcalc_allow_detail_title" value="0"<?php if (isset($rospost_postcalc_allow_detail_title) && $rospost_postcalc_allow_detail_title == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_allow_detail_title)) { ?> checked="checked"<?php } } ?> type="radio" /><?php echo $text_no; ?></label>
										</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_allow_detail_types_tooltip;?>" data-toggle="tooltip"><?php echo $entry_allow_detail_types; ?></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input name="rospost_postcalc_allow_detail_types" value="1"<?php if (isset($rospost_postcalc_allow_detail_types) && $rospost_postcalc_allow_detail_types == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
											<label class="radio-inline">
												<input name="rospost_postcalc_allow_detail_types" value="0"<?php if (isset($rospost_postcalc_allow_detail_types) && $rospost_postcalc_allow_detail_types == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_allow_detail_types)) { ?> checked="checked"<?php } } ?> type="radio" /><?php echo $text_no; ?></label>
										</div>
								</div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_show_cod_tooltip;?>" data-toggle="tooltip"><?php echo $entry_show_cod; ?></span></label>
                    <div class="col-sm-10">
                      <label class="radio-inline">
                        <input name="rospost_postcalc_show_cod" value="1"<?php if (isset($rospost_postcalc_show_cod) && $rospost_postcalc_show_cod == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
                      <label class="radio-inline">
                        <input name="rospost_postcalc_show_cod" value="0"<?php if (isset($rospost_postcalc_show_cod) && $rospost_postcalc_show_cod == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_show_cod)) { ?> checked="checked"<?php } } ?> type="radio" /><?php echo $text_no; ?></label>
                    </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_append_cod_to_total_tooltip;?>" data-toggle="tooltip"><?php echo $entry_append_cod_to_total; ?></span></label>
                    <div class="col-sm-10">
                      <label class="radio-inline">
                        <input name="rospost_postcalc_append_cod_to_total" value="1"<?php if (isset($rospost_postcalc_append_cod_to_total) && $rospost_postcalc_append_cod_to_total == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
                      <label class="radio-inline">
                        <input name="rospost_postcalc_append_cod_to_total" value="0"<?php if (isset($rospost_postcalc_append_cod_to_total) && $rospost_postcalc_append_cod_to_total == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_append_cod_to_total)) { ?> checked="checked"<?php } } ?> type="radio" /><?php echo $text_no; ?></label>
                    </div>
                </div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_allow_part_package_tooltip;?>" data-toggle="tooltip"><?php echo $entry_allow_part_package; ?></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input name="rospost_postcalc_allow_part_package" value="1"<?php if (isset($rospost_postcalc_allow_part_package) && $rospost_postcalc_allow_part_package == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
											<label class="radio-inline">
												<input name="rospost_postcalc_allow_part_package" value="0"<?php if (isset($rospost_postcalc_allow_part_package) && $rospost_postcalc_allow_part_package == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_allow_part_package)) { ?> checked="checked"<?php } } ?> type="radio" /><?php echo $text_no; ?></label>
										</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_ico_type_tooltip;?>" data-toggle="tooltip"><?php echo $entry_ico_type; ?></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input name="rospost_postcalc_ico_type" value="1"<?php if (isset($rospost_postcalc_ico_type) && $rospost_postcalc_ico_type == '1') { ?> checked="checked"<?php } ?> type="radio" /> <img src="/admin/view/image/rospost/rospost_icon_t1_48.png" alt="" /></label>
												<label class="radio-inline">
													<input name="rospost_postcalc_ico_type" value="2"<?php if (isset($rospost_postcalc_ico_type) && $rospost_postcalc_ico_type == '2') { ?> checked="checked"<?php } ?> type="radio" /> <img src="/admin/view/image/rospost/rospost_icon_t2_48.png" alt="" /></label>
												<label class="radio-inline">
													<input name="rospost_postcalc_ico_type" value="3"<?php if (isset($rospost_postcalc_ico_type) && $rospost_postcalc_ico_type == '3') { ?> checked="checked"<?php } ?> type="radio" /> <img src="/admin/view/image/rospost/rospost_icon_t3_48.png" alt="" /></label>
												<label class="radio-inline">
												<input name="rospost_postcalc_ico_type" value="4"<?php if (isset($rospost_postcalc_ico_type) && $rospost_postcalc_ico_type == '4') { ?> checked="checked"<?php } ?> type="radio" /> <img src="/admin/view/image/rospost/rospost_icon_t4_48.png" alt="" /></label>
											<label class="radio-inline">
												<input name="rospost_postcalc_ico_type" value="0"<?php if (isset($rospost_postcalc_ico_type) && $rospost_postcalc_ico_type == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_ico_type)) { ?> checked="checked"<?php } } ?> type="radio" /><?php echo $text_no; ?></label>
										</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_ico_size_tooltip;?>" data-toggle="tooltip"><?php echo $entry_ico_size; ?></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input name="rospost_postcalc_ico_size" value="32"<?php if (isset($rospost_postcalc_ico_size) && $rospost_postcalc_ico_size == '32') { ?> checked="checked"<?php } ?> type="radio" /> 32px</label>
											<label class="radio-inline">
												<input name="rospost_postcalc_ico_size" value="48"<?php if (isset($rospost_postcalc_ico_size) && $rospost_postcalc_ico_size == '48') { ?> checked="checked"<?php } ?> type="radio" /> 48px</label>
											<label class="radio-inline">
												<input name="rospost_postcalc_ico_size" value="64"<?php if (isset($rospost_postcalc_ico_size) && $rospost_postcalc_ico_size == '64') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_ico_size)) { ?> checked="checked"<?php } } ?> type="radio" /> 64px</label>
										</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_ico_pos_tooltip;?>" data-toggle="tooltip"><?php echo $entry_ico_pos; ?></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input name="rospost_postcalc_ico_pos" value="1"<?php if (isset($rospost_postcalc_ico_pos) && $rospost_postcalc_ico_pos == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_ico_before; ?></label>
											<label class="radio-inline">
												<input name="rospost_postcalc_ico_pos" value="2"<?php if (isset($rospost_postcalc_ico_pos) && $rospost_postcalc_ico_pos == '2') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_ico_pos)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_ico_after; ?></label>
										</div>
								</div>

							</fieldset>

							<fieldset>
								<legend><?php echo $text_options_postcalc; ?></legend>


								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-type"><span data-toggle="tooltip" title="<?php echo $entry_type_tooltip; ?>"><?php echo $entry_type; ?></span></label>
									<div class="col-sm-10">
										<div class="well well-sm" style="height: 150px; overflow: auto;">
											<?php //echo $text_all_types; ?>
											<?php foreach ($inside_post as $k => $type) { ?>
											<div class="checkbox">
												<label>
													<input type="checkbox" name="rospost_postcalc_type[]" value="<?php echo $k; ?>"<?php if (isset($rospost_postcalc_type) && in_array($k, $rospost_postcalc_type)) { ?> checked="checked"<?php } ?> />
													<?php echo $type; ?>
												</label>
											</div>
											<?php } ?>
										</div>
									</div>
								</div>

								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-source"><span data-toggle="tooltip" title="<?php echo $entry_source_tooltip; ?>"><?php echo $entry_source; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_postcalc_source" value="<?php if (isset($rospost_postcalc_source)) echo $rospost_postcalc_source; ?>" placeholder="<?php echo $entry_source; ?>" id="input-source" class="form-control" readonly="readonly" />
										<?php if ($error_source) { ?>
										<div class="text-danger"><?php echo $error_source; ?></div>
										<?php } ?>
									</div>
								</div>

								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-st"><span data-toggle="tooltip" title="<?php echo $entry_st_tooltip; ?>"><?php echo $entry_st; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_postcalc_st" value="<?php if (isset($rospost_postcalc_st)) echo $rospost_postcalc_st; ?>" placeholder="<?php echo $entry_st; ?>" id="input-st" class="form-control" readonly="readonly" />
										<?php if ($error_st) { ?>
										<div class="text-danger"><?php echo $error_st; ?></div>
										<?php } ?>
									</div>
								</div>

								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-ml"><span data-toggle="tooltip" title="<?php echo $entry_ml_tooltip; ?>"><?php echo $entry_ml; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_postcalc_ml" value="<?php if (isset($rospost_postcalc_ml)) echo $rospost_postcalc_ml; ?>" placeholder="<?php echo $entry_ml; ?>" id="input-ml" class="form-control" readonly="readonly" />
										<?php if ($error_ml) { ?>
										<div class="text-danger"><?php echo $error_ml; ?></div>
										<?php } ?>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-ib"><span data-toggle="tooltip" title="<?php echo $entry_ib_tooltip; ?>"><?php echo $entry_ib; ?> (<a href="http://postcalc.ru/faq.html#insurance" target="_blank">подробнее</a>)</span></label>
									<div class="col-sm-10">
										<select name="rospost_postcalc_ib" id="input-ib" class="form-control">
											<option value="f"<?php if (isset($rospost_postcalc_ib) && $rospost_postcalc_ib == 'f') { ?> selected="selected"<?php } ?>><?php echo $entry_ib_text_full; ?></option>
											<option value="p"<?php if (isset($rospost_postcalc_ib) && $rospost_postcalc_ib == 'p') { ?> selected="selected"<?php } ?>><?php echo $entry_ib_text_part; ?></option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-r"><span data-toggle="tooltip" title="<?php echo $entry_r_tooltip; ?>"><?php echo $entry_r; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_postcalc_r" value="<?php if (isset($rospost_postcalc_r)) echo $rospost_postcalc_r; ?>" placeholder="<?php echo $entry_r; ?>" id="input-r" class="form-control" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-pr"><span data-toggle="tooltip" title="<?php echo $entry_pr_tooltip; ?>"><?php echo $entry_pr; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_postcalc_pr" value="<?php if (isset($rospost_postcalc_pr)) echo $rospost_postcalc_pr; ?>" placeholder="<?php echo $entry_pr; ?>" id="input-pr" class="form-control" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-pk"><span data-toggle="tooltip" title="<?php echo $entry_pk_tooltip; ?>"><?php echo $entry_pk; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_postcalc_pk" value="<?php if (isset($rospost_postcalc_pk)) echo $rospost_postcalc_pk; ?>" placeholder="<?php echo $entry_pk; ?>" id="input-pk" class="form-control" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-cs"><span data-toggle="tooltip" title="<?php echo $entry_cs_tooltip; ?>"><?php echo $entry_cs; ?></span></label>
									<div class="col-sm-10">
										<select name="rospost_postcalc_cs" id="input-cs" class="form-control">
											<option value="utf-8"<?php if (isset($rospost_postcalc_cs) && $rospost_postcalc_cs == 'utf-8') { ?> selected="selected"<?php } ?>><?php echo $entry_cs_text_utf; ?></option>
											<option value="windows-1251"<?php if (isset($rospost_postcalc_cs) && $rospost_postcalc_cs == 'windows-1251') { ?> selected="selected"<?php } ?>><?php echo $entry_cs_text_win; ?></option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-d"><span data-toggle="tooltip" title="<?php echo $entry_d_tooltip; ?>"><?php echo $entry_d; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_postcalc_d" value="<?php if (isset($rospost_postcalc_d)) echo $rospost_postcalc_d; ?>" placeholder="<?php echo $entry_d; ?>" id="input-d" class="form-control" />
									</div>
								</div>

								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-default-from"><span data-toggle="tooltip" title="<?php echo $entry_default_from_tooltip; ?>"><?php echo $entry_default_from; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_postcalc_default_from" value="<?php if (isset($rospost_postcalc_default_from)) echo $rospost_postcalc_default_from; ?>" placeholder="<?php echo $entry_default_from; ?>" id="input-default-from" class="form-control" />
										<?php if ($error_default_from) { ?>
										<div class="text-danger"><?php echo $error_default_from; ?></div>
										<?php } ?>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_log_tooltip;?>" data-toggle="tooltip"><?php echo $entry_log; ?></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input name="rospost_postcalc_log" value="1"<?php if (isset($rospost_postcalc_log) && $rospost_postcalc_log == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
											<label class="radio-inline">
												<input name="rospost_postcalc_log" value="0"<?php if (isset($rospost_postcalc_log) && $rospost_postcalc_log == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_log)) { ?> checked="checked"<?php } }?> type="radio" /> <?php echo $text_no; ?></label>
										</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_error_log_tooltip;?>" data-toggle="tooltip"><?php echo $entry_error_log; ?></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input name="rospost_postcalc_error_log" value="1"<?php if (isset($rospost_postcalc_error_log) && $rospost_postcalc_error_log == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
											<label class="radio-inline">
												<input name="rospost_postcalc_error_log" value="0"<?php if (isset($rospost_postcalc_error_log) && $rospost_postcalc_error_log == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_error_log)) { ?> checked="checked"<?php } }?> type="radio" /> <?php echo $text_no; ?></label>
										</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-error-log-send"><span data-toggle="tooltip" title="<?php echo $entry_error_log_send_tooltip; ?>"><?php echo $entry_error_log_send; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_postcalc_error_log_send" value="<?php if (isset($rospost_postcalc_error_log_send)) echo $rospost_postcalc_error_log_send; ?>" placeholder="<?php echo $entry_error_log_send; ?>" id="input-error-log-send" class="form-control" />
									</div>
								</div>

								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-cache-dir"><span data-toggle="tooltip" title="<?php echo $entry_cache_dir_tooltip; ?>"><?php echo $entry_cache_dir; ?></span></label>
									<div class="col-sm-10">
											<div class="input-group">
												<div class="input-group-addon">/</div>
												<input type="text" name="rospost_postcalc_cache_dir" value="<?php if (isset($rospost_postcalc_cache_dir)) echo $rospost_postcalc_cache_dir; ?>" placeholder="<?php echo $entry_cache_dir; ?>" id="input-cache-dir" class="form-control" />
												<div class="input-group-addon">/</div>
											</div>
										<?php if ($error_cache_dir) { ?>
										<div class="text-danger"><?php echo $error_cache_dir; ?></div>
										<?php } ?>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-cache-valid"><span data-toggle="tooltip" title="<?php echo $entry_cache_valid_tooltip; ?>"><?php echo $entry_cache_valid; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_postcalc_cache_valid" value="<?php if (isset($rospost_postcalc_cache_valid)) echo $rospost_postcalc_cache_valid; ?>" placeholder="<?php echo $entry_cache_valid; ?>" id="input-cache-valid" class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-timeout"><span data-toggle="tooltip" title="<?php echo $entry_timeout_tooltip; ?>"><?php echo $entry_timeout; ?></span></label>
									<div class="col-sm-10">
										<input type="text" name="rospost_postcalc_timeout" value="<?php if (isset($rospost_postcalc_timeout)) echo $rospost_postcalc_timeout; ?>" placeholder="<?php echo $entry_timeout; ?>" id="input-timeout" class="form-control" />
									</div>
								</div>

								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-servers"><span data-toggle="tooltip" title="<?php echo $entry_servers_tooltip; ?>"><?php echo $entry_servers; ?></span></label>
									<div class="col-sm-10">
										<textarea name="rospost_postcalc_servers" rows="5" placeholder="<?php echo $entry_servers; ?>" id="input-servers" class="form-control"><?php if (isset($rospost_postcalc_servers)) echo $rospost_postcalc_servers; ?></textarea>
										<?php if ($error_servers) { ?>
										<div class="text-danger"><?php echo $error_servers; ?></div>
										<?php } ?>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for=""><span title="<?php echo $entry_city_as_pindex_tooltip;?>" data-toggle="tooltip"><?php echo $entry_city_as_pindex; ?></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input name="rospost_postcalc_city_as_pindex" value="1"<?php if (isset($rospost_postcalc_city_as_pindex) && $rospost_postcalc_city_as_pindex == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
											<label class="radio-inline">
												<input name="rospost_postcalc_city_as_pindex" value="0"<?php if (isset($rospost_postcalc_city_as_pindex) && $rospost_postcalc_city_as_pindex == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_city_as_pindex)) { ?> checked="checked"<?php } } ?> type="radio" /><?php echo $text_no; ?></label>
										</div>
								</div>

							</fieldset>

						</div>
						<div class="tab-pane" id="tab-history">
							<h2><?php echo $text_stat_postcalc; ?></h2>
							<a onclick="get_stat(); return false;" class="btn btn-default"><?php echo $text_get_stat; ?></a>
							<div id="stat" style="margin: 20px 0px;"></div>
						</div>
						<div class="tab-pane" id="tab-server">
							<h2><?php echo $text_test_postcalc; ?></h2>
							<h5><?php echo $text_test_postcalc_etc; ?></h5>
							<a onclick="get_test(); return false;" class="btn btn-default"><?php echo $text_get_test; ?></a>
							<div id="test" style="margin: 20px 0px;"></div>
						</div>
						<div class="tab-pane" id="tab-log">
							<h2><?php echo $text_log_postcalc; ?></h2>
							<a onclick="get_log(false, false, false); return false;" class="btn btn-default"><?php echo $text_get_log; ?></a>
							<div id="log" style="margin: 20px 0px;"></div>
							<div id="log-file"></div>
						</div>
					</div>
			</form>

			</div>
		</div>
	</div>
</div>

<?php } else { ?>

<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/shipping.png" alt="" /> <?php echo $heading_title; ?></h1>
			<div class="buttons"><a id="save_and_stay" class="button"><?php echo $button_save_and_stay; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
		</div>
		<div class="content">
			<div id="tabs" class="htabs">
				<a href="#tab-option"><?php echo $tab_option; ?></a>
				<a href="#tab-history"><?php echo $tab_history; ?></a>
				<a href="#tab-server"><?php echo $tab_server; ?></a>
				<a href="#tab-log"><?php echo $tab_log; ?></a>
			</div>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<div id="tab-option">
				<div class="clearfix"><span class="range pull-right" style="color: inherit;"><?php echo $text_postcalc_copy; ?></span></div>
				<h2><?php echo $text_options_common; ?></h2>
				<table class="form">
					<tr>
						<td><span class="required">*</span> <?php echo $entry_name; ?><span class="help"><?php echo $entry_name_tooltip; ?></span></td>
						<td><input type="text" name="rospost_name" value="<?php if (isset($rospost_name)) echo $rospost_name; ?>" placeholder="<?php echo $entry_name; ?>" />
							<?php if ($error_name) { ?>
							<span class="error"><?php echo $error_name; ?></span>
							<?php } ?></td>
					</tr>
					<tr>
						<td><?php echo $entry_status; ?><span class="help"><?php echo $entry_status; ?></span></td>
						<td><select name="rospost_status">
								<?php if ($rospost_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select></td>
					</tr>
					<tr>
						<td><?php echo $entry_sort_order; ?><span class="help"><?php echo $entry_sort_order; ?></span></td>
						<td><input type="text" name="rospost_sort_order" value="<?php echo $rospost_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" size="1" /></td>
					</tr>
				</table>

				<h2><?php echo $text_options_calc_view; ?></h2>
				<table class="form">
					<tr>
						<td><?php echo $entry_cost; ?><span class="help"><?php echo $entry_cost_tooltip; ?></span></td>
						<td><input type="text" name="rospost_cost" value="<?php if (isset($rospost_cost)) echo $rospost_cost; ?>" placeholder="<?php echo $entry_cost; ?>" />
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_rate; ?><span class="help"><?php echo $entry_rate_tooltip; ?></span></td>
						<td>
							<textarea name="rospost_rate" rows="5" placeholder="<?php echo $entry_rate; ?>"><?php echo $rospost_rate; ?></textarea>
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_only_costtype; ?><span class="help"><?php echo $entry_only_costtype_tooltip; ?></span></td>
						<td>
							<label for="onlycosttype_y">
									<input id="onlycosttype_y" name="rospost_postcalc_only_costtype" value="1"<?php if (isset($rospost_postcalc_only_costtype) && $rospost_postcalc_only_costtype == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
							 <label for="onlycosttype_n">
									<input id="onlycosttype_n" name="rospost_postcalc_only_costtype" value="0"<?php if (isset($rospost_postcalc_only_costtype) && $rospost_postcalc_only_costtype == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_only_costtype)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_hide_from; ?><span class="help"><?php echo $entry_hide_from_tooltip; ?></span></td>
						<td>
							<label for="hide_from_y">
									<input id="hide_from_y" name="rospost_postcalc_hide_from" value="1"<?php if (isset($rospost_postcalc_hide_from) && $rospost_postcalc_hide_from == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
							 <label for="hide_from_n">
									<input id="hide_from_n" name="rospost_postcalc_hide_from" value="0"<?php if (isset($rospost_postcalc_hide_from) && $rospost_postcalc_hide_from == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_hide_from)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_hide_to; ?><span class="help"><?php echo $entry_hide_to_tooltip; ?></span></td>
						<td>
							<label for="hide_to_y">
									<input id="hide_to_y" name="rospost_postcalc_hide_to" value="1"<?php if (isset($rospost_postcalc_hide_to) && $rospost_postcalc_hide_to == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
							 <label for="hide_to_n">
									<input id="hide_to_n" name="rospost_postcalc_hide_to" value="0"<?php if (isset($rospost_postcalc_hide_to) && $rospost_postcalc_hide_to == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_hide_to)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_allow_detail_title; ?><span class="help"><?php echo $entry_allow_detail_title_tooltip; ?></span></td>
						<td>
							<label for="alldettitle_y">
									<input id="alldettitle_y" name="rospost_postcalc_allow_detail_title" value="1"<?php if (isset($rospost_postcalc_allow_detail_title) && $rospost_postcalc_allow_detail_title == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
							 <label for="alldettitle_n">
									<input id="alldettitle_n" name="rospost_postcalc_allow_detail_title" value="0"<?php if (isset($rospost_postcalc_allow_detail_title) && $rospost_postcalc_allow_detail_title == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_allow_detail_title)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
						</td>
					</tr>


					<tr>
						<td><?php echo $entry_allow_detail_types; ?><span class="help"><?php echo $entry_allow_detail_types_tooltip; ?></span></td>
						<td>
							<label for="alldettypes_y">
									<input id="alldettypes_y" name="rospost_postcalc_allow_detail_types" value="1"<?php if (isset($rospost_postcalc_allow_detail_types) && $rospost_postcalc_allow_detail_types == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
							 <label for="alldettypes_n">
									<input id="alldettypes_n" name="rospost_postcalc_allow_detail_types" value="0"<?php if (isset($rospost_postcalc_allow_detail_types) && $rospost_postcalc_allow_detail_types == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_allow_detail_types)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
						</td>
					</tr>

          <tr>
            <td><?php echo $entry_show_cod; ?><span class="help"><?php echo $entry_show_cod_tooltip; ?></span></td>
            <td>
              <label for="allshowcod_y">
                  <input id="allshowcod_y" name="rospost_postcalc_show_cod" value="1"<?php if (isset($rospost_postcalc_show_cod) && $rospost_postcalc_show_cod == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
               <label for="allshowcod_n">
                  <input id="allshowcod_n" name="rospost_postcalc_show_cod" value="0"<?php if (isset($rospost_postcalc_show_cod) && $rospost_postcalc_show_cod == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_show_cod)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
            </td>
          </tr>

          <tr>
            <td><?php echo $entry_append_cod_to_total; ?><span class="help"><?php echo $entry_append_cod_to_total_tooltip; ?></span></td>
            <td>
              <label for="allappcod_y">
                  <input id="allshowcod_y" name="rospost_postcalc_append_cod_to_total" value="1"<?php if (isset($rospost_postcalc_append_cod_to_total) && $rospost_postcalc_append_cod_to_total == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
               <label for="allappcod_n">
                  <input id="allappcod_n" name="rospost_postcalc_append_cod_to_total" value="0"<?php if (isset($rospost_postcalc_append_cod_to_total) && $rospost_postcalc_append_cod_to_total == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_append_cod_to_total)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
            </td>
          </tr>

					<tr>
						<td><?php echo $entry_allow_part_package; ?><span class="help"><?php echo $entry_allow_part_package_tooltip; ?></span></td>
						<td>
							<label for="allpart_y">
									<input id="allpart_y" name="rospost_postcalc_allow_part_package" value="1"<?php if (isset($rospost_postcalc_allow_part_package) && $rospost_postcalc_allow_part_package == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
							 <label for="allpart_n">
									<input id="allpart_n" name="rospost_postcalc_allow_part_package" value="0"<?php if (isset($rospost_postcalc_allow_part_package) && $rospost_postcalc_allow_part_package == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_allow_part_package)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_ico_type; ?><span class="help"><?php echo $entry_ico_type_tooltip; ?></span></td>
						<td>
							<label for="icotype_1">
									<input id="icotype_1" name="rospost_postcalc_ico_type" value="1"<?php if (isset($rospost_postcalc_ico_type) && $rospost_postcalc_ico_type == '1') { ?> checked="checked"<?php } ?> type="radio" /> <img src="/admin/view/image/rospost/rospost_icon_t1_48.png" alt="" /></label>
							<label for="icotype_2">
									<input id="icotype_2" name="rospost_postcalc_ico_type" value="2"<?php if (isset($rospost_postcalc_ico_type) && $rospost_postcalc_ico_type == '2') { ?> checked="checked"<?php } ?> type="radio" /> <img src="/admin/view/image/rospost/rospost_icon_t2_48.png" alt="" /></label>
							<label for="icotype_3">
									<input id="icotype_3" name="rospost_postcalc_ico_type" value="3"<?php if (isset($rospost_postcalc_ico_type) && $rospost_postcalc_ico_type == '3') { ?> checked="checked"<?php } ?> type="radio" /> <img src="/admin/view/image/rospost/rospost_icon_t3_48.png" alt="" /></label>
							<label for="icotype_4">
									<input id="icotype_4" name="rospost_postcalc_ico_type" value="4"<?php if (isset($rospost_postcalc_ico_type) && $rospost_postcalc_ico_type == '4') { ?> checked="checked"<?php } ?> type="radio" /> <img src="/admin/view/image/rospost/rospost_icon_t4_48.png" alt="" /></label>
							 <label for="icotype_n">
									<input id="icotype_n" name="rospost_postcalc_ico_type" value="0"<?php if (isset($rospost_postcalc_ico_type) && $rospost_postcalc_ico_type == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_ico_type)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_ico_size; ?><span class="help"><?php echo $entry_ico_size_tooltip; ?></span></td>
						<td>
							<label for="icosize_32">
									<input id="icosize_32" name="rospost_postcalc_ico_size" value="32"<?php if (isset($rospost_postcalc_ico_size) && $rospost_postcalc_ico_size == '32') { ?> checked="checked"<?php } ?> type="radio" /> 32px</label>
							 <label for="icosize_48">
									<input id="icosize_48" name="rospost_postcalc_ico_size" value="48"<?php if (isset($rospost_postcalc_ico_size) && $rospost_postcalc_ico_size == '48') { ?> checked="checked"<?php } ?> type="radio" /> 48px</label>
							 <label for="icosize_64">
									<input id="icosize_64" name="rospost_postcalc_ico_size" value="64"<?php if (isset($rospost_postcalc_ico_size) && $rospost_postcalc_ico_size == '64') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_ico_size)) { ?> checked="checked"<?php } } ?> type="radio" /> 64px</label>
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_ico_pos; ?><span class="help"><?php echo $entry_ico_pos_tooltip; ?></span></td>
						<td>
							<label for="icopos_y">
									<input id="icopos_y" name="rospost_postcalc_ico_pos" value="1"<?php if (isset($rospost_postcalc_ico_pos) && $rospost_postcalc_ico_pos == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_ico_before; ?></label>
							 <label for="icopos_n">
									<input id="icopos_n" name="rospost_postcalc_ico_pos" value="2"<?php if (isset($rospost_postcalc_ico_pos) && $rospost_postcalc_ico_pos == '2') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_ico_pos)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_ico_after; ?></label>
						</td>
					</tr>

				</table>


				<h2>Настройки PostCalc (<a href="http://postcalc.ru/api.html" target="_blank" title="postcalc.ru">postcalc.ru</a>)</h2>
				<table class="form">
					<tr>
						<td><?php echo $entry_type; ?><span class="help"><?php echo $entry_type_tooltip; ?></span></td>
						<td id="type">
							<div>
								<div class="scrollbox">
									<?php $c = 0; foreach ($inside_post as $k => $type) { ?>
									<div<?php if($c % 2) { ?> class="even"<?php } else { ?> class="odd"<?php } ?>>
										<label for="<?php echo $k; ?>">
											<input id="<?php echo $k; ?>" type="checkbox" name="rospost_postcalc_type[]" value="<?php echo $k; ?>"<?php if (isset($rospost_postcalc_type) && in_array($k, $rospost_postcalc_type)) { ?> checked="checked"<?php } ?> />
											<?php echo $type; ?>
										</label>
									</div>
									<?php $c++; } ?>
								</div>
							</div>
							<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
					</tr>

					<tr>
						<td><span class="required">*</span> <?php echo $entry_source; ?><span class="help"><?php echo $entry_source_tooltip; ?></span></td>
						<td><?php if (isset($rospost_postcalc_source)) echo $rospost_postcalc_source; ?>
            <input type="hidden" name="rospost_postcalc_source" value="<?php if (isset($rospost_postcalc_source)) echo $rospost_postcalc_source; ?>" />
							<?php if ($error_source) { ?>
							<span class="error"><?php echo $error_source; ?></span>
							<?php } ?></td>
					</tr>

					<tr>
						<td><span class="required">*</span> <?php echo $entry_st; ?><span class="help"><?php echo $entry_st_tooltip; ?></span></td>
						<td><?php if (isset($rospost_postcalc_st)) echo $rospost_postcalc_st; ?>
            <input type="hidden" name="rospost_postcalc_st" value="<?php if (isset($rospost_postcalc_st)) echo $rospost_postcalc_st; ?>" />
							<?php if ($error_st) { ?>
							<span class="error"><?php echo $error_st; ?></span>
							<?php } ?></td>
					</tr>

					<tr>
						<td><span class="required">*</span> <?php echo $entry_ml; ?><span class="help"><?php echo $entry_ml_tooltip; ?></span></td>
						<td><?php if (isset($rospost_postcalc_ml)) echo $rospost_postcalc_ml; ?>
            <input type="hidden" name="rospost_postcalc_ml" value="<?php if (isset($rospost_postcalc_ml)) echo $rospost_postcalc_ml; ?>" />
							<?php if ($error_ml) { ?>
							<span class="error"><?php echo $error_ml; ?></span>
							<?php } ?></td>
					</tr>

					<tr>
						<td><?php echo $entry_ib; ?> (<a href="http://postcalc.ru/faq.html#insurance" target="_blank">подробнее</a>)<span class="help"><?php echo $entry_ib_tooltip; ?></span></td>
						<td><select name="rospost_postcalc_ib">
								<option value="f"<?php if (isset($rospost_postcalc_ib) && $rospost_postcalc_ib == 'f') { ?> selected="selected"<?php } ?>><?php echo $entry_ib_text_full; ?></option>
								<option value="p"<?php if (isset($rospost_postcalc_ib) && $rospost_postcalc_ib == 'p') { ?> selected="selected"<?php } ?>><?php echo $entry_ib_text_part; ?></option>
							</select></td>
					</tr>

					<tr>
						<td><?php echo $entry_r; ?><span class="help"><?php echo $entry_r_tooltip; ?></span></td>
						<td><input type="text" name="rospost_postcalc_r" value="<?php if (isset($rospost_postcalc_r)) echo $rospost_postcalc_r; ?>" placeholder="<?php echo $entry_r; ?>" />
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_pr; ?><span class="help"><?php echo $entry_pr_tooltip; ?></span></td>
						<td><input type="text" name="rospost_postcalc_pr" value="<?php if (isset($rospost_postcalc_pr)) echo $rospost_postcalc_pr; ?>" placeholder="<?php echo $entry_pr; ?>" />
					</td>
					</tr>

					<tr>
						<td><?php echo $entry_pk; ?><span class="help"><?php echo $entry_pk_tooltip; ?></span></td>
						<td><input type="text" name="rospost_postcalc_pk" value="<?php if (isset($rospost_postcalc_pk)) echo $rospost_postcalc_pk; ?>" placeholder="<?php echo $entry_pk; ?>" /></td>
					</tr>

					<tr>
						<td><?php echo $entry_cs; ?><span class="help"><?php echo $entry_cs_tooltip; ?></span></td>
						<td><select name="rospost_postcalc_cs">
								<option value="utf-8"<?php if (isset($rospost_postcalc_cs) && $rospost_postcalc_cs == 'utf-8') { ?> selected="selected"<?php } ?>><?php echo $entry_cs_text_utf; ?></option>
								<option value="windows-1251"<?php if (isset($rospost_postcalc_cs) && $rospost_postcalc_cs == 'windows-1251') { ?> selected="selected"<?php } ?>><?php echo $entry_cs_text_win; ?></option>
							</select></td>
					</tr>

					<tr>
						<td><?php echo $entry_d; ?><span class="help"><?php echo $entry_d_tooltip; ?></span></td>
						<td><input type="text" name="rospost_postcalc_d" value="<?php if (isset($rospost_postcalc_d)) echo $rospost_postcalc_d; ?>" placeholder="<?php echo $entry_d; ?>" /></td>
					</tr>

					<tr>
						<td><span class="required">*</span> <?php echo $entry_default_from; ?><span class="help"><?php echo $entry_default_from_tooltip; ?></span></td>
						<td><input type="text" name="rospost_postcalc_default_from" value="<?php if (isset($rospost_postcalc_default_from)) echo $rospost_postcalc_default_from; ?>" placeholder="<?php echo $entry_default_from; ?>" />
							<?php if ($error_default_from) { ?>
							<span class="error"><?php echo $error_default_from; ?></span>
							<?php } ?></td>
					</tr>

					<tr>
						<td><?php echo $entry_log; ?><span class="help"><?php echo $entry_log_tooltip; ?></span></td>
						<td>
							<label for="log_y">
									<input id="log_y" name="rospost_postcalc_log" value="1"<?php if (isset($rospost_postcalc_log) && $rospost_postcalc_log == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
							 <label for="log_n">
									<input id="log_n" name="rospost_postcalc_log" value="0"<?php if (isset($rospost_postcalc_log) && $rospost_postcalc_log == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_log)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_error_log; ?><span class="help"><?php echo $entry_error_log_tooltip; ?></span></td>
						<td>
							<label for="elog_y">
									<input id="elog_y" name="rospost_postcalc_error_log" value="1"<?php if (isset($rospost_postcalc_error_log) && $rospost_postcalc_error_log == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
							 <label for="elog_n">
									<input id="elog_n" name="rospost_postcalc_error_log" value="0"<?php if (isset($rospost_postcalc_error_log) && $rospost_postcalc_error_log == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_error_log)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_error_log_send; ?><span class="help"><?php echo $entry_error_log_send_tooltip; ?></span></td>
						<td><input type="text" name="rospost_postcalc_error_log_send" value="<?php if (isset($rospost_postcalc_error_log_send)) echo $rospost_postcalc_error_log_send; ?>" placeholder="<?php echo $entry_error_log_send; ?>" /></td>
					</tr>

					<tr>
						<td><span class="required">*</span> <?php echo $entry_cache_dir; ?><span class="help"><?php echo $entry_cache_dir_tooltip; ?></span></td>
						<td>/ <input type="text" name="rospost_postcalc_cache_dir" value="<?php if (isset($rospost_postcalc_cache_dir)) echo $rospost_postcalc_cache_dir; ?>" placeholder="<?php echo $entry_cache_dir; ?>" /> /
							<?php if ($error_cache_dir) { ?>
							<span class="error"><?php echo $error_cache_dir; ?></span>
							<?php } ?></td>
					</tr>

					<tr>
						<td><?php echo $entry_cache_valid; ?><span class="help"><?php echo $entry_cache_valid_tooltip; ?></span></td>
						<td><input type="text" name="rospost_postcalc_cache_valid" value="<?php if (isset($rospost_postcalc_cache_valid)) echo $rospost_postcalc_cache_valid; ?>" placeholder="<?php echo $entry_cache_valid; ?>" /></td>
					</tr>

					<tr>
						<td><?php echo $entry_timeout; ?><span class="help"><?php echo $entry_timeout_tooltip; ?></span></td>
						<td><input type="text" name="rospost_postcalc_timeout" value="<?php if (isset($rospost_postcalc_timeout)) echo $rospost_postcalc_timeout; ?>" placeholder="<?php echo $entry_timeout; ?>" /></td>
					</tr>

					<tr>
							<td><span class="required">*</span> <?php echo $entry_servers; ?><span class="help"><?php echo $entry_servers_tooltip; ?></span></td>
							<td><textarea name="rospost_postcalc_servers" cols="40" rows="5" placeholder="<?php echo $entry_servers; ?>"><?php if (isset($rospost_postcalc_servers)) echo $rospost_postcalc_servers; ?></textarea>
								<?php if ($error_servers) { ?>
								<span class="error"><?php echo $error_servers; ?></span>
								<?php } ?></td>
						</tr>

					<tr>
						<td><?php echo $entry_city_as_pindex; ?><span class="help"><?php echo $entry_city_as_pindex_tooltip; ?></span></td>
						<td>
							<label for="citypindex_y">
									<input id="citypindex_y" name="rospost_postcalc_city_as_pindex" value="1"<?php if (isset($rospost_postcalc_city_as_pindex) && $rospost_postcalc_city_as_pindex == '1') { ?> checked="checked"<?php } ?> type="radio" /> <?php echo $text_yes; ?></label>
							 <label for="citypindex_n">
									<input id="citypindex_n" name="rospost_postcalc_city_as_pindex" value="0"<?php if (isset($rospost_postcalc_city_as_pindex) && $rospost_postcalc_city_as_pindex == '0') { ?> checked="checked"<?php } else { if(!isset($rospost_postcalc_city_as_pindex)) { ?> checked="checked"<?php } } ?> type="radio" /> <?php echo $text_no; ?></label>
						</td>
					</tr>
			</table>
		</div>
		<div id="tab-history">
				<h2><?php echo $text_stat_postcalc; ?></h2>
				<a onclick="get_stat(); return false;" class="button"><?php echo $text_get_stat; ?></a>
				<div id="stat" style="margin: 20px 0px;"></div>
		</div>
		<div id="tab-server">
				<h2><?php echo $text_test_postcalc; ?></h2>
				<h5>Простейший вызов библиотеки PostcalcLight и API</h5>
				<a onclick="get_test(); return false;" class="button"><?php echo $text_get_test; ?></a>
				<div id="test" style="margin: 20px 0px;"></div>
		</div>
		<div id="tab-log">
				<h2><?php echo $text_log_postcalc; ?></h2>
				<a onclick="get_log(false, false, false); return false;" class="button"><?php echo $text_get_log; ?></a>
				<div id="log" style="margin: 20px 0px;"></div>
				<div id="log-file"></div>
		</div>
			</form>

			</div>
		</div>
	</div>
</div>
<?php } ?>

<script type="text/javascript"><!--
$(document).ready(function() {

<?php if($v2) { ?>

		$('body').on('click', '#save_and_stay', function() {
		$.ajax( {
			type: 'post',
			url: $("form[id*='form-']").attr('action') + '&save',
			data: $("form[id*='form-']").serialize(),
			beforeSend: function() {
				$("form[id*='form-']").fadeTo('slow', 0.5);
			},
			complete: function() {
				$("form[id*='form-']").fadeTo('slow', 1);   
			},
			success: function(response) {
				//console.log(response);
			}
		});
	});

	$('html').on('click', '#log a', function(e) {
		get_log($(this).attr('data-file'), false, false);
		e.preventDefault();
	});
	$('html').on('click', '#stat a.log', function(e) {
		get_log(false, $(this).attr('data-date'), false);
		$('#tbs a[href="#tab-log"]').tab('show');
		e.preventDefault();
	});
	$('html').on('click', '#stat a.errlog', function(e) {
		get_log(false, $(this).attr('data-date'), $(this).attr('data-errorlog'));
		$('#tbs a[href="#tab-log"]').tab('show');
		e.preventDefault();
	});

<?php } else { ?>
  $('#tabs a').tabs();

  // check version jQuery
  if(parseFloat(jQuery.fn.jquery) >= 1.7) {
  // over jQuery 1.7
		$('html').on('click', '#save_and_stay', function(e) {
			$.ajax({
				type: 'post',
				url: $('#form').attr('action') + '&save',
				data: $('#form').serialize(),
				beforeSend: function() {
					$('#form').fadeTo('slow', 0.5);
				},
				complete: function() {
					$('#form').fadeTo('slow', 1);   
				},
				success: function(response) {
					//console.log(response);
				}
			});
			e.preventDefault();
		});

    $('html').on('click', '#log a', function(e) {
      get_log($(this).attr('data-file'), false, false);
      e.preventDefault();
    });
    $('html').on('click', '#stat a.log', function(e) {
      get_log(false, $(this).attr('data-date'), false);
      $('#tabs a[href="#tab-log"]').trigger('click');
      e.preventDefault();
    });
    $('html').on('click', '#stat a.errlog', function(e) {
      get_log(false, $(this).attr('data-date'), $(this).attr('data-errorlog'));
      $('#tabs a[href="#tab-log"]').trigger('click');
      e.preventDefault();
    });
  }
  else {

		$('html').delegate('#save_and_stay', 'click', function() {
			$.ajax({
				type: 'post',
				url: $('#form').attr('action') + '&save',
				data: $('#form').serialize(),
				beforeSend: function() {
					$('#form').fadeTo('slow', 0.5);
				},
				complete: function() {
					$('#form').fadeTo('slow', 1);   
				},
				success: function(response) {
					//console.log(response);
				}
			});
			return false;
		});

    $('html').delegate('#log a', 'click', function(e) {
      get_log($(this).attr('data-file'), false, false);
      return false;
    });
    $('html').delegate('#stat a.log', 'click', function(e) {
      get_log(false, $(this).attr('data-date'), false);
      $('#tabs a[href="#tab-log"]').trigger('click');
      return false;
      
    });
    $('html').delegate('#stat a.errlog', 'click', function(e) {
      get_log(false, $(this).attr('data-date'), $(this).attr('data-errorlog'));
      $('#tabs a[href="#tab-log"]').trigger('click');
      return false;
    });
  }
<?php } /*end if $v2 */ ?>

});

function get_stat() {
	$.ajax({
		url: 'index.php?route=shipping/rospost/get_stat&token=<?php echo $token; ?>',
		dataType: 'json',
		success: function(json) {
			if(json.error) {
				$('#stat').empty().html('<div class="error">' + json.error + '</div>');
			}
			else {
				<?php if($v2) { ?>
				var html = '<table class="table table-striped table-hover table-condensed" style="width: 70%;"><tr><th>Дата</th><th>Запросов</th><th>Ср.время</th><th>Ср.размер</th><th>Ошибки</th></tr>';
				<?php } else { ?>
				var html = '<table class="form" style="width: 70%;"><tr><th style="text-align: center;">Дата</th><th style="text-align: center;">Запросов</th><th style="text-align: center;">Ср.время</th><th style="text-align: center;">Ср.размер</th><th style="text-align: center;">Ошибки</th></tr>';
				<?php } ?>
				$.each(json['data'], function(index, value) {
					html += '<tr><td colspan="5"><h2><a class="log" href="#" data-date="' + value.month + '">' + value.month + '</a></h2></td></tr>';
					$.each(value.lines, function(lindex, lvalue) {
						html += '<tr>';
						html += '<td style="text-align: center;"><a class="log" href="#"" data-date="' + lvalue.date + '">' + lvalue.date + '</a></td>';
						html += '<td style="text-align: center;">' + lvalue.num_requests + '</td>';
						html += '<td style="text-align: center;">' + lvalue.time_elapsed + '</td>';
						html += '<td style="text-align: center;">' + lvalue.size + '</td><td style="text-align: center;">';
						if(typeof value.errors !=='undefined' && typeof value.errors[lvalue.date] !=='undefined') {
							html += '<a class="errlog" href="#" data-date="' + lvalue.date + '" data-errorlog="1">' + value.errors[lvalue.date] + '</a>';
						}
						html += '</td></tr>';
					});
					html += '<tr><td colspan="5">' + value.common + '</td></tr>';
        });
        html += '</table>';
      }
			$('#stat').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	}); 
}


// functions get info
function get_log(file, idate, errorlog) {
	var data = (file ? 'logfile=' + file : '');
	data += (idate ? 'date=' + idate : '');
	data += (errorlog ? '&errorlog=' + errorlog : '');

	$.ajax({
		url: 'index.php?route=shipping/rospost/get_log&token=<?php echo $token; ?>',
		dataType: 'json',
		type: 'get',
		data: data,
		success: function(json) {
			if(json.error) {
				$('#log').empty().html('<div class="error">' + json.error + '</div>');
			}
			else {
				var html = '<pre><h2>' + json.data.head + '</h2>';
				if(file || idate) {
					html += json.data.content;
					html += '</pre>';
					$('#log-file').html(html);
				}
				else {
					if(json.data.content) {
						$.each(json.data.content, function(index, value) {
							html += ' <a href="#"" data-file="' + value.datafile + '">' + value.title + '</a> ';
						});
					}
					html += '</pre>';
					$('#log').html(html);
					$('#log-file').empty();
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	}); 
}

function get_test() {
	$.ajax({
		url: 'index.php?route=shipping/rospost/get_test&token=<?php echo $token; ?>',
		dataType: 'json',
		success: function(json) {
			if(json.error) {
				$('#test').empty().html('<div class="error">' + json.error + '</div>');
			}
			else {
				<?php if($v2) { ?>
				var html = '<table class="table table-striped table-hover table-condensed" style="width: 70%;"><tr><th>Название</th><th style="text-align: center;">Доставка</th><th style="text-align: center;">Сроки</th></tr>';
				<?php } else { ?>
				var html = '<table class="form" style="width: 70%;"><tr><th>Название</th><th style="text-align: center;">Доставка</th><th style="text-align: center;">Сроки</th></tr>';
					<?php } ?>
				$.each(json['data'], function(index, value) {
					html += '<tr><td>' + value.name + '</td><td style="text-align: center;">' + value.ship + ' руб.</td><td style="text-align: center;">' + value.time + ' дн.</td></tr>';
				});
				html += '</table>';
				$('#test').html(html);
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	}); 
}

//--></script>
<?php echo $footer; ?>