var form1 = document.getElementById('form1');


var stamp_name = document.getElementById('stamp_name');
var received = document.getElementById('received');
var gettime = document.getElementById('gettime');
var receivetime = document.getElementById('receivetime');
var button2 = document.getElementById('button2');
var data1 = {};
var data2 = {};


var fun1 =	function (event) {
	event.preventDefault();  //阻止事件的默认行为，此处为提交事件submit，默认事件为刷新页面，此处阻止了页面刷新但是数据依旧提交
	stamp_name.innerHTML = '查询中';
	received.innerHTML ="";
	gettime.innerHTML ="";
	receivetime.innerHTML ="";
	button2.style.display = " none";

	if(isNaN(form1.stamp_name.value)){
		stamp_name.innerHTML = '请输入数字';
		return;
	}

	var request = new XMLHttpRequest(); //创建新对象

	request.onreadystatechange = function(event) {
		if(request.readyState == 4){
			
			try{
				data1 = JSON.parse(request.responseText);
			} catch(e) {
				console.error(e);
			}

			if(data1.code == 1){
				stamp_name.innerHTML =data1.info.name;
				received.innerHTML ="是否领取: ";
				received.innerHTML += data1.info.received != 0 ? "是":"否";
				gettime.innerHTML ="投票时间: " +  data1.info.gettime;
				receivetime.innerHTML ="领取时间: ";
				receivetime.innerHTML +=data1.info.receivetime ==null ? "无" : data1.info.receivetime;


				if (data1.info.received == 0){
					button2.style.display = " block";
				}else{
					button2.style.display = " none";
				}

			} else {
				stamp_name.innerHTML = '未查询到该编号'; 
			}
		}
	};

	request.open("POST","./ajax.php",true);
	request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded'); 
	request.send('stamp_name=' + form1.stamp_name.value +'&order=1');

}
form1.addEventListener('submit', fun1);



form2.addEventListener('submit', function (event) {
	event.preventDefault();  //阻止事件的默认行为，此处为提交事件submit，默认事件为刷新页面，此处阻止了页面刷新但是数据依旧提交
	stamp_name.innerHTML = '处理中';
	received.innerHTML ="";
	gettime.innerHTML ="";
	receivetime.innerHTML ="";
	button2.style.display = " none";
	var request = new XMLHttpRequest(); //创建新对象

	request.onreadystatechange = function(event) {
		if(request.readyState == 4){

			try{
				data2 = JSON.parse(request.responseText);
			} catch(e) {
				console.error(e);
			}

			if(data2.code == 1){
				stamp_name.innerHTML ="执行成功"

			} else {
				stamp_name.innerHTML = ''; 
			}
		}
	};

	request.open("POST","./ajax.php",true);
	request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded'); 
	request.send('stamp_name=' + data1.info.name +'&order=2');

});