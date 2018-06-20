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
            background: url("images/time.jpg") no-repeat;
            background-size: cover;
        }
        .login{
        	float: right;
            width: 280px;
            height: 260px;
            padding: 10px 20px;
            border: 1px solid #e0e0e0;
            background-color: #fff;
            position: fixed;
    		bottom: 34%;
    		right: 16%;
        }
        .login h3{
            font-size: 24px;
            font-family: "Microsoft YaHei";
            font-weight: 600;
            height: 60px;
            line-height: 60px;
            text-align: center;
        }
        
        .name-box,
        .password-box,
        .type-box,
        .field-box,
        .register-box{
            text-align: center;
            margin-top: 6px;
        }
        
        .type-box{
        	margin-bottom: 12px;
        }

		.login .type-box .user-type{
            width: 120px;
            height: 24px;
        }
        
        .login .name-box input,
        .login .password-box input{
            width: 160px;
            height: 18px;
            margin-left: 6px;
        }
        
         .field-box{
            font-size: 12px;
        }
        .field-box label{
            float: left;
            padding-left: 40px;
        }
        .field-box a{
            float: right;
            text-decoration: none;
            color: #f00;
            padding-right: 40px;
        }
        
        .login-btn{
            text-align: center;
            margin-top: 36px;
        }
        .login-btn input{
            width: 198px;
            height: 24px;
            margin: 0 5px;
            box-shadow: 0 2px 5px rgba(0,28,88,.3);
            cursor: pointer;
            color: #6d798c;
        }
        
         .go-register{
            float: right;
            font-size: 12px;
            padding-right: 40px;
        }
        .go-register a{
            font-weight: 700;
            text-decoration: none;
            color: #449d44;
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
        	margin: -120px 0 0 -150px; 
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
    <script src="lib/jquery/jquery.min.js"></script>
	<script>
		$(function(){
			$('#login_Btn').click(function(){
				if($('#name').val != "" && $('#pw').val() != ""){
					$.ajax({
						type: "post",
						url: "loginCtrl",
						async: true,
						data: {
							"userType": $(".user-type option:selected").val(),
							"userName": $('#name').val(),
							"passWord": $('#pw').val()
						},
						dataType: "json",
						success: function(data){
							$('.bg-model').show();
							if(data.state){
								$('.bg-model .warn p').html("欢迎" + $('#name').val() + "登录成功");
								$('.bg-model .warn .btn-confirm').click(function(){
									if($(".user-type option:selected").val() == "consumer"){
										window.location.href = "index.jsp?account="+data.account;
									}else if($(".user-type option:selected").val() == "shop"){
										window.location.href = "shopIndex.jsp?account="+data.account;
									}else if($(".user-type option:selected").val() == "operator"){
										window.location.href = "operatorIndex.jsp?account="+data.account;
									}
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
				}else{
					$('.bg-model').show();
					$('.bg-model .warn p').html("账号或密码不能为空");
					$('.bg-model .warn .btn-confirm').click(function(){
						window.location.href = "login.jsp";
					});
				}
			});
		});
	</script>
</head>
<body>
	<div id="container"></div>
	<div class="login">
	    <form class="login-form">
	        <h3>登陆</h3>
	        <div class="type-box">
	            <select class="user-type">
	                <option value="consumer">普通用户</option>
	                <option value="shop">店铺商家</option>
	                <option value="operator">运营商</option>
	            </select>
        	</div>
	        <div class="name-box">
	            <label for="name">账号</label><input type="text" placeholder="请输入账号" id="name" name="userName">
	        </div>
	        <div class="password-box">
	            <label for="pw">密码</label><input type="password" placeholder="请输入密码" id="pw" name="passWord">
	        </div>
	        <div class="field-box">
	            <label for="autologin"><input type="checkbox" value="autologin" id="autologin">7天内自动登录</label>
	            <a href="#" class="forgot-pw">忘记密码?</a>
	        </div>
	        <div class="login-btn">
	            <input type="button" value="登陆" id="login_Btn">
	        </div>
	        <div class="register-box">
	            <div class="go-register">
	                <span>还没有账号?</span><a href="register.jsp">去注册</a>
	            </div>
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