<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
        *{
            padding: 0;
            margin: 0;
        }
        body{
            font-family:"Microsoft YaHei","SimSun";
            background: url("images/zhou-1.jpg") no-repeat;
            background-size: cover;
        }
        .login{
            width: 240px;
            height: 200px;
            margin: 100px 200px;
            padding: 10px 20px;
            border: 1px solid #e0e0e0;
            background-color: #F6F5F0;
        }
        .login h3{
            font-size: 24px;
            font-family: "Microsoft YaHei";
            font-weight: 600;
            height: 60px;
            line-height: 60px;
            text-align: center;
        }
        .name-box, .password-box{
            text-align: center;
            margin-top: 6px;
        }

        .login .name-box input,
        .login .password-box input{
            width: 160px;
            height: 18px;
            margin-left: 6px;
        }
        .login-btn{
            text-align: center;
            margin-top: 16px;
        }
        .login-btn input{
            width: 42px;
            height: 20px;
            margin: 0 5px;
            box-shadow: 0 2px 5px rgba(0,28,88,.3);
            cursor: pointer;
            color: #6d798c;
        }
        
        .bg-model{
        	top: 0%;
        	left: 0%;
        	background: rgba(0, 0, 0, 0.3);
        	width: 100%;
        	height: 100%;
        	position: fixed;
        	z-index: 9999;
        	opacity: 1;
        	display: none;
        }
        .warn{
        	width: 360px;
        	height: 240px;
        	position: absolute;
        	top: 50%;
        	left: 50%;
        	margin: -120px 0 0 -200px; 
        	border-radius: 4px;
        	text-align: center;
        	background-color: #fff;
        }
        .warn p{
        	width: 100%;
        	height: 60px;
        	color: #f00;
        	font-size: 26px;
        	margin: 65px 0 30px 0;
        	font-family: initial;
        }
        .warn .btn-confirm{
        	width: 48px;
        	height: 24px;
        	font-size: 16px;
        	cursor: pointer;
        }
    </style>
    <script src="jquery-1.11.1.min.js"></script>
	<script>
		$(function(){
			$('#register_Btn').click(function(){
				window.location.href = "register.jsp";
			});
			
			$('#login_Btn').click(function(){
				$.ajax({
					type: "post",
					url: "loginCtrl",
					async: false,
					data: {
						"userName": $('#name').val(),
						"passWord": $('#pw').val()
					},
					dataType: "json",
					success: function(data){
						$('.bg-model').show();
						if(data.state){
							$('.bg-model .warn p').html("欢迎" + $('#name').val() + "登录成功");
							$('.bg-model .warn .btn-confirm').click(function(){
								window.location.href = "index.jsp";
							});
						}else{
							$('.bg-model .warn p').html("登录失败，账号或密码有误");
							$('.bg-model .warn .btn-confirm').click(function(){
								window.location.href = "login.jsp";
							});
						}
					},
					error: function(XMLHttpRequest, textStatus, errorThrown){
			            alert(XMLHttpRequest.readyState);
			            alert(XMLHttpRequest.status);
			            alert(textStatus);
					}
				});
			});
		});
	</script>
</head>
<body>
	<div class="login">
	    <form class="login-form">
	        <h3>登陆</h3>
	        <div class="name-box">
	            <label for="name">账号</label><input type="text" placeholder="请输入账号" id="name" name="userName">
	        </div>
	        <div class="password-box">
	            <label for="pw">密码</label><input type="password" placeholder="请输入密码" id="pw" name="passWord">
	        </div>
	        <div class="login-btn">
	            <input type="button" value="登陆" id="login_Btn">
	            <input type="button" value="注册" id="register_Btn">
	        </div>
	    </form>
	</div>
	
	<div class="bg-model">
		<div class="warn">
			<p></p>
			<div class="bg-button">
				<button class="btn-confirm">确认</button>
			</div>
		</div>
	</div>
</body>
</html>