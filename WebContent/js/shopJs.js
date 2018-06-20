/**
 * Created by 廖幸锋 on 2018/6/7.
 */
$(function(){
	checkInfo();
});

function checkInfo(){
	var  account = getQueryString("account");
	$.ajax({
		type: "get",
		url: "shopCtrl",
		dataType: "json",
		data: {
			"fn": "shopCheck",
			"shopID": account
		},
		success: function(data){
			var shopID = data.shopID;
			var shopName = data.shopName;
			var shopAddress = data.shopAddress;
			var peisongFee = data.peisongFee;
			var canheFee = data.canheFee;
			var pingfen = data.pingfen;
			var sale = data.sale;
			var youhui = data.youhui;
			
			$('#category_01 .shopInfo-form table tr:eq(0) td:eq(1)').text(shopName);
			$('#category_01 .shopInfo-form table tr:eq(1) td:eq(1)').text(shopAddress);
			$('#category_01 .shopInfo-form table tr:eq(2) td:eq(1)').text(peisongFee);
			$('#category_01 .shopInfo-form table tr:eq(3) td:eq(1)').text(canheFee);
			$('#category_01 .shopInfo-form table tr:eq(4) td:eq(1)').text(pingfen);
			$('#category_01 .shopInfo-form table tr:eq(5) td:eq(1)').text(sale);
			$('#category_01 .shopInfo-form table tr:eq(6) td:eq(1)').text(youhui);
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

function indexInfo(){
	var page = 1;
	var shopName = $('.shopCheck-shopName').text();
	$.ajax({
		type: "get",
		url: "shopCtrl",
		data: {
			"fn": "foodCheck",
			"shopName": shopName,
			"page": page
		},
		dataType: "json",
		success: function(data){
			for(var i in data){
				if(i == 0){
					var page = data[i].page;
					var totalpages = data[i].totalpages;
					$('.foodcheck-btn .nowPage').text(page);
					$('.foodcheck-btn .sumPage').text(totalpages);
				}else{
					var foodName = data[i].foodName;
					var foodUnitPrice = data[i].foodUnitPrice;
					$('.food-check-table tr:eq('+ i +') td').eq(0).text(foodName);
					$('.food-check-table tr:eq('+ i +') td').eq(1).text(foodUnitPrice);
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
	var nowPage = $('.foodcheck-btn .nowPage').text();
	var page = nowPage <= 1 ? 1 : (nowPage-1);
	var shopName = $('.shopCheck-shopName').text();
	$.ajax({
		type: "get",
		url: "shopCtrl",
		data: {
			"fn": "foodCheck",
			"shopName": shopName,
			"page": page
		},
		dataType: "json",
		success: function(data){
			$('.food-check-table tbody td').text("");
			for(var i in data){
				if(i == 0){
					var page = data[i].page;
					var totalpages = data[i].totalpages;
					$('.foodcheck-btn .nowPage').text(page);
					$('.foodcheck-btn .sumPage').text(totalpages);
				}else{
					var foodName = data[i].foodName;
					var foodUnitPrice = data[i].foodUnitPrice;
					$('.food-check-table tr:eq('+ i +') td').eq(0).text(foodName);
					$('.food-check-table tr:eq('+ i +') td').eq(1).text(foodUnitPrice);
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
	var nowPage = $('.foodcheck-btn .nowPage').text();
	var nowTotalPage = $('.foodcheck-btn .sumPage').text();
	var page = nowPage >= nowTotalPage ? nowTotalPage : (nowPage-(-1));
	var shopName = $('.shopCheck-shopName').text();
	$.ajax({
		type: "get",
		url: "shopCtrl",
		data: {
			"fn": "foodCheck",
			"shopName": shopName,
			"page": page
		},
		dataType: "json",
		success: function(data){
			$('.food-check-table tbody td').text("");
			for(var i in data){
				if(i == 0){
					var page = data[i].page;
					var totalpages = data[i].totalpages;
					$('.foodcheck-btn .nowPage').text(page);
					$('.foodcheck-btn .sumPage').text(totalpages);
				}else{
					var foodName = data[i].foodName;
					var foodUnitPrice = data[i].foodUnitPrice;
					$('.food-check-table tr:eq('+ i +') td').eq(0).text(foodName);
					$('.food-check-table tr:eq('+ i +') td').eq(1).text(foodUnitPrice);
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


