<%@ page import="java.util.*,javaWebDesign.model.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
        .container{
            width: 1024px;
            margin:0 auto;
        }
        .top {
            width: 100%;
            height: 48px;
            background-color: #191D3A;
            line-height: 48px;
        }
        .nav{
            float: left;
        }
        .nav ul{
            list-style: none;
        }
        .nav ul li{
            float: left;
            text-align: center;
            line-height: 48px;
            border-left: 1px solid #252947;
            border-right: 1px solid #252947;
        }
        .nav ul li + li{
            border-left: 0;
        }
        .nav ul li a{
        	display: block;
        	width: 160px;
        	height: 48px;
            font-size: 16px;
            text-decoration: none;
            color: #fff;
        }
        .active{
            background-color: #252947;
        }

        .login{
            float: right;
        }
        .login a {
            font-size: 14px;
            color: #fff;
            text-decoration: none;
        }

        .content .main{
            display: none;
        }
        .content .main.selected{
            display: block;
        }

        .main .add-box,
        .main .edit-box,
        .main .delete-box{
            width: 480px;
            height: 460px;
        }     
        
        .main .title{
            width: 100%;
            height: 160px;
            text-align: center;
            line-height: 160px;
            font-size: 28px;
        }
        .main .info{
            width: 400px;
            height: 286px;
            border: 1px solid #000;
            margin: 0 auto;
            padding: 30px 10px;
        }
        .main p{
            width: 320px;
            height: 26px;
            line-height: 26px;
            text-align: center;
            margin: 0 auto;
            padding: 8px 0;
        }
        .main p label{
            display: inline-block;
            width: 100px;
            height: 26px;
        }
        .main p input{
            width: 180px;
            height: 20px;
        }

        .main .btn-box{
            width: 160px;
            margin: 18px auto;
            text-align: center;
        }

        .main .btn-box input{
            width: 46px;
            height: 24px;
            margin: 0 2px;
            cursor: pointer;
        }

        /* 查看用户信息 */
        .check-box{
        	width: 100%;
        	height: 100%;
        }
        .check-box .check-box-top{
        }
        .check-box .check-box-top ul{
            list-style: none;
        }
        .check-box .check-box-top ul li{
            margin: 2px 0;
            background-color: #191D3A;
            border-left: 1px solid #252947;
            border-right: 1px solid #252947;
            text-align: center;
            line-height: 32px;
            float: left;
        }
        .check-box .check-box-top ul li + li{
        	border-left: 0;
        }
        .check-box .check-box-top ul li span{
        	display: block;
            width: 160px;
            height: 32px;
            color: #fff;
        }
        .check-box-top li i{
        	font-style: normal;
        }
        .check-box .check-box-top ul li a{
        	display: block;
            width: 160px;
            height: 32px;
            text-decoration: none;
            color: #fff;
        }

        .check-box .check-box-bottom{
            width: 480px;
            overflow: hidden;
            position: relative;
        }
        .user-table,
        .delete-table{
            width: 480px;
            border: 2px solid #191D3A;
            margin-top: 20px;
            border-collapse: collapse;
        }
        .user-table th,
        .user-table td,
        .delete-table th,
        .delete-table td{
        	width: 56px;
        	height: 24px;
        	text-align: center;
        	line-height: 24px;
            border: 1px solid #6d798c;
        }

        .delete-box .delete-table a{
            display: inline-block;
            width: 100%;
            height: 100%;
            text-align: center;
            line-height: 18px;
            text-decoration: none;
            color: #191D3A;
        }
        .delete-box .delete-table a:hover{
        	color: #fff;
        	background-color: #f15353;
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
        	width: 400px;
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
        	font-size: 24px;
        	color: #f00;
        	margin-top: 65px;
        	font-family: initial;
        }
        .warn .btn-confirm,
        .warn .btn-cancel,
        .warn .btn-back{
        	width: 48px;
        	height: 24px;
        	font-size: 16px;
        	margin: 0 6px;
        	cursor: pointer;
        }
        .warn .btn-back{
        	display: none;
        }
    </style>
    
    <script src="jquery-1.11.1.min.js"></script>
    <script>
	    $(function () {
	        $(".tab li").click(function () {
	            var $this = $(this),   // jQuery转换js
	            index = $this.index();
	            $(this).addClass("active").siblings("li").removeClass("active");
	            $(".content .main")
	                    .eq(index)
	                    .addClass("selected")
	                    .siblings("div")
	                    .removeClass("selected");
	        });
	    });
	    
	    function addInfo(){
	    	$('.add-box .bg-model p').text("是否添加该用户？");
        	$('.add-box .bg-model, .add-box .btn-confirm, .add-box .btn-cancel').show();
			$('.add-box .bg-button .btn-back').hide();
			$('.add-box .btn-cancel').click(function(){
				$('.add-box .bg-model').hide();
			});
			
			$('.add-box .btn-confirm').click(function(event){
				event.stopPropagation();
				
				if($('#add_Name').val() != "" && $('#add_Pw').val() != "" && $('#add_Age').val() != "" && $('#add_Tel').val() != "" && $('#add_Wechat').val() != ""){
					$.ajax({
		        		url: "addCtrl",
		        		type: "post",
		        		async: false,
		        		cache: false,
		        		data: $('#add_form').serialize(),
		        		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		        		dataType: "json",
		        		success: function(date){
							if(date.state){
								$('.add-box .bg-model p').text("添加成功");
							}else{
								$('.add-box .bg-model p').text("添加失败");
							}
							$('.add-box .btn-confirm, .add-box .btn-cancel').hide();
							$('.add-box .bg-button .btn-back').show().click(function(){
								window.location.href="index.jsp";
							});
						},
						error: function(XMLHttpRequest, textStatus, errorThrown){
					            alert(XMLHttpRequest.readyState);
					            alert(XMLHttpRequest.status);
					            alert(textStatus);
						}
		        	});
				}else{
					$('.add-box .bg-model p').text("用户信息填写不完整");
					$('.add-box .btn-confirm, .add-box .btn-cancel').hide();
					$('.add-box .bg-button .btn-back').show().click(function(){
						$('.add-box .bg-model').hide();
					});
				}
			});
	    }
	    
	    function indexInfo(){
	    	var page = 1;
        	$.ajax({
				type: "get",
				url: "pageQueryCtrl",
				data: {
					"page": page
				},
				dataType: "json",
				success: function(data){
					for(var i in data){
						if(i == 0){
							var page = data[i].page;
							var totalpages = data[i].totalpages;
							var indexPage = $('<span>第   <i>' + page + '</i> 页/'+ '共  <i>' + totalpages + '</i> 页</span>');
							$('.check-box-top li:eq(0)').html("");
							$('.check-box-top li:eq(0)').append(indexPage);
						}else{
							var username = data[i].username;
							var password = data[i].password;
							var age = data[i].age;
							var tel = data[i].tel;
							var wechat = data[i].wechat;
							$('.user-table tr:eq('+ i +') td').eq(0).text(username);
							$('.user-table tr:eq('+ i +') td').eq(1).text(password);
							$('.user-table tr:eq('+ i +') td').eq(2).text(age);
							$('.user-table tr:eq('+ i +') td').eq(3).text(tel);
							$('.user-table tr:eq('+ i +') td').eq(4).text(wechat);
						}
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
		            alert(XMLHttpRequest.readyState);
		            alert(XMLHttpRequest.status);
		            alert(textStatus);
				}
			});
	    };
        	
	    function prevInfo(){
	    	var nowPage = $('.check-box-top li:eq(0) i').eq(0).text();
	    	var page = nowPage <= 1 ? 1 : (nowPage-1);
        	$.ajax({
				type: "get",
				url: "pageQueryCtrl",
				data: {
					"page": page
				},
				dataType: "json",
				success: function(data){
					for(var i in data){
						if(i == 0){
							var page = data[i].page;
							var totalpages = data[i].totalpages;
							var indexPage = $('<span>第   <i>' + page +'</i> 页/'+ '共  <i>' + totalpages + '</i> 页</span>');
							$('.check-box-top li:eq(0)').html("");
							$('.check-box-top li:eq(0)').append(indexPage);
						}else{
							var username = data[i].username;
							var password = data[i].password;
							var age = data[i].age;
							var tel = data[i].tel;
							var wechat = data[i].wechat;
							$('.user-table tr:eq('+ i +') td').eq(0).text(username);
							$('.user-table tr:eq('+ i +') td').eq(1).text(password);
							$('.user-table tr:eq('+ i +') td').eq(2).text(age);
							$('.user-table tr:eq('+ i +') td').eq(3).text(tel);
							$('.user-table tr:eq('+ i +') td').eq(4).text(wechat);
						}
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
		            alert(XMLHttpRequest.readyState);
		            alert(XMLHttpRequest.status);
		            alert(textStatus);
				}
			});
	    };
            	
	    function nextInfo(){
	    	var nowPage = $('.check-box-top li:eq(0) i').eq(0).text();
	    	var nowTotalPage = $('.check-box-top li:eq(0) i').eq(1).text();
	    	var page = nowPage >= nowTotalPage ? nowTotalPage : (nowPage-(-1));
        	$.ajax({
				type: "get",
				url: "pageQueryCtrl",
				data: {
					"page": page
				},
				dataType: "json",
				success: function(data){
					$('.user-table tbody td').text("");
					for(var i in data){
						if(i == 0){
							var page = data[i].page;
							var totalpages = data[i].totalpages;
							var indexPage = $('<span>第   <i>' + page +'</i> 页/'+ '共  <i>' + totalpages + '</i> 页</span>');
							$('.check-box-top li:eq(0)').html("");
							$('.check-box-top li:eq(0)').append(indexPage);
						}else{
							var username = data[i].username;
							var password = data[i].password;
							var age = data[i].age;
							var tel = data[i].tel;
							var wechat = data[i].wechat;
							$('.user-table tr:eq('+ i +') td').eq(0).text(username);
							$('.user-table tr:eq('+ i +') td').eq(1).text(password);
							$('.user-table tr:eq('+ i +') td').eq(2).text(age);
							$('.user-table tr:eq('+ i +') td').eq(3).text(tel);
							$('.user-table tr:eq('+ i +') td').eq(4).text(wechat);
						}
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
		            alert(XMLHttpRequest.readyState);
		            alert(XMLHttpRequest.status);
		            alert(textStatus);
				}
			});
	    };

	    function deleteInfo(){
	    	$('.delete-table .delete-tbody').html("");
	    	$.ajax({
				type: "get",
				url: "deleteCtrl",
				data:{
					"fn": "loadInfo"
				},
				dataType: "json",
				success: function(data){
					for(var i in data){
						var str = "<tr><td>" + (i-(-1)) + "</td><td></td><td></td><td></td><td></td><td></td><td><a href='javascript:void(0);' class='delete-btn'>Delete</a></td></tr>"
						$('.delete-table .delete-tbody').append(str);
						var username = data[i].username;
						var password = data[i].password;
						var age = data[i].age;
						var tel = data[i].tel;
						var wechat = data[i].wechat;
						$('.delete-tbody tr:eq('+ i +') td').eq(1).text(username);
						$('.delete-tbody tr:eq('+ i +') td').eq(2).text(password);
						$('.delete-tbody tr:eq('+ i +') td').eq(3).text(age);
						$('.delete-tbody tr:eq('+ i +') td').eq(4).text(tel);
						$('.delete-tbody tr:eq('+ i +') td').eq(5).text(wechat);
					}
					
					$('.delete-tbody .delete-btn').click(function(event){
						event.stopPropagation();
						
						$('.delete-box .bg-model, .delete-box .btn-confirm, .delete-box .btn-cancel').show();
						$('.delete-box .bg-button .btn-back').hide()
				    	$('.delete-box .btn-cancel').click(function(){
				    		$('.delete-box .bg-model').hide();
				    	});
			        	var username = $(this).parent().parent().children('td:eq(1)').text();
				    	$('.delete-box .btn-confirm').click(function(){
				    		$.ajax({
								type: "get",
								url: "deleteCtrl",
								data:{
									"fn": "deleteInfo",
									"username": username
								},
								dataType: "json",
								success: function(data){
									if(data.state){
										$('.delete-box .bg-model p').text("删除成功");
									}else{
										$('.delete-box .bg-model p').text("删除失败");
									}
									$('.delete-box .btn-confirm, .delete-box .btn-cancel').hide();
									$('.delete-box .bg-button .btn-back').show().click(function(){
										window.location.href="index.jsp";
										/* $('.tab li .delete').trigger('click');
										$('.delete-box .bg-model').hide(); */
									});
								},
								error: function(XMLHttpRequest, textStatus, errorThrown){
						            alert(XMLHttpRequest.readyState);
						            alert(XMLHttpRequest.status);
						            alert(textStatus);
								}
							});
				    	});
			        });
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
		            alert(XMLHttpRequest.readyState);
		            alert(XMLHttpRequest.status);
		            alert(textStatus);
				}
			});
	    }
	    
	</script>
</head>
<body>
    <!-- 头部 -->
    <header class="top">
        <div class="container">
            <div class="nav">
                <ul class="tab">
                        <li class="tab-item active">
                            <a href="javascript:void(0);" class="index">首页</a>
                        </li>
                        <li class="tab-item">
                            <a href="javascript:void(0);" class="add">添加用户信息</a>
                        </li>
                        <li class="tab-item">
                            <a href="javascript:void(0);" class="edit">修改用户信息</a>
                        </li>
                        <li class="tab-item">
                            <a href="javascript:void(0);" onclick="indexInfo();" class="check">查看用户信息</a>
                        </li>
                        <li class="tab-item">
                            <a href="javascript:void(0);" onclick="deleteInfo()" class="delete">删除用户信息</a>
                        </li>
                    </ul>
            </div>
            <div class="login">
                <a href="login.jsp">登录</a>
                <a href="register.jsp">注册</a>
            </div>
        </div>
    </header>
    <!-- 头部结束 -->

    <!-- 内容展示 -->
    <section class="content">
        <div class="container">
        	<!-- 首页部分 -->
            <div class="main selected">
                <div class="index-box"> 
                    <div class="title"></div>
                    <div class="info"></div>
                </div>
            </div>
            
            <!-- 添加用户信息板块 -->
            <div class="main">
                <div class="add-box">
                    <div class="title">
                        <h2>添加用户信息</h2>
                    </div>
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
                    <div class="info">
                        <form id="add_form">
                            <p><label for="add_name">用户名</label><input type="text" id="add_Name" name="addName"></p>
                            <p><label for="add_pw">密码</label><input type="password" id="add_Pw" name="addPw"></p>
                            <p><label for="add_age">年龄</label><input type="text" id="add_Age" name="addAge"></p>
                            <p><label for="add_tel">手机号码</label><input type="tel" id="add_Tel" name="addTel"></p>
                            <p><label for="add_wechat">微信</label><input type="text" id="add_Wechat" name="addWechat"></p>
                            <div class="btn-box">
                                <input type="button" value="添加" id="add_btn" onclick="addInfo()">
                                <input type="reset" value="重置" class="clear_btn">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
            <!-- 修改用户信息板块  -->
            <div class="main">
                <div class="edit-box">
                    <div class="title">
                        <h2>修改用户信息</h2>
                    </div>
                    <div class="bg-model">
                    	<div class="warn">
                    		<p>是否修改该用户信息？</p>
                    		<div class="bg-button">
                    			<button class="btn-confirm">确认</button>
                    			<button class="btn-cancel">取消</button>
                    			<button class="btn-back">返回</button>
                    		</div>
                    	</div>
                    </div>
                    <div class="info">
                        <form id="edit_form" method="post" action="javascript:;">
                            <p><label for="edit_name">用户名</label><input type="text" id="edit_name"></p>
                            <p><label for="edit_pw">密码</label><input type="password" id="edit_pw"></p>
                            <p><label for="edit_age">年龄</label><input type="text" id="edit_age"></p>
                            <p><label for="edit_tel">手机号码</label><input type="tel" id="edit_tel"></p>
                            <p><label for="edit_wechat">微信</label><input type="text" id="edit_wechat"></p>
                            <div class="btn-box">
                                <input type="submit" value="添加" id="edit_btn">
                                <input type="reset" value="重置">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
            <!-- 查看用户信息板块  -->
            <div class="main">
                <div class="check-box">
                    <div class="check-box-top">
                        <ul>
                            <li></li>
                            <li>
                                <a href="javascript:void(0);" onclick="prevInfo();">上一页</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" onclick="indexInfo();">首页</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" onclick="nextInfo();">下一页</a>
                            </li>
                            <li>
                            	<a href="javascript:void(0);">跳到第几页</a>
                            </li>
                        </ul>
                    </div>
                    <div class="check-box-bottom">
                        <table class="user-table">
                            <tr>
                                <th>用户名</th>
                                <th>密码</th>
                                <th>年龄</th>
                                <th>手机号码</th>
                                <th>微信</th>
                            </tr>
                            <tbody>
	                            <tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <!-- 删除用户信息板块  -->
            <div class="main">
                <div class="delete-box">
                    <div class="title">
                        <h2>删除用户信息</h2>
                    </div>
                    <div class="bg-model">
                    	<div class="warn">
                    		<p>是否删除该用户信息？</p>
                    		<div class="bg-button">
                    			<button class="btn-confirm">确认</button>
                    			<button class="btn-cancel">取消</button>
                    			<button class="btn-back">返回</button>
                    		</div>
                    	</div>
                    </div>
                    <table class="delete-table">
                    	<tr>
                    		<th>编号</th>
                    		<th>用户名</th>
                    		<th>密码</th>
                    		<th>年龄</th>
                    		<th>手机号码</th>
                    		<th>微信</th>
                    		<th>删除</th>
                        </tr>
                    	<tbody class="delete-tbody">
                        </tbody>
                    </table>
                </div>
            </div>

    </section>
    <!--内容展示结束-->
</body>
</html>