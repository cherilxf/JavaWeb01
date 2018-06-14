/**
 * Created by 廖幸锋 on 2018/6/9.
 */
$(function () {
    $('.header-bar .nav li').click(function () {
        var $this = $(this),   // jQuery转换js
        index = $this.index();
        $(this).addClass('header-nav-active').siblings('li').removeClass('header-nav-active');
    });

    $('.navBar-left li').click(function () {
        var $this = $(this),   // jQuery转换js
        index = $this.index();
        $(this).addClass('active').siblings('li').removeClass('active');
        $('.product-info .main')
            .eq(index)
            .addClass('selected')
            .siblings('div')
            .removeClass('selected');
    });

    //  以屏幕范围为界面上的每一张轮播图设置背景
    $('.header-content .carousel-inner > .item').each(function (i,item) {
        var $item = $(item);  // 因为拿到的DOM对象 需要转换成jqueryd对象
        // var imgSrc = isSmallScreen ? $item.data('slide-small') : $item.data('slide-large');
        var imgSrc = $item.data("slide-image");

        // 设置背景图片
        $item.css('backgroundImage','url("' + imgSrc + '")');
    });

    // 菜品信息页面点击数量的加减和修改
    $(document).on("blur",".product-box .product-num .num",function(){
        var num = $(this).text();
        if(num > 99){
            $(this).text(99);
        }else if(num < 0){
            $(this).text(0);
        }
    });

    $(document).on("click",".product-box .product-num .reduce",function(){
        var num = $(this).next().val();
        if(num > 0){
            num--;
        }else{
            num = 0;
        }
        $(this).next().val(num);
    });

    $(document).on("click",".product-box .product-num .add",function(){
        var num = $(this).prev().val();
        if(num < 99){
            num++;
        }else{
            num = 99;
        }
        $(this).prev().val(num);
    });

    // 菜品页面点击“加入购物车”
    $(document).on("click",".product-box .addCart",function(){
        var foodName = $(this).siblings('.foodTitle').text();
        var foodNum = $(this).siblings('.product-num').children('.num').val();
        var foodPrice = $(this).siblings('.price-box').children('.price').text();

        var sumPrice = foodPrice * foodNum;
        
        var str = '<div class="cartfood-info"><ul><li class="food-name"><p>';
        str += foodName;
        str += '</p></li><li class="food-num"><span class="reduce">-</span><input class="num" type="text" value="';
        str += foodNum;
        str += '"/><span class="add">+</span></li><li class="foodUnitPrice" style="display:none"><span style="display:none">';
        str += foodPrice;
        str += '</span></li><li class="food-price">&yen;<span class="price">';
        str += sumPrice;
        str += '</span></li><li class="food-delete"><span class="food-delete-top"></span><span class="food-delete-bot"></span></li></ul></div>';

        $('#cartfood_info_box').append(str);
        $('#cartfood_info_box').trigger('create');
        
        var sumAmount = $('.goPay-box .amount span').text() - (-foodNum);
        $('.goPay-box .pay-info .amount span').text(sumAmount);
        
        var paySumPrice = $('.pay-sumPrice span:eq(0)').text();
        $('.goPay-box .pay-sumPrice span:eq(0)').text(paySumPrice - (-sumPrice));
    });

    // 点击商家店铺时进入商家页面
    $('.product-info .shop-box').click(function(){
        $('.shop-food-info')
            .addClass('selected')
            .siblings('div')
            .removeClass('selected');
        $('.shop-food-info .nav-tabs li').eq(0)
            .addClass('active')
            .siblings('li')
            .removeClass('active');
        $('.shop-food-info .tab-content').children(0)
            .addClass('active in')
            .nextAll()
            .removeClass('active');
    });

    // 结算区域的菜品数量加减和修改
    $(document).on("click",".cartfood-info .food-num .reduce",function(){
        var num = $(this).next().val();
        var foodUnitPrice = $(this).parent().next().children('span').text();
        
        if(num > 0){
            num--;
            
            var sumAmount = $('.pay-info .amount span').text();
            $('.goPay-box .pay-info .amount span').text(sumAmount - 1);
            
            var paySumPrice = $('.pay-info .pay-sumPrice span').eq(0).text();
            var newpaySumPrice = paySumPrice -  foodUnitPrice;
            $('.pay-info .pay-sumPrice span:eq(0)').text(newpaySumPrice);
        }else{
            num = 0;
        }
        $(this).next().val(num);
        // 小计
        var sumPrice = foodUnitPrice * num;
        $(this).parent().siblings('.food-price').children('.price').text(sumPrice);
    });
    $(document).on("click",".cartfood-info .food-num .add",function(){
        var num = $(this).prev().val();
        var foodUnitPrice = $(this).parent().next().children('span').text();
        if(num < 99){
            num++;
            
            var sumAmount = $('.pay-info .amount span').text();
            $('.goPay-box .pay-info .amount span').text(sumAmount - (-1));
            
            var paySumPrice = $('.pay-info .pay-sumPrice span').eq(0).text();
            var newpaySumPrice = paySumPrice -  (-foodUnitPrice);
            $('.pay-info .pay-sumPrice span:eq(0)').text(newpaySumPrice);
        }else{
            num = 99;
        }
        $(this).prev().val(num);
        // 小计
        var sumPrice = foodUnitPrice * num;
        $(this).parent().siblings('.food-price').children('.price').text(sumPrice);
    });
    $(document).on("change",".cartfood-info .food-num .num",function(){
        var sunAmount = 0;
        $('.cartfood-info .food-num .num').each(function (index,ele) {
            sunAmount = sunAmount - (-($(ele).val()));
        });
        $('.goPay-box .pay-info .amount span').text(sunAmount);
        
        var foodUnitPrice = $(this).parent().next().children('span').text();
        var sumPrice = foodUnitPrice * num;
        $(this).parent().siblings('.food-price').children('.price').text(sumPrice);
   
        var paySumPrice = $('.pay-info .pay-sumPrice span').eq(0).text();
        var newpaySumPrice = paySumPrice -  (-foodUnitPrice);
        $('.pay-info .pay-sumPrice span:eq(0)').text(newpaySumPrice);
    });

    	
    	
    // 结算区域的菜品删除
    $(document).on("click",".cartfood-info .food-delete .food-delete-bot",function(){
        var num = $(this).parent().siblings('.food-num').children('.num').val();
        var sumAmount = $('.pay-info .amount span').text() - num;
        $(this).parent().parent().parent().remove();
        $('.goPay-box .pay-info .amount span').text(sumAmount);
    });
    

    // 点击结算后跳到支付页面
    $('.cart .pay-submit').click(function(){
    	$('#order-food-info-box').html("");
        $('.cart .cartfood .cartfood-info').each(function(index,ele){
            var foodName = $('.cartfood-info:eq(' + index + ') .food-name').text();
            var foodNum = $('.cartfood-info:eq(' + index + ') .food-num .num').val();
            var foodPrice = $('.cartfood-info:eq(' + index + ') .food-price .price').text();

            if(foodNum != 0){
                var str = '<div class="order-food-info"><div class="order-food-left"><img src="';
                //str += srcImg;
                str += '" alt=""></div><div class="order-food-right"><p><span>';
                str += foodName;
                str += '</span> × <span>';
                str += foodNum;
                str += '</span></p><p class="order-price">';
                str += foodPrice;
                str += ' &yen;</p></div></div>';
                $('#order-food-info-box').append(str);
            }
           
        });
        $('#order-food-info-box').trigger('create');
        
        var canheFee = $('.canhe-fee .canhe-price span').text();
        var peisongFee = $('.peisong-fee .peisong-price span').text();
        var youhuiFee = $('.youhui-fee .youhui-price span').text();
        var hongbao = $('.hongbao .hongbao-price span').text();
        
        
        var orderSumPrice = $('.goPay-box .pay-sumPrice span:eq(0)').text() - (-canheFee) - (-peisongFee) - youhuiFee - hongbao;
        var youhuiPrice = $('.goPay-box .pay-sumPrice span:eq(1)').text();

        $('.order .pay-option .pay-option-sumPrice span').text(orderSumPrice);
        $('.order .pay-option .pay-option-youhui span').text((youhuiFee - (-hongbao)));
        
        $('.cart .order').show();
    });

    $('.order .cancel').click(function(){
        $('.order').hide();
    })
    
    
    // 推荐商家
    $('#tjsj-btn').click(function(){
    	$.ajax({
			type: "get",
			url: "foodCtrl",
			dataType: "json",
			data: {
				"sort": "tjsj",
				"info": "shop"
			},
			success: function(data){
				for(var i in data){
					var shopImg = data[i].shopImg;
					var shopName = data[i].shopName;
					var shopPingfen = data[i].pingfen;
					var shopSale = data[i].sale;
					var shopYouhui = data[i].youhui;
					
					var str = '<div class="shop-box"><a href="#"><img src="images/timg.jpg';
//					str += images/timg.jpg;
					str += '" alt=""></a><div class="shop-info"><div><span class="shop-title">';
					str += shopName;
					str += '</span><span class="grade"><div class="star"></div><span> ';
					str += shopPingfen;
					str += '</span></span><span class="sale">月售';
					str += shopSale;
					str += '单</span></div></div><div class="discount"><span>';
					str += shopYouhui;
					str += '</span></div></div>';
					
					$('#tjsj').append(str);
					$('#tjsj').trigger('create');
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){
	            alert(XMLHttpRequest.readyState);
	            alert(XMLHttpRequest.status);
	            alert(textStatus);
			}
    	});
    });
    
    
    // 今日菜品推介
    $('#jrcptj-btn').click(function(){
    	$.ajax({
			type: "get",
			url: "foodCtrl",
			dataType: "json",
			data: {
				"sort": "jrcptj",
				"info": "food"
			},
			success: function(data){
				for(var i in data){
					var foodImg = data[i].foodImg;
					var foodName = data[i].foodName;
					var foodUnitPrice = data[i].foodUnitPrice;
					
					var str = '<div class="product-box"><a href="#"><img src="images/timg.jpg" alt=""></a><span class="foodTitle">';
					str += foodName;
					str += '</span><div class="product-num"><input type="button" class="reduce" value="-"><input type="tel" class="num" value="0"/><input type="button" class="add" value="+"></div><p class="price-box">&yen;<span class="price">';
					str += foodUnitPrice;
					str += '</span></p><a href="#" class="addCart">加入购物车</a></div>';
					$('#jrcptj').append(str);
					$('#jrcptj').trigger('create');
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){
	            alert(XMLHttpRequest.readyState);
	            alert(XMLHttpRequest.status);
	            alert(textStatus);
			}
    	});
    });
    
    // 大牌店铺
    $('#dpdp-btn').click(function(){
    	$.ajax({
			type: "get",
			url: "foodCtrl",
			dataType: "json",
			data: {
				"sort": "dpdp",
				"info": "shop"
			},
			success: function(data){
				for(var i in data){
					var shopImg = data[i].shopImg;
					var shopName = data[i].shopName;
					var shopPingfen = data[i].pingfen;
					var shopSale = data[i].sale;
					var shopYouhui = data[i].youhui;
					
					var str = '<div class="shop-box"><a href="#"><img src="images/timg.jpg';
//					str += images/timg.jpg;
					str += '" alt=""></a><div class="shop-info"><div><span class="shop-title">';
					str += shopName;
					str += '</span><span class="grade"><div class="star"></div><span> ';
					str += shopPingfen;
					str += '</span></span><span class="sale">月售';
					str += shopSale;
					str += '单</span></div></div><div class="discount"><span>';
					str += shopYouhui;
					str += '</span></div></div>';
					
					$('#dpdp').append(str);
					$('#dpdp').trigger('create');
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){
	            alert(XMLHttpRequest.readyState);
	            alert(XMLHttpRequest.status);
	            alert(textStatus);
			}
    	});
    });

    // 校园优选
    $('#xyyx-btn').click(function(){
    	$.ajax({
			type: "get",
			url: "foodCtrl",
			dataType: "json",
			data: {
				"sort": "xyyx",
				"info": "shop"
			},
			success: function(data){
				for(var i in data){
					var shopImg = data[i].shopImg;
					var shopName = data[i].shopName;
					var shopPingfen = data[i].pingfen;
					var shopSale = data[i].sale;
					var shopYouhui = data[i].youhui;
					
					var str = '<div class="shop-box"><a href="#"><img src="images/timg.jpg';
//					str += images/timg.jpg;
					str += '" alt=""></a><div class="shop-info"><div><span class="shop-title">';
					str += shopName;
					str += '</span><span class="grade"><div class="star"></div><span> ';
					str += shopPingfen;
					str += '</span></span><span class="sale">月售';
					str += shopSale;
					str += '单</span></div></div><div class="discount"><span>';
					str += shopYouhui;
					str += '</span></div></div>';
					
					$('#xyyx').append(str);
					$('#xyyx').trigger('create');
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){
	            alert(XMLHttpRequest.readyState);
	            alert(XMLHttpRequest.status);
	            alert(textStatus);
			}
    	});
    });

    // 限时热卖
    $('#xsrm-btn').click(function(){
    	$.ajax({
			type: "get",
			url: "foodCtrl",
			dataType: "json",
			data: {
				"sort": "xsrm",
				"info": "food"
			},
			success: function(data){
				for(var i in data){
					var foodImg = data[i].foodImg;
					var foodName = data[i].foodName;
					var foodUnitPrice = data[i].foodUnitPrice;
					
					var str = '<div class="product-box"><a href="#"><img src="images/timg.jpg" alt=""></a><span class="foodTitle">';
					str += foodName;
					str += '</span><div class="product-num"><input type="button" class="reduce" value="-"><input type="tel" class="num" value="0"/><input type="button" class="add" value="+"></div><p class="price-box">&yen;<span class="price">';
					str += foodUnitPrice;
					str += '</span></p><a href="#" class="addCart">加入购物车</a></div>';
					$('#xsrm').append(str);
					$('#xsrm').trigger('create');
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){
	            alert(XMLHttpRequest.readyState);
	            alert(XMLHttpRequest.status);
	            alert(textStatus);
			}
    	});
    });

    // 美时美刻
    $('#msmk-btn').click(function(){
    	$.ajax({
			type: "get",
			url: "foodCtrl",
			dataType: "json",
			data: {
				"sort": "msmk",
				"info": "food"
			},
			success: function(data){
				for(var i in data){
					var foodImg = data[i].foodImg;
					var foodName = data[i].foodName;
					var foodUnitPrice = data[i].foodUnitPrice;
					
					var str = '<div class="product-box"><a href="#"><img src="images/timg.jpg" alt=""></a><span class="foodTitle">';
					str += foodName;
					str += '</span><div class="product-num"><input type="button" class="reduce" value="-"><input type="tel" class="num" value="0"/><input type="button" class="add" value="+"></div><p class="price-box">&yen;<span class="price">';
					str += foodUnitPrice;
					str += '</span></p><a href="#" class="addCart">加入购物车</a></div>';
					$('#msmk').append(str);
					$('#msmk').trigger('create');
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){
	            alert(XMLHttpRequest.readyState);
	            alert(XMLHttpRequest.status);
	            alert(textStatus);
			}
    	});
    });

    // 炸鸡汉堡
    $('#zjhb-btn').click(function(){
    	$.ajax({
			type: "get",
			url: "foodCtrl",
			dataType: "json",
			data: {
				"sort": "zjhb",
				"info": "food"
			},
			success: function(data){
				for(var i in data){
					var foodImg = data[i].foodImg;
					var foodName = data[i].foodName;
					var foodUnitPrice = data[i].foodUnitPrice;
					
					var str = '<div class="product-box"><a href="#"><img src="images/timg.jpg" alt=""></a><span class="foodTitle">';
					str += foodName;
					str += '</span><div class="product-num"><input type="button" class="reduce" value="-"><input type="tel" class="num" value="0"/><input type="button" class="add" value="+"></div><p class="price-box">&yen;<span class="price">';
					str += foodUnitPrice;
					str += '</span></p><a href="#" class="addCart">加入购物车</a></div>';
					$('#zjhb').append(str);
					$('#zjhb').trigger('create');
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){
	            alert(XMLHttpRequest.readyState);
	            alert(XMLHttpRequest.status);
	            alert(textStatus);
			}
    	});
    });

});



