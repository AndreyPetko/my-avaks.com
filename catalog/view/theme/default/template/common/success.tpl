<?php echo $header; ?>
<div class="container">
 <div id="breadcrumps">
    <a href="<?php echo $home; ?>">
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
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>