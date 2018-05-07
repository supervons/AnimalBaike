var pathName = document.location.pathname;
var index = pathName.substr(1).indexOf("/");
var result = pathName.substr(0,index+1);
//以下为默认执行的方法，多为失去焦点事件等
$(document).ready(function(){
  $("#userId").blur(function(){
	  if($("#userId").val() == "" || $("#userId").val().length <6){
			closeAlert();
			$("#userId").val("");
			$("#userIdcheck").show();
			return false;
	  }else{
		  $.ajax({
	        url:result +  "/Login/getUserById/",
	        data:{
	        	userId:$("#userId").val()//参数
	        },
	        type:"POST",
	        success:function(re){
	        	if(re==1){
					closeAlert();
					$("#userIdCanUseAlert").show();
	        	}else{
					closeAlert();
					$("#userId").val("");
					$("#userIdAlert").show();
	        	}
	        }
	    }); 
		var name = '${isExistFlag}';
		console.log(name);
	  }
		
  });  

  $("#userPasswordReplay").blur(function() {
		if ($("#userPassword").val() != "") {
			if ($("#userPassword").val() != $("#userPasswordReplay").val()) {
				closeAlert();
				$("#userPasswordReplay").val("");
				$("#passWordAlert").show();
			}else{
				closeAlert();
			}
		}
	});  

  $("#userPassword").blur(function() {
		if ($("#userPassword").val() !="" && $("#userPassword").val().length<6) {
				closeAlert();
				$("#userPassword").val("");
				$("#checkPassWordLength").show();
		}else{
			$("#checkPassWordLength").hide();
		}
	}); 
});

//注册提交事件方法
function checkFrom(){
	let userId=$("#userId").val();
	let userPassword=$("#userPassword").val();
	let userPasswordReplay=$("#userPasswordReplay").val();
	let phoneNum=$("#phoneNum").val();
	let checkCode=$("#checkCode").val();
	console.log(userId + "-" + userPassword + "-" + phoneNum + "-" + checkCode);
	if(userId==""||userPassword==""||phoneNum==""||checkCode==""||userPasswordReplay==""){
		closeAlert();
		$("#myAlert").show();
		return false;
	}else{
		closeAlert();
		return true;
	}
}
//发送验证码方法
function sendCode(){
	var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
	let aa=document.getElementById("sendCodeBtn");
	let userId=document.getElementById("userId").value;
	let userPassword=document.getElementById("userPassword").value;
	let phoneNum=document.getElementById("phoneNum").value;
    var phoneNumReg = /^1[3|4|5|7|8]\d{9}$/   
    if(!phoneNumReg.test(phoneNum)) {   
    	document.getElementById("phoneNum").focus();
    	closeAlert();//关闭其他的提示框，在显示当前提示。
		$("#phoneNumberAlert").show();
    	return false;  
    	}else{
    		closeAlert();
    	}
	$.ajax({
        url:result +  "/Login/sendCode/",
        data:{
        	phoneNum:phoneNum//参数
        },
        type:"POST",
        success:function(re){
            console.log(re);
        }
    });
	$("#codeSendSuccessAlert").show();
	aa.disabled=true;
	let count = 60 ;//重复发送阀值
	aa.value =count + "秒后，重新发送";
	function countDown(){
		count--;
		aa.value =count + "秒后，重新发送";
		if(count==0){
			clearInterval(timer);	
			aa.disabled=false;
			aa.value ="重新发送";
			$("#codeSendSuccessAlert").hide();
		}
	}
	timer=setInterval(countDown,1000);
}

//点击叉时，关闭提示框
function closeAlert(){
    $("#phoneNumberAlert").hide();
    $("#myAlert").hide();
    $("#passWordAlert").hide();
    $("#checkPassWordLength").hide();
    $("#userIdCanUseAlert").hide();
    $("#userIdAlert").hide();
    $("#userIdcheck").hide();
    if($("#welcomeInfo").hide == true)
        $("#welcomeInfo").show();
    else{
        $("#welcomeInfo").hide();
    }
}