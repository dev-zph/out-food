$(function($) {
	$.pfa = $.pfa || {};
	$.extend($.pfa, {
		host: document.location.protocol + '//' + document.location.host + '/',
		hostName: document.location.protocol + '//' + document.location.host +$('body').attr('ctx') + '/',
        pfaAjax: function( opts ){
    		var type = opts.type || 'get',
    			url = opts.url,
    			callback = opts.callback,
    			ajaxData = opts.ajaxData || {};
    		$.ajax({
    			type: type,
    			url: $.pfa.hostName + url,
    			dataType: 'json',
    			data: ajaxData,
    			cache: false,
    			success: function( data ) {
    				var bFlag = $.isEmptyObject( data ) ? false : true,
    					dataObj;
    				if( bFlag ){
    					dataObj = data || {};
    				}else{
    					dataObj = false;
    				}
    				if ($.isFunction(callback)) {
						callback.call(this,dataObj);
					}
    			},error: function() {
    				layer.msg('服务繁忙，请重新登录！',{icon:2});
//    				window.location.href =  $('body').attr('ctx')+'/toLogin.html';
    			}
    		});
    	},
	});
});