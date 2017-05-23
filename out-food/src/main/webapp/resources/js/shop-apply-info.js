$(function($) {
    var info = {},
        __url = {
            view_info            : 'navigate_apply/info.html',
            view_verify          : 'navigate_apply/verify.html',
            view_read            : 'navigate_apply/read.html',
            get                  : 'apply/shop/data.html',
            update               : 'apply/shop/update.html',
            upload               : 'apply/upload.html'
        },
        initEventBind = function(){
            $('#businessScope').unbind('change keydown keyup blur').bind('change keydown keyup blur',function(){
                $(this).siblings('.spanTips').html($(this).val().length+'/1000');
            });
            $('.write-pro .buttonList :button').unbind('click').bind('click',function(){
                updateInfo($(this));
            });
            $('.radio-input i').unbind('click').bind('click',function(){
                var _this = $(this);
                if( _this.hasClass('selected') ){
                    _this.siblings('i').removeClass('selected');
                }else{
                    _this.addClass('selected');
                    _this.siblings('i').removeClass('selected');
                }
            });
            $('#licenseUrl,#shopLogUrl,#contactUrl,#logoUrl').fileupload({
                url : $.pfa.hostName+__url.upload,
                dataType : 'json',
                autoUpload : true,
                acceptFileTypes : /(\.|\/)(gif|jpe?g|png)$/i,
                minFileSize : 1, // 1 Byte
                maxFileSize : 10000000, // 10 MB
                progressall : function (e, data) {
                    $(this).parent().siblings('.fileupload-process').html("上传进度："+parseInt(data.loaded / data.total * 100, 10)+"%");
                },
                processalways : function (e, data) {
                    if(data.files.error){
                        if(data.files[0].error==data.messages.acceptFileTypes){
                            layer.msg('限定文件类型：gif,jpg,png',{icon:2,time:2000}, function(){});
                        }else if(data.files[0].error==data.messages.maxFileSize){
                            layer.msg('超过最大限制10M',{icon:2,time:2000}, function(){});
                        }else if(data.files[0].error==data.messages.minFileSize){
                            layer.msg('文件太小', {icon:2,time:2000},function(){});
                        }
                        
                    }
                },
                done : function (e, data) {
                    $(this).attr('file-filename',data.result.tmpFileName);
                    $(this).parent().siblings('.fileupload-process').html('');
                    $(this).prev("span").find("img").attr('src',server+data.result.tmpFileName);
                },
                fail : function (e, data) {
                    
                }
            });
        },
        updateInfo = function(triggerObject){
            if(triggerObject.hasClass('regBtn')){
                info.next = 'next';
            }else{
                info.next = '';
            }
            info.shopName = $("#shopName").val();//店铺名字
            info.shopLogUrl = $('#shopLogUrl').attr('file-filename');//	店铺logo	
            info.shopType = $(".selector").val();
            info.leastMon = parseFloat($("#leastMon").val());//最低起送价
            info.sendMon = parseFloat($("#sendMon").val());//配送费
            info.packageMon = parseFloat($("#packageMon").val());//配送费
            info.businessScope = $("#businessScope").val();//店铺简介
            info.licenseUrl = $('#licenseUrl').attr('file-filename');//	营业执照
            info.licenseNum = $("#licenseNum").val();//营业执照号contactCell
            info.address = $("#shopAddress").val();//营业执照号contactCell
            info.contactName = $("#contactName").val();//店铺联系人
            info.contactCell = $("#contactCell").val();
            info.contactUrl = $("#contactUrl").attr('file-filename');//身份证信息
            if(info.licenseUrl==''){
                layer.msg('请上传营业执照！', {icon:3,time:2000},function(){});
                return;
            }
            if(info.licenseNum==''){
                layer.msg('请填写营业执照号！',{icon:3,time:2000}, function(){});
                return;
            }
            if(info.shopName==''){
                layer.msg('请填写店铺名称！', {icon:3,time:2000},function(){});
                return;
            }
            if(info.contactName==''){
                layer.msg('请填写店铺联系人姓名！',{icon:3,time:2000}, function(){});
                return;
            }
            if(info.contactCell==''){
                layer.msg('请填写联系电话！',{icon:3,time:2000}, function(){});
                return;
            }
            if(info.contactUrl==''){
                layer.msg('请上传联系人身份证！',{icon:3,time:2000}, function(){});
                return;
            }
            if(info.address==''){
                layer.msg('请填写您的店铺地址!！',{icon:3,time:2000}, function(){});
                return;
            }
            //提交
            $.pfa.pfaAjax({
                url : __url.update,
                type : 'post',
                ajaxData : info,
                callback : function(data){
                    if(data){
                        var result = data.data || 'fail';
                        if(result == 'success'){
                            layer.msg('提交成功！',{icon:1});
                            if(info.next == 'next'){
                                location.href = $.pfa.hostName+__url.view_verify;
                            }
                        }
                    }
                }
            });
            
        },
        initPageElement = function(){
            $.pfa.pfaAjax({
                url : __url.get,
                callback : function(data){ 
                    if(data){
                        var result = data.data || [];
                        if(result.length<=0||result[0].status!=1){
                            //跳转到step1
                            location.href = $.pfa.hostName+__url.view_read;
                        }else{
                            $('#applyInfoId').val(result[0].id);
                            $('#company').val(result[0].company);
                            $('#companyAddress').val(result[0].companyAddress);
                            $('#accountPeriod').val(result[0].accountPeriod);
                            $('#businessScope').val(result[0].businessScope);
                            $('#businessScope').siblings('.spanTips').html(result[0].businessScope.length+'/1000');
                            if(result[0].licenseUrl&&result[0].licenseUrl.indexOf('http')==0){
                                $('#licenseUrl').prev("span").find("img").attr('src',result[0].licenseUrl);
                                //$('#licenseUrl').parent().siblings('.fileupload-process').after('<img width="80px" height="45px" src="'+result[0].licenseUrl+'"/>');
                            }else{
                                $('#licenseUrl').attr('file-filename',result[0].licenseUrl);
                            }
                            if(result[0].logoUrl&&result[0].logoUrl.indexOf('http')==0){
                                $('#logoUrl').prev("span").find("img").attr('src',result[0].logoUrl);
                                //$('#licenseUrl').parent().siblings('.fileupload-process').after('<img width="80px" height="45px" src="'+result[0].licenseUrl+'"/>');
                            }else{
                                $('#logoUrl').attr('file-filename',result[0].logoUrl);
                            }
                            $('#licenseNum').val(result[0].licenseNum);
                            $('#taxNum').val(result[0].taxNum);
                            $('#taxStatus i[data-value="'+result[0].taxStatus+'"]').addClass('selected').siblings('i').removeClass('selected');
                            if(result[0].taxUrl&&result[0].taxUrl.indexOf('http')==0){
                                $('#taxUrl').prev("span").find("img").attr('src',result[0].taxUrl);
                                //$('#taxUrl').parent().siblings('.fileupload-process').after('<img width="80px" height="45px" src="'+result[0].taxUrl+'"/>');
                            }else{
                                $('#taxUrl').attr('file-filename',result[0].taxUrl);
                            }
                            $('#bankAccountName').val(result[0].bankAccountName);
                            $('#bankName').val(result[0].bankName);
                            $('#bankNum').val(result[0].bankNum);
                            $('#name').val(result[0].name);
                            $('#serviceHotline').val(result[0].serviceHotline);
                            $('#serviceArea').val(result[0].serviceArea);
                            $('#contactName').val(result[0].contactName);
                            $('#contactCell').val(result[0].contactCell);
                            if(result[0].contactUrl&&result[0].contactUrl.indexOf('http')==0){
                                $('#contactUrl').prev("span").find("img").attr('src',result[0].contactUrl);
                                //$('#contactUrl').parent().siblings('.fileupload-process').after('<img width="80px" height="45px" src="'+result[0].contactUrl+'"/>');
                            }else{
                                $('#contactUrl').attr('file-filename',result[0].contactUrl);
                            }
                            //获取服务区域拉下列表
                        }
                    }
                }
            });
        },
        getCities = function(pid){
            if(pid && pid!=0){
                $.pfa.pfaAjax({
                    url : 'area/byparent.html',
                    ajaxData : {
                        parentId : pid
                    },
                    callback : function(data){
                        if(data){
                            var result = data.data || [];
                            var selectTemp = ['<option value="0">--请选择--</option>'];
                            $.each( result, function(i, obj){
                                selectTemp.push( '<option value="'+  obj.id  +'">'+ obj.name +'</option>' );
                            });
                            $('#city').empty().append( selectTemp.join('') );
                            $('#city').unbind('change').bind('change',function(){
                                var cityId = $('#city').val();
                                if(cityId!=0){
                                    getAreas(cityId);
                                }else{
                                	$('#area').empty();
                                }
                            });
                        }
                    }
                });
            }else{
                var selectTemp = ['<option value="0">--请选择--</option>'];
                $('#city').empty().append(selectTemp.join(''));
            }
        },
        getAreas = function(pid){
            if(pid && pid!=0){
                $.pfa.pfaAjax({
                    url : 'area/byparent.html',
                    ajaxData : {
                        parentId : pid
                    },
                    callback : function(data){
                        if(data){
                            var result = data.data || [];
                            var areaListHtml = ['<label></label>'];
                            $.each( result, function(i, obj){
                            	if((i+1)%5==0){//一行显示5个区
                            		areaListHtml.push( '<input type="checkbox" style="width:15px" value="'+  obj.name  +'">'+ obj.name +'</input><br/><label></label>' );
                            	}else{
                            		areaListHtml.push( '<input type="checkbox" style="width:15px" value="'+  obj.name  +'">'+ obj.name +'</input>&nbsp;&nbsp;&nbsp;' );
                            	}
                            });
                            $('#area').empty().append( areaListHtml.join('') );
                        }
                    }
                });
            }else{
                $('#area').empty();
            }
        }
    ;
//    initPageElement();
    initEventBind();
});