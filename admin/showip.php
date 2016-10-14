<?php 
session_start();
if (!isset($_SESSION['token']) || $_SESSION['token'] !== "zhegemimahaonancaiyahaonancaiacjacjacjacj"){
		header("Location: ./login.php"); 
	exit;
} 

header('Content-Type: text/html; charset=utf-8');
require_once "../config.php";


$link  = new PDO(DB_TYPE.':host='.DB_HOST.';dbname='.DB_NAME,DB_USER,DB_PWD);
$link->exec('SET NAMES '.DB_CHARSET);
		
$sql = "SELECT `ip`,`time` FROM `ips` ";
$stmt = $link->prepare($sql);
$stmt->execute();
$all = $stmt->fetchALL(PDO::FETCH_ASSOC);
echo"<pre>";
print_r($all);
echo"</pre>";










