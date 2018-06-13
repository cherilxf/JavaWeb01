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
    $('.product-box .product-num .num').blur(function () {
        var num = $(this).text();
        if(num > 99){
            $(this).text(99);
        }else if(num < 0){
            $(this).text(0);
        }
    }).change(function() {

    });

    $('.product-box .product-num .reduce').on('click',function () {
        var num = $(this).next().val();
        if(num > 0){
            num--;
        }else{
            num = 0;
        }
        $(this).next().val(num);
    });

    $('.product-box .product-num .add').on('click',function () {
        var num = $(this).prev().val();
        if(num < 99){
            num++;
        }else{
            num = 99;
        }
        $(this).prev().val(num);
    });

    // 菜品页面点击“加入购物车”
    $('.product-box .addCart').click(function(){
        var foodName = $(this).siblings('.foodTitle').text();
        var foodNum = $(this).siblings('.product-num').children('.num').val();
        var foodPrice = $(this).siblings('.price-box').children('.price').text();

        var str = '<div class="cartfood-info"><ul><li class="food-name"><p>';
        str += foodName;
        str += '</p></li><li class="food-num"><span class="reduce">-</span><input class="num" type="text" value="';
        str += foodNum;
        str += '"/><span class="add">+</span></li><li class="food-price">&yen;<span class="price">';
        str += foodPrice;
        str += '</span></li><li class="food-delete"><span class="food-delete-top"></span><span class="food-delete-bot"></span></li></ul></div>';

        $('#cartfood_info_box').append(str);
        var sumAmount = $('.goPay-box .amount span').text() - (-foodNum);
        $('.goPay-box .pay-info .amount span').text(sumAmount);
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

    //结算区域的菜品数量加减和修改
    $(document).on("click",".cartfood-info .food-num .reduce",function(){
        var num = $(this).next().val();
        if(num > 0){
            num--;
            var sumAmount = $('.pay-info .amount span').text();
            $('.goPay-box .pay-info .amount span').text(sumAmount - 1);
        }else{
            num = 0;
        }
        $(this).next().val(num);
    });
    $(document).on("click",".cartfood-info .food-num .add",function(){
        var num = $(this).prev().val();
        if(num < 99){
            num++;
        }else{
            num = 99;
        }
        $(this).prev().val(num);
        var sumAmount = $('.pay-info .amount span').text();
        $('.goPay-box .pay-info .amount span').text(sumAmount - (-1));
    });
    $(document).on("change",".cartfood-info .food-num .num",function(){
        var sunAmount = 0;
        $('.cartfood-info .food-num .num').each(function (index,ele) {
            sunAmount = sunAmount - (-($(ele).val()));
        });
        $('.goPay-box .pay-info .amount span').text(sunAmount);
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
                str += '</span></p><p class="order-price">&yen;';
                str += 3.00;
                str += '</p></div></div>';

                $('.order-info').prepend(str);
            }

        });
        var foodPrice = $('.goPay-box .pay-sumPrice span:eq(0)').text();
        var youhuiPrice = $('.goPay-box .pay-sumPrice span:eq(1)').text();

        $('.cart .order').show();
    });

    $('.order .cancel').click(function(){
        $('.order').hide();
    })
});