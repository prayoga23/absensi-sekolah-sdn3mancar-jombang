<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Login Petugas Absensi</title>
   <link href="<?= base_url('public/assets2/css/material-dashboard.css'); ?>" rel="stylesheet" />
   <?= $this->include('templates/css'); ?>
   <style>
.logo-container {
    display: flex;
    justify-content: center;
    align-items: center;
}

.logo-container img {
    height: 80px; /* Atur tinggi logo sesuai kebutuhan */
    margin: 0 10px; /* Atur jarak antar logo */
}

@media (max-width: 768px) {
    .logo-container img {
        height: 60px; /* Atur tinggi logo untuk tampilan mobile */
        margin: 0 5px;
    }
}
</style>

</head>
<body>
<main class="main-content mt-0">
    <div class="page-header align-items-start min-vh-100" style="background-image: url('public/assets/img/mancar.jpg');">
        <span class="mask bg-gradient-dark opacity-6"></span>
        <div class="container my-auto">
            <div class="row">
                <div class="col-lg-4 col-md-8 col-12 mx-auto">
                    <div class="card z-index-0 fadeIn3 fadeInBottom">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                            <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
                            <div class="logo-container text-center my-2">
                                    <img src="public/assets/img/logo_jombang.png" alt="Logo" class="logo">
                                    <img src="public/assets/img/kemendikbud.png" alt="Logo" class="logo">
                                </div>
                                <h4 class=" font-weight-bolder text-center mt-3 mb-0" style="color: yellow;">LOGIN SISTEM INFORMASI PRESENSI KEHADIRAN SISWA SDN 3 MANCAR <br> KAB. JOMBANG KEC. PETERONGAN <br> MENGGUNAKAN QRCODE</h4>
                            </div>
                        </div>
                        <div class="card-body">
                            <?= view('\App\Views\admin\_message_block') ?>
                            <form action="<?= url_to('login') ?>" method="post">
                         <?= csrf_field() ?>
                         <div class="row">
                            <div class="col-md-12">
                               <?php if ($config->validFields === ['email']) : ?>
                                  <div class="form-group">
                                     <label class="bmd-label-floating"><?= lang('Auth.email') ?></label>
                                     <input type="email" class="form-control <?php if (session('errors.login')) : ?>is-invalid<?php endif ?>" name="login" autofocus>
                                     <div class="invalid-feedback">
                                        <?= session('errors.login') ?>
                                     </div>
                                  </div>
                               <?php else : ?>
                                  <div class="form-group">
                                     <label class="bmd-label-floating"><?= lang('Auth.emailOrUsername') ?></label>
                                     <input type="text" class="form-control <?php if (session('errors.login')) : ?>is-invalid<?php endif ?>" name="login" autofocus>
                                     <div class="invalid-feedback">
                                        <?= session('errors.login') ?>
                                     </div>
                                  </div>
                               <?php endif; ?>
                            </div>
                         </div>
                         <div class="row mt-3">
                            <div class="col-md-12">
                               <div class="form-group">
                                  <label class="bmd-label-floating">Password</label>
                                  <input type="password" name="password" class="form-control  <?php if (session('errors.password')) : ?>is-invalid<?php endif ?>">
                                  <div class="invalid-feedback">
                                     <?= session('errors.password') ?>
                                  </div>
                               </div>
                            </div>
                         </div>
                         <!-- <button type="submit" class="btn btn-primary col-md-12">Login</button> -->
                         <?php if ($config->allowRemembering) : ?>
                            <div class="form-check">
                               <label class="form-check-label">
                                  <input type="checkbox" name="remember" class="form-check-input" <?php if (old('remember')) : ?> checked <?php endif ?>>
                                  <?= lang('Auth.rememberMe') ?>
                               </label>
                            </div>
                         <?php endif; ?>

                         <br>

                         <button type="submit" class="btn btn-primary btn-block"><?= lang('Auth.loginAction') ?></button>

                         <?php if ($config->activeResetter) : ?>
                            <p><a href="<?= url_to('forgot') ?>"><?= lang('Auth.forgotYourPassword') ?></a></p>
                         <?php endif; ?>
                         <div class="clearfix"></div>
                      </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer position-absolute bottom-2 py-2 w-100">
            <div class="container">
                <div class="row align-items-center">
                    <div class="copyright text-center text-sm text-white text-lg-start">
                        © <script>
                            document.write(new Date().getFullYear())
                        </script>
                        Dibuat Oleh Erly Wahyuningtyas
                    </div>
                </div>
            </div>
        </footer>
    </div>
</main>
 
<script src="<?= base_url('public/assets2/js/core/popper.min.js') ?>" type="text/javascript"></script>
  <script src="<?= base_url('public/assets2/js/core/bootstrap.min.js') ?>" type="text/javascript"></script>
  <script src="<?= base_url('public/assets2/js/plugins/perfect-scrollbar.min.js') ?>" type="text/javascript"></script>
  <script src="<?= base_url('public/assets2/js/plugins/smooth-scrollbar.min.js') ?>" type="text/javascript"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
   <!-- Github buttons -->
   <script async defer src="https://buttons.github.io/buttons.js"></script>
   <?= $this->include('templates/js'); ?>
</body>
</html>
