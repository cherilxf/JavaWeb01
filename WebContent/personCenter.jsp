<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>个人中心</title>
	<link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="lib/jquery/jquery.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/indexJs.js"></script>
</head>
<body>
	<!-- 头部区域 -->
	<header id="header">
	    <!-- 头部广告 -->
	    <div class="header-content">
	        <section id="home_slide" class="carousel slide" data-ride="carousel">
	            <!-- 指示器 -->
	            <ol class="carousel-indicators">
	                <li data-target="#home_slide" data-slide-to="0" class="active"></li>
	                <li data-target="#home_slide" data-slide-to="1"></li>
	                <li data-target="#home_slide" data-slide-to="2"></li>
	                <li data-target="#home_slide" data-slide-to="3"></li>
	                <li data-target="#home_slide" data-slide-to="4"></li>
	            </ol>
	            <!-- 轮播项 -->
	            <div class="carousel-inner" role="listbox">
	                <div class="item active" data-slide-image="images/slide_01.png" data-image-alt=""></div>
	                <div class="item" data-slide-image="images/slide_02.png" data-image-alt=""></div>
	                <div class="item" data-slide-image="images/slide_03.png" data-image-alt=""></div>
	                <div class="item" data-slide-image="images/slide_04.png" data-image-alt=""></div>
	                <div class="item" data-slide-image="images/slide_05.png" data-image-alt=""></div>
	            </div>
	            <!-- 控制按钮 -->
	            <a class="left carousel-control" href="#home_slide" role="button" data-slide="prev">
	                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	                <span class="sr-only">Previous</span>
	            </a>
	            <a class="right carousel-control" href="#home_slide" role="button" data-slide="next">
	                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                <span class="sr-only">Next</span>
	            </a>
	        </section>
	    </div>
	    <!-- 头部广告结束 -->
	
	    <nav class="header-bar">
	        <div class="container">
	            <div class="collapse navbar-collapse" id="nav_menu">
	                <ul class="nav navbar-nav">
	                    <li><a href="#">美团</a></li>
	                    <li><a href="index.html">首页</a></li>
	                    <li><a href="orderInfo.html">我的订单</a></li>
	                    <li><a href="#">发现美食</a></li>
	                    <li><a href="#">优惠专区</a></li>
	                    <li class="header-nav-active"><a href="#">个人中心</a></li>
	                </ul>
	                <a href="#" id="logout">注销</a>
	                <a href="#" id="exit">退出账号</a>
	            </div>
	        </div>
	    </nav>
	</header>
	<!-- 头部结束 -->
	
	<section id="order">
	    <div class="container">
	        <div class="order-info">
	            <div class="touch-scroll">
	                <ul class="nav nav-tabs" role="tablist">
	                    <li role="presentation" class="active"><a href="#category_01" aria-controls="category_01" role="tab" data-toggle="tab">查看个人信息</a></li>
	                    <li role="presentation"><a href="#category_02" aria-controls="category_02" role="tab" data-toggle="tab">设置个人信息</a></li>
	                    <li role="presentation"><a href="#category_03" aria-controls="category_03" role="tab" data-toggle="tab">管理地址</a></li>
	                    <li role="presentation"><a href="#category_04" aria-controls="category_04" role="tab" data-toggle="tab">账号与安全</a></li>
	                </ul>
	            </div>
	            <div class="tab-content">
	                <div role="tabpanel" class="tab-pane fade in active" id="category_01">
	                    <form action="" method="post" class="person-form">
	                        <br><h1 align="center">个人信息</h1><hr />
	                        <table align="center">
	                            <tr>
	                                <td>姓名</td>
	                                <td><input type="text"></td>
	                            </tr>
	                            <tr>
	                                <td>昵称</td>
	                                <td><input type="text"></td>
	                            </tr>
	                            <tr>
	                                <td>年龄</td>
	                                <td><input type="text"></td>
	                            </tr>
	                            <tr>
	                                <td>手机号码</td>
	                                <td>
	                                    <input type="tel">
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>微信</td>
	                                <td>
	                                    <input type="tel">
	                                </td>
	                            </tr>
	                        </table>
	                    </form>
	                </div>
	                <div role="tabpanel" class="tab-pane fade in" id="category_02">
	                    <form action="" method="post" class="person-form">
	                        <br><h1 align="center">个人信息</h1><hr />
	                        <table align="center">
	                            <tr>
	                                <td>姓名</td>
	                                <td><input type="text"></td>
	                            </tr>
	                            <tr>
	                                <td>昵称</td>
	                                <td><input type="text"></td>
	                            </tr>
	                            <tr>
	                                <td>年龄</td>
	                                <td><input type="text"></td>
	                            </tr>
	                            <tr>
	                                <td>手机号码</td>
	                                <td>
	                                    <input type="tel">
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>微信</td>
	                                <td>
	                                    <input type="tel">
	                                </td>
	                            </tr>
	                        </table>
	                    </form>
	                </div>
	                <div role="tabpanel" class="tab-pane fade in" id="category_03">
	                    <div class="manage-address-left">
	                        <div class="addressTitle-box">
	                            <div class="addressTitle">
	                                <p><sapn class="address-name">廖XX </sapn><span class="address-tel">135****9004</span></p>
	                                <p>广东 广州市 海珠区 纺织路东沙街24号</p>
	                            </div>
	                            <div class="addressTitle">
	                                <p><sapn class="address-name">廖XX </sapn><span class="address-tel">135****9004</span></p>
	                                <p>广东 广州市 海珠区 纺织路东沙街24号</p>
	                            </div>
	                            <div class="addressTitle">
	                                <p><sapn class="address-name">廖XX </sapn><span class="address-tel">135****9004</span></p>
	                                <p>广东 广州市 海珠区 纺织路东沙街24号</p>
	                            </div>
	                        </div>
	                        <div>
	                            <button class="addAddress">新增收货地址</button>
	                        </div>
	                    </div>
	                    <div class="manage-address-right">
	                        <form action="" method="post" class="address-form">
	                            <br><h1 align="center">新增收货地址</h1><hr />
	                            <table align="center">
	                                <tr>
	                                    <td>姓名</td>
	                                    <td><input type="text"></td>
	                                </tr>
	                                <tr>
	                                    <td>电话</td>
	                                    <td>
	                                        <input type="text"></td>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>地区</td>
	                                    <td><input type="text"></td>
	                                </tr>
	                                <tr>
	                                    <td>地址</td>
	                                    <td><input type="text"></td>
	                                </tr>
	                                <tr>
	                                    <td>邮编</td>
	                                    <td><input type="text"></td>
	                                </tr>
	                            </table>
	                        </form>
	                    </div>
	                </div>
	                <div role="tabpanel" class="tab-pane fade in" id="category_04">
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	
	<!-- 脚注区域 -->
	<footer class="footer">
	
	</footer>
	<!-- 脚注区域结束 -->
</body>
</html>