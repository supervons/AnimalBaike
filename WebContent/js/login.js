$(function() {
	$('#username').focus().blur(checkName);
	$('#password').blur(checkPassword);
	if($("#loginFlag").val()=='false'){
		$("#userLogincheck").show();
	}else{
		$("#userLogincheck").hide();
	}
});

function checkName() {
	var name = $('#username').val();
	if (name == null || name == "") {
		// 提示错误
		$('#count-msg').html("用户名不能为空");
		return false;
	}

	$('#count-msg').empty();
	return true;
}

function checkPassword() {
	var password = $('#password').val();
	if (password == null || password == "") {
		// 提示错误
		$('#password-msg').html("密码不能为空");
		return false;
	}

	$('#password-msg').empty();
	return true;
}
// 登陆检测手机号格式
function checkLogin() {
	let	userId = $("#userId").val();
	let	userPassword = $("#userPassword").val();
	if (userId == "" || userPassword == "") {
		closeAlert();
		$("#userInputcheck").show();
		return false;
	} else {
		debugger;
		var flag = true;
		$.ajax({
			url : result + "/Login/login/",
			data : {
				userId : userId,// 参数
				userPassword : userPassword
			},
			type : "POST",
			async : false,
			success : function(re) {
				if (re == 1) {
					closeAlert();
					alert('s');
					$("#userLogincheck").show();
				} else {
					closeAlert();
					alert('ss');
					$("#userLogincheck").show();
					flag = false;
				}
			}
		});
		return false;
	}

}
//点击叉时，关闭提示框
function closeAlert() {
	$("#userLogincheck").hide();
	$("#userInputcheck").hide();
}
