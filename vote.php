<?php   
header('Content-Type: text/html; charset=utf-8');
//header('Access-Control-Allow-Origin: *');  
require_once "config.php";

class Vote{

	public static $info = "";   //信息提示
	public static $response = 0; //返回状态码 1:成功,-1:已知错误,-2:验证码错误，-3:ip多次使用
	public static $dbVersion =""; //db版本
	public static $link =null;     // pdoLink

	//获取电影信息
	public function getInfo($key){
		//--------创建POD--------
		if (!$this->createPDO()){
			return false;
		}
		$sql = "SELECT `details` FROM `vote` WHERE `id` = :id";
		$stmt = self::$link->prepare($sql);
		$stmt->execute(array(':id' => $key));

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
	public function upvote($votedata){
		//表单验证__创建POD__IP验证 
		if (!$this->upvoteCheck($votedata) || !$this->createPDO() || !$this->IPVerification()){
			return false;
		}

		//投票
		$bool = "";  //未识别的电影 id
		for ($i=1; $i <= MOVIE_NUMBER; $i++) { 
			if ($votedata[$i] == 1){
				if(!$this->plusOne($i)){
					$bool .=" ".$i;
				}
			}
		}

		if ($bool != "" ){
			$this->throw_exception("Unknown id : $bool" );
		}else{
			$stampId = $this->newStamp();
			self::$response = 1;
			self::$info = $stampId;
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

		$votenum = $row['vote'] + 1;// +1s
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
	protected function upvoteCheck($votedata){
		//-------TODO：时间验证-----------


		//-------电影id验证-----------
		for ($i=1; $i <= MOVIE_NUMBER ; $i++) { 
			if (!isset($votedata[$i]) || !is_numeric($votedata[$i])){
				$this->UndefinedRequest();
				return false;
			}
		}
		// //-------验证码验证-----------	
		// if (!isset($_POST['captcha']) ||!isset($_SESSION['authcode']) || strtolower($_POST['captcha'])!=$_SESSION['authcode']){
		// 	unset($_SESSION['authcode']);
		// 	self::$response = -2;
		// 	self::$info = "captcha is wrong";
		// 	$this->responseJSON();
		// 	return false;
		// }
		// unset($_SESSION['authcode']);
		return true;
	}

	//生成一个新的印花
	public function newStamp(){
		if (!$this->createPDO()){
			return false;
		}
		$id = 0;
		$count = 0;
		do{
		$id = rand(10000000,99999999);
        $sql = "SELECT COUNT(*) FROM `stamp` WHERE `name` = $id";
        $count = self::$link->query($sql)->fetchColumn();
		}while($count !=0);

		$sql = "INSERT INTO `stamp`(`id`, `name`, `received`, `used`, `gettime`, `receivetime`, `usetime`) VALUES (null,\"$id\",0,0,now(),null,null)";
		$PDOStatement = self::$link->prepare($sql);
		$PDOStatement->execute();
		//检查是否出错
		$arrError = $PDOStatement->errorInfo();
		if ($arrError[0] !='00000') {
			$errMsg = 'SQLSTAE: '.$arrError[0].'  SQL Error: '.$arrError[2];
			$this->throw_exception($errMsg);
			return false;
		}
		return $id;
	}

	//创建一个PDO对象
	protected function createPDO(){
		if(!isset(self::$link)){ 
			try{
				//格式：$pdo = new PDO('mysql:host=localhost;dbname=user','root','password');
				self::$link  = new PDO(DB_TYPE.':host='.DB_HOST.';dbname='.DB_NAME,DB_USER,DB_PWD);
			}catch(PDOException $e){
				self::throw_exception($e->getMessage());
				return false;
			}
			self::$link->exec('SET NAMES '.DB_CHARSET);
			self::$info = "";
			self::$response = 0;
			self::$dbVersion = self::$link->getAttribute(constant("PDO::ATTR_SERVER_VERSION"));
		}
		return true;
	}

	protected function getIP(){
	    if (isset($_SERVER)) {
	        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
	            $realip = $_SERVER['HTTP_X_FORWARDED_FOR'];
	        } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
	            $realip = $_SERVER['HTTP_CLIENT_IP'];
	        } else {
	            $realip = $_SERVER['REMOTE_ADDR'];
	        }
	    } else {
	        if (getenv("HTTP_X_FORWARDED_FOR")) {
	            $realip = getenv( "HTTP_X_FORWARDED_FOR");
	        } elseif (getenv("HTTP_CLIENT_IP")) {
	            $realip = getenv("HTTP_CLIENT_IP");
	        } else {
	            $realip = getenv("REMOTE_ADDR");
	        }
	    }
	    return $realip;
	}

	protected function IPVerification(){
		define('ONE_IP_MAX_VOTE', 10);
		$ip = $this->getIP();
		$votestr = $_POST['vote'];
		$HTTP_X_FORWARDED_FOR= '';
		$HTTP_CLIENT_IP = '';
		$REMOTE_ADDR ='';

		if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])){
			$HTTP_X_FORWARDED_FOR = $_SERVER['HTTP_X_FORWARDED_FOR'];
		}elseif(getenv("HTTP_X_FORWARDED_FOR")) {
            $HTTP_X_FORWARDED_FOR = getenv( "HTTP_X_FORWARDED_FOR");
        }

        if (isset($_SERVER['HTTP_CLIENT_IP'])){
        	$HTTP_CLIENT_IP = $_SERVER['HTTP_CLIENT_IP'];
        }elseif (getenv("HTTP_CLIENT_IP")) {
            $HTTP_CLIENT_IP = getenv("HTTP_CLIENT_IP");	
        }

        if (isset($_SERVER['REMOTE_ADDR'])){
            $REMOTE_ADDR = $_SERVER['REMOTE_ADDR'];
        }elseif (getenv("REMOTE_ADDR")) {
            $REMOTE_ADDR = getenv("REMOTE_ADDR");
        }

        $sql = "SELECT COUNT(*) FROM `ips` WHERE `ip` = \"$ip\"";
        $count = self::$link->query($sql)->fetchColumn();
        //检查是否出错

        if ($count >= ONE_IP_MAX_VOTE){
	        $sql = "INSERT INTO `ips`(`id`, `ip`, `HTTP_X_FORWARDED_FOR`, `HTTP_CLIENT_IP`, `REMOTE_ADDR`,  `vote`, `time`,`isstoped`) VALUES (null,:ip,:HTTP_X_FORWARDED_FOR,:HTTP_CLIENT_IP,:REMOTE_ADDR,:votestr,now(),1)";
			$PDOStatement = self::$link->prepare($sql);
			$PDOStatement->execute(
					array(
						':ip' => $ip,
						':HTTP_X_FORWARDED_FOR' =>$HTTP_X_FORWARDED_FOR,
						':HTTP_CLIENT_IP' => $HTTP_CLIENT_IP,
						':REMOTE_ADDR' => $REMOTE_ADDR,
						':votestr' => $votestr));
			self::$response = -3;
			self::$info = "ip used too many times";
			$this->responseJSON();
			return false;
        }else{
	        $sql = "INSERT INTO `ips`(`id`, `ip`, `HTTP_X_FORWARDED_FOR`, `HTTP_CLIENT_IP`, `REMOTE_ADDR`,  `vote`, `time`,`isstoped`) VALUES (null,:ip,:HTTP_X_FORWARDED_FOR,:HTTP_CLIENT_IP,:REMOTE_ADDR,:votestr,now(),0)";
			$PDOStatement = self::$link->prepare($sql);
			$PDOStatement->execute(
					array(
						':ip' => $ip,
						':HTTP_X_FORWARDED_FOR' =>$HTTP_X_FORWARDED_FOR,
						':HTTP_CLIENT_IP' => $HTTP_CLIENT_IP,
						':REMOTE_ADDR' => $REMOTE_ADDR,
						':votestr' => $votestr));
					//检查是否出错
			$arrError = $PDOStatement->errorInfo();
			if ($arrError[0] !='00000') {
				$errMsg = 'SQLSTAE: '.$arrError[0].'  SQL Error: '.$arrError[2];
				$this->throw_exception($errMsg);
				return false;
			}
			return true;
        }
	}

	//拿到json
	public function getjson(){
		$this->createPDO();
		$sql = "SELECT `id`, `name`,`details` FROM `vote` ";
		$stmt = self::$link->prepare($sql);
		$stmt->execute();
		$all = $stmt->fetchALL(PDO::FETCH_ASSOC);// Use fetchAll() if you want all 
		if ($all == false ) {
			$this->throw_exception("错误");
		}else{
			echo json_encode($all);
		}
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
define('MOVIE_NUMBER',50);
 //	假设输入  
// $_POST = array( "vote" => '{"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":0,"9":0,"10":0,"11":0,"12":0,"13":0,"14":0,"15":0,"16":0,"17":0,"18":0,"19":0,"20":0,"21":0,"22":0,"23":0,"24":0,"25":0,"26":0,"27":0,"28":0,"29":0,"30":0,"31":0,"32":0,"33":0,"34":0,"35":0,"36":0,"37":0,"38":0,"39":0,"40":0,"41":0,"42":0,"43":0,"44":0,"45":0,"46":0,"47":0,"48":0,"49":0,"50":0}');
 // 
 // 假设输入:
 // $_GET = array('id' => 8);

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

if (!empty($_POST['vote'])) {
	$votedata =json_decode($_POST['vote'],true ) ;
	//var_dump($votedata);
	$Vote->upvote($votedata);
	return;
}

$Vote->UndefinedRequest();







