<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>Insert title here</title>
	<link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/operatorCss.css">
    <script src="lib/jquery/jquery.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/operatorJs.js"></script>
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
                    <li role="presentation" class="active"><a href="#category_01" aria-controls="category_01" role="tab" data-toggle="tab">个人信息管理</a></li>
                    <li role="presentation"><a href="#category_02" aria-controls="category_02" role="tab" data-toggle="tab">商家信息管理</a></li>
                    <li role="presentation"><a href="#category_03" aria-controls="category_03" role="tab" data-toggle="tab">用户信息管理</a></li>
                    <a id="exit" href="login.jsp">退出账号</a>
                </ul>
            </div>
            <!-- 选择卡内容 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="category_01">
                    <div class="row">
                        <div class="col-md-3">
                            <div id="person_navbarLeft">
                                <ul class="nav nav-pills nav-stacked person-manage-nav" role="tablist">
                                    <li role="presentation" class="active"> <a href="#person_manage_01" onclick="checkInfo();" aria-controls="person_manage_01" role="tab" data-toggle="tab">查看个人信息</a></li>
                                    <li role="presentation"><a href="#person_manage_02" onclick="setInfo();" aria-controls="person_manage_02" role="tab" data-toggle="tab">设置个人信息</a></li>
                                    <li role="presentation"><a href="#person_manage_03" onclick="editInfo();" aria-controls="person_manage_02" role="tab" data-toggle="tab">修改个人信息</a></li>
                                    <li role="presentation"><a href="#person_manage_04" onclick="printInfo();" aria-controls="person_manage_03" role="tab" data-toggle="tab">打印个人信息</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div id="person_contentRight">
                                <div role="tabpanel" class="tab-pane fade in active" id="person_manage_01">
                                    <form action="" method="post" class="person-form">
                                        <br><h1 align="center">个人信息</h1><hr />
                                        <table align="center" class="check-table">
                                            <tr>
                                                <td>账号ID</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>姓名</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>年龄</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>性别</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>手机号码</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>微信</td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                                
                                <div role="tabpanel" class="tab-pane fade in" id="person_manage_02">
                                	<div class="bg-model">
				                    	<div class="warn">
				                    		<p></p>
				                    		<div class="bg-button">
				                    			<button class="btn-confirm">确认</button>
				                    			<button class="btn-cancel">取消</button>
				                    			<button class="btn-back">返回</button>
				                    		</div>
				                    	</div>
				                    </div>
                                    <form class="person-form" id="set_form">
                                        <br><h1 align="center">设置个人信息</h1><hr />
                                        <table align="center" class="set-table">
                                            <tr>
                                                <td>姓名</td>
                                                <td><input type="text" id="operatorName"></td>
                                            </tr>
                                            <tr>
                                                <td>年龄</td>
                                                <td><input type="text" id="operatorAge"></td>
                                            </tr>
                                            <tr>
                                                <td>请选择你的性别</td>
                                                <td id="operatorSex">
                                                    <label for="operatorMan"><input type="radio" id="operatorMan" name="sex" value="男" checked="checked" />男</label>
                                                    <label for="operatorWomen"><input type="radio" id="operatorWomen" name="sex" value="女"/>女</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>手机号码</td>
                                                <td>
                                                    <input type="tel" id="operatorTel">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>微信</td>
                                                <td>
                                                    <input type="text" id="operatorWechat">
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="btn-box">
			                                <input type="button" value="提交" id="set_info_btn">
			                                <input type="reset" value="重置" class="clear_btn">
                            			</div>
                                    </form>
                                </div>
                                
                                <div role="tabpanel" class="tab-pane fade in" id="person_manage_03">
                                	<div class="bg-model">
				                    	<div class="warn">
				                    		<p></p>
				                    		<div class="bg-button">
				                    			<button class="btn-confirm">确认</button>
				                    			<button class="btn-cancel">取消</button>
				                    			<button class="btn-back">返回</button>
				                    		</div>
				                    	</div>
				                    </div>
                                    <form class="person-form" id="edit_form">
                                        <br><h1 align="center">修改个人信息</h1><hr />
                                        <table align="center" class="edit-table">
                                            <tr>
                                                <td>姓名</td>
                                                <td><input type="text" id=""></td>
                                            </tr>
                                            <tr>
                                                <td>账号</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>年龄</td>
                                                <td><input type="text" id=""></td>
                                            </tr>
                                            <tr>
                                                <td>请选择你的性别</td>
                                                <td id="">
                                                    <label for="operatorMan1"><input type="radio" id="operatorMan1" name="sex" value="男" checked="checked" />男</label>
                                                    <label for="operatorWomen1"><input type="radio" id="operatorWomen1" name="sex" value="女"/>女</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>手机号码</td>
                                                <td>
                                                    <input type="tel" id="">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>微信</td>
                                                <td>
                                                    <input type="text" id="">
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="btn-box">
			                                <input type="button" value="修改" id="set_info_btn1">
			                                <input type="reset" value="重置" class="clear_btn">
                            			</div>
                                    </form>
                                </div>
                                
                                <div role="tabpanel" class="tab-pane fade in" id="person_manage_04">
                                	<div class="bg-model">
				                    	<div class="warn">
				                    		<p></p>
				                    		<div class="bg-button">
				                    			<button class="btn-confirm">确认</button>
				                    			<button class="btn-cancel">取消</button>
				                    			<button class="btn-back">返回</button>
				                    		</div>
				                    	</div>
				                    </div>
                                    <form class="person-form" id="print_form">
                                        <br><h1 align="center">打印个人信息</h1><hr />
                                        <table align="center" class="print-table">
                                            <tr>
                                                <td>姓名</td>
                                                <td><input type="text" id=""></td>
                                            </tr>
                                            <tr>
                                                <td>账号</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>年龄</td>
                                                <td><input type="text" id=""></td>
                                            </tr>
                                            <tr>
                                                <td>请选择你的性别</td>
                                                <td id="operatorSex">
                                                    <label for="operatorMan2"><input type="radio" id="operatorMan2" name="sex" value="男" checked="checked" />男</label>
                                                    <label for="operatorWomen2"><input type="radio" id="operatorWomen2" name="sex" value="女"/>女</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>手机号码</td>
                                                <td>
                                                    <input type="tel" id="">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>微信</td>
                                                <td>
                                                    <input type="text" id="">
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="btn-box">
			                                <input type="button" value="打印" id="set_info_btn2">
                            			</div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div role="tabpanel" class="tab-pane fade in" id="category_02">
                    <div class="row">
                        <div class="col-md-3">
                            <div id="shop_navbarLeft">
                                <ul class="nav nav-pills nav-stacked person-manage-nav" role="tablist">
                                    <li role="presentation" class="active"><a href="#shop_manage_01" aria-controls="person_manage_01" role="tab" data-toggle="tab">增加商家信息</a></li>
                                    <li role="presentation"><a href="#shop_manage_02" aria-controls="person_manage_02" role="tab" data-toggle="tab">查看商家信息</a></li>
                                    <li role="presentation"><a href="#shop_manage_03" aria-controls="person_manage_03" role="tab" data-toggle="tab">修改商家信息</a></li>
                                    <li role="presentation"><a href="#shop_manage_04" aria-controls="person_manage_04" role="tab" data-toggle="tab">删除商家信息</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div id="shop_contentRight">
                                <div role="tabpanel" class="tab-pane fade in active" id="shop_manage_01">
                                    
                                </div>
                                <div role="tabpanel" class="tab-pane fade in" id="shop_manage_02">
                                    <div>222</div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade in" id="shop_manage_03">
                                    <div>333</div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade in" id="shop_manage_04">
                                    <div>444</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade in" id="category_03">
                    <div class="row">
                        <div class="col-md-3">
                            <div id="consumer_navbarLeft">
                                <ul class="nav nav-pills nav-stacked person-manage-nav" role="tablist">
                                    <li role="presentation" class="active"><a href="#consumer_manage_01" aria-controls="consumer_manage_01" role="tab" data-toggle="tab">增加用户信息</a></li>
                                    <li role="presentation"><a href="#consumer_manage_02" aria-controls="consumer_manage_02" role="tab" data-toggle="tab">查看用户信息</a></li>
                                    <li role="presentation"><a href="#consumer_manage_03" aria-controls="consumer_manage_03" role="tab" data-toggle="tab">修改用户信息</a></li>
                                    <li role="presentation"><a href="#consumer_manage_04" aria-controls="consumer_manage_04" role="tab" data-toggle="tab">删除用户信息</a></li>
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
                                <div role="tabpanel" class="tab-pane fade in" id="consumer_manage_03">
                                    <div>333</div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade in" id="consumer_manage_04">
                                    <div>444</div>
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