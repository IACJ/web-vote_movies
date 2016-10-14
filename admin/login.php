
<?php 
if (isset($_POST['ac'])  && isset($_POST['pw']) && $_POST['ac'] ==='diaokeshiguang' && $_POST['pw'] ==='acjacj'){
	session_start();
	$_SESSION['token'] = "zhegemimahaonancaiyahaonancaiacjacjacjacj";
	header("Location: ./admin.php"); 
	exit;
} 
?>

<!DOCTYPE html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<link rel="stylesheet" type="text/css" href="position.css" />
	<title>雕刻时光数据查询</title>
	</head>

	<body >

	<header>
	<div id="login">
		<h1>雕刻时光数据查询</h1>
	<p class="message">(省流量版)</p>
	</header>

<form name="loginform" id="loginform" action="" method="post">
	<p>
		<label for="user_login">用户名<br />
		<input type="text" name="ac"   value="" size="20" /></label>
	</p>
	<p>
		<label for="user_pass">密码<br />
		<input type="password" name="pw"  value="" size="20" /></label>
	</p>
	<p class="submit">
		<input type="submit" name="wp-submit"  class="newbutton" value="登录" />
	</p>

<p><font id="nav" color="red">
<?php 
if (isset($_POST['ac'])  && isset($_POST['pw']) ){
	echo "账号/密码错误!";
} 
?>

</font></p>
</form>
	</div>	
		<div class="clear"></div>
	</body>
	</html>
	