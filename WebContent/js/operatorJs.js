/**
 * Created by 廖幸锋 on 2018/6/4.
 */
$(function(){
	checkInfo();
});

function getQueryString(name) {
    var result = window.location.search.match(new RegExp("[\?\&]" + name + "=([^\&]+)", "i"));
    if (result == null || result.length < 1) {
        return "";
    }
    return result[1];
}


function checkInfo(){
	var  operatorID = getQueryString("account");
	$.ajax({
		type: "post",
		url: "operatorCtrl",
		data: {
			"fn": "checkInfo",
			"operatorID": operatorID
		},
		dataType: "json",
		success: function(data){
			$('.person-form .check-table tr:eq(0) td:eq(1)').text(data.operatorID);
			$('.person-form .check-table tr:eq(1) td:eq(1)').text(data.name);
			$('.person-form .check-table tr:eq(2) td:eq(1)').text(data.age);
			$('.person-form .check-table tr:eq(3) td:eq(1)').text(data.sex);
			$('.person-form .check-table tr:eq(4) td:eq(1)').text(data.tel);
			$('.person-form .check-table tr:eq(5) td:eq(1)').text(data.wechat);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
            alert(XMLHttpRequest.readyState);
            alert(XMLHttpRequest.status);
            alert(textStatus);
		}
	});
}

//function setInfo(){
//	var  account = getQueryString("account");
//	$('.person-form .set-table tr:eq(1) td:eq(1)').text(account);
//	
//	$('#set_info_btn').click(function(){
////		$('#person_manage_02 .bg-model p').text("是否提交用户信息？");
////    	$('#person_manage_02 .bg-model, #person_manage_02 .btn-confirm, #person_manage_02 .btn-cancel').show();
////		$('#person_manage_02 .bg-button .btn-back').hide();
////		$('#person_manage_02 .btn-cancel').click(function(){
////			$('#person_manage_02 .bg-model').hide();
////		});
//		$('#person_manage_02 .btn-confirm').click(function(event){
//			event.stopPropagation();
//			
//			$.ajax({
//	    		type: "post",
//	    		url: "operatorCtrl",
//	    		async: false,
//        		cache: false,
//        		data: {
//        			"fn": "setInfo",
//        			"name": $('#operatorName').val(),
//        			"account": account,
//        			"age": $('#operatorAge').val(),
//        			"sex": $('#operatorSex input[name="sex"]:checked').val(),
//        			"tel": $('#operatorTel').val(),
//        			"wechat": $('#operatorWechat').val()
//        		},
//        		contentType : "application/x-www-form-urlencoded; charset=utf-8",
//	    		dataType: "json",
//	    		success: function(data){
//	    		},
//	    		error: function(){
//	    			$('#person_manage_02 .bg-model p').text("服务器请求失败");
//					$('#person_manage_02 .btn-confirm, #person_manage_02 .btn-cancel').hide();
//					$('#person_manage_02 .bg-button .btn-back').show().click(function(){
//						$('#person_manage_02 .bg-model').hide();
//					});
//	    		}
//	    	});
//		});
//	});
//}

function editInfo(){
	
}

function printInfo(){
	
}