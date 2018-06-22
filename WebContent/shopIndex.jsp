<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>商铺首页</title>
	<link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/shopCss.css">
    <script src="lib/jquery/jquery.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/shopJs.js"></script>
</head>
<body>
   <!-- 头部区域 -->
    <header class="header-box">
    	<div class="container">
	    	<div class="header-left">
	        	<img src="images/logo.jpg" alt="">
	        </div>
	        <div class="header-right">
	        	<h2>美食汇商家管理系统</h2>
	        </div>
        </div>
    </header>
    <!-- 头部区域结束 -->

    <!-- 操作管理区域 -->
    <section id="managed">
        <div class="container">
            <!-- 选项卡标题 -->
            <div class="touch-scroll">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#category_01" aria-controls="category_01" role="tab" data-toggle="tab">商铺信息管理</a></li>
                    <li role="presentation"><a href="#category_02" aria-controls="category_02" role="tab" data-toggle="tab">美食菜单管理</a></li>
                    <li role="presentation"><a href="#category_03" aria-controls="category_03" role="tab" data-toggle="tab">顾客订单管理</a></li>
                    <li role="presentation"><a href="#category_04" aria-controls="category_04" role="tab" data-toggle="tab">单日账单管理</a></li>
                    <a href="InvalidateServlet" id="exit">退出账号</a>
                </ul>
            </div>
            <!-- 选择卡内容 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="category_01">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="navbarLeft">
                                <ul class="nav nav-pills nav-stacked person-manage-nav" role="tablist">
                                    <li role="presentation" class="active"><a href="#shopinfo_01" aria-controls="shop_manage_01" role="tab" data-toggle="tab">查看店铺信息</a></li>
                                    <li role="presentation"><a href="#shopinfo_02" aria-controls="shop_manage_02" role="tab" data-toggle="tab">修改店铺信息</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="shopInfo-contentRight">
                                <div role="tabpanel" class="tab-pane fade in active" id="shopinfo_01">
                                    <form action="" method="post" class="shopInfo-form">
                                        <br><h1 align="center">查看店铺信息</h1><hr />
                                        <table align="center">
                                            <tr>
                                                <td>商铺名称</td>
                                                <td class="shopCheck-shopName"></td>
                                            </tr>
                                            <tr>
                                                <td>商铺地址</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>商铺配送费</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>商铺餐盒费</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>商铺评分</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>商铺销量</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>商铺优惠</td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>

                                <div role="tabpanel" class="tab-pane fade in" id="shopinfo_02">
                                    <form action="" method="post" class="shopInfo-form checkinfo-shop">
                                        <br><h1 align="center">修改店铺信息</h1><hr />
                                        <table align="center">
                                            <tr>
                                                <td>商铺名称</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>商铺地址</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>商铺配送费</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>商铺餐盒费</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>商铺评分</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>商铺销量</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>商铺优惠</td>
                                                <td><input type="text"></td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div role="tabpanel" class="tab-pane fade in" id="category_02">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="navbarLeft">
                                <ul class="nav nav-pills nav-stacked person-manage-nav" role="tablist">
                                    <li role="presentation" class="active"><a href="#food_manage_01" aria-controls="food_manage_01" role="tab" data-toggle="tab">增加菜单</a></li>
                                    <li role="presentation"><a href="#food_manage_02" aria-controls="food_manage_02" role="tab" data-toggle="tab" onclick="indexInfo()">查看菜单</a></li>
                                    <li role="presentation"><a href="#food_manage_03" aria-controls="food_manage_03" role="tab" data-toggle="tab">修改菜单</a></li>
                                    <li role="presentation"><a href="#food_manage_04" aria-controls="food_manage_04" role="tab" data-toggle="tab">删除菜单</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="food-contentRight">
                                <div role="tabpanel" class="foodInfo tab-pane fade in active" id="food_manage_01">
                                    <div>
	                                    <form class="shopInfo-form">
	                                        <br><h1 align="center">增加菜单</h1><hr/>
	                                        <table align="center" class="add-food-table">
	                                            <tr>
	                                                <td>菜品名称</td>
	                                                <td><input type="text" id="add_food_name"></td>
	                                            </tr>
	                                            <tr>
	                                                <td>菜品单价</td>
	                                                <td><input type="text" id="add_food_price"></td>
	                                            </tr>
	                                        </table>
	                                        <div class="btn-box">
				                                <input type="button" value="提交" id="add_food_btn" onclick="addFood()">
				                                <input type="reset" value="重置" class="clear_btn">
	                            			</div>
	                                    </form>
                                    </div>
                                </div>
                                <div role="tabpanel" class="foodInfo tab-pane fade in" id="food_manage_02">
                                    <div>
                                        <table class="food-check-table">
                                        	<th>
                                        		菜品名
                                            </th>
                                            <th>
                                        		菜品价格
                                            </th>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                        <div class="foodcheck-btn">
                                            <ul>
                                                <li>
                                                	第<span class="nowPage"></span>页/共<span class="sumPage"></span>页
                                                </li>
                                                <li>
                                                    <a href="#" class="prevPage" onclick="prevInfo();">上一页</a>
                                                </li>
                                                <li>
                                                    <a href="#" class="indexPage" onclick="indexInfo();">首页</a>
                                                </li>
                                                <li>
                                                    <a href="#" class="nextPage" onclick="nextInfo();">下一页</a>
                                                </li>
                                                <li>
                                                	跳到第<input type="text" class="goPage" value="1">页
                                                    <a href="#" class="goPage-btn">Go</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="foodInfo tab-pane fade in" id="food_manage_03">
                                    <div></div>
                                </div>
                                <div role="tabpanel" class="foodInfo tab-pane fade in" id="food_manage_04">
                                    <div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div role="tabpanel" class="tab-pane fade in" id="category_03">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="navbarLeft">
                                <ul class="nav nav-pills nav-stacked person-manage-nav" role="tablist">
                                    <li role="presentation" class="active"><a href="#order_manage_01" aria-controls="order_manage_01" role="tab" data-toggle="tab">查看订单信息</a></li>
                                    <li role="presentation"><a href="#order_manage_02" aria-controls="order_manage_02" role="tab" data-toggle="tab">删除订单信息</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="order_contentRight">
                                <div role="tabpanel" class="tab-pane fade in active" id="order_manage_01">
                                    <div>111</div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade in" id="order_manage_02">
                                    <div>222</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div role="tabpanel" class="tab-pane fade in" id="category_04">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="navbarLeft">
                                <ul class="nav nav-pills nav-stacked person-manage-nav" role="tablist">
                                    <li role="presentation" class="active"><a href="#bill_manage_01" aria-controls="bill_manage_01" role="tab" data-toggle="tab">查看账单流水</a></li>
                                    <li role="presentation"><a href="#bill_manage_02" aria-controls="bill_manage_02" role="tab" data-toggle="tab">单日销售额</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div id="bill_contentRight">
                                <div role="tabpanel" class="tab-pane fade in active" id="bill_manage_01">
                                    <div>111</div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade in" id="bill_manage_02">
                                    <div>222</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 操作管理区域结束 -->
</body>
</html>