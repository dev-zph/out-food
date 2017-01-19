$(function ($) {
    var ctx = $('body').attr('ctx');
    /*订单搜索*/
    var _searchOrder = function () {
        //买家搜索
            //订单页面
            //按订单号搜索
            $('.search-btn').click(function () {
                var keyword = $(this).siblings('.keyword').val();
                window.location.href = ctx + '/order/getOrderList.html?keyword=' + keyword + "&index=2";
            });
            //按买家条件搜索
            $('.search-buyer').click(function () {
                var keyword = $('#keyword').val();
                var start_date = $('#start-date').val();
                var end_date = $('#end-date').val();
                var status = $('.search-by-status').val();
                var is_comment = $('.search-by-comment').val();
                window.location.href = ctx + '/order/getOrderList.html?keyword=' + keyword + '&startDate=' + start_date + '&endDate=' + end_date + '&isComment=' + is_comment + '&status=' + status + "&index=2";
            });
            //按订单状态搜索
            $('.search-by-status').change(function () {
                var status = $(this).val();
                var start_date = $('#start-date').val();
                var end_date = $('#end-date').val();
                var is_comment = $('.search-by-comment').val();
                window.location.href = ctx + '/order/getOrderList.html?startDate=' + start_date + '&endDate=' + end_date + '&isComment=' + is_comment + '&status=' + status + "&index=2";
            });
            //按评价状态搜索
            $('.search-by-comment').change(function () {
                var start_date = $('#start-date').val();
                var end_date = $('#end-date').val();
                var status = $('.search-by-status').val();
                var is_comment = $(this).val();
                window.location.href = ctx + '/order/getOrderList.html?startDate=' + start_date + '&endDate=' + end_date + '&isComment=' + is_comment + '&status=' + status + "&index=2";
            });
            // 买家账期搜索
             //按订单状态搜索
            $('.status-consumerList-buyer').change(function () {
                var status = $(this).val();
                var start_date = $('#start-date').val();
                var end_date = $('#end-date').val();
                window.location.href = ctx + '/accountPeriod/consumerList.html?startDate=' + start_date + '&endDate=' + end_date + '&status=' + status + "&index=9";
            });
             //按条件搜索
            $('.search-consumerList-buyer').click(function () {
                var keyword = $('#keyword').val();
                var start_date = $('#start-date').val();
                var end_date = $('#end-date').val();
                var status = $('.search-by-status').val();
                window.location.href = ctx + '/accountPeriod/consumerList.html?keyword=' + keyword + '&startDate=' + start_date + '&endDate=' + end_date + '&status=' + status + "&index=9";
            });
        // 卖家搜索
            //按卖家家条件搜索
            $('.search-seller').click(function () {
                var orderNum = $('#keyword').val();
                var start_date = $('#start-date').val();
                var end_date = $('#end-date').val();
                var status = $('.search-by-status').val();
                window.location.href = ctx + '/order/getShopOrderList.html?orderNum=' + orderNum + '&startDate=' + start_date + '&endDate=' + end_date  + '&status=' + status + "&status=0";
            });
            //按订单状态搜索
            $('.status-seller').change(function () {
                var status = $(this).val();
                var start_date = $('#start-date').val();
                var end_date = $('#end-date').val();
                window.location.href = ctx + '/order/getShopOrderList.html?startDate=' + start_date + '&endDate=' + end_date  + '&status=' + status ;
            });
            // 卖家账期搜索
            //按订单状态搜索
            $('.status-consumerList-seller').change(function () {
                var status = $(this).val();
                var start_date = $('#start-date').val();
                var end_date = $('#end-date').val();
                window.location.href = ctx + '/accountPeriod/businessList.html?startDate=' + start_date + '&endDate=' + end_date + '&status=' + status + "&index=7";
            });
            //按条件搜索
            $('.search-consumerList-seller').click(function () {
                var keyword = $('#keyword').val();
                var start_date = $('#start-date').val();
                var end_date = $('#end-date').val();
                var status = $('.search-by-status').val();
                window.location.href = ctx + '/accountPeriod/businessList.html?keyword=' + keyword + '&startDate=' + start_date + '&endDate=' + end_date + '&status=' + status + "&index=7";
            });
            //批量导出
            $('.listOrderExport').click(function () {
                var keyword = $('#keyword').val();
                var start_date = $('#start-date').val();
                var end_date = $('#end-date').val();
                var status = $('.search-by-status').val();
                var keyword = $(this).siblings('.keyword').val();
                var shop = $(this).attr("shop");
                if(shop == "true"){
                    $.ajax({
                        type: 'POST',
                        url: ctx + '/reportServer/saveOrderReport.html',
                        data: {
                            action: 'create',
                            startDate: start_date,
                            endDate: end_date,
                            status: status,
                            orderNum: keyword,
                            shop:shop
                        },
                        error: function () {
                            layer.msg("请求网络失败,请重试！",{icon:7});
                        },
                        success: function (data) {
                            if (data.code == 101) {
                                window.open(data.data);
                            } else {
                                layer.msg("操作异常！",{icon:2});
                            }
                        }
                    });
                }else{
                    $.ajax({
                        type: 'POST',
                        url: ctx + '/reportServer/saveOrderReport.html',
                        data: {
                            action: 'create',
                            startDate: start_date,
                            endDate: end_date,
                            status: status,
                            orderNum: keyword
                        },
                        error: function () {
                            layer.msg("请求网络失败,请重试！",{icon:7});
                        },
                        success: function (data) {
                            if (data.code == 101) {
                                window.open(data.data);
                            } else {
                                layer.msg("操作异常！",{icon:2});
                            }
                        }
                    });
                }
                //提交地址 reportServer/saveOrderReport.html
                // action=create   action:'create'


            });
        },
        /*付款*/
        _toPayOrder = function () {
            // 支付货款/首付款
            $('.to-pay-btn').click(function () {
                var order_no = $(this).parent().attr('orderno');
                var order_price = $(this).parent().attr('orderprice');
                window.location.href = ctx + '/order/toPayOrder.html?action=payFirst&orderPrice=' + order_price + '&orderNo=' + order_no;
            });
            // 支付余款
            $('.final-payment').click(function(){
                var order_no = $(this).parent().attr('orderno');
                window.location.href = ctx+'/order/toPayOrder.html?action=paySecond&orderNo='+order_no;
            });
        },
        /*合并支付*/
        _toMergePayOrder = function () {
            $('.merge-pay-btn').click(function () {
                var checked_count = $('.user-data-list').find('.order-checkbox:checked').length;
                if (checked_count == 0) {
                    layer.msg('请选择订单！',{icon:3});
                    return;
                }
                var order_checked = $('.user-data-list').find('.order-checkbox:checked');
                var order_num_arr = [];
                var total_order_price = 0.00;
                $.each(order_checked, function (i, order) {
                    var status = $(order).parents('.user-data-list').find('.order-status').val();
                    var pay_status = $(order).parents('.user-data-list').find('.order-payStatus').val();
                    var order_num = $(order).parents('.user-data-list').find('.order-num').val();
                    var order_price = parseFloat($(order).parents('.user-data-list').find('.order-price').val()).toFixed(2);
                    if (status == 1 && pay_status == 2) {//已确认并且等待付款的订单进行合并支付
                        order_num_arr.push(order_num);
                        total_order_price = _math_add(total_order_price, order_price).toFixed(2);
                    }

                });
                if (order_num_arr.length > 3) {
                    layer.msg('合并支付的订单数量不能超过3个！',{icon:2});
                    return;
                }
                ;
                window.location.href = ctx + '/order/toPayOrder.html?orderPrice=' + total_order_price + '&orderNo=' + order_num_arr;
            });
        },
        /*批量收货*/
        _batchConfirmReceipt = function () {
            $('.batch-confirm-btn').click(function () {
                var checked_count = $('.user-data-list').find('.order-checkbox:checked').length;
                if (checked_count == 0) {
                    layer.msg('请选择订单！',{icon:3});
                    return;
                }
                if (confirm("是否批量确认收货?")) {
                    var order_checked = $('.user-data-list').find('.order-checkbox:checked');
                    var order_num_arr = [];
                    $.each(order_checked, function (i, order) {
                        var status = $(order).parents('.user-data-list').find('.order-status').val();
                        var pay_status = $(order).parents('.user-data-list').find('.order-payStatus').val();
                        var order_num = $(order).parents('.user-data-list').find('.order-num').val();
                        if (status == 3 && pay_status == 3) {//等待收货并且已支付的订单进行批量收货
                            order_num_arr.push(order_num);
                        }
                    });
                    $.ajax({
                        type: 'POST',
                        url: ctx + '/order/updateOrder.html',
                        data: {
                            action: 'confirm_receipt',
                            orderNum: order_num_arr.join(',')
                        },
                        dataType: 'json',
                        error: function () {
                            layer.msg("请求网络失败,请重试！",{icon:7});
                        },
                        success: function (data) {
                            if (data == 101) {
                                window.location.href = ctx + '/order/getOrderList.html?index=2';
                            } else {
                                layer.msg("操作异常！",{icon:2});
                            }
                        }
                    });
                }
            });
        },
        /*确认收货弹框*/
        _confirmReceipt = function () {
            $('.confirm-receipt').click(function () {
                var order_no = $(this).parent().attr('orderno');
                window.location.href = ctx + '/orderVoucher/list/' + order_no + ".html?index=2";
            });
            $('.colse').click(function () {
                $('.comfirm-receipt-pop').hide();
                document.documentElement.style.overflow = 'auto';
            });
            $('.close').click(function () {
                $('.comfirm-receipt-pop').hide();
                document.documentElement.style.overflow = 'auto';
            });
        },
        /*确认收货处理*/
        _confirmReceiptProcess = function () {
            $('.process-confirm').click(function () {
                if (confirm("是否确认收货？")) {
                    var order_no = $(this).attr('orderno');
                    var start_date = $('#start-date').val();
                    var end_date = $('#end-date').val();
                    var status = $('.search-by-status').val();
                    var is_comment = $('.search-by-comment').val();
                    var url = $(this).attr('url');
                    var pageNo = parseInt($('.page-list').find('a[class="index on"]').text());
                    if ($('.user-data-list').length == 1) {
                        pageNo = pageNo - 1;
                    }
                    $.ajax({
                        type: 'POST',
                        url: ctx + '/order/updateOrder.html',
                        data: {
                            action: 'confirm_receipt',
                            orderNum: order_no
                        },
                        dataType: 'json',
                        error: function () {
                            layer.msg("请求网络失败,请重试！",{icon:7});
                        },
                        success: function (data) {
                            if (data == 101) {
                                if (url == null) {
                                    window.location.href = ctx + '/order/getOrderList.html?startDate=' + start_date + '&endDate=' + end_date + '&isComment=' + is_comment + '&status=' + status + '&index=2' + '&pageNo=' + pageNo;
                                } else {
                                    window.location.href = url;
                                }

                            } else {
                                layer.msg("操作异常！",{icon:2});
                            }
                        }
                    });
                }
            });
        },
        /*取消订单*/
        _cancelOrder = function () {
            $('.cancel-order').click(function () {
                if (confirm("是否确定取消订单?")) {
                    var orderNum = $(this).parent().attr('orderno');
                    $.ajax({
                        type: 'POST',
                        url: ctx + '/order/updateOrder.html',
                        data: {
                            action: "cancel_order",
                            orderNum: orderNum
                        },
                        dataType: 'json',
                        error: function () {
                            layer.msg("请求网络失败,请重试！",{icon:7});
                        },
                        success: function (data) {
                            if (data == 101) {
                                window.location.href = ctx + '/order/getOrderList.html?index=2';
                            } else {
                                layer.msg("操作异常！",{icon:2});
                            }
                        }
                    });
                }
            });
        },
        /*订单详情*/
        _orderDetail = function () {
            $('.order-detail').click(function () {
                var ud = $(this).parent().attr('ud');
                var order_num = $(this).parent().attr('orderno');
                if (ud == null) {
                    window.open(ctx + '/order/getOrderDetail/' + order_num + '.html?index=2');
                } else {
                    var status = $(this).attr('status');
                    window.open(ctx + '/order/getOrderDetail/' + order_num + '.html?ud=' + ud + '&status=' + status);
                }
            });
        },
        /*评价*/
        _toComment = function () {
            $('.to-comment').click(function () {
                var order_num = $(this).parent().attr('orderno');
                var shop_id = $(this).parent().attr('shopid');
                window.location.href = ctx + '/navigate_comment/index.html?shopId=' + shop_id + '&orderNum=' + order_num;
            });
        },
        /*投诉*/
        _toComplaint = function () {
            $('.complaint').click(function () {
                var detail_id = $(this).parent().attr('detailid');
                window.location.href = ctx + '/navigate_complaints/apply.html?id=' + detail_id;
            });
        },
        /*退货、换货*/
        _toReturnOrExchangeGoods = function () {
            $('.return-exchange').click(function () {
                var detail_id = $(this).parent().attr('detailid');
                var type = $(this).attr('type');
                window.location.href = ctx + '/navigate_aftersale/index.html?id=' + detail_id + '&st=' + type;
            });
        },
        /*商家发货-填写快递信息*/
        _sendGoods = function () {
            //打开弹框
            /*	$('.send-goods').click(function(){
             $(".pop").show();
             document.documentElement.style.overflow='hidden';
             $('#expressName-warning').text('');
             $('#expressNum-warning').text('');
             });*/
            //发货
            $('.send-goods').click(function () {
                var order_no = $('.send-goods').parent().attr('orderno');
                var menu_status = $('.left-menu').val();
                var pageNo = $('.page-list').find('a[class="index on"]').text();
                var expressName = $('.expressName').val().trim();
                var expressNum = $('.expressNum').val().trim();
                window.location.href = ctx + '/orderVoucher/shopList/'+ order_no +'.html';
                /*if(expressName == ''){
                 $('#expressName-warning').text('请填选择快递名称！');
                 return;
                 }else{
                 $('#expressName-warning').text('');
                 }
                 if(expressNum == ''){
                 $('#expressNum-warning').text('请填写快递运单号！');
                 return;
                 }else{
                 $('#expressNum-warning').text('');
                 }*/
                /*	if(expressName == '' && expressNum != ''){
                 $('#expressName-warning').text('请填选择快递名称！');
                 return;
                 }else{
                 $('#expressName-warning').text('');
                 }
                 if(expressNum == '' && expressName != ''){
                 $('#expressNum-warning').text('请填写快递运单号！');
                 return;
                 }else{
                 $('#expressNum-warning').text('');
                 }
                 */
                // $.ajax({
                //     type: 'POST',
                //     url: ctx + '/order/updateOrder.html',
                //     data: {
                //         action: "send_goods",
                //         orderNum: order_no/*,
                //          expressName:expressName,
                //          expressNum:expressNum*/
                //     },
                //     dataType: 'json',
                //     error: function () {
                //         alert("请求网络失败");
                //     },
                //     success: function (data) {
                //         if (data == 101) {
                //             alert("确认成功！");
                //             window.location.href = ctx + '/order/getShopOrderList.html?status=' + menu_status + '&pageNo=' + pageNo;
                //         } else {
                //             alert("操作异常！");
                //         }
                //     }
                // });
            });
            //关闭弹框
            $('.colse').click(function () {
                $(".pop").hide();
                document.documentElement.style.overflow = 'auto';
            });

            $('.close').click(function () {
                $(".pop").hide();
                document.documentElement.style.overflow = 'auto';
            });
        },
        /*floadt类型加法*/
        _math_add = function (arg1, arg2) {
            var r1, r2, m;
            try {
                r1 = arg1.toString().split(".")[1].length;
            } catch (e) {
                r1 = 0;
            }
            try {
                r2 = arg2.toString().split(".")[1].length;
            } catch (e) {
                r2 = 0;
            }
            m = Math.pow(10, Math.max(r1, r2));
            return (arg1 * m + arg2 * m) / m;
        };

    /*订单查询*/
    _searchOrder();
    /*付款*/
    _toPayOrder();
    /*合并付款*/
    _toMergePayOrder();
    /*批量确认收货*/
    _batchConfirmReceipt();
    /*确认收货弹框*/
    _confirmReceipt();
    /*确认收货处理*/
    _confirmReceiptProcess();
    /*取消订单*/
    _cancelOrder();
    /*订单详情*/
    _orderDetail();
    /*评价*/
    _toComment();
    /*投诉*/
    _toComplaint();
    /*退货、换货*/
    _toReturnOrExchangeGoods();
    /*商家发货*/
    _sendGoods();
});