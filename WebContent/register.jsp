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
            width: 280px;
            height: 340px;
            margin: 100px 200px;
            padding: 10px 30px;
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

        .name-box,
        .type-box,
        .password-box1,
        .password-box2{
            width: 100%;
            height: 100%;
            line-height: 28px;
            text-align: center;
            margin: 6px 0;
        }
         .type-box{
            margin-bottom: 12px;
        }
        .register .type-box .user-type{
            width: 120px;
            height: 24px;
        }

        .hidden-msg{
            display: none;
        }
        .show-msg{
            display: block;
            width: 100%;
            height: 20px;
            text-align: center;
            background: #ff0000;
        }

        .register .name-box input,
        .register .password-box1 input,
        .register .password-box2 input{
            float: right;
            width: 188px;
            height: 24px;
        }

		 .register-xieyi{
            text-align: center;
            font-size: 14px;
        }
        .register-xieyi a{
            text-decoration: none;
            color: #f15353;
        }
		
        .register-btn{
            text-align: center;
            margin-top: 16px;
        }
        #register_btn{
            width: 198px;
            height: 26px;
            font-size: 16px;
            line-height: 26px;
            box-shadow: 0 2px 5px rgba(0,28,88,.3);
            color: #6d798c;
            cursor: pointer;
            disabled: true;
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
        	padding: 0 10px;
        	cursor: pointer;
        }
    </style>
    
	<script type="text/javascript" src="jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var flagName = false;
			var flagPw1 = false;
			var flagPw2 = false;
			
			$('#name')
			.focus(function (){
				$('#msg_name').removeClass('show-msg').addClass('hidden-msg');
			})
			.blur(function(){
				var userType = $(".user-type option:selected").val();
				var userName = $(this).val();
				if(userName != ""){
					$.ajax({
						type: "post",
						url: "registerCtrl",
						data: {
							"userType": userType,
							"userName": userName,
							"fn": "checkName"
						},
						dataType: "json",
						success: function(data){
							if(data.state){
								$('#msg_name').removeClass('hidden-msg').addClass('show-msg').text("账号名已被注册");
								flagName = false;
							}else{
								flagName = true;
							}
						},
						error: function(XMLHttpRequest, textStatus, errorThrown){
				            alert(XMLHttpRequest.readyState);
				            alert(XMLHttpRequest.status);
				            alert(textStatus);
						}
					});
				}else{
					$('#msg_name').removeClass('hidden-msg').addClass('show-msg').text("账号名不能为空");
				};
			});
			
			$('#pw1')
			.blur(function(){
				var passWord = $('#pw1').val();
				if(passWord == ""){
					$('#msg_pw1').removeClass('hidden-msg').addClass('show-msg').text("密码不能为空");
				}else if(passWord.length < 6 || passWord.length > 16){
					$('#msg_pw1').removeClass('hidden-msg').addClass('show-msg').text("密码为6-16位");
				}else{
					flagPw1 = true;
				}
			})
			.focus(function(){
				$('#msg_pw1').removeClass('show-msg').addClass('hidden-msg');
			});
			
			$('#pw2')
			.blur(function(){
				var passWord = $('#pw2').val();
				if(passWord == ""){
					$('#msg_pw2').removeClass('hidden-msg').addClass('show-msg').text("密码不能为空");
				}else if(passWord.length < 6 || passWord.length > 16){
					$('#msg_pw2').removeClass('hidden-msg').addClass('show-msg').text("密码为6-16位");
				}else if($('#pw1').val() != $('#pw2').val()){
					$('#msg_pw2').removeClass('hidden-msg').addClass('show-msg').text("输入密码不一致");
				}else{
					flagPw2 = true;
				}
			})
			.focus(function(){
				$('#msg_pw2').removeClass('show-msg').addClass('hidden-msg');
			});
			
			$('#register_btn').click(function(){
				var userType = $(".user-type option:selected").val();
				var userName = $('#name').val();
				var passWord1 = $('#pw1').val();
				var passWord2 = $('#pw2').val();
				if(userName != "" && passWord1 != "" && passWord1 != ""){
					if(flagName && flagPw1 && flagPw2){
						$.ajax({
							type: "post",
							url: "registerCtrl",
							data: {
								"userType": userType,
								"userName": userName,
								"passWord": passWord1,
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
					$('.bg-model .warn p').html("账号名或密码不能为空");
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
	        <div class="type-box">
	            <select class="user-type">
	                <option value="consumer">普通用户</option>
	                <option value="shop">店铺商家</option>
	                <option value="operator">运营商</option>
	            </select>
	        </div>
	        <div class="name-box">
	            <label for="name">账号名</label><input type="text" placeholder="请输入账号名" id="name">
	        </div>
	        <div class="hidden-msg" id="msg_name"></div>
	        <div class="password-box1">
	            <label for="pw1">密码</label><input type="password" placeholder="请输入密码" id="pw1">
	        </div>
	        <div class="hidden-msg" id="msg_pw1"></div>
	        <div class="password-box2">
	            <label for="pw2">确认密码</label><input type="password" placeholder="请输入密码" id="pw2">
	        </div>
	        <div class="hidden-msg" id="msg_pw2"></div>
	        <div class="register-xieyi">
	            <a href="#">《关于美食订餐协议》</a>
	        </div>
	        <div class="hidden-msg" id="msg_pw"></div>
	
	        <div class="register-btn">
	            <input type="button" value="同意并注册" id="register_btn">
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