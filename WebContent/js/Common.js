var pathName = document.location.pathname;
var index = pathName.substr(1).indexOf("/");
var result = pathName.substr(0, index + 1);
// 以下为默认执行的方法，多为失去焦点事件等
$(document).ready(
		function() {
		});

// 注册提交事件方法
function checkFrom() {
	let	userId = $("#userId").val();
	let	userPassword = $("#userPassword").val();
	let	userPasswordReplay = $("#userPasswordReplay").val();
	let	phoneNum = $("#phoneNum").val();
	let	checkCode = $("#checkCode").val();
	console.log(userId + "-" + userPassword + "-" + phoneNum + "-" + checkCode);
	if (userId == "" || userPassword == "" || phoneNum == "" || checkCode == ""
			|| userPasswordReplay == "") {
		closeAlert();
		$("#myAlert").show();
		return false;
	} else {
		var flag = true;
		$.ajax({
			url : result + "/Login/checkCodeNumber/",
			data : {
				phoneNum : phoneNum,// 参数
				checkCode : checkCode
			},
			type : "POST",
			async : false,
			success : function(re) {
				if (re == 0) {
					closeAlert();
					$("#codeNumberAlert").show();
					flag = false;
				} else {
					closeAlert();
					$("#codeNumberAlert").hide();
					flag = true;
				}
			}
		});
		return flag;
	}
}
// 发送验证码方法
function sendCode() {
	var pathName = document.location.pathname;
	var index = pathName.substr(1).indexOf("/");
	var result = pathName.substr(0, index + 1);
	let	sendCodeBtn = document.getElementById("sendCodeBtn");
	let	userId = document.getElementById("userId").value;
	let	userPassword = document.getElementById("userPassword").value;
	let	phoneNum = document.getElementById("phoneNum").value;
	var phoneNumReg = /^1[3|4|5|7|8]\d{9}$/
	if (!phoneNumReg.test(phoneNum)) {
		document.getElementById("phoneNum").focus();
		closeAlert();// 关闭其他的提示框，在显示当前提示。
		$("#phoneNumberAlert").show();
		return false;
	} else {
		closeAlert();
	}
	$.ajax({
		url : result + "/Login/sendCode/",
		data : {
			phoneNum : phoneNum
		// 参数
		},
		type : "POST",
		success : function(re) {
			console.log(re);
		}
	});
	$("#codeSendSuccessAlert").show();
	sendCodeBtn.disabled = true;
	let	count = 60;// 重复发送阀值
	sendCodeBtn.value = count + "秒后，重新发送";
	function countDown() {
		count--;
		sendCodeBtn.value = count + "秒后，重新发送";
		if (count == 0) {
			clearInterval(timer);
			sendCodeBtn.disabled = false;
			sendCodeBtn.value = "重新发送";
			$("#codeSendSuccessAlert").hide();
		}
	}
	timer = setInterval(countDown, 1000);
}

// 点击叉时，关闭提示框
function closeAlert() {
	$("#phoneNumberAlert").hide();
	$("#myAlert").hide();
	$("#passWordAlert").hide();
	$("#checkPassWordLength").hide();
	$("#userIdCanUseAlert").hide();
	$("#userIdAlert").hide();
	$("#userIdcheck").hide();
	$("#codeNumberAlert").hide();
	$("#welcomeInfo").hide();
	$("#codeSendSuccessAlert").hide();
}