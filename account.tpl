<?php include $this->tpl_header; ?>

<script type="text/javascript">
	$('.sidebar-menu .active').removeClass('active');
	$('.sidebar-menu .account').addClass('active');
</script>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		<?= $_lang['menumyaccount']; ?>
	</h1>
	<ol class="breadcrumb">
		<li><a href="home.php"><i class="fa fa-dashboard"></i> <?= $_lang['controlpanelname']; ?></a></li>
		<li class="active"><?= $_lang['menumyaccount']; ?></li>
	</ol>
</section>

<section class="content">
	<?php if ($this->firstnameshort) { ?>
		<div class="row">
			<div class="col-md-12">
				<div class="callout callout-danger">
					<h4>Error</h4>
					<p><?= $_lang['accountfirstnameshort']; ?></p>
				</div>
			</div>
		</div>
	<?php } ?>
	<?php if ($this->lastnameshort) { ?>
		<div class="row">
			<div class="col-md-12">
				<div class="callout callout-danger">
					<h4>Error</h4>
					<p><?= $_lang['accountlastnameshort']; ?></p>
				</div>
			</div>
		</div>
	<?php } ?>
	<?php if ($this->invalidemail) { ?>
		<div class="row">
			<div class="col-md-12">
				<div class="callout callout-danger">
					<h4>Error</h4>
					<p><?= $_lang['accountinvalidemail']; ?></p>
				</div>
			</div>
		</div>
	<?php } ?>
	<?php if ($this->settingssuccess) { ?>
		<div class="row">
			<div class="col-md-12">
				<div class="callout callout-success">
					<h4>Success</h4>
					<p><?= $_lang['accountsettingssuccess']; ?></p>
				</div>
			</div>
		</div>
	<?php } ?>

	<?php if ($this->nocurrentpass) { ?>
		<div class="row">
			<div class="col-md-12">
				<div class="callout callout-danger">
					<h4>Error</h4>
					<p><?= $_lang['accountspecifycurrentpass']; ?></p>
				</div>
			</div>
		</div>
	<?php } ?>
	<?php if ($this->passtooshort) { ?>
		<div class="row">
			<div class="col-md-12">
				<div class="callout callout-danger">
					<h4>Error</h4>
					<p><?= $_lang['accountpasstooshort']; ?></p>
				</div>
			</div>
		</div>
	<?php } ?>
	<?php if ($this->passnotmatch) { ?>
		<div class="row">
			<div class="col-md-12">
				<div class="callout callout-danger">
					<h4>Error</h4>
					<p><?= $_lang['accountpassnotmatch']; ?></p>
				</div>
			</div>
		</div>
	<?php } ?>
	<?php if ($this->passsuccess) { ?>
		<div class="row">
			<div class="col-md-12">
				<div class="callout callout-success">
					<h4>Success</h4>
					<p><?= $_lang['accountpasssuccess']; ?></p>
				</div>
			</div>
		</div>
	<?php } ?>

	<div class="row">
		<div class="col-md-6">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title"><?= $_lang['accountheader']; ?></h3>
				</div>
				<form action="" method="post" name="settings">
					<div class="box-body">
						<div class="form-group">
							<label for="firstname"><?= $_lang['accountfirstname']; ?></label>
							<input type="text" class="form-control" name="firstname" id="firstname" value="<?= $this->accountfirstname; ?>">
						</div>

						<div class="form-group">
							<label for="lastname"><?= $_lang['accountlastname']; ?></label>
							<input type="text" class="form-control" name="lastname" id="lastname" value="<?= $this->accountlastname; ?>">
						</div>

						<div class="form-group">
							<label for="emailaddress"><?= $_lang['accountemailaddress']; ?></label>
							<input type="email" class="form-control" name="emailaddress" id="emailaddress" value="<?= $this->accountemailaddress; ?>">
						</div>

						<div class="form-group">
							<label for="company"><?= $_lang['accountcompany']; ?></label>
							<input type="text" class="form-control" name="company" id="company" value="<?= $this->accountcompany; ?>">
						</div>

						<div class="form-group">
							<label for="language"><?= $_lang['accountlanguage']; ?></label>
							<select class="form-control" name="language" id="language">
								<?php foreach($this->langoption as $language) { ?>
									<option value="<?= $language; ?>" <?php if ($language == $this->accountlang) { echo 'selected="selected"'; } ?>>
									    <?= $language; ?>
									</option>
								<?php } ?>
							</select>
						</div>

						<div>
							<label for="loginalert">
								<input type="checkbox" name="loginalert" id="loginalert" <?php if ($this->loginalert) { echo 'checked="checked"'; } ?>> <?= $_lang['accountloginalert']; ?>
							</label>
						</div>

					</div>

					<div class="box-footer">
						<input class="btn bg-purple btn-flat pull-right" name="updatesettings" type="submit" value="<?= $_lang['accountupdatesettingsbutton']; ?>">
					</div>
				</form>

				<script>
					jQuery(document).ready(function($) {
					    $('#loginalert').iCheck({
					        checkboxClass: 'icheckbox_square-purple',
					        radioClass: 'iradio_square-purple',
					        increaseArea: '20%' // optional
					    });
					});
				</script>
			</div>
		</div>
		<div class="col-md-6">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title"><?= $_lang['accountchangeaccountpassword']; ?></h3>
				</div>
				<form action="" method="post" name="password">
					<div class="box-body">
						<div class="form-group">
							<label for="firstname"><?= $_lang['accountcurrentpassword']; ?></label>
							<input type="password" class="form-control" name="currentpassword" id="currentpassword">
						</div>

						<div class="form-group">
							<label for="lastname"><?= $_lang['accountnewpassword']; ?></label>
							<input type="password" class="form-control" name="newpassword" id="newpassword">
						</div>

						<div class="form-group">
							<label for="emailaddress"><?= $_lang['accountrepeatnewpassword']; ?></label>
							<input type="password" class="form-control" name="newpasswordrepeat" id="newpasswordrepeat">
						</div>
					</div>

					<div class="box-footer">
						<input class="btn bg-purple btn-flat pull-right" name="updatepassword" type="submit" value="<?= $_lang['accountupdatepasswordbutton']; ?>">
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<?php include $this->tpl_footer; ?>
