<?php include $this->tpl_header; ?>

<script type="text/javascript">
	$('.sidebar-menu .active').removeClass('active');
	$('.sidebar-menu .authlog').addClass('active');
</script>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>Authentication Log</h1>
	<ol class="breadcrumb">
		<li><a href="home.php"><i class="fa fa-dashboard"></i> <?= $_lang['controlpanelname']; ?></a></li>
		<li class="active">Authentication Log</li>
	</ol>
</section>

<?php
    global $db;
    $succeeded = $db->query(
        "SELECT date, ipaddress FROM authenticationlog " .
        "WHERE type = 'Login' " .
        "AND username = '{$_SESSION["username"]}' " .
        "AND status = 'Ok' " .
        "ORDER BY date DESC LIMIT 100;"
    );
    $failed = $db->query(
        "SELECT date, ipaddress FROM authenticationlog " .
        "WHERE type = 'Login' " .
        "AND username = '{$_SESSION["username"]}' " .
        "AND status = 'Failed' " .
        "ORDER BY date DESC LIMIT 100;"
    );

    $locations = array();
    function get_ip_location($ip) {
        global $locations;
        $part = explode(".", $ip, -1);
        $prefix = implode(".", $part);
        
        if (isset($locations[$prefix])) {
            return $locations[$prefix];
        }
        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "http://127.0.0.1:9200/$ip");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        $output = curl_exec($ch);
        curl_close($ch);
        
        $locations[$prefix] = $output;
        return $output;
    }
?>

<section class="content">
	<div class="row">
		<div class="col-md-6">
			<div class="box box-info">
				<div class="box-header">
					<h3 class="box-title">Login Logs</h3>
				</div>
				<div class="box-body no-padding table-responsive">
                    <table class="table table-striped"><tbody>
                        <tr>
                            <th>Time</th>
                            <th>IP</th>
                            <th>Location</th>
                        </tr>
                        <?php while ($log = $db->fetchArray($succeeded)) { ?>
                            <tr>
                                <td><?= date("Y-m-d H:i:s", $log["date"]); ?></td>
                                <td><?= $log["ipaddress"]; ?></td>
                                <td><?= get_ip_location($log["ipaddress"]); ?></td>
                            </tr>
                        <?php } ?>
                    </tbody></table>
				</div>
			</div>
		</div>

		<div class="col-md-6">
			<div class="box box-danger">
				<div class="box-header">
					<h3 class="box-title">Failed Login Attempts</h3>
				</div>
				<div class="box-body no-padding table-responsive">
                    <table class="table table-striped"><tbody>
                        <tr>
                            <th>Time</th>
                            <th>IP</th>
                            <th>Location</th>
                        </tr>
                        <?php while ($log = $db->fetchArray($failed)) { ?>
                            <tr>
                                <td><?= date("Y-m-d H:i:s", $log["date"]); ?></td>
                                <td><?= $log["ipaddress"]; ?></td>
                                <td><?= get_ip_location($log["ipaddress"]); ?></td>
                            </tr>
                        <?php } ?>
                    </tbody></table>
				</div>
			</div>
		</div>
	</div>
</section>

<?php include $this->tpl_footer; ?>
