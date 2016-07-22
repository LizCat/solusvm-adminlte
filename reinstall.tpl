<?php include $this->tpl_header; ?>

<script type="text/javascript">
	var reinstallModals = {
		reinstall: {
			title: "<?= $_lang['reinstallboxtitle']; ?>",
			msg: "<?=$_lang['reinstallboxmsg'];?>",
			callback: function() {
				document.reinstallvserver.submit();
			}
		}
	};
	jQuery.extend(modals, reinstallModals);
</script>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		<?= $_lang['reinstallboxtitle']; ?>
	</h1>
	<ol class="breadcrumb">
		<li><a href="home.php"><i class="fa fa-dashboard"></i> <?= $_lang['controlpanelname']; ?></a></li>
		<li class="active"><?= $_lang['reinstallboxtitle']; ?></li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<?php if ($this->msgsessuccess) { ?>
				<div class="callout callout-success">
					<h4>Success</h4>
					<p><?= $_lang[$this->msgsessuccess]; ?></p>
					<?php if ($this->vt == "kvm" && $_SESSION['reinstpasswd']) {
						echo "<p>". $_lang['reinstallpassword'] . " " . $_SESSION['reinstpasswd'] . "</p>";
					}
					if ($this->vt == "kvm" && $_SESSION['reininformation']) {
						echo "<p>" . $_SESSION['reininformation'] . "</p>";
					} ?>
				</div>
			<?php } ?>

			<?php if ($this->msgseserror) { ?>
				<div class="callout callout-danger">
					<h4>Error</h4>
					<p><?= $_lang[$this->msgerror]; ?></p>
				</div>
			<?php } ?>

			<?php if ($this->noreinstall) { ?>
				<div class="callout callout-warning">
					<h4>Warning</h4>
					<p><?= $_lang['noreinstallmessage']; ?></p>
				</div>
			<?php } else { ?>
				<div class="box">
					<div class="box-header">
						<h3 class="box-title"><?= $_lang['reinstallheader']; ?> <?= $this->vhostname; ?> (<?= $this->vipaddress; ?>)</h3>
					</div>
					<?php if ($this->vt == "openvz" || $this->vt == "xen" || $this->vt == "xenhvm" || $this->vt == "kvm") { ?>
						<?php if ($this->showtemplates) { ?>
							<form action="" method="post" name="reinstallvserver" id="reinstallvserver">
								<input type="hidden" name="initiatereinstall" value="1">
								<div class="box-body no-padding">
									<table class="table"><tbody>
										<?php foreach ($this->templatedata as $template) { ?>
											<tr>
												<td class="reinstall-image">
													<img src="<?= $this->tpl_asset_path; ?>images/icons/<?= $template['distro']; ?>.jpg">
												</td>
												<td>
													<p><strong><?=$template['friendlyname'];?></strong></p>
													<p><?=$template['description'];?></p>
												</td>
												<td class="reinstall-radio">
													<?= $template['radio']; ?>
												</td>
											</tr>
										<?php } ?>
									</tbody></table>
								</div>

								<div class="box-footer">
									<a class="btn btn-default btn-flat" href="ontrol.php?_v=<?=$this->vid;?>"><?= $_lang['backbutton']; ?></a>
									<input class="btn bg-purple btn-flat pull-right" type="button" value="<?= $_lang['reinstallbutton']; ?>" onclick="dialogOpen('reinstall')">
								</div>
							</form>
						<?php } else { ?>
							<div class="box-body">
								<?= $_lang['reinstallnomediafound']; ?>
							</div>
							<div class="box-footer">
								<a class="btn btn-default btn-flat" href="ontrol.php?_v=<?=$this->vid;?>"><?= $_lang['backbutton']; ?></a>
							</div>
						<?php } ?>
					<?php } else { ?>
						<div class="box-body">
							<?= $_lang['reinstallvtnotsupported']; ?>
						</div>
						<div class="box-footer">
							<a class="btn btn-default btn-flat" href="ontrol.php?_v=<?=$this->vid;?>"><?= $_lang['backbutton']; ?></a>
						</div>
					<?php } ?>

					<script>
						jQuery(document).ready(function($) {
						    $('.reinstall-radio input').iCheck({
						        checkboxClass: 'icheckbox_square-purple',
						        radioClass: 'iradio_square-purple',
						        increaseArea: '20%' // optional
						    });
						    $('tr').click(function() {
						        $(this).find('.reinstall-radio').iCheck('check');
						    });
						});
					</script>
				</div>
			<?php } ?>
		</div>
	</div>
</section>

<?php include $this->tpl_footer; ?>
