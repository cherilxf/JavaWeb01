<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>我的订单</title>
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
	                    <li class="header-nav-active"><a href="#">我的订单</a></li>
	                    <li><a href="#">发现美食</a></li>
	                    <li><a href="#">优惠专区</a></li>
	                    <li><a href="#">个人中心</a></li>
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
	                        <li role="presentation" class="active"><a href="#category_01" aria-controls="category_01" role="tab" data-toggle="tab">全部订单</a></li>
	                        <li role="presentation"><a href="#category_02" aria-controls="category_02" role="tab" data-toggle="tab">待付款</a></li>
	                        <li role="presentation"><a href="#category_03" aria-controls="category_03" role="tab" data-toggle="tab">待评价</a></li>
	                        <li role="presentation"><a href="#category_04" aria-controls="category_04" role="tab" data-toggle="tab">查看我的评价</a></li>
	                        <li role="presentation"><a href="#category_05" aria-controls="category_05" role="tab" data-toggle="tab">退款/售后</a></li>
	                    </ul>
	                </div>
	            <div class="tab-content">
	                <div role="tabpanel" class="tab-pane fade in active" id="category_01">
	                    <div class="line"></div>
	                    <div class="order-box-left">
	                        <ul>
	                            <li>
	                                <div class="orderInfo">
	                                    <div class="orderInfo-left">
	                                        <img src="images/timg.jpg" alt="">
	                                    </div>
	                                    <div class="orderInfo-right">
	                                        <p class="shop-name">
	                                            华莱士
	                                        </p>
	                                        <i>已完成</i>
	                                        <p class="order-time">
	                                            下单时间：<span>2018-06-11 23:20</span>
	                                        </p>
	                                        <p class="order-sumPrice">
	                                            总价：&yen;<span>20</span>
	                                        </p>
	                                    </div>
	                                </div>
	                            </li>
	                        </ul>
	                    </div>
	                    <div class="order-box-right">
	                        <div class="order-title">
	                            <h4>订单已完成 ></h4>
	                            <p>感谢您对本店铺的支持，期待你的再次光临。</p>
	                            <span>再来一单</span>
	                        </div>
	                        <div class="order-foodInfo">
	                            <p class="order-shopName">麦当劳</p>
	                            <div class="foodIndo-box">
	                                <div class="foodInfo-box-left">
	                                    <img src="images/timg.jpg" alt="">
	                                </div>
	                                <div class="foodInfo-box-right">
	                                    <p>
	                                        <span class="foodName">至尊双层鸡腿堡 </span>×<span class="foodNum">2</span>
	                                    </p>
	                                    <p class="foodPrice">&yen;<span>18</span></p>
	                                </div>
	                            </div>
	                            <div class="sum-box">
	                                <p class="sumPrice">总计&yen;<span>120</span> 优惠&yen;<span>20</span></p>
	                                <p class="pay">实付 &yen;<span>100</span></p>
	                            </div>
	                        </div>
	                        <div class="address">
	                            <div class="title-left">
	                                <span>配送地址</span>
	                            </div>
	                            <div class="content-right">
	                                <p>
	                                    <span>廖XX(先生) 135331XXXX5</span><br>
	                                    <span>仲恺农业工程学院(8栋XXX)</span>
	                                </p>
	                            </div>
	                        </div>
	                        <div class="psService">
	                            <div class="title-left">
	                                <span>配送服务</span>
	                            </div>
	                            <div class="content-right">
	                                <p>
	                                    <span>由商家提供配送服务</span>
	                                </p>
	                            </div>
	                        </div>
	                        <div class="orderNum">
	                            <div class="title-left">
	                                <span>订单号码</span>
	                            </div>
	                            <div class="content-right">
	                                <p>
	                                    <span>由商家提供配送服务</span>
	                                </p>
	                            </div>
	                        </div>
	                        <div class="orderTime">
	                            <div class="title-left">
	                                <span>订单时间</span>
	                            </div>
	                            <div class="content-right">
	                                <p>
	                                    <span>2018-06-11 23:20:12</span>
	                                </p>
	                            </div>
	                        </div>
	                        <div class="payStyle">
	                            <div class="title-left">
	                                <span>支付方式</span>
	                            </div>
	                            <div class="content-right">
	                                <p>
	                                    <span>在线支付</span>
	                                </p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div role="tabpanel" class="tab-pane fade in" id="category_02">
	                </div>
	                <div role="tabpanel" class="tab-pane fade in" id="category_03">
	                </div>
	                <div role="tabpanel" class="tab-pane fade in" id="category_04">
	                </div>
	                <div role="tabpanel" class="tab-pane fade in" id="category_05">
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