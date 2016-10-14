<?php   
header('Content-Type: text/html; charset=utf-8');
require_once "../config.php";

class Ajax{

	public static $info = "";   //信息提示
	public static $response = 0; //返回状态码 1:成功,-1:已知错误,-2:未知错误
	public static $dbVersion =""; //db版本
	public static $link =null;     // pdoLink

	//获取电影信息
	public function getStampInfo($key){
		//--------创建POD--------
		if (!$this->createPDO()){
			return false;
		}
		$sql = "SELECT * FROM `stamp` WHERE `name` = :name";
		$stmt = self::$link->prepare($sql);
		$stmt->execute(array(':name' => $key));

		$row = $stmt->fetch(PDO::FETCH_ASSOC);// Use fetchAll() if you want all 
		if ($row == false ) {
			$this->throw_exception("no such stamp_id");
		}else{
			self::$response = 1;
			self::$info = $row;
			$this->responseJSON();
		}
	}

	public function receivedStamp($key){
		//--------创建POD--------
		if (!$this->createPDO()){
			return false;
		}


		$sql = "UPDATE `stamp` SET `received`=1,`used`=1,`receivetime`=now(),`usetime`=now()  WHERE `name` = :name";
		$stmt = self::$link->prepare($sql);
		$stmt->execute(array(':name' => $key));

		//检查是否出错
		$arrError = $stmt->errorInfo();
		if ($arrError[0] !='00000') {
			$errMsg = 'SQLSTAE: '.$arrError[0].'  SQL Error: '.$arrError[2];
			$this->throw_exception($errMsg);
			return false;
		}
		self::$response = 1;
		self::$info = 'ok';
		$this->responseJSON();
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
		return true;
		self::$info = "";
		self::$response = 0;
		self::$dbVersion = self::$link->getAttribute(constant("PDO::ATTR_SERVER_VERSION"));
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


session_start();
if (!isset($_SESSION['token']) || $_SESSION['token'] !== "zhegemimahaonancaiyahaonancaiacjacjacjacj"  || empty($_POST)||empty($_POST['order']) ){
	echo "bye-bye";
	exit;
} 


$ajax = new Ajax;

switch ($_POST['order']) {
	case 1:
		if (isset($_POST['stamp_name'])) {
			$ajax -> getStampInfo($_POST['stamp_name']);
		}else{
			$ajax->UndefinedRequest();
		}
		break;
	case 2:
		if (isset($_POST['stamp_name'])) {
			$ajax -> receivedStamp($_POST['stamp_name']);
		}else{
			$ajax->UndefinedRequest();
		}
		break;
	
	default:
		$ajax->UndefinedRequest();
		break;
}





