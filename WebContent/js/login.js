$(function(){
	$('#username').focus().blur(checkName);
	$('#password').blur(checkPassword);
});

function checkName(){
	var name = $('#username').val();
	if(name == null || name == ""){
		//提示错误
		$('#count-msg').html("用户名不能为空");
		return false;
	}
	
	$('#count-msg').empty();
	return true;
}

function checkPassword(){
	var password = $('#password').val();
	if(password == null || password == ""){
		//提示错误
		$('#password-msg').html("密码不能为空");
		return false;
	}
	
	$('#password-msg').empty();
	return true;
}


function sendCode(){
	let aa=document.getElementById("sendCodeBtn");
	let userId=document.getElementById("userId").value;
	let userPassword=document.getElementById("userPassword").value;
	let phoneNum=document.getElementById("phoneNum").value;
	$.ajax({
        url:"${path}/Login/sendCode/",
        data:{
        	phoneNum:phoneNum//参数
        },
        type:"POST",
        success:function(re){
            console.log(re);
        }
    });
	alert("发送成功!");
	aa.disabled=true;
	let count = 15 ;
	aa.value =count + "秒后，重新发送";
	function countDown(){
		count--;
		aa.value =count + "秒后，重新发送";
		if(count==0){
			clearInterval(timer);	
			aa.disabled=false;
			aa.value ="重新发送";
		}
	}
	timer=setInterval(countDown,1000);
}
