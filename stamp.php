<?php   
header('Content-Type: text/html; charset=utf-8');
require "config.php";

class Stamp{

	public static $info = "";   //信息提示
	public static $response = 0; //返回状态码 1:成功,-1:已知错误,-2:未知错误
	public static $dbVersion =""; //db版本
	public static $link =null;     // pdoLink



	//表单验证
	protected function check(){
		//-------TODO：时间验证-----------
		//-------TODO：防空验证-----------
		//-------TODO：token验证-----------
		return true;
	}

	//创建一个PDO对象
	protected function createPDO(){
		try{
			//$pdo = new PDO('mysql:host=localhost;dbname=user','root','');
			self::$link  = new PDO(DB_TYPE.':host='.DB_HOST.';dbname='.DB_NAME,DB_USER,DB_PWD);
		}catch(PDOException $e){
			self::throw_exception($e->getMessage());
			return false;
		}
		self::$link->exec('SET NAMES '.DB_CHARSET);
		self::$info = "";
		self::$response = 0;
		self::$dbVersion = self::$link->getAttribute(constant("PDO::ATTR_SERVER_VERSION"));
		return true;
	}



	protected  function throw_exception($errMsg){
		self::$response = -1;
		self::$info = $errMsg;
		$this->responseJSON();
	}

	protected  function responseJSON(){
		$ans = array('code'=>self::$response, 'info'=>self::$info);
		$json = json_encode($ans);
		echo $json;
	}
	public function UndefinedRequest(){
		$ans = array('code'=>-1, 'info'=>"Undefined request");
		$json = json_encode($ans);
		echo $json;
	}
}




 // ______main________
 //	假设输入  （假设有5部电影）
 //$_POST = array(1 =>1, 2=>1, 3=>0, 4=>1, 5=>1 );
 // 
 // 
 // 假设输入:
 $_GET = array('id' => 4);

session_start();
$Vote = new Vote();

if (!empty($_GET['id'])){
	$id = $_GET['id'];
	if (is_numeric($id)){
		$Vote->getInfo($id);
	}else{
		$Vote->UndefinedRequest();
	}
	return;
}

if (!empty($_POST)) {
	foreach ($_POST as $key => $value) {
		if (!is_numeric($key)){
			$Vote->UndefinedRequest();
			return;
		}
	}
	$Vote->upvote();
	return;
}
$Vote->UndefinedRequest();









