<?php include $this->tpl_lang_path; ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<title><?= $_lang['pagetitle']; ?></title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.6 -->
	<link rel="stylesheet" href="<?= $this->tpl_asset_path; ?>AdminLTE/bootstrap/css/bootstrap.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<?= $this->tpl_asset_path; ?>AdminLTE/dist/css/AdminLTE.min.css">
	<!-- NyaVM Custom CSS -->
	<link rel="stylesheet" href="<?= $this->tpl_asset_path; ?>style.css">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body class="hold-transition login-page">
<div class="login-box">
	<div class="login-logo">
		<a href="javascript:;">
			<!--<b>Nya</b>VM-->
			<img src="<?= $this->tpl_asset_path; ?>images/login-logo.png" height="44">
		</a>
	</div>
	<!-- /.login-logo -->
	<div class="login-box-body">
		<?php if ($this->maintenancemode) { ?>
			<p class="login-box-msg"><?= $this->mmmsg; ?></p>
		<?php } elseif ($this->error == "blacklisted") { ?>
			<p class="login-box-msg"><?= $_lang['loginblacklist']; ?></p>
		<?php } else { ?>
			<p class="login-box-msg"><?= $_lang['loginboxheader']; ?></p>

			<?php if ($this->error == "failed") { ?>
				<p class="login-box-msg" style="color:#F00"><?= $_lang['loginfailed']; ?></p>
			<?php } ?>

			<form action="" method="post" name="">
				<div class="form-group">
					<input name="username" id="username" type="text" class="form-control" placeholder="<?= $_lang['loginusername']; ?>">
				</div>

				<div class="form-group">
					<input name="password" id="password" type="password" class="form-control" placeholder="<?= $_lang['loginpassword']; ?>">
				</div>

				<div class="form-group">
					<input name="Submit" type="submit" value="<?= $_lang['loginbutton']; ?>" class="btn bg-purple btn-block btn-flat">
				</div>
			</form>

			<!--
			<form action="" method="post" name="lang">
				<div class="form-group">
					<select name="language" class="form-control" id="language" ONCHANGE="document.lang.submit();">
						<?php foreach($this->langoption as $language) { ?>
							<option value="<?= $language; ?>" <?php if($language == $this->loginlang) { echo 'selected="selected"'; } ?>><?= $language; ?></option>
						<?php } ?>
					</select>
				</div>
			</form>
			-->

			<a href="lostpassword.php"><?= $_lang['loginforgotpassword']; ?></a><br>

		<?php } ?>

	</div>
	<!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="<?= $this->tpl_asset_path; ?>AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<?= $this->tpl_asset_path; ?>AdminLTE/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
