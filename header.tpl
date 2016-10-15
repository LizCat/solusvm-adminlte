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
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<?= $this->tpl_asset_path; ?>AdminLTE/dist/css/AdminLTE.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
			 folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="<?= $this->tpl_asset_path; ?>AdminLTE/dist/css/skins/skin-purple-light.min.css">
	<!-- iCheck -->
	<link rel="stylesheet" href="<?= $this->tpl_asset_path; ?>AdminLTE/plugins/iCheck/square/purple.css">
	<!-- NyaVM Custom CSS -->
	<link rel="stylesheet" href="<?= $this->tpl_asset_path; ?>style.css">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

	<!-- jQuery 2.2.3 -->
	<script src="<?= $this->tpl_asset_path; ?>AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="<?= $this->tpl_asset_path; ?>AdminLTE/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<?= $this->tpl_asset_path; ?>AdminLTE/dist/js/app.min.js"></script>
	<!-- iCheck -->
	<script src="<?= $this->tpl_asset_path; ?>AdminLTE/plugins/iCheck/icheck.min.js"></script>
	<!-- iCheck -->
	<script src="<?= $this->tpl_asset_path; ?>jquery.backstretch.min.js"></script>
	<!-- NyaVM -->
	<script src="<?= $this->tpl_asset_path; ?>script.js"></script>
</head>

<body class="hold-transition skin-purple-light sidebar-mini">

<!-- Modal -->
<div class="modal fade" id="actionModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="actionTitle">Modal title</h4>
			</div>
			<div class="modal-body" id="actionMsg">
				...
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-flat" data-dismiss="modal" id="closeBtn"><?= $_lang[vserveralertno]; ?></button>
				<a type="button" class="btn bg-purple btn-flat" id="actionLink" href="#"><?= $_lang[vserveralertyes]; ?></a>
			</div>
		</div>
	</div>
</div>

<div class="wrapper">

	<script type="text/javascript">
		var commonModals = {
			logout: {
				title: "<?= $_lang['logout']; ?>",
				msg: "<?=$_lang['logoutalert'];?>",
				url: "logout.php"
			}
		};
		jQuery.extend(modals, commonModals);
	</script>

	<header class="main-header">

		<!-- Logo -->
		<a href="home.php" class="logo">
			<!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"><b>N</b>ya</span>
			<!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><b>Nya</b>VM</span>
		</a>

		<!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top">
			<!-- Sidebar toggle button-->
			<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
				<span class="sr-only">Toggle navigation</span>
			</a>
			<!-- Navbar Right Menu -->
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<li>
						<a href="javascript:dialogOpen('logout');">
							<i class="fa fa-sign-out" aria-hidden="true"></i>
							<span class="hidden-xs"><?= $_lang['logout']; ?></span>
						</a>
					</li>
				</ul>
			</div>

		</nav>
	</header>
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar">
		<!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar">
			<!-- Sidebar user panel -->
			<div class="user-panel">
				<div class="info">
					<p><?= $this->fname; ?> <?= $this->lname; ?></p>
					<a href="#"><?= $_lang['welcomeback']; ?></a>
				</div>
			</div>
			<!-- sidebar menu: : style can be found in sidebar.less -->
			<ul class="sidebar-menu">
				<li class="home active">
					<a href="home.php">
						<i class="fa fa-dashboard"></i>
						<span><?= $_lang['menuhome']; ?></span>
					</a>
				</li>
				<?php if($this->showdnsmenu) {?>
					<li class="dns">
						<a href="dns.php">
							<i class="fa fa-globe"></i>
							<?=$_lang['menudns'];?>
						</a>
					</li>
				<?php } ?>
				<?php if($this->showhelp) { ?>
					<li class="help">
						<a href="http://vpsmanual.com" target="_blank">
							<i class="fa fa-question"></i>
							<?=$_lang['menuhelp'];?>
						</a>
					</li>
				<?php } ?>
				<li class="account">
					<a href="account.php">
						<i class="fa fa-user"></i>
						<span><?= $_lang['menumyaccount']; ?></span>
					</a>
				</li>
			</ul>
		</section>
		<!-- /.sidebar -->
	</aside>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">

		<section class="content-header" id="loginAsAdmin" style="display:none">
			<div class="row">
				<div class="col-md-12">
					<div class="callout callout-info" style="margin-bottom:0">
						<h4>Title</h4>
						<a href="#"></a>
					</div>
				</div>
			</div>
		</section>
