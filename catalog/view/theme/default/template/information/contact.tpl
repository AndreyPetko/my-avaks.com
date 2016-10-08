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






        </div>
      </div>
        <div class="contact-info">
        <div class="row">
          <div class="col-sm-4">
            <img src="/catalog/view/theme/default/images/contacts_13.png">
            <p><?php echo $telephone; ?> - интернет-магазин<br>
              8 (3812)489-189 - магазин<br>
              8 (3812)438-248 - факс<br>
              8-953-393-65-22- заказ установок<br>
              8-913-61-03-493- ОПТ</p>
            </div>
            <div class="col-sm-4">
              <img src="/catalog/view/theme/default/images/contacts_10.png">
              <p>503737@mail.ru- общие вопросы<br>
                89136103493@mail.ru- ОПТ</p>
              </div>
              <div class="col-sm-4">
                <img src="/catalog/view/theme/default/images/contacts_16.png">
                <p>avaks503737- общие вопросы <br>
                  avaks75 -ОПТ</p>
                </div>
               <!--  <div class="col-sm-3">
                  <img src="/catalog/view/theme/default/images/contacts_19.png">
                  <p>434999771</p>
                </div> -->
              </div>
            </div>
            <div class="contact-map">
              <div class="row">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2289.757935896385!2d73.32223331530133!3d54.97734405899721!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x43ab019273a55da9%3A0xb7eee07a353f2c00!2sAvaks!5e0!3m2!1sru!2sru!4v1466539409428" width="100%" height="300" frameborder="0"  allowfullscreen></iframe>
              </div>
            </div>
          </div>
        </div>



            <?php echo $content_bottom; ?></div>
            <?php echo $column_right; ?></div>
          </div>
          <?php echo $footer; ?>
