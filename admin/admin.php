<?php 
session_start();
if (!isset($_SESSION['token']) || $_SESSION['token'] !== "zhegemimahaonancaiyahaonancaiacjacjacjacj"){
		header("Location: ./login.php"); 
	exit;
} 
?>


<!DOCTYPE html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0"/>
	<link rel="stylesheet" type="text/css" href="position.css" />
	<title>雕刻时光数据查询</title>
	</head>

	<body >
	<header>

	<div id="login">
		<h1>雕刻时光数据查询</h1>
	<p class="message">(省流量版)</p>
	</header>


		<form id="form1" name="form1" action="" method="post">
			<p>
				<label for="user_login">印花编号<br />
				<input type="text" name="stamp_name"  class="input" value="" size="20" /></label>
			</p>

			<p class="submit">
				<input type="submit" name="wp-submit"  class="newbutton " value="查询" />
				<input type="hidden" name="redirect_to" value="http://" />
				<input type="hidden" name="testcookie" value="1" />
			</p>
		</form>

	</div>	

	<div class="block">
		<p class ="info"><span id="stamp_name"></span></p>
		<p class ="info"><span id="received"></span></p>
		<p class ="info"><span id="gettime"></span></p>
		<p class ="info"><span id="receivetime"></span></p>
		<form id="form2" name="form2" action="" method="post">
			<input type="submit" name="submit" id="button2" value="领取" />
		</form>
	</div>

	<script src="ajax.js"></script>
	</body>
	</html>
	