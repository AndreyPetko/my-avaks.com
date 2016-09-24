<?php echo $header; ?>
<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?>
		<a href="<?php echo $breadcrumb['href']; ?>">
			<?php echo $breadcrumb['text']; ?>
		</a>
		<?php } ?>
	</div>
	<?php if ($error_warning) { ?>
	<div class="warning">
		<?php echo $error_warning; ?>
	</div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1>
				<img src="view/image/module.png" alt="" />
				<?php echo $heading_title ?>
			</h1>
			<div class="buttons">
				<a onclick="$('#form').submit();" class="button">
					<?php $z('button_save') ?>
				</a>
				<a href="<?php echo $z->url->link('extension/module','token='.$z->session->data['token'],'SSL') ?>" class="button">
					<?php $z('button_cancel') ?>
				</a>
			</div>
		</div>
		<div class="content">
			<form action="<?php echo $z->url->link('module/occm','token='.$z->session->data['token'],'SSL') ?>" method="post" enctype="multipart/form-data" id="form">
				<table class="form">
					<tr>
						<td>
							<?php $z('Status:') ?>
						</td>
						<td>
							<select name="occm_status">
								<?php if ($occm_status) { ?>
								<option value="1" selected="selected">
									<?php $z('text_enabled') ?>
								</option>
								<option value="0">
									<?php $z('text_disabled') ?>
								</option>
								<?php } else { ?>
								<option value="1">
									<?php $z('text_enabled') ?>
								</option>
								<option value="0" selected="selected">
									<?php $z('text_disabled') ?>
								</option>
								<?php } ?>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<?php $z('Name field:') ?>
						</td>
						<td>
							<select name="occm_name_field">
								<option value="0" <?php echo $occm_name_field ? '' : 'selected="selected"' ?>>
									<?php $z('text_disabled') ?>
								</option>
								<option value="1" <?php echo 1 != $occm_name_field ? '' : 'selected="selected"' ?>>
									<?php $z('text_enabled') ?>
								</option>
								<option value="2" <?php echo 2 != $occm_name_field ? '' : 'selected="selected"' ?>>
									<?php $z('Required') ?>
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<?php $z('Phone field:') ?>
						</td>
						<td>
							<select name="occm_phone_field">
								<option value="0" <?php echo $occm_phone_field ? '' : 'selected="selected"' ?>>
									<?php $z('text_disabled') ?>
								</option>
								<option value="1" <?php echo 1 != $occm_phone_field ? '' : 'selected="selected"' ?>>
									<?php $z('text_enabled') ?>
								</option>
								<option value="2" <?php echo 2 != $occm_phone_field ? '' : 'selected="selected"' ?>>
									<?php $z('Required') ?>
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<?php $z('Mail field:') ?>
						</td>
						<td>
							<select name="occm_mail_field">
								<option value="0" <?php echo $occm_mail_field ? '' : 'selected="selected"' ?>>
									<?php $z('text_disabled') ?>
								</option>
								<option value="1" <?php echo 1 != $occm_mail_field ? '' : 'selected="selected"' ?>>
									<?php $z('text_enabled') ?>
								</option>
								<option value="2" <?php echo 2 != $occm_mail_field ? '' : 'selected="selected"' ?>>
									<?php $z('Required') ?>
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<?php $z('Comment field:') ?>
						</td>
						<td>
							<select name="occm_comment_field">
								<option value="0" <?php echo $occm_comment_field ? '' : 'selected="selected"' ?>>
									<?php $z('text_disabled') ?>
								</option>
								<option value="1" <?php echo 1 != $occm_comment_field ? '' : 'selected="selected"' ?>>
									<?php $z('text_enabled') ?>
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<?php $z('Order status:') ?>
							<br><span class="help"><?php $z('order_status_help') ?></span>
						</td>
						<td>
							<select name="occm_order_status_id">
								<?php foreach ($z->m('localisation/order_status')->getOrderStatuses() as $orderStatus) { ?>
									<?php if ($orderStatus['order_status_id'] == $occm_order_status_id) { ?>
										<option value="<?php echo $orderStatus['order_status_id']; ?>" selected="selected"><?php echo $orderStatus['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $orderStatus['order_status_id']; ?>"><?php echo $orderStatus['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<?php $z('Image size:') ?>
							<br><span class="help"><?php $z('image_size_help') ?></span>
						</td>
						<td>
							<input type="text" name="occm_image_size_x" value="<?php echo $occm_image_size_x ?>" size="3">x
							<input type="text" name="occm_image_size_y" value="<?php echo $occm_image_size_y ?>" size="3">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<?php echo $footer; ?>