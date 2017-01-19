$(function($) {
	var ctx = $('body').attr('ctx');
    var info = {},
        __url = {
            view_verify           : 'navigate_apply/verify.html',
            view_read             : 'navigate_apply/read.html',
            view_info             : 'navigate_apply/info.html',
            get                   : 'apply/shop/data.html',
            status_read           : 'apply/shop/status-read.html'
        },
        initEventBind = function(){
            $('.open-info-verify-zfb .regBtn').unbind('click').bind('click',function(){
                $.pfa.pfaAjax({
                    url : __url.get,
                    callback : function(data) {
                        if (data) {
                            var result = data.data || [];
                            if (result.length <= 0) {
                                //跳转到step1
                                location.href = $.pfa.hostName + __url.view_read;
                            } else {
                                info.id = result[0].id;
                                info.status = result[0].status;
                                if(info.status==2){
                                    layer.msg('亲~正在全力审核中！',{icon:7});
                                    return;
                                }
                                if(info.status==3){
                                	var payType = $('.zfbList').find('input[type=radio]:checked').val();
                                	var bail_price = $('.bail-price').text().replace('￥','');
                                	var shopId = info.id;
                                	window.location.href = ctx+'/order/toPayBail.html?payForType=1&price='+bail_price+'&payType='+payType+'&shopId='+shopId;
                                    return;
                                }
                                if(info.status==4){
                                    layer.msg('审核未通过！',{icon:2});
                                    //未通过审核
                                    var editBtn = $('.garyBtn');
                                    if(editBtn){
                                        editBtn.remove();
                                    }
//                                    $('.open-info-verify-zfb .regBtn').after('<button class="garyBtn">重新编辑店铺资料</button>');
//                                    $('.open-info-verify-zfb .regBtn').remove();
                                    $('.open-info-verify-zfb').remove();
                                	$('.box-content').after('<div align="center"><button class="garyBtn">重新编辑店铺资料</button></div>');
                                    bindEditEvent();
                                    return;
                                }
                            }
                        }
                    }
                }); 
            });
        },
        bindEditEvent = function(){
            $('.garyBtn').unbind('click').bind('click',function(){
                $.pfa.pfaAjax({
                    url : __url.status_read,
                    type : 'post',
                    ajaxData : info,
                    callback : function(data){
                        if(data){
                            var result = data.data || 'fail';
                            if(result == 'success'){
                                location.href = $.pfa.hostName + __url.view_info;
                            }
                        }
                    }
                });
            });
        },
        initPageElement = function(){
            $.pfa.pfaAjax({
                url : __url.get,
                callback : function(data) {
                    if (data) {
                        var result = data.data || [];
                        if (result.length <= 0) {
                            //跳转到step1
                            location.href = $.pfa.hostName + __url.view_read;
                        } else {
                            info.id = result[0].id;
                            info.status = result[0].status;
                            if (info.status == 4) {
                                //未通过审核
                                var editBtn = $('.garyBtn');
                                if (editBtn) {
                                    editBtn.remove();
                                }
//                                $('.open-info-verify-zfb .regBtn').after('<button class="garyBtn">重新编辑店铺资料</button>');
//                                $('.open-info-verify-zfb .regBtn').remove();
                            	$('.open-info-verify-zfb').remove();
                            	$('.box-content').after('<div align="center"><button class="garyBtn">重新编辑店铺资料</button></div>');
                                bindEditEvent();
                                return;
                            }else if(info.status == 2){
                            	$('.open-info-verify-zfb').remove();
                            }
                        }
                    }
                }
            });
        }
    ;
    initPageElement();
    initEventBind();
});