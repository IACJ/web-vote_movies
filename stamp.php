<?php   
header('Content-Type: text/html; charset=utf-8');
require_once "config.php";

class Stamp{

	public static $info = "";   //信息提示
	public static $response = 0; //返回状态码 1:成功,-1:已知错误,-2:未知错误
	public static $dbVersion =""; //db版本
	public static $link =null;     // pdoLink

	//生成一个新的印花
	public function newStamp(){
		if (!$this->createPDO()){
			return false;
		}

		$id = 0;
		do{
		$id = rand(10000000,99999999);
		$PDOStatement = self::$link->prepare("SELECT * FROM `stamp` WHERE `name` = $id");
		$PDOStatement->execute();
		$result=$PDOStatement->fetch(constant("PDO::FETCH_ASSOC"));
		}while($result !=false);

		$sql = "INSERT INTO `stamp`(`id`, `name`, `received`, `used`, `gettime`) VALUES ('',\"$id\",0,0,now())";
		$PDOStatement = self::$link->prepare($sql);
		$PDOStatement->execute();

		return $id;
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













