$(function($) {
    var 
        __url = {
            view_read            : 'navigate_apply/read.html',
            view_info            : 'navigate_apply/info.html',
            save                 : 'apply/shop/save.html'
        },
        initEventBind = function(){
            $('.agreement-box .agree').unbind('click').bind('click',function(){
                var isRead = $('.agreement-box :radio').prop("checked");
                if(isRead){
                    $.pfa.pfaAjax({
                        url : __url.save,
                        callback : function(data){
                            if(data){
                            	console.log(data);
                                var result = data.data || 'fail',
                                    message = data.message || '';
                                if(result == 'success'){
                                	alert("1");
                                    //跳转到消息完善页
                                    location.href = $.pfa.hostName+__url.view_info;
                                }else if(message == 'exists'){
                                    layer.msg('每个账号只能申请一个店铺呦！',{icon:7,time:2000}, function(){});
                                }else{
                                    layer.msg('协议处理失败！',{icon:2,time:2000}, function(){});
                                }
                            }
                        }
                    });
                }else{
                    layer.msg('请仔细阅读以上协议！',{icon:7,time:2000}, function(){});
                    return;
                }
            });
        }
    ;
    initEventBind();
});