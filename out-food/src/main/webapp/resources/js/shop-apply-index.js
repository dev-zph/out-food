$(function($) {
    var 
        __url = {
            view_index           : 'navigate_apply/index.html',
            view_read            : 'navigate_apply/read.html',
            get                  : 'apply/shop/data.html'
        },
        initEventBind = function(){
            $('.open-shop-title a').unbind('click').bind('click',function(){
                $.pfa.pfaAjax({
                    url : __url.get,
                    callback : function(data){
                        if(data){
                            var result = data.data || [];
                            if(result.length<=0){
                                //跳转到step1
                                location.href = $.pfa.hostName+__url.view_read;
                            }else{
                                layer.msg('亲~您已申请过店铺了呦！',{icon:1,time:2000} ,function(){});
                                return;
                            }
                        }
                    }
                });
            });
        }
    ;
    initEventBind();
});