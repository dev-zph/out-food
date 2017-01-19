$(function(){
	//上传文件
		  $('#itemImg').fileupload({
              url : ctx+'/apply/upload.html',
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
                  //$(this).parent().siblings('img').remove();
                  //$(this).parent().siblings('.fileupload-process').after('<img width="80px" height="45px" src="../'+data.result.tmpFileRouting+data.result.tmpFileName+'"/>');
              },
              fail : function (e, data) {
                  
              }
          });
	
})