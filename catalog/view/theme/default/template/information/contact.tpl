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


  <div id="contacts">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="main-title">
            <h1>Контакты</h1>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-7">
          <div class="contact-INN">
            <p>
              ИНН: 552830000704<br>
              ОГРН:  308554312000123
            </p>
          </div>
          <div class="contact-home">
            <div class="row ">

              <div class="col-sm-6">
                <img src="/catalog/view/theme/default/images/contacts_03.png">
                <p><?php echo $address; ?></p>
              </div>
              <div class="col-sm-6">
                <img src="/catalog/view/theme/default/images/contacts_05.png">
                <p><?php echo $text_open; ?>:<br> <?php echo $open; ?></p>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-5">
          <div class="contact-form-avaks">
            <h5>Форма обратной связи</h5>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" >
              <div class="row">

                <div class="col-xs-2">
                  <p>Имя*</p>
                </div>
                <div class="col-xs-10">
                <input type="text" name="name" id="input-name"  value="<?php echo $name; ?>">
                  <?php if ($error_name) { ?>
                  <div class="text-danger"><?php echo $error_name; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="row">
                <div class="col-xs-2">
                  <p> Email*</p>
                </div>
                <div class="col-xs-10">
                  <input type="text" name="email" id="input-email" for="input-email" value="<?php echo $email; ?>">
                  <?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="row">
                <div class="col-xs-2">
                  <p>Сообщение*</p>
                </div>
                <div class="col-xs-10">
                  <textarea id="input-enquiry" name="enquiry"></textarea> 
                  <?php if ($error_enquiry) { ?>
                  <div class="text-danger"><?php echo $error_enquiry; ?></div>
                  <?php } ?>
                </div>

              </div>
              <?php echo $captcha; ?>
              <input type="submit" value="Отправить" >
            </form>
          </div>


<!--           <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <fieldset>
              <legend><?php echo $text_contact; ?></legend>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                  <?php if ($error_name) { ?>
                  <div class="text-danger"><?php echo $error_name; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                  <?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                <div class="col-sm-10">
                  <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
                  <?php if ($error_enquiry) { ?>
                  <div class="text-danger"><?php echo $error_enquiry; ?></div>
                  <?php } ?>
                </div>
              </div>
              <?php echo $captcha; ?>
            </fieldset>
            <div class="buttons">
              <div class="pull-right">
                <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
              </div>
            </div>
          </form> -->



        </div>
      </div>
        <div class="contact-info">
        <div class="row">
          <div class="col-sm-3">
            <img src="/catalog/view/theme/default/images/contacts_13.png">
            <p><?php echo $telephone; ?> - интернет-магазин<br>
              8 (3812)489-189 - магазин<br>
              8 (3812)438-248 - факс<br>
              8-953-393-65-22- заказ установок<br>
              8-913-61-03-493- ОПТ</p>
            </div>
            <div class="col-sm-3">
              <img src="/catalog/view/theme/default/images/contacts_10.png">
              <p>503737@mail.ru- общие вопросы<br>
                89136103493@mail.ru- ОПТ</p>
              </div>
              <div class="col-sm-3">
                <img src="/catalog/view/theme/default/images/contacts_16.png">
                <p>avaks503737- общие вопросы <br>
                  avaks75 -ОПТ</p>
                </div>
                <div class="col-sm-3">
                  <img src="/catalog/view/theme/default/images/contacts_19.png">
                  <p>434999771</p>
                </div>
              </div>
            </div>
            <div class="contact-map">
              <div class="row">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2289.757935896385!2d73.32223331530133!3d54.97734405899721!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x43ab019273a55da9%3A0xb7eee07a353f2c00!2sAvaks!5e0!3m2!1sru!2sru!4v1466539409428" width="100%" height="300" frameborder="0"  allowfullscreen></iframe>
              </div>
            </div>
          </div>
        </div>


<!-- 
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
            <h3><?php echo $text_location; ?></h3>
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="row">
                  <?php if ($image) { ?>
                  <div class="col-sm-3"><img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" class="img-thumbnail" /></div>
                  <?php } ?>
                  <div class="col-sm-3"><strong><?php echo $store; ?></strong><br />
                    <address>
                      <?php echo $address; ?>
                    </address>
                    <?php if ($geocode) { ?>
                    <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                    <?php } ?>
                  </div>
                  <div class="col-sm-3"><strong><?php echo $text_telephone; ?></strong><br>
                    <?php echo $telephone; ?><br />
                    <br />
                    <?php if ($fax) { ?>
                    <strong><?php echo $text_fax; ?></strong><br>
                    <?php echo $fax; ?>
                    <?php } ?>
                  </div>
                  <div class="col-sm-3">
                    <?php if ($open) { ?>
                    <strong><?php echo $text_open; ?></strong><br />
                    <?php echo $open; ?><br />
                    <br />
                    <?php } ?>
                    <?php if ($comment) { ?>
                    <strong><?php echo $text_comment; ?></strong><br />
                    <?php echo $comment; ?>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <?php if ($locations) { ?>
            <h3><?php echo $text_store; ?></h3>
            <div class="panel-group" id="accordion">
              <?php foreach ($locations as $location) { ?>
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
                </div>
                <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
                  <div class="panel-body">
                    <div class="row">
                      <?php if ($location['image']) { ?>
                      <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                      <?php } ?>
                      <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                        <address>
                          <?php echo $location['address']; ?>
                        </address>
                        <?php if ($location['geocode']) { ?>
                        <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                        <?php } ?>
                      </div>
                      <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                        <?php echo $location['telephone']; ?><br />
                        <br />
                        <?php if ($location['fax']) { ?>
                        <strong><?php echo $text_fax; ?></strong><br>
                        <?php echo $location['fax']; ?>
                        <?php } ?>
                      </div>
                      <div class="col-sm-3">
                        <?php if ($location['open']) { ?>
                        <strong><?php echo $text_open; ?></strong><br />
                        <?php echo $location['open']; ?><br />
                        <br />
                        <?php } ?>
                        <?php if ($location['comment']) { ?>
                        <strong><?php echo $text_comment; ?></strong><br />
                        <?php echo $location['comment']; ?>
                        <?php } ?>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <?php } ?>
            </div>
            <?php } ?>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
              <fieldset>
                <legend><?php echo $text_contact; ?></legend>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                    <?php if ($error_name) { ?>
                    <div class="text-danger"><?php echo $error_name; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                    <?php if ($error_email) { ?>
                    <div class="text-danger"><?php echo $error_email; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                  <div class="col-sm-10">
                    <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
                    <?php if ($error_enquiry) { ?>
                    <div class="text-danger"><?php echo $error_enquiry; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php echo $captcha; ?>
              </fieldset>
              <div class="buttons">
                <div class="pull-right">
                  <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
                </div>
              </div>
            </form> -->
            <?php echo $content_bottom; ?></div>
            <?php echo $column_right; ?></div>
          </div>
          <?php echo $footer; ?>
