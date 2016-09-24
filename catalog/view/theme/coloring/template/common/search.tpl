<div id="search" class="input-group">	
	<span class="input-group-btn categories">
    <button id="change_category" type="button" class="btn dropdown-toggle" data-toggle="dropdown">
			<?php foreach ($search_categories as $search_category) {if ($search_category['category_id'] == $category_id) {$search_text_category = $search_category['name'];}}?>
			<span class="category-name"><?php echo $search_text_category; ?>&nbsp;</span>&nbsp;<span class="fa fa fa-angle-down caretalt"></span></span>
		</button>
    <ul class="dropdown-menu">
			<li><a href="#" onclick="return false;" id="0"><?php echo $search_text_category_alt; ?></a></li>
			<?php foreach ($search_categories as $search_category) { ?>
			<li><a href="#" onclick="return false;" id="<?php echo $search_category['category_id']; ?>"><?php echo $search_category['name']; ?></a></li>
			<?php } ?>
		</ul>
		<input id="selected_category" type="hidden" name="category_id" value="0" />
  </span>
  <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control" />
  <span class="input-group-btn">
    <button type="button" class="btn" id="search-button">
			<i class="glyphicon glyphicon-search"></i>
		</button>
  </span>
</div>
<script type="text/javascript">
$('#search a').click(function(){
	$("#selected_category").val($(this).attr('id'));
	$('#change_category').html('<span class="category-name">' + $(this).html() + '&nbsp;</span>&nbsp;<span class="fa fa fa-angle-down caretalt"></span>');
});
</script>
