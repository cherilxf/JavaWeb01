<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.bg-model{
    	top: 0%;
    	left: 0%;
    	background: rgba(0, 0, 0, 0.3);
    	width: 100%;
    	height: 100%;
    	position: fixed;
    	z-index: 9999;
    }
    .warn{
    	width: 360px;
    	height: 200px;
    	position: absolute;
    	top: 50%;
    	left: 50%;
    	margin: -180px 0 0 -180px; 
    	border-radius: 4px;
    	text-align: center;
    	background-color: #fff;
    }
    .warn p{
    	font-size: 18px;
    	line-height: 164px;
    }
</style>
</head>
<body>
	<div class="bg-model">
   	<div class="warn">
   		<p>
   			对不起，你还没有登录，请点击<a href="login.jsp">登录</a>
   		</p>
   	</div>
   </div>
</body>
</html>