/**
 * Created by 廖幸锋 on 2018/6/12.

 */

$(function(){
	var  account = getQueryString("account");
	$.ajax({
		type: "get",
		url: "orderCtrl",
		dataType: "json",
		data: {
			"fn": "getOrder",
			"consumerName": account
		},
		success: function(data){
			for(var i in data){
				var orderImg = data[i].foodImg;
				var shopName = data[i].shopName;
				var orderState = data[i].orderState;
				var orderID = data[i].orderID;
				var orderSumPrice = data[i].orderPaySumPrice;
				if(orderState == 1){
					orderState = "正在配送中";
				}else if(orderState == 2){
					orderState = "已完成";
				}
				
				var str = '<li><div class="orderInfo"><div class="orderInfo-left"><img src="images/timg.jpg" alt=""></div><div class="orderInfo-right"><p class="shop-name">';
                str += shopName;
                str += '</p><i>';
                str += orderState;
                str += '</i><p class="orderID">订单号：<span>';
                str += orderID;
                str += '</span></p><p class="order-sumPrice">总价：<span>';
                str += orderSumPrice;
                str += '</span></p></div></div></li>';
                
                $('#category_01 .order-box-left ul').prepend(str);
			}
			$('#category_01').trigger('create');
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
            alert(XMLHttpRequest.readyState);
            alert(XMLHttpRequest.status);
            alert(textStatus);
		}
	});
	
    $(document).on('click','.order-box-left .orderInfo',function(){
        $('.order-box-right').show();
        var  account = getQueryString("account");
        var orderID = $(this).children('.orderInfo-right').children('.orderID').children('span').text();
        $.ajax({
    		type: "get",
    		url: "orderCtrl",
    		dataType: "json",
    		data: {
    			"fn": "getOrderInfo",
    			"orderID": orderID
    		},
    		success: function(data){
    			var orderID = data.orderID;
				var shopName = data.shopName;
				var consumerName = data.consumerName;
				var orderState = data.orderState;
				var orderTel = data.orderTel;
				var orderAddress = data.orderAddress;
				var orderTime = data.orderTime;
				var orderPayStyle = data.orderPayStyle;
				var orderPaySumPrice = data.orderPaySumPrice;
				var orderYouhui = data.orderYouhui;
				var orderShiFu = data.orderShiFu;
				var orderFood = data.orderFood;
				
    			$('.order-foodInfo .order-shopName').text(shopName);
    			for(var i=0;i<orderFood.length;i++){
    				var foodName = orderFood[i].foodName;
    				var foodNum = orderFood[i].foodNum;
    				var foodXiaoji = orderFood[i].foodXiaoji;
    				
    				var str = '<div class="foodInfo-box"><div class="foodInfo-box-left"><img src="images/timg.jpg" alt=""></div><div class="foodInfo-box-right"><p><span class="foodName">';
    				str += foodName;
    				str += '</span>×<span class="foodNum">';
    				str += foodNum;
    				str += '</span></p><p class="foodPrice"><span>';
    				str += foodXiaoji;
    				str += '</span> &yen;</p></div></div>';
    				
    				$('.order-food-box').append(str);
    			}
    			$('.order-food-box').trigger("create");
    			
    			$('.sum-box .sumPrice span:eq(0)').text(orderPaySumPrice);
    			$('.sum-box .sumPrice span:eq(1)').text(orderYouhui);
    			$('.sum-box .pay-shifu').text(orderShiFu);
    			
    			$('.address .content-right p span:eq(0)').text(orderTel);
    			$('.address .content-right p span:eq(1)').text(orderAddress);
    			$('.orderID-info .content-right p span').text(orderID);
    			$('.orderTime .content-right p span').text(orderTime);
    			$('.payStyle .content-right p span').text(orderPayStyle);
    			
    			
    		},
    		error: function(XMLHttpRequest, textStatus, errorThrown){
                alert(XMLHttpRequest.readyState);
                alert(XMLHttpRequest.status);
                alert(textStatus);
    		}
        });
    });
});

function getQueryString(name) {
    var result = window.location.search.match(new RegExp("[\?\&]" + name + "=([^\&]+)", "i"));
    if (result == null || result.length < 1) {
        return "";
    }
    return result[1];
}
