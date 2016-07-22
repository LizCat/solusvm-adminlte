<?php include $this->tpl_header; ?>

<script type="text/javascript">
	$('.sidebar-menu .active').removeClass('active');
</script>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		<?= $_lang['systemerrorheader']; ?>
	</h1>
	<ol class="breadcrumb">
		<li><a href="home.php"><i class="fa fa-dashboard"></i> <?= $_lang['controlpanelname']; ?></a></li>
		<li class="active"><?= $_lang['systemerrorheader']; ?></li>
	</ol>
</section>

<section class="content">
	<div class="error-page">
		<h2 class="headline text-red">500</h2>
		<div class="error-content">
			<h3>
				<i class="fa fa-warning text-red"></i>
				<?= $_lang['systemerrorheader']; ?>
			</h3>
			<p><?= $_lang['systemerrormsg']; ?></p>
		</div>
	</div>
	<!-- /.error-page -->
</section>

<?php include $this->tpl_footer; ?>
