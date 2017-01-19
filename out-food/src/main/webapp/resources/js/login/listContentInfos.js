/*
 功能：分类内容信息
 时间：2016年11月9日
 作者：su
 使用：
 var contypeId
 */
//选择渲染位置
function choiceMethod(contypeId, data) {
    if (contypeId == 11) {
        loginImg(data);//登录海报渲染
    }
}

/*功能：位置渲染*/
//登录海报渲染
function loginImg(data) {
    var loginPicture = data[0].filePath;//获取登录海报
    var innerUrl = data[0].url;//获取广告链接地址
    $("#loginImg").attr('src', loginPicture);
    $("#innerUrl").attr('href', innerUrl);

}