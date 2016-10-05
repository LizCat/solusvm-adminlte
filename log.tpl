<?php include $this->tpl_header; ?>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		<?= $_lang['logheader']; ?> (<?= $this->vhostname; ?> <?= $this->vipaddress; ?>)
	</h1>
	<ol class="breadcrumb">
		<li><a href="home.php"><i class="fa fa-dashboard"></i> <?= $_lang['controlpanelname']; ?></a></li>
		<li><?= $this->vhostname; ?></li>
		<li class="active"><?= $_lang['logheader']; ?></li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<?php if ($this->logdata) { ?>
					<div class="box-body no-padding" style="overflow-x:auto">
						<table class="table table-striped" id="servers"><tbody>
							<tr>
								<th nowrap><?= $_lang['logdate']; ?></th>
								<th nowrap><?= $_lang['logaction']; ?></th>
								<th nowrap><?= $_lang['logip']; ?></th>
								<th nowrap><?= $_lang['logstatus']; ?></th>
							</tr>
							<?php foreach($this->logdata as $log) { ?>
								<tr>
									<td nowrap><?= date('Y/m/d h:i:s A', $log['date']); ?></td>
									<td nowrap><?= $log["action"]; ?></td>
									<td nowrap><?= $log["requestipaddress"]; ?></td>
									<td nowrap><?= $log["status"]; ?></td>
								</tr>
							<?php } ?>
						</tbody></table>
					</div>
					<div class="box-footer">
						<a href="control.php?_v=<?= $this->vid; ?>" class="btn btn-default btn-sm btn-flat"><?= $_lang['backbutton']; ?></a>
						<div class="pull-right"><?=$this->paginatejm;?>&nbsp;<?=$this->paginateipp;?></div>
					</div>
				<?php } else { ?>
					<div class="box-body">
						<?=$_lang['lognodata'];?>
					</div>
					<div class="box-footer">
						<a href="control.php?_v=<?= $this->vid; ?>" class="btn btn-default btn-sm btn-flat"><?= $_lang['backbutton']; ?></a>
					</div>
				<?php } ?>
			</div>
		</div>
	</div>
</section>

<?php include $this->tpl_footer; ?>
