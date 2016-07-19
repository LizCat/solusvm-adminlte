<?php include $this->tpl_header; ?>

<script type="text/javascript">
var actionUrlBase = 'control.php?_v=<?= $this->vid; ?>&_a=';
var modals = {
	kvmreconfigure: {
		title: "<?= $_lang['vserverkvmreconfigureboxtitle']; ?>",
		msg: "<?= $_lang['vserverkvmreconfigureboxmsg']; ?>"
	},
	poweroff: {
		title: "<?= $_lang['vserverpoweroffboxtitle']; ?>",
		msg: "<?= $_lang['vserverpoweroffboxmsg']; ?>"
	},
	pxeenable: {
		title: "<?= $_lang['vserverpxeenableboxtitle']; ?>",
		msg: "<?= $_lang['vserverpxeenableboxmsg']; ?>"
	},
	pxedisable: {
		title: "<?= $_lang['vserverpxedisableboxtitle']; ?>",
		msg: "<?= $_lang['vserverpxedisableboxmsg']; ?>"
	},
	tunenable: {
		title: "<?= $_lang['vservertunenableboxtitle']; ?>",
		msg: "<?= $_lang['vservertunenableboxmsg']; ?>"
	},
	tundisable: {
		title: "<?= $_lang['vservertundisableboxtitle']; ?>",
		msg: "<?= $_lang['vservertundisableboxmsg']; ?>"
	},
	pppenable: {
		title: "<?= $_lang['vserverpppenableboxtitle']; ?>",
		msg: "<?= $_lang['vserverpppenableboxmsg']; ?>"
	},
	pppdisable: {
		title: "<?= $_lang['vserverpppdisableboxtitle']; ?>",
		msg: "<?= $_lang['vserverpppdisableboxmsg']; ?>"
	},
	reboot: {
		title: "<?= $_lang['vserverrebootboxtitle']; ?>",
		msg: "<?= $_lang['vserverrebootboxmsg']; ?>"
	},
	boot: {
		title: "<?= $_lang['vserverbootboxtitle']; ?>",
		msg: "<?= $_lang['vserverbootboxmsg']; ?>"
	},
	shutdown: {
		title: "<?= $_lang['vservershutdownboxtitle']; ?>",
		msg: "<?= $_lang['vservershutdownboxmsg']; ?>"
	}
};
jQuery(document).ready(function($) {
	window.dialogOpen = function(action) {
		var url = actionUrlBase + action;
		$('#actionTitle').text(modals[action].title);
		$('#actionMsg').text(modals[action].msg);
		$('#actionLink').attr('href', url);
		$('#actionModal').modal('show');
	};
});
</script>

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
				<button type="button" class="btn btn-default btn-flat" data-dismiss="modal"><?= $_lang[vserveralertno]; ?></button>
				<a type="button" class="btn btn-primary btn-flat" id="actionLink" href="#"><?= $_lang[vserveralertyes]; ?></a>
			</div>
		</div>
	</div>
</div>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		VPS Control
	</h1>
	<ol class="breadcrumb">
		<li><a href="home.php"><i class="fa fa-dashboard"></i> Dashboard</a></li>
		<li class="active">VPS Control</li>
	</ol>
</section>

<!-- Main content -->
<section class="content">
	<?php if ($this->msgpxe) { ?>
		<div class="row">
			<div class="col-md-12">
				<div class="callout callout-warning">
					<h4>Notice</h4>

					<p><?= $_lang['vserverpxeenabled']; ?></p>
					<input class="btn btn-warning btn-flat" name="pxedisable" type="button" value="<?= $_lang['vserverpxebuttondisable']; ?>" onClick="dialogOpen('pxedisable')">
				</div>
			</div>
		</div>
	<?php } ?>

	<?php if ($this->msgsuccess) { ?>
		<div class="row">
			<div class="col-md-12">
				<div class="callout callout-success">
					<h4>Success</h4>

					<p><?= $_lang[$this->msgsessuccess]; ?></p>
					<?php if ($this->msgsessuccess == "vserverpxeenablesuccess") { ?>
						<input class="btn btn-success btn-flat" name="vnc" type="button" value="<?= $_lang['vservervncbutton']; ?>" onClick="window.location='remote.php?_v=<?= $this->vid; ?>'">
					<?php } ?>
				</div>
			</div>
		</div>
	<?php } ?>

	<?php if ($this->msgerror) { ?>
		<div class="row">
			<div class="col-md-12">
				<div class="callout callout-danger">
					<h4>Error</h4>

					<p><?= $_lang[$this->msgseserror]; ?></p>
				</div>
			</div>
		</div>
	<?php } ?>

	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title"><?= $this->vhostname; ?> (<?= $this->vipaddress; ?>)</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body no-padding">
					<table class="table table-striped"><tbody>
						<tr>
							<td nowrap class="status-name"><?= $_lang['vserverstatuslabel']; ?></td>
							<td>
								<?php if ($this->vstatus == "Suspended") { ?>
									<span style='color: #000'><?= $_lang['vserverstatesuspended']; ?></span>
								<?php } elseif ($this->vstatus == "Online") { ?>
									<span style='color: #090'><?= $_lang['vserverstateonline']; ?></span>
								<?php } elseif ($this->vstatus == "Offline") { ?>
									<span style='color: #F00'><?= $_lang['vserverstateoffline']; ?></span>
								<?php } ?>
							</td>
						</tr>

						<tr>
							<td nowrap class="status-name"><?= $_lang['vserverhostnamelabel']; ?></td>
							<td><?= $this->vhostname; ?></td>
						</tr>

						<tr>
							<td nowrap class="status-name"><?= $_lang['vserveripaddresslabel']; ?></td>
							<td><?= $this->vipaddress; ?></td>
						</tr>

						<tr>
							<td nowrap class="status-name"><?= $_lang['vserveroperatingsystemlabel']; ?></td>
							<td><?= $this->vtemplate; ?></td>
						</tr>

						<tr>
							<td nowrap class="status-name"><?= $_lang['vserveripv4label']; ?></td>
							<td><?= $this->v4; ?></td>
						</tr>

						<tr>
							<td nowrap class="status-name"><?= $_lang['vserveripv6label']; ?></td>
							<td><?= $this->v6; ?></td>
						</tr>

						<tr>
							<td nowrap class="status-name"><?= $_lang['vservernodelabel']; ?></td>
							<td><?= $this->vnode; ?></td>
						</tr>

						<tr>
							<td nowrap class="status-name"><?= $_lang['vserverbandwidthlabel']; ?></td>
							<td><?= $this->totalbw; ?></td>
						</tr>

						<tr>
							<td nowrap class="status-name"><?= $_lang['vserverdiskspacelabel']; ?></td>
							<td><?= $this->totalhdd; ?><?= $this->secondaryhdd; ?></td>
						</tr>

						<tr>
							<td nowrap class="status-name"><?= $_lang['vservermemorylabel']; ?></td>
							<td><?= $this->totalmemalloc; ?></td>
						</tr>

						<tr>
							<td nowrap class="status-name"><?= $_lang['vservervtlabel']; ?></td>
							<td><?= substr($this->vtypename, 1, -1); ?></td>
						</tr>

						<tr>
							<td nowrap class="status-name">
								<?php if ($this->swaptype=='swap') {
									echo $_lang['vserverswaplabel'];
								} elseif ($this->swaptype=='vswap') {
									echo $_lang['vservervswaplabel'];
								} else {
									echo $_lang['vserverburstlabel'];
								} ?>
							</td>
							<td><?= $this->totalswapalloc; ?></td>
						</tr>

					</tbody></table>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<?php if ($this->vt == "openvz" || $this->vt == "xen") {
						if ($this->showconsole != "1") { ?>
							<a class="btn btn-success btn-flat" href="remote.php?_v=<?= $this->vid; ?>"><?= $_lang['vserverconsolebutton']; ?></a>
						<?php }
					} else { ?>
						<a class="btn btn-success btn-flat" href="remote.php?_v=<?= $this->vid; ?>"><?= $_lang['vservervncbutton']; ?></a>
					<?php } ?>

					<a class="btn btn-default btn-flat pull-right box-btn-right" href="log.php?_v=<?= $this->vid; ?>"><?= $_lang['vserverlogbutton']; ?></a>
					<a class="btn btn-primary btn-flat pull-right box-btn-right" href="control.php?_v=<?= $this->vid; ?>"><?= $_lang['vserverrefreshbutton']; ?></a>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-body no-padding" style="overflow-x:auto">
					<table class="table"><tbody>
						<tr>
							<td nowrap class="status-name"><?= $_lang['vserverbandwidthusagelabel']; ?></td>
							<td nowrap style="width:120px">
								<div class="progress progress-xs">
									<div class="progress-bar" style="width:<?= $this->percentbw; ?>%;background-color:<?= $this->percentbwc; ?>"></div>
								</div>
							</td>
							<td nowrap style="width:40px"><span class="badge bg-light-blue"><?= $this->percentbw; ?>%</span></td>
							<td nowrap><?= $this->usedbw; ?> <?= $_lang['vserverbarof']; ?> <?= $this->totalbw; ?> <?= $_lang['vserverbarused']; ?> / <?= $this->freebw; ?> <?= $_lang['vserverbarfree']; ?></td>
						</tr>

						<?php if ($this->vt == "openvz") { ?>
							<tr>
								<td nowrap class="status-name"><?= $_lang['vservermemoryusagelabel']; ?></td>
								<td nowrap style="width:120px">
									<div class="progress progress-xs">
										<div class="progress-bar" style="width:<?= $this->percentmem; ?>%;background-color:<?= $this->percentmemc; ?>"></div>
									</div>
								</td>
								<td nowrap style="width:40px"><span class="badge bg-light-blue"><?= $this->percentmem; ?>%</span></td>
								<td nowrap><?= $this->usedmem; ?> <?= $_lang['vserverbarof']; ?> <?= $this->totalmem; ?> <?= $_lang['vserverbarused']; ?> / <?= $this->freemem; ?> <?= $_lang['vserverbarfree']; ?></td>
							</tr>

							<?php if ($this->vswapshow) { ?>
								<tr>
									<td nowrap class="status-name"><?= $_lang['vservervswapusagelabel']; ?></td>
									<td nowrap style="width:120px">
										<div class="progress progress-xs">
											<div class="progress-bar" style="width:<?= $this->percentvswap; ?>%;background-color:<?= $this->percentvswapc; ?>"></div>
										</div>
									</td>
									<td nowrap style="width:40px"><span class="badge bg-light-blue"><?= $this->percentvswap; ?>%</span></td>
									<td nowrap><?= $this->usedvswap; ?> <?= $_lang['vserverbarof']; ?> <?= $this->totalvswap; ?> <?= $_lang['vserverbarused']; ?> / <?= $this->freevswap; ?> <?= $_lang['vserverbarfree']; ?></td>
								</tr>
							<?php } ?>

						<?php } ?>

						<?php if ($this->vt == "openvz" || $this->vt == "xen") { ?>
							<tr>
								<td nowrap class="status-name"><?= $_lang['vserverdiskusagelabel']; ?></td>
								<td nowrap style="width:120px">
									<div class="progress progress-xs">
										<div class="progress-bar" style="width:<?= $this->percenthdd; ?>%;background-color:<?= $this->percenthddc; ?>"></div>
									</div>
								</td>
								<td nowrap style="width:40px"><span class="badge bg-light-blue"><?= $this->percenthdd; ?>%</span></td>
								<td nowrap><?= $this->usedhdd; ?> <?= $_lang['vserverbarof']; ?> <?= $this->totalhdd; ?> <?= $_lang['vserverbarused']; ?> / <?= $this->freehdd; ?> <?= $_lang['vserverbarfree']; ?></td>
							</tr>
						<?php } ?>

					</tbody></table>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title"><?= $_lang['vservertabcontrols']; ?></h3>
				</div>
				<div class="box-body no-padding table-responsive">
					<table class="table"><tbody>
						<tr class="with-btn-sm">
							<td nowrap class="status-name"><?= $_lang['vservertabgeneral']; ?></td>
							<td>
								<input class="btn btn-info btn-flat btn-sm" name="reboot" type="button" value="<?= $_lang['vserverrebootbutton']; ?>" onClick="dialogOpen('reboot')">
								<input class="btn btn-danger btn-flat btn-sm" name="shutdown" type="button" value="<?= $_lang['vservershutdownbutton']; ?>" onClick="dialogOpen('shutdown')">
								<input class="btn btn-success btn-flat btn-sm" name="boot" type="button" value="<?= $_lang['vserverbootbutton']; ?>" onClick="dialogOpen('boot')">
								<?php if ($this->vt == "kvm") { ?>
									<input class="submitbuttonyellow" name="poweroff" type="button" value="<?= $_lang['vserverpoweroffbutton']; ?>" onClick="dialogOpen('poweroff')">
									<input class="btn btn-primary btn-flat btn-sm" name="reconfigure" type="button" value="<?= $_lang['vserverkvmreconfigurebutton']; ?>" onClick="dialogOpen('kvmreconfigure')">
								<?php } ?>
								<?php if ($this->vt == "openvz" || $this->vt == "xen" || $this->vt == "xenhvm" || $this->vt == "kvm") { ?>
									<a class="btn btn-default btn-flat btn-sm" href="reinstall.php?_v=<?= $this->vid; ?>"><?= $_lang['vserverreinstallbutton']; ?></a>
								<?php } ?>
								<?php if ($this->centralbackup) { ?>
									<a class="btn btn-primary btn-flat btn-sm" href="centralbackup.php?_v=<?= $this->vid; ?>"><?= $_lang['vservercentralbackupbutton']; ?></a>
								<?php } ?>
								<?php if ($this->vt == "kvm" || $this->vt == "xenhvm") {
									if ($this->ispxe) {
										if ($this->pxeenabled) { ?>
											<input class="btn btn-danger btn-flat btn-sm" name="pxedisable" type="button" value="<?= $_lang['vserverpxebuttondisable']; ?>" onClick="dialogOpen('pxedisable')">
										<?php } else { ?>
											<input class="btn btn-success btn-flat btn-sm" name="pxeenable" type="button" value="<?= $_lang['vserverpxebuttonenable']; ?>" onClick="dialogOpen('pxeenable')">
										<?php }
									}
								} ?>
							</td>
						</tr>

						<?php if ($this->vt == "openvz" && ($this->extrastun || $this->extrasapp)) { ?>
							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vservertabsettings']; ?></td>
								<td>
									<?php if ($this->extrastun) {
										if ($this->tun == "1") { ?>
											<input type="button" name="disabletap" class="btn btn-danger btn-flat btn-sm" value="<?= $_lang['vserverdisabletunbutton']; ?>" onClick="dialogOpen('tundisable')">
										<?php } else { ?>
											<input type="button" name="enabletap" class="btn btn-success btn-flat btn-sm" value="<?= $_lang['vserverenabletunbutton']; ?>" onClick="dialogOpen('tunenable')">
										<?php }
									}
									if ($this->extrasppp) {
										if ($this->ppp == "1") { ?>
											<input type="button" name="disableppp" class="btn btn-danger btn-flat btn-sm" value="<?= $_lang['vserverdisablepppbutton']; ?>" onClick="dialogOpen('pppdisable')">
										<?php } else { ?>
											<input type="button" name="enableppp" class="btn btn-success btn-flat btn-sm" value="<?= $_lang['vserverenablepppbutton']; ?>" onClick="dialogOpen('pppenable')">
										<?php }
									} ?>
								</td>
							</tr>
						<?php } ?>

						<?php if ($this->vt == "kvm" || $this->vt == "xenhvm") { ?>
							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vserverlabelsettingsapic']; ?></td>
								<td>
									<form action="" method="post">
										<?php if ($this->apic) { ?>
											<span class="label label-success">ON</span>
											<input name="apic" type="submit" class="btn btn-danger btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonoff']; ?>">
											<input type="hidden" name="setting" value="Off">
										<?php } else { ?>
											<span class="label label-danger">OFF</span>
											<input name="apic" type="submit" class="btn btn-success btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonon']; ?>">
											<input type="hidden" name="setting" value="On">
										<?php } ?>
									</form>
								</td>
							</tr>

							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vserverlabelsettingsacpi']; ?></td>
								<td>
									<form action="" method="post">
										<?php if ($this->acpi) { ?>
											<span class="label label-success">ON</span>
											<input name="acpi" type="submit" class="btn btn-danger btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonoff']; ?>">
											<input type="hidden" name="setting" value="Off">
										<?php } else { ?>
											<span class="label label-danger">OFF</span>
											<input name="acpi" type="submit" class="btn btn-success btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonon']; ?>">
											<input type="hidden" name="setting" value="On">
										<?php } ?>
									</form>
								</td>
							</tr>

							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vserverlabelsettingsvnc']; ?></td>
								<td>
									<form action="" method="post">
										<?php if ($this->vnc) { ?>
											<span class="label label-success">ON</span>
											<input name="vnc" type="submit" class="btn btn-danger btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonoff']; ?>">
											<input type="hidden" name="setting" value="Off">
										<?php } else { ?>
											<span class="label label-danger">OFF</span>
											<input name="vnc" type="submit" class="btn btn-success btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonon']; ?>">
											<input type="hidden" name="setting" value="On">
										<?php } ?>
									</form>
								</td>
							</tr>

							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vserverlabelsettingspae']; ?></td>
								<td>
									<form action="" method="post">
										<?php if ($this->pae) { ?>
											<span class="label label-success">ON</span>
											<input name="pae" type="submit" class="btn btn-danger btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonoff']; ?>">
											<input type="hidden" name="setting" value="Off">
										<?php } else { ?>
											<span class="label label-danger">OFF</span>
											<input name="pae" type="submit" class="btn btn-success btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonon']; ?>">
											<input type="hidden" name="setting" value="On">
										<?php } ?>
									</form>
								</td>
							</tr>

							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vserverlabelsettingsapic']; ?></td>
								<td>
									<form action="" method="post">
										<?php if ($this->apic) { ?>
											<span class="label label-success">ON</span>
											<input name="apic" type="submit" class="btn btn-danger btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonoff']; ?>">
											<input type="hidden" name="setting" value="Off">
										<?php } else { ?>
											<span class="label label-danger">OFF</span>
											<input name="apic" type="submit" class="btn btn-success btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonon']; ?>">
											<input type="hidden" name="setting" value="On">
										<?php } ?>
									</form>
								</td>
							</tr>

							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vserverlabelsettingskeyboard']; ?></td>
								<td>
									<form action="" method="post">
										<div class="input-group input-group-sm">
											<select name="keyboard" id="keyboard" class="form-control">
												<option value="0" <?php if ($this->keyboard == "0") { echo 'selected="selected"'; } ?>>Default</option>
												<?php foreach($this->keyboardlist as $keyboard) { ?>
													<option value="<?= $keyboard[id]; ?>" <?php if ($this->keyboard == $keyboard[id]) { echo 'selected="selected"'; } ?>>
														<?= $keyboard[name]; ?>
													</option>
												<?php } ?>
											</select>
											<span class="input-group-btn">
												<input name="keyboardsubmit" type="submit" class="btn btn-primary btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonset']; ?>">
											</span>
										</div>
										<input type="hidden" name="keyboardchange" value="1">
									</form>
								</td>
							</tr>

							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vserverlabelsettingsboot']; ?></td>
								<td>
									<form action="" method="post">
										<div class="input-group input-group-sm">
											<select name="bootorder" id="bootorder" class="form-control">
												<option value="cd" <?php if ($this->boot == "cd") { echo 'selected="selected"'; } ?>>
													(1) <?= $_lang['vserversettingsborderharddisk']; ?> (2) <?= $_lang['vserversettingsbordercdrom']; ?>
												</option>
												<option value="dc" <?php if ($this->boot == "dc") { echo 'selected="selected"'; } ?>>
													(1) <?= $_lang['vserversettingsbordercdrom']; ?> (2) <?= $_lang['vserversettingsborderharddisk']; ?>
												</option>
												<option value="c" <?php if ($this->boot == "c") { echo 'selected="selected"'; } ?>>
													<?= $_lang['vserversettingsborderharddisk']; ?> <?= $_lang['vserversettingsborderonly']; ?>
												</option>
												<option value="d" <?php if ($this->boot == "d") { echo 'selected="selected"'; } ?>>
													<?= $_lang['vserversettingsbordercdrom']; ?> <?= $_lang['vserversettingsborderonly']; ?>
												</option>
											</select>
											<span class="input-group-btn">
												<input name="border" type="submit" class="btn btn-primary btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonset']; ?>">
											</span>
										</div>
									</form>
								</td>
							</tr>

						<?php } ?>

						<?php if ($this->vt == "kvm") { ?>
							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vserverlabelsettingsnic']; ?></td>
								<td>
									<form action="" method="post">
										<div class="input-group input-group-sm">
											<select name="nic" id="nic" class="form-control">
												<option value="1" <?php if ($this->nic == "1") { echo 'selected="selected"'; } ?>>Realtek 8139</option>
												<option value="2"  <?php if ($this->nic == "2") { echo 'selected="selected"'; } ?>>Intel PRO/1000</option>
												<option value="3" <?php if ($this->nic == "3") { echo 'selected="selected"'; } ?>>Virtio</option>
											</select>
											<span class="input-group-btn">
												<input name="nicsubmit" type="submit" class="btn btn-primary btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonset']; ?>">
											</span>
										</div>
									</form>
								</td>
							</tr>

							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vserverlabelsettingsdiskdriver']; ?></td>
								<td>
									<form action="" method="post">
										<div class="input-group input-group-sm">
											<select name="diskdriver" id="diskdriver" class="form-control">
												<option value="1" <?php if ($this->diskdriver == "1") { echo 'selected="selected"'; } ?>>ide (default)</option>
												<option value="2"  <?php if ($this->diskdriver == "2") { echo 'selected="selected"'; } ?>>virtio</option>
											</select>
											<span class="input-group-btn">
												<input name="diskdriverx" type="submit" class="btn btn-primary btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonset']; ?>">
											</span>
										</div>
									</form>
								</td>
							</tr>
						<?php } ?>

						<?php if ($this->vt == "xenhvm" || $this->vt == "xen") { ?>
							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vserverlabelsettingsnic']; ?></td>
								<td>
									<form action="" method="post">
										<div class="input-group input-group-sm">
											<select name="nic" id="nic" class="form-control">
												<option value="1" <?php if ($this->nic == "1") { echo 'selected="selected"'; } ?>>Realtek 8139</option>
												<option value="2"  <?php if ($this->nic == "2") { echo 'selected="selected"'; } ?>>Intel E1000</option>
												<option value="3" <?php if ($this->nic == "3") { echo 'selected="selected"'; } ?>>Novell NE2000</option>
											</select>
											<span class="input-group-btn">
												<input name="nicsubmit" type="submit" class="btn btn-primary btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonset']; ?>">
											</span>
										</div>
									</form>
								</td>
							</tr>
						<?php } ?>

						<?php if ($this->vt == "xenhvm") { ?>
							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vserverlabelsettingsnicemu']; ?></td>
								<td>
									<form action="" method="post">
										<div class="input-group input-group-sm">
											<select name="nicemu" id="nicemu" class="form-control">
												<option value="0" <?php if ($this->nicemu == "0") { echo 'selected="selected"'; } ?>>ioemu</option>
												<option value="1"  <?php if ($this->nicemu == "1") { echo 'selected="selected"'; } ?>>netfront</option>
											</select>
											<span class="input-group-btn">
												<input name="nicemusubmit" type="submit" class="btn btn-primary btn-flat btn-sm" value="<?= $_lang['vserversettingsbuttonset']; ?>">
											</span>
										</div>
									</form>
								</td>
							</tr>
						<?php } ?>

						<?php if ($this->vt == "kvm" || $this->vt == "xenhvm") { ?>
							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vservertabcdrom']; ?></td>
								<td>
									<form action="" method="post">
										<?php if ($this->cdrom == "none") { ?>
											<div class="input-group input-group-sm">
												<select name="vmos" id="vmos" class="form-control">
													<?php foreach($this->isolist as $iso) { ?>
														<option value="<?= $iso[filename]; ?>">
															<?= $iso[friendlyname]; ?>
														</option>
													<?php } ?>
												</select>
												<span class="input-group-btn">
													<input name="mount" type="<?= $this->isolist ? 'submit' : 'button' ?>" class="btn btn-success btn-flat btn-sm" value="<?= $_lang['vservercdrommountbutton']; ?>">
												</span>
											</div>
										<?php } else { ?>
											<span class="label label-success"><?= $this->vtemplate; ?></span>
											<input name="unmount" type="submit" class="btn btn-danger btn-flat btn-sm" value="<?= $_lang['vservercdromunmountbutton']; ?>">
										<?php } ?>
									</form>
								</td>
							</tr>
						<?php } ?>

						<?php if ($this->vt == "kvm") { ?>
							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vserverlabeldriver']; ?></td>
								<td>
									<?php if ($this->driverlist) { ?>
										<form action="" method="post">
											<div class="input-group input-group-sm">
												<select name="driver" id="driver" class="form-control">
													<?php foreach($this->driverlist as $driver) { ?>
														<option value="<?= $driver[filename]; ?>">
															<?= $driver[friendlyname]; ?>
														</option>
													<?php } ?>
												</select>
												<span class="input-group-btn">
													<input name="changedriver" type="submit" class="btn btn-success btn-flat btn-sm" value="<?= $_lang['vserverchangedriverbutton']; ?>">
													<input name="unmountdriver" type="submit" class="btn btn-primary btn-flat btn-sm" value="<?= $_lang['vserverunmountdriverbutton']; ?>">
												</span>
											</div>
										</form>
									<?php } else {
										echo $_lang['vservernodriver'];
									} ?>
								</td>
							</tr>
						<?php } ?>

						<tr class="with-btn-sm">
							<td nowrap class="status-name"><?= $_lang['vservertabhostname']; ?></td>
							<td>
								<form action="" method="post">
									<div class="input-group input-group-sm">
										<input type="text" name="newhostname" id="newhostname" class="form-control" value="<?= $this->vhostname; ?>">
										<span class="input-group-btn">
											<input name="changehostname" type="submit" class="btn btn-success btn-flat btn-sm" value="<?= $_lang['vserverchangehostnamebutton']; ?>">
										</span>
									</div>
								</form>
							</td>
						</tr>

						<?php if ($this->vt == "openvz" || $this->vt == "xen") { ?>
							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vservertabrootpassword']; ?></td>
								<td>
									<form action="" method="post">
										<div class="input-group input-group-sm">
											<input type="password" name="newrootpassword" id="newrootpassword" class="form-control">
											<span class="input-group-btn">
												<input name="changerootpassword" type="submit" class="btn btn-success btn-flat btn-sm" value="<?= $_lang['vserverchangerootpasswordbutton']; ?>">
											</span>
										</div>
									</form>
								</td>
							</tr>
						<?php } ?>

						<?php if ($this->vt == "notused") { ?>
							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vservertabconsolepassword']; ?></td>
								<td>
									<form action="" method="post">
										<div class="input-group input-group-sm">
											<input type="password" name="newconsolepassword" id="newconsolepassword" class="form-control">
											<span class="input-group-btn">
												<input name="changeconsolepassword" type="submit" class="btn btn-success btn-flat btn-sm" value="<?= $_lang['vserverchangeconsolepasswordbutton']; ?>">
											</span>
										</div>
									</form>
								</td>
							</tr>
						<?php } ?>

						<?php if ($this->vt == "kvm" || $this->vt == "xenhvm") { ?>
							<tr class="with-btn-sm">
								<td nowrap class="status-name"><?= $_lang['vservertabvncpassword']; ?></td>
								<td>
									<form action="" method="post">
										<div class="input-group input-group-sm">
											<input type="password" name="newvncpassword" id="newvncpassword" class="form-control">
											<span class="input-group-btn">
												<input name="changevncpassword" type="submit" class="btn btn-success btn-flat btn-sm" value="<?= $_lang['vserverchangevncpasswordbutton']; ?>">
											</span>
										</div>
									</form>
								</td>
							</tr>
						<?php } ?>

						<?php if ($this->quickbackup) { ?>
							<?php if ($this->vt == "openvz") { ?>
								<tr class="with-btn-sm">
									<td nowrap class="status-name"><?= $_lang['vservertabquickbackup']; ?></td>
									<td>
										<form action="" method="post">
											<input type="submit" name="quickbackup" class="btn btn-primary btn-flat btn-sm" value="<?= $_lang['vserverquickbackupbutton']; ?>" />
										</form>
									</td>
								</tr>
							<?php } ?>
						<?php } ?>

					</tbody></table>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /.content -->

<?php include $this->tpl_footer; ?>
