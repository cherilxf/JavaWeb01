<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>美食</title>
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
                        <li><a href="#" onclick="index()">美团</a></li>
                        <li class="header-nav-active"><a href="#" onclick="index()">首页</a></li>
                        <li><a href="#" onclick="myOrder()">我的订单</a></li>
                        <li><a href="#" onclick="findFood()">发现美食</a></li>
                        <li><a href="#" onclick="youHui()">优惠专区</a></li>
                        <li><a href="#" onclick="personCenter()">个人中心</a></li>
                    </ul>
                    <a href="InvalidateServlet" id="exit">退出账号</a>
                </div>
            </div>
        </nav>
    </header>
    <!-- 头部结束 -->

    <!-- 内容导航区域 -->
    <section class="content">
        <div class="container">
            <nav class="navBar-left">
                <div class="sortTitle">
                    <p>菜单分类</p>
                </div>
                <div class="wrapper">
                    <ul>
                        <li class="active" id="tjsj-btn">
                            <a href="#">推荐商家</a>
                        </li>
                        <li id="jrcptj-btn">
                            <a href="#">今日菜品推介</a>
                        </li>
                        <li id="dpdp-btn">
                            <a href="#">大牌店铺</a>
                        </li>
                        <li id="xyyx-btn">
                            <a href="#">校园优选</a>
                        </li>
                        <li id="xsrm-btn">
                            <a href="#">限时热卖</a>
                        </li>
                        <li id="msmk-btn">
                            <a href="#">美食美刻</a>
                        </li>
                        <li id="zjhb-btn">
                            <a href="#">炸鸡汉堡</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="product-info">
                <div class="nav-shopName"></div>
                <div id="tjsj" class="main selected">
                </div>
                <div id="jrcptj" class="main food-main">
                </div>
                <div id="dpdp" class="main">
                </div>
                <div id="xyyx" class="main">
                </div>
                <div id="xsrm" class="main food-main">
                </div>
                <div id="msmk" class="main food-main">
                </div>
                <div id="zjhb" class="main food-main">
                </div>
                <!-- 店铺内的菜品信息 -->
                <div class="shop-food-info main food-main">
                    <div class="touch-scroll">
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#category_01" aria-controls="category_01" role="tab" data-toggle="tab">点餐</a></li>
                            <li role="presentation"><a href="#category_02" aria-controls="category_02" role="tab" data-toggle="tab">评价</a></li>
                            <li role="presentation"><a href="#category_03" aria-controls="category_03" role="tab" data-toggle="tab">商家</a></li>
                        </ul>
                    </div>

                    <!-- 商店内进行订餐 -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="category_01">
                        </div>
                        <!-- 查看用户评价 -->
                        <div role="tabpanel" class="tab-pane fade in" id="category_02">
                            <div class="evaluation-title">
                                <div class="evaluation-title-left">
                                    <span>5.0</span>
                                    <p>综合评价</p>
                                    <p>高于周边商家80.7%</p>
                                </div>
                                <div class="line"></div>
                                <div class="evaluation-title-right">
                                    <p>
                                        <span>服务态度5.0</span>
                                        <span class="grade"><span class="star"></span></span>
                                    </p>
                                    <p>
                                        <span>菜品评价4.8</span>
                                        <span class="grade"><span class="star"></span></span>
                                    </p>
                                    <p>送达时间<span class="finish-time">28分钟</span></p>
                                </div>
                            </div>
                            <div class="evaluation-sort">
                                <ul>
                                    <li>全部 669</li>
                                    <li>满意 649</li>
                                    <li>不满意 42</li>
                                    <li>服务不错 15</li>
                                    <li>送货快 24</li>
                                </ul>
                            </div>
                            <div class="evaluation-content">
                                <div class="evaluation-content-left">
                                    <img src="images/timg.jpg" alt="">
                                </div>
                                <div class="evaluation-content-right">
                                    <p>匿名用户<span class="evaluation-time">2018-06-10</span></p>
                                    <p>鸡翅很好吃，可乐也很好喝，食物看起来很新鲜，送餐小哥人很好，送餐又快，服务也不错，就是有点贵，大家放心点。</p>
                                </div>
                            </div>
                        </div>
                        <!-- 查看商家信息 -->
                        <div role="tabpanel" class="tab-pane fade in" id="category_03">
                            <div class="peisone-info">
                                <h4>配送信息</h4>
                                <p>由商家配送提供配送，约28分钟送达，距离2.1km</p><br>
                                <p>配送费&yen 9</p>
                            </div>
                            <div class="activity-service">
                                <h4>活动与服务</h4>
                                <p>
                                    <span>满减</span> 满89减20
                                </p><br>
                                <p>
                                    <span>特价</span> 特价商品33元起
                                </p><br>
                                <p>
                                    <span>首单</span> 新用户下单立减18元(不与其它活动同享)
                                </p><br>
                                <p>
                                    <span>发票</span> 新用户下单立减18元(不与其它活动同享)
                                </p>
                            </div>
                            <div class="shangjia-xinxi">
                                <h4>商家信息</h4>
                                <p>
                                    品类：<span>炸鸡炸串、汉堡</span>
                                </p><br>
                                <p>
                                    商家电话：<span>020 0000 0000</span>
                                </p><br>
                                <p>
                                    地址：<span>广州市海珠区江南大道中666号C168铺</span>
                                </p><br>
                                <p>
                                    营业时间<span>(00:00-04:45,06:00-11:00,12:00-23:55)</span>
                                </p><br>
                                <p>
                                    营业资质<span>></span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="cart">
                <div class="cartitle">
                    <p>我的菜单栏</p>
                </div>
                <div class="cart-shopName">
                	<p></p>
                </div>
                <div class="cartfood">
                    <div class="cartfood-title">
                        <ul>
                            <li>菜品</li>
                            <li>数量</li>
                            <li>小计</li>
                            <li>删除</li>
                        </ul>
                    </div>
                    <div class="cartfood-info-box" id="cartfood_info_box">
                    </div>
                </div>

                <div class="goPay-box">
                    <div class="pay-info">
                        <p class="amount">合计数量：<span></span>份</p>
                        <p class="pay-sumPrice">总额：&yen;<span></span>  优惠：&yen;<span></span></p>
                    </div>
                    <div class="pay-submit">
                        <a href="#" class="goPay">去结算</a>
                    </div>
                </div>
            </div>
            
            <div class="order">
                    <div class="warn">
                        <div class="cancel">×</div>
                        <h4 class="order-title">确认订单</h4>
                        <div class="address">
                            <p>
                                订单配送至
                            </p><br>
                            <p class="orderAddress">
                                仲恺农业工程学院北区宿舍8XXX
                            </p><br>
                            <p class="orderTel">
                                廖XX(先生) 135XXXX9005
                            </p>
                        </div>
                        <div class="arrive-time">
                            <p>送达时间</p>
                            <span>尽快送达(预计12:12送达)  ></span>
                        </div>
                        <div class="pay-style">
                            <p>支付方式</p>
                            <span>在线支付</span>
                        </div>
                        <div class="order-info-box">
                            <p class="order-shop-name"><span></span></p>
                            <div id="order-food-info-box">
                            </div>

                            <div class="canhe-fee">
                                <div class="canhe-fee-left">
                                    <span>包装</span>
                                </div>
                                <div class="canhe-fee-right">
                                    <p>餐盒</p>
                                    <p class="canhe-price"><span>3</span> &yen;</p>
                                </div>
                            </div>
                            <div class="peisong-fee">
                                <div class="peisong-fee-left">
                                    <span>商家</span>
                                </div>
                                <div class="peisong-fee-right">
                                    <p>配送费</p>
                                    <p class="peisong-price"><span>3</span> &yen;</p>
                                </div>
                            </div>
                            <div class="youhui-fee">
                                <div class="youhui-fee-left">
                                    <span>满减</span>
                                </div>
                                <div class="youhui-fee-right">
                                    <p>在线支付立减优惠</p>
                                    <p class="youhui-price"><span>0</span> &yen;</p>
                                </div>
                            </div>
                            <div class="hongbao">
                                <div class="hongbao-left">
                                    <span>红包</span>
                                </div>
                                <div class="hongbao-right">
                                    <p>(含店铺专享红包)</p>
                                    <p class="hongbao-price"><span>3</span> &yen;</p>
                                </div>
                            </div>
                        </div>
                        <div class="pay-option">
                            <div class="pay-option-info">
                                <p class="pay-option-sumPrice">总额  <span></span> &yen;</p>
                                <p class="pay-option-youhui">已优惠  <span></span> &yen;</p>
                            </div>
                            <div class="pay-option-submit">
                                <a href="#" onclick="pay()">立即支付</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="order-state">
	                <div class="order-state-warn">
	                	<p></p>
	                	<button class="order-state-btn">确定</button>
	                </div>
                </div>

            <div class="tip">
                <p class="tip-title">友情提示</p>
                <span class="tip-content">
                    新疆、西藏、黑龙江等部分地区暂未开通服务，对于偏远地区如山区等特殊地区恕不配送，不便之处，敬请原谅。
                </span>
            </div>
        </div>
    </section>
    <!-- 内容导航结束 -->


    <!-- 脚注区域 -->
    <footer class="footer">

    </footer>
    <!-- 脚注区域结束 -->
</body>
</html>