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
    <header>
        <div class="header-top"></div>
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
                    <a id="exit" href="#">退出账号</a>
                </ul>
            </div>
            <!-- 选择卡内容 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="category_01">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="navbarLeft">
                                <ul class="nav nav-pills nav-stacked person-manage-nav" role="tablist">
                                    <li role="presentation" class="active"><a href="#shopinfo_01" aria-controls="shop_manage_01" role="tab" data-toggle="tab">注册店铺信息</a></li>
                                    <li role="presentation"><a href="#shopinfo_02" aria-controls="shop_manage_02" role="tab" data-toggle="tab">查看店铺信息</a></li>
                                    <li role="presentation"><a href="#shopinfo_03" aria-controls="shop_manage_03" role="tab" data-toggle="tab">修改店铺信息</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="shopInfo-contentRight">
                                <div role="tabpanel" class="tab-pane fade in active" id="shopinfo_01">
                                    <form action="" method="post" class="shopInfo-form register-shop">
                                        <br><h1 align="center">注册店铺信息</h1><hr />
                                        <table align="center">
                                            <tr>
                                                <td>商铺名称</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>商铺ID</td>
                                            </tr>
                                            <tr>
                                                <td>商铺法人</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>签约人类型</td>
                                                <td>
                                                    <label for="gr"><input type="radio" id="gr" name="signType" checked="checked" />个人</label>
                                                    <label for="qyfr"><input type="radio" id="qyfr" name="signType" />企业法人</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>签约人姓名</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>签约人身份证号码</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>经营品类</td>
                                                <td>
                                                    <fieldset>
                                                        <input type="checkbox" />都市快餐
                                                        <input type="checkbox" />早餐包点
                                                        <input type="checkbox" />宵夜烧烤
                                                        <input type="checkbox" />特色小吃
                                                        <input type="checkbox" />其他
                                                    </fieldset>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>门店区域</td>
                                                <td>
                                                    <select id="province" name="province"></select>
                                                    <select id="city" name="city"></select>
                                                    <select id="area" name="area"></select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>门店地址</td>
                                                <td>
                                                    <input type="text" >
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>

                                <div role="tabpanel" class="tab-pane fade in" id="shopinfo_02">
                                    <form action="" method="post" class="shopInfo-form checkinfo-shop">
                                        <br><h1 align="center">查看店铺信息</h1><hr />
                                        <table align="center">
                                            <tr>
                                                <td>商铺名称</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>商铺法人</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>签约人类型</td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>签约人姓名</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>签约人身份证号码</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>经营品类</td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>门店区域</td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>门店地址</td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>

                                <div role="tabpanel" class="tab-pane fade in" id="shopinfo_03">
                                    <form action="" method="post" class="shopInfo-form editinfo-shop">
                                        <br><h1 align="center">修改店铺信息</h1><hr />
                                        <table align="center">
                                            <tr>
                                                <td>商铺名称</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>商铺法人</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>签约人类型</td>
                                                <td>
                                                    <label for="edit_gr"><input type="radio" id="edit_gr" name="signType" checked="checked" />个人</label>
                                                    <label for="edit_qyfr"><input type="radio" id="edit_qyfr" name="signType" />企业法人</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>签约人姓名</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>签约人身份证号码</td>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <td>经营品类</td>
                                                <td>
                                                    <fieldset>
                                                        <input type="checkbox" />都市快餐
                                                        <input type="checkbox" />早餐包点
                                                        <input type="checkbox" />宵夜烧烤
                                                        <input type="checkbox" />特色小吃
                                                    </fieldset>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>门店区域</td>
                                                <td>
                                                    <select>
                                                        <option value="">广东</option>
                                                        <option value="">深圳</option>
                                                        <option value="">上海</option>
                                                        <option value="">北京</option>
                                                        <option value="">杭州</option>
                                                    </select>
                                                    <select>
                                                        <option value="">广州</option>
                                                        <option value="">深圳</option>
                                                        <option value="">上海</option>
                                                        <option value="">北京</option>
                                                        <option value="">杭州</option>
                                                    </select>
                                                    <select>
                                                        <option value="">海珠区</option>
                                                        <option value="">天河区</option>
                                                        <option value="">上海</option>
                                                        <option value="">北京</option>
                                                        <option value="">杭州</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>门店地址</td>
                                                <td>
                                                    <input type="text" >
                                                </td>
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
                                    <li role="presentation"><a href="#food_manage_02" aria-controls="food_manage_02" role="tab" data-toggle="tab">查看菜单</a></li>
                                    <li role="presentation"><a href="#food_manage_03" aria-controls="food_manage_03" role="tab" data-toggle="tab">修改菜单</a></li>
                                    <li role="presentation"><a href="#food_manage_04" aria-controls="food_manage_04" role="tab" data-toggle="tab">删除菜单</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div id="food_contentRight">
                                <div role="tabpanel" class="tab-pane fade in active" id="food_manage_01">
                                    <div>111</div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade in" id="food_manage_02">
                                    <div>222</div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade in" id="food_manage_03">
                                    <div>333</div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade in" id="food_manage_04">
                                    <div>444</div>
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
                            <div id="consumer_contentRight">
                                <div role="tabpanel" class="tab-pane fade in active" id="consumer_manage_01">
                                    <div>111</div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade in" id="consumer_manage_02">
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