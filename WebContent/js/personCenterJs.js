/**
 * Created by 廖幸锋 on 2018/6/12.
 */
$(function(){
	checkInfo();
});

function setInfo(){
	$('#category_02 .bg-model p').text("是否提交用户信息？");
	$('#category_02 .bg-model, #category_02 .btn-confirm, #set_form .btn-cancel').show();
	$('#category_02 .bg-button .btn-back').hide();
	$('#category_02 .btn-cancel').click(function(){
		$('#category_02 .bg-model').hide();
	});
	
	$('#category_02 .btn-confirm').click(function(event){
		event.stopPropagation();
		var consumerID = $('#set_form_ID').text();
		var consumerName = $('#set_form_name').val();
		var nichen = $('#set_form_nichen').val();
		var consumerAge = $('#set_form_age').val();
		var consumerTel = $('#set_form_tel').val();
		var consumerWechat = $('#set_form_wechat').val();
		console.log(consumerID);
		$.ajax({
			url: "consumerCtrl",
			type: "post",
			async: false,
			cache: false,
			data: {
				"fn": "setInfo",
				"consumerID": consumerID,
				"consumerName": consumerName,
				"nichen": nichen,
				"consumerAge": consumerAge,
				"consumerTel": consumerTel,
				"consumerWechat": consumerWechat
			},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType: "json",
			success: function(date){
				if(date.state){
					$('#category_02 .bg-model p').text("设置成功");
				}else{
					$('#category_02 .bg-model p').text("设置失败");
				}
				$('#category_02 .btn-confirm, #category_02 .btn-cancel').hide();
				$('#category_02 .bg-button .btn-back').show().click(function(){
					window.location.href = "personCenter.jsp?account="+consumerID;
				});
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){
		            alert(XMLHttpRequest.readyState);
		            alert(XMLHttpRequest.status);
		            alert(textStatus);
			}
		});
	});
}

function checkInfo(){
	var  account = getQueryString("account");
	$.ajax({
		type: "get",
		url: "consumerCtrl",
		dataType: "json",
		data: {
			"fn": "checkInfo",
			"consumerID": account
		},
		success: function(data){
			var consumerID = data.consumerID;
			var consumerName = data.consumerName;
			var nichen = data.nichen;
			var conaumerAge = data.conaumerAge;
			var consumerTel = data.consumerTel;
			var consumerWechat = data.consumerWechat;
			
			$('#shopinfo_01 .person-form table tr:eq(0) td:eq(1)').text(consumerID);
			$('#shopinfo_01 .person-form table tr:eq(1) td:eq(1)').text(consumerName);
			$('#shopinfo_01 .person-form table tr:eq(2) td:eq(1)').text(nichen);
			$('#shopinfo_01 .person-form table tr:eq(3) td:eq(1)').text(conaumerAge);
			$('#shopinfo_01 .person-form table tr:eq(4) td:eq(1)').text(consumerTel);
			$('#shopinfo_01 .person-form table tr:eq(5) td:eq(1)').text(consumerWechat);
			
			$('#set_form table tr:eq(0) td:eq(1)').text(consumerID);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
            alert(XMLHttpRequest.readyState);
            alert(XMLHttpRequest.status);
            alert(textStatus);
		}
	});
}


function getQueryString(name) {
    var result = window.location.search.match(new RegExp("[\?\&]" + name + "=([^\&]+)", "i"));
    if (result == null || result.length < 1) {
        return "";
    }
    return result[1];
}