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
    
    <script>
    	$(function(){
    		
    	});
    	
    	function getQueryString(name) {
    	    var result = window.location.search.match(new RegExp("[\?\&]" + name + "=([^\&]+)", "i"));
    	    if (result == null || result.length < 1) {
    	        return "";
    	    }
    	    return result[1];
    	}
	
	    function checkInfo(){
	    	$('#person_contentRight').html();
	    	var  account = getQueryString("account");
	    	$.ajax({
	    		type: "post",
	    		url: "operatorCtrl",
	    		data: {
	    			"fn": "checkInfo",
	    			"account": account
	    		},
	    		dataType: "json",
	    		success: function(data){
	    			$('.person-form .check-table tr:eq(0) td:eq(1)').text(data.name);
	    			$('.person-form .check-table tr:eq(1) td:eq(1)').text(data.account);
	    			$('.person-form .check-table tr:eq(2) td:eq(1)').text(data.age);
	    			$('.person-form .check-table tr:eq(3) td:eq(1)').text(data.sex);
	    			$('.person-form .check-table tr:eq(4) td:eq(1)').text(data.tel);
	    			$('.person-form .check-table tr:eq(5) td:eq(1)').text(data.wechat);
	    			$('.person-form .check-table tr:eq(6) td:eq(1)').text(data.qq);
	    			$('.person-form .check-table tr:eq(7) td:eq(1)').text(data.city);
	    			$('.person-form .check-table tr:eq(8) td:eq(1)').text(data.job);
	    			$('.person-form .check-table tr:eq(9) td:eq(1)').text(data.hobby);
	    		},
	    		error: function(XMLHttpRequest, textStatus, errorThrown){
	                alert(XMLHttpRequest.readyState);
	                alert(XMLHttpRequest.status);
	                alert(textStatus);
	    		}
	    	});
	    }
	    
	    function setInfo(){
	    	var  account = getQueryString("account");
	    	$('.person-form .set-table tr:eq(1) td:eq(1)').text(account);
	    	
    		$('#set_info_btn').click(function(){
    			$('#person_manage_02 .bg-model p').text("是否提交用户信息？");
            	$('#person_manage_02 .bg-model, #person_manage_02 .btn-confirm, #person_manage_02 .btn-cancel').show();
    			$('#person_manage_02 .bg-button .btn-back').hide();
    			$('#person_manage_02 .btn-cancel').click(function(){
    				$('#person_manage_02 .bg-model').hide();
    			});
    			$('#person_manage_02 .btn-confirm').click(function(event){
    				event.stopPropagation();
    				
    				$.ajax({
        	    		type: "post",
        	    		url: "operatorCtrl",
        	    		async: false,
                		cache: false,
                		data: {
                			"fn": "setInfo",
                			"name": $('#operatorName').val(),
                			"account": account,
                			"age": $('#operatorAge').val(),
                			"sex": $('#operatorSex input[name="sex"]:checked').val(),
                			"tel": $('#operatorTel').val(),
                			"wechat": $('#operatorWechat').val(),
                			"qq": $('#operatorQq').val(),
                			"city": $("#operatorCity option:selected").text(),
                			"job": $('#operatorJob input[name="job"]:checked').val(),
                			"hobby": $('#operatorHobby').val(),
                		},
                		contentType : "application/x-www-form-urlencoded; charset=utf-8",
        	    		dataType: "json",
        	    		success: function(data){
        	    			if(data.state){
        						$('#person_manage_02 .bg-model p').text("设置成功");
        					}else{
        						$('#person_manage_02 .bg-model p').text("设置失败");
        					}
        					$('#person_manage_02 .btn-confirm, #person_manage_02 .btn-cancel').hide();
        					$('#person_manage_02 .bg-button .btn-back').show().click(function(){
        						$('#person_manage_02 .bg-model').hide();
        					});
        	    		},
        	    		error: function(){
        	    			$('#person_manage_02 .bg-model p').text("服务器请求失败");
        					$('#person_manage_02 .btn-confirm, #person_manage_02 .btn-cancel').hide();
        					$('#person_manage_02 .bg-button .btn-back').show().click(function(){
        						$('#person_manage_02 .bg-model').hide();
        					});
        	    		}
        	    	});
    			});
    		});
	    }
	    
	    function editInfo(){
	    	
	    }
	    
	    function printInfo(){
	    	
	    }
    </script>
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
                                                <td>姓名</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>账号</td>
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
                                            <tr>
                                                <td>QQ</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>你来自哪个城市</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>你的职业</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>爱好</td>
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
                                                <td>账号</td>
                                                <td></td>
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
                                            <tr>
                                                <td>QQ</td>
                                                <td>
                                                    <input type="text" id="operatorQq">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>你来自哪里哪个城市</td>
                                                <td>
                                                    <select id="operatorCity">
                                                        <option value="gz">广州</option>
                                                        <option value="sz">深圳</option>
                                                        <option value="bj">北京</option>
                                                        <option value="sh">上海</option>
                                                        <option value="hz">杭州</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>请选择你的职业</td>
                                                <td id="operatorJob">
                                                	<label for="student"><input type="radio" id="student" name="job" value="学生"/>学生</label>
                                                	<label for="teacher"><input type="radio" id="teacher" name="job" value="老师"/>老师</label>
                                                	<label for="other"><input type="radio" id="other" name="job" value="其他"/>其他</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>你的爱好</td>
                                                <td>
                                                    <input type="text" id="operatorHobby">
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
                                            <tr>
                                                <td>QQ</td>
                                                <td>
                                                    <input type="text" id="">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>你来自哪里哪个城市</td>
                                                <td>
                                                    <select id="">
                                                        <option value="gz">广州</option>
                                                        <option value="sz">深圳</option>
                                                        <option value="bj">北京</option>
                                                        <option value="sh">上海</option>
                                                        <option value="hz">杭州</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>请选择你的职业</td>
                                                <td id="operatorJob">
                                                	<label for="student1"><input type="radio" id="student1" name="job" value="学生"/>学生</label>
                                                	<label for="teacher1"><input type="radio" id="teacher1" name="job" value="老师"/>老师</label>
                                                	<label for="other1"><input type="radio" id="other1" name="job" value="其他"/>其他</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>你的爱好</td>
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
                                            <tr>
                                                <td>QQ</td>
                                                <td>
                                                    <input type="text" id="">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>你来自哪里哪个城市</td>
                                                <td>
                                                    <select id="">
                                                        <option value="gz">广州</option>
                                                        <option value="sz">深圳</option>
                                                        <option value="bj">北京</option>
                                                        <option value="sh">上海</option>
                                                        <option value="hz">杭州</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>请选择你的职业</td>
                                                <td id="">
                                                	<label for="student2"><input type="radio" id="student2" name="job" value="学生"/>学生</label>
                                                	<label for="teacher2"><input type="radio" id="teacher2" name="job" value="老师"/>老师</label>
                                                	<label for="other2"><input type="radio" id="other2" name="job" value="其他"/>其他</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>你的爱好</td>
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