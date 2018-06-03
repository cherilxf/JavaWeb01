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
        .register{
            width: 240px;
            height: 200px;
            margin: 100px 200px;
            padding: 10px 20px;
            border: 1px solid #e0e0e0;
            background-color: #F6F5F0;
            position: relative;
        }
        .register h3{
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

        .hidden-msg{
            display: none;
        }
        .show-msg{
            display: block;
            width: 160px;
            height: 20px;
            margin: 2px 0 0 58px;
            background: #ff0000;
        }

        .register .name-box input,
        .register .password-box input{
            width: 160px;
            height: 18px;
            margin-left: 6px;
        }

        .register-btn{
            text-align: center;
            margin-top: 16px;
        }
        .register-btn input{
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
        	font-size: 16px;
        	cursor: pointer;
        }
    </style>
    
	<script type="text/javascript" src="jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var flag1 = false;
			var flag2 = false;
			$('#name')
			.focus(function (){
				$('#msg_name').removeClass('show-msg').addClass('hidden-msg');
			})
			.blur(function(){
				var userName = $(this).val();
				if(userName.length > 0){
					$.ajax({
						type: "post",
						url: "registerCtrl",
						data: {
							"userName": userName,
							"fn": "checkName"
						},
						dataType: "json",
						success: function(data){
							if(data.state){
								$('#msg_name').removeClass('hidden-msg').addClass('show-msg').text("用户名已被占用！！！");
								flag1 = false;
							}else{
								flag1 = true;
							}
						},
						error: function(XMLHttpRequest, textStatus, errorThrown){
				            alert(XMLHttpRequest.readyState);
				            alert(XMLHttpRequest.status);
				            alert(textStatus);
						}
					});
				}else{
					$('#msg_name').removeClass('hidden-msg').addClass('show-msg').text("用户名不能为空！！！");
				};
			});
			
			$('#pw').blur(function(){
				var passWord = $('#pw').val();
				if(passWord == ""){
					$('#msg_pw').removeClass('hidden-msg').addClass('show-msg').text("密码不能为空！！！");
				}else if(passWord.length < 6 || passWord.length > 16){
					$('#msg_pw').removeClass('hidden-msg').addClass('show-msg').text("密码为6-16位！！！");
				}else{
					flag2 = true;
				}
			});
			
			$('#pw').focus(function(){
				$('#msg_pw').removeClass('show-msg').addClass('hidden-msg');
			});
			
			$('#register_btn').click(function(){
				var userName = $('#name').val();
				var passWord = $('#pw').val();
				if(userName != "" && passWord != ""){
					if(flag1 && flag2){
						$.ajax({
							type: "get",
							url: "registerCtrl",
							data: {
								"username": userName,
								"password": passWord,
								"fn": "register"
							},
							dataType: "json",
							success: function(data){
								$('.bg-model').show();
								if(data.state){
									$('.bg-model .warn p').html("恭喜" + userName + "注册成功");
									$('.bg-model .warn .btn-confirm').html("立即登录").click(function(){
										window.location.href = "login.jsp";
									});
								}else{
									$('.bg-model .warn p').html("注册失败,服务器错误");
									$('.bg-model .warn .btn-confirm').html("确定").click(function(){
										window.location.href = "register.jsp";
									});
								}
							},
							error: function(XMLHttpRequest, textStatus, errorThrown){
					            alert(XMLHttpRequest.readyState);
					            alert(XMLHttpRequest.status);
					            alert(textStatus);
							}
						});
					}else{
						$('.bg-model').show();
						$('.bg-model .warn p').html("注册失败,该用户信息已存在");
						$('.bg-model .warn .btn-confirm').html("确定").click(function(){
							window.location.href = "register.jsp";
						});
					}
				}else{
					$('.bg-model').show();
					$('.bg-model .warn p').html("用户账号或密码不能为空");
					$('.bg-model .warn .btn-confirm').html("确定").click(function(){
						window.location.href = "register.jsp";
					});
				}
				
			});
			
			$('#back').click(function(){
				window.location.href = "login.jsp";
			});
		});
	</script>
</head>
<body>
	<div class="register">
	    <form action="RegisterCtrl" method="get" class="register-form">
	        <h3>注册</h3>
	        <div></div>
	        <div class="name-box">
	            <label for="name">账号</label><input id="name" name="username" type="text" placeholder="请输入账号">
	        </div>
	        <div class="hidden-msg" id="msg_name"></div>
	        <div class="password-box">
	            <label for="pw">密码</label><input id="pw" name="password" type="password" placeholder="请输入密码">
	        </div>
	        <div class="hidden-msg" id="msg_pw"></div>
	
	        <div class="register-btn">
	            <input type="button" value="注册" id="register_btn">
	            <input type="button" value="返回" id="back">
	        </div>
	    </form>
	</div>
	<div class="bg-model">
		<div class="warn">
			<p></p>
			<div class="bg-button">
				<button class="btn-confirm"></button>
			</div>
		</div>
	</div>
</body>
</html>