<?php   
header('Content-Type: text/html; charset=utf-8');
require "config.php";

class Vote{

	public static $info = "";   //信息提示
	public static $response = 0; //返回状态码 1:成功,-1:已知错误,-2:未知错误
	public static $dbVersion =""; //db版本
	public static $link =null;     // pdoLink

	//获取电影信息
	public function getInfo($key){
		//--------表单验证 并 创建POD--------
		if (!$this->check() || !$this->createPDO()){
			return false;
		}
		$sql = "SELECT * FROM `vote` WHERE `id` = :id";
		$stmt = self::$link->prepare($sql);
		$stmt->execute(array(':id' => $key));

		//检查是否出错
		$arrError = $stmt->errorInfo();
		if ($arrError[0] !='00000') {
			$errMsg = 'SQLSTAE: '.$arrError[0].'  SQL Error: '.$arrError[2];
			$this->throw_exception($errMsg);
			return false;
		}

		$row = $stmt->fetch(PDO::FETCH_ASSOC);// Use fetchAll() if you want all 

		if ($row == false ) {
			$this->throw_exception("no such id");
		}else{
			self::$response = 1;
			self::$info = $row;
			$this->responseJSON();
		}
	}

    //投票
	public function upvote(){
		//--------表单验证 并 创建POD--------
		if (!$this->check() || !$this->createPDO()){
			return false;
		}

		//--------投票-----------
		$bool = "";  //未识别的电影 id
		foreach ($_POST as $key => $value) {
			if ($value == 1){
				if(!$this->plusOne($key)){
					$bool .=" ".$key;
				}
			}
		}

		if ($bool != "" ){
			$this->throw_exception("Unknown id    $bool" );
		}else{
			self::$response = 1;
			$_SESSION['token'] = md5(microtime(true));
			self::$info = $_SESSION['token'];
			$this->responseJSON();
		}
	}



	protected function plusOne($key){

		$sql = "SELECT * FROM `vote` WHERE `id` = :id";
		$stmt = self::$link->prepare($sql);
		$stmt->execute(array(':id' => $key));

		//检查是否出错
		$arrError = $stmt->errorInfo();
		if ($arrError[0] !='00000') {
			$errMsg = 'SQLSTAE: '.$arrError[0].'  SQL Error: '.$arrError[2];
			$this->throw_exception($errMsg);
			return false;
		}

		$row = $stmt->fetch(PDO::FETCH_ASSOC);// Use fetchAll() if you want all 

		if ($row == false ) {
			return false;
		}

		$votenum = $row['vote'] + 1;
		// +1s
		$sql = "UPDATE `vote` SET `vote`=:vote WHERE id = :id";
		$stmt = self::$link->prepare($sql);
		$stmt->execute(array(':id' => $key, ':vote' => $votenum));

		//检查是否出错
		$arrError = $stmt->errorInfo();
		if ($arrError[0] !='00000') {
			$errMsg = 'SQLSTAE: '.$arrError[0].'  SQL Error: '.$arrError[2];
			$this->throw_exception($errMsg);
			return false;
		}
		return true;
	}

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
 $_POST = array(1 =>1, 2=>1, 3=>0, 4=>1, 5=>1 );
 // 
 // 
 // 假设输入:
 //$_GET = array('id' => 4);

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









