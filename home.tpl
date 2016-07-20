<?php include $this->tpl_header; ?>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		<?= $_lang['homeheader']; ?>
	</h1>
	<ol class="breadcrumb">
		<li><a href="home.php"><i class="fa fa-dashboard"></i> <?= $_lang['controlpanelname']; ?></a></li>
		<li class="active"><?= $_lang['homeheader']; ?></li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<?php if ($this->vservers) { ?>
					<div class="box-body no-padding" style="overflow-x:auto">
						<table class="table table-striped" id="servers"><tbody>
							<tr>
								<th nowrap><?= $_lang['homevserverhostname']; ?></th>
								<th nowrap><?= $_lang['homevserveripaddress']; ?></th>
								<th nowrap><?= $_lang['homevserveroperatingsystem']; ?></th>
								<th nowrap><?= $_lang['homevservermemory']; ?></th>
								<th nowrap><?= $_lang['homevserverdisk']; ?></th>
								<th nowrap></th>
							</tr>
							<?php foreach($this->vservers as $vps) { ?>
								<tr class="with-btn-sm">
									<td nowrap>
										<a href="control.php?_v=<?= $vps['vstring']; ?>"><?= $vps["hostname"]; ?></a>
									</td>
									<td nowrap><?= $vps["mainipaddress"]; ?></td>
									<td nowrap><?= $vps["template"]; ?></td>
									<td nowrap><?= $vps["memory"]; ?></td>
									<td nowrap><?= $vps["disk"]; ?></td>
									<td nowrap><a href="control.php?_v=<?= $vps['vstring']; ?>" class="btn bg-purple btn-flat btn-sm"><?= $_lang['homemanagebutton']; ?></a></td>
								</tr>
							<?php } ?>
						</tbody></table>
					</div>
				<?php } else { ?>
					<div class="box-body">
						<?=$_lang['homenovirtualservers'];?>
					</div>
				<?php } ?>
			</div>
		</div>
	</div>
</section>

<?php include $this->tpl_footer; ?>
