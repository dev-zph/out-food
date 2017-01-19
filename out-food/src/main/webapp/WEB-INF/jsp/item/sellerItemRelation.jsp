<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <%@ include file="../common/init.jsp" %>
    <title>
        <c:out value="${pageTitle}"/>
    </title>
    <link rel="stylesheet" href="${ctx}/resources/css/webBase.css"/>
    <link rel="stylesheet" href="${ctx}/resources/css/base.css"/>
    <link rel="stylesheet" href="${ctx}/resources/webFrame/public/css/button.css">
</head>
<body ref="${ctx}" ctx="${ctx}">
<%@ include file="../common/head.jsp" %>
<%@ include file="../common/seller_head.jsp" %>
<%@ include file="../common/head_seller.jsp" %>
<div class="content content-box clear-float">
    <%@include file="../common/left_menu_seller.jsp" %>
    <div class="seller-center-info float-right">
        <p class="small-nav">
            <a href="${ctx}/home.html">首页</a>&gt;<a href="">关系管理</a>&gt;
        </p>
        <div class="user-data">
            <div class="oder-more-info">
                <div class="oder-more-info-address">
                    <br>
                    <div class="oder-more-info-text">
                        <h4><a href="#">商品信息</a></h4>
                        <input type="hidden" name="itemId" value="${item.id }"><!--  商品编号 -->
                        <div class="text">
                            <p>商品名称：
                                <b>${item.name} ${item.title}</b>
                            </p>
                            <p>商品规格：
                                <b>${item.version}</b>
                            </p>
                            <p>商品价格：
                                <b>${item.price}￥</b>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <!-- 商品关系列表 -->
                <table class="pure-table pure-table-bordered text-center  tr-height-30"
                       style="margin-top: 15px;">
                    <thead>
                    <tr>
                        <th>集团公司</th>
                        <th>合同价格</th>
                        <th>库存</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${itemRelationList}" var="itemRelation" varStatus="status">
                        <tr>
                            <td>${itemRelation.nickName}</td>
                            <td>${itemRelation.itemPrice}</td>
                            <td>${itemRelation.itemStock}</td>
                            <td>
                                <button class="layui-btn button-red layui-btn-small editItemRelation"
                                        itemRelationId="${itemRelation.id }">修改集团价格/库存
                                </button>
                                <button class="layui-btn layui-btn-normal layui-btn-small addPasture"
                                        userId="${itemRelation.userId }">设置牧场价格/库存
                                </button>
                                <button class="layui-btn layui-btn-primary layui-btn-small delItemRelationg"
                                        itemRelationId="${itemRelation.id }">删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="4" style="height: 50px;line-height: 50px;">
                            <button class="layui-btn button-red addNick">添加集团价格</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<table class="pure-table pure-table-bordered text-center tr-height-30"
       style="display: none;width: 800px;margin: 30px auto;" id="addNickFrame">
    <thead id="background-color-gray">
    <tr>
        <th>集团公司</th>
        <th>合同价格</th>
        <th>库存</th>
        <th>选择</th>
    </tr>
    </thead>
    <tbody style="overflow:scroll;height: 300px;">
    <c:forEach items="${userList}" var="user">
        <tr class="userNickPriceInfo">
            <td>${user.nickName}</td>
            <td>
                <input name="itemPrice" type="text" value="${item.price}" required> ￥
            </td>
            <td>
                <input name="itemStock" type="text" value="${item.itemStock}" required>
            </td>
            <td>
                <label for="${user.id}" class="pure-checkbox">
                    <input name="userId" id="${user.id}" type="checkbox" value="${user.id }">
                </label>
            </td>
        </tr>
    </c:forEach>
    <tr style="border: hidden;border-top: 1px solid #cbcbcb;">
        <td colspan="3" style="height: 50px;line-height: 50px;">
            <button id="addItemRelation" class="layui-btn button-red" type="submit">确认添加
            </button>
            <button class="layui-btn layui-btn-primary CloseItemRelation" style="margin-left: 20px;">取消
            </button>
        </td>
    </tr>
    </tbody>
</table>
<table class="pure-table pure-table-bordered text-center tr-height-30"
       style="display: none;width: 800px;margin: 30px auto;" id="addPasture">
    <thead>
    <tr>
        <th>牧场名称</th>
        <th>合同价格</th>
        <th>库存</th>
        <th>是否生效</th>
        <th>选择</th>
    </tr>
    </thead>
    <tbody style="overflow:scroll;height: 300px;" id="userPasturePriceInfo">
    <!--<tr>-->
    <!--<td name="pastureName"></td>-->
    <!--<td>-->
    <!--<input name="itemPrice" type="text" placeholder="" value="" required> ￥-->
    <!--</td>-->
    <!--<td>-->
    <!--<label for="" class="pure-checkbox">-->
    <!--<input name="userPastureId" userId="" type="checkbox" value="" parentId="">-->
    <!--</label>-->
    <!--</td>-->
    <!--</tr>-->
    <!--<tr last style="border: hidden;border-top: 1px solid #cbcbcb;">-->
    <!--<td colspan="3" style="height: 50px;line-height: 50px;">-->
    <!--<button id="addPasturePrice" class="layui-btn button-red" type="submit">保存-->
    <!--</button>-->
    <!--<button class="layui-btn layui-btn-primary CloseItemRelation" style="margin-left: 20px;">取消-->
    <!--</button>-->
    <!--</td>-->
    <!--</tr>-->
    </tbody>
</table>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
<script type="text/javascript">
    $(function ($) {
        $('.addNick').click(function () {
            layer.open({
                title: '添加新条目',
                area: ['850px', '500px'],
                type: 1,
                scrollbar: true,
                content: $('#addNickFrame'),
            });
        });

        //新增集团价格
        $('#addItemRelation').click(function () {
            var itemId = $('input[name=itemId]').val();
            var addNickFrame = $('#addNickFrame');
            var itemPriceInfo = addNickFrame.find('.userNickPriceInfo');
            var itemRelatiomId = $('input[name=pasturePrice]').attr('itemRelatiomId');
            var itemInfo = [];
            if (itemRelatiomId != "") {

            }
            $('input[name=userId]:checked').each(function (index, el) {
                itemInfo.push("{'userId':'" + $(el).attr('id') + "','parentId':'0','itemPrice':'" + $(el).parents('tr').find('input[name=itemPrice]').val() + "','itemStock':'" + $(el).parents('tr').find('input[name=itemStock]').val() + "'}");
            });
            if (itemInfo.length == 0) {
                layer.msg('未勾选任何条目！', {icon: 2});
                return;
            }
            var itemInfoStr = itemInfo.join(',');
            itemInfoStr = '[' + itemInfoStr + ']';
            $.ajax({
                type: 'POST',
                url: ctx + '/itemRelation/addItemRelation.html',
                data: {
                    itemId: itemId,
                    itemInfo: itemInfoStr
                },
                error: function () {
                    layer.msg('请求网络失败，请重试！', {
                        icon: 7
                    });
                },
                success: function (data) {
                    if (data.code == 101) {
                        layer.msg(data.message, {
                            time: 2000,
                            icon: 1
                        }, function () {
                            window.location.reload();
                        })
                    } else {
                        layer.msg('操作异常，请刷新后重试！', {
                            icon: 2
                        });
                    }
                }
            });
        });
        //修改集团价格/库存   更新链接 itemRelation/updateItemRelation.html   参数  id ，itemPrice ，itemStock
        $('.editItemRelation').click(function () {
            var itemRelationId = $(this).attr("itemRelationId");
            layer.confirm('修改集团价格/修改集团库存？', {
                title: '请选择',
                btn: ['集团价格', '集团库存', '取消'] //可以无限个按钮
                ,btn3: function(index, layero){
                    layer.close(index);
                }
            }, function(index, layero){
                editPrice();
            }, function(index){
                editStock();
            });
            function editPrice() {//修改集团价格弹窗
                layer.prompt({
                    formType: 0,
                    value: '',
                    title: '修改合同价格'
                }, function (value, index, elem) {
                    layer.close(index);
                    $.ajax({
                        type: "POST",
                        url: ctx + '/itemRelation/updateItemRelation.html',
                        data: {
                            id: itemRelationId,
                            itemPrice: value
                        },
                        error: function () {
                            layer.msg('请求网络失败，请重试！', {
                                icon: 7
                            });
                        },
                        success: function (data) {
                            if (data.code == 101) {
                                layer.msg(data.message, {
                                    time: 2000,
                                    icon: 1
                                }, function () {
                                    window.location.reload();
                                })
                            } else {
                                layer.msg('操作异常，请刷新后重试！', {
                                    icon: 2
                                });
                            }
                        }
                    });
                });
            };
            function editStock() {//修改集团库存弹窗
                layer.prompt({
                    formType: 0,
                    value: '',
                    title: '修改集团库存'
                }, function (value, index, elem) {
                    layer.close(index);
                    $.ajax({
                        type: "POST",
                        url: ctx + '/itemRelation/updateItemRelation.html',
                        data: {
                            id: itemRelationId,
                            itemStock: value
                        },
                        error: function () {
                            layer.msg('请求网络失败，请重试！', {
                                icon: 7
                            });
                        },
                        success: function (data) {
                            if (data.code == 101) {
                                layer.msg(data.message, {
                                    time: 2000,
                                    icon: 1
                                }, function () {
                                    window.location.reload();
                                })
                            } else {
                                layer.msg('操作异常，请刷新后重试！', {
                                    icon: 2
                                });
                            }
                        }
                    });
                });
            }


        })
        //删除事件，url itemRelation/deleteItemRelation.html 参数  id
        $('.delItemRelationg').click(function () {
            var itemRelationId = $(this).attr("itemRelationId");
            layer.confirm('是否要删除此条集团记录？', {icon: 3, title:'提示'}, function(index){
                $.ajax({//确认后的动作
                    type: "POST",
                    url: ctx + '/itemRelation/deleteItemRelation.html',
                    data: {
                        id: itemRelationId
                    },
                    error: function () {
                        layer.msg('请求网络失败，请重试！', {
                            icon: 7
                        });
                    },
                    success: function (data) {
                        if (data.code == 101) {
                            layer.msg(data.message, {
                                time: 2000,
                                icon: 1
                            }, function () {
                                window.location.reload();
                            })
                        } else {
                            layer.msg('操作异常，请刷新后重试！', {
                                icon: 2
                            });
                        }
                    }
                });
                layer.close(index);//关闭弹窗
            });

        })
        //设置牧场价格弹窗
        $('.addPasture').click(function () {
            var itemId = $('input[name=itemId]').val();
            var parentId = $(this).attr('userId');
            $.ajax({
                type: 'POST',
                url: ctx + '/itemRelation/getRanchPrice.html',
                data: {
                    itemId: itemId,
                    parentId: parentId,
                },
                error: function () {
                    layer.msg('请求网络失败，请重试！', {
                        icon: 7
                    });
                },
                success: function (data) {
                    if (data.code == 101) {
                        console.log(data.data);
                        showPasture(data.data);

                    } else {
                        layer.msg('操作异常，请刷新后重试！', {
                            icon: 2
                        });
                    }
                }
            });
            function showPasture(data) {
                for (i = 0; i < data.length; i++) {
//                    console.log(data[i].nickName);
                    var pastureName = data[i].nickName;
                    var pasturePrice = data[i].itemPrice;
                    var pastureStock = data[i].itemStock;
                    var parentId = data[i].parentId;
                    var userId = data[i].userId;
                    var status = data[i].status;
                    var itemRelationId = data[i].id;
                    if (status == 2) {
                        status = "是";
                    } else {
                        status = "否";
                    }

                    info = {
                        pastureName: "<td name='pastureName'>" + pastureName + "</td>",
                        pasturePrice: "<td><input name='pasturePrice' type='text' placeholder='" + pasturePrice + "' value='" + pasturePrice + "' required> ￥<td>",
                        pastureStock: "<input name='pastureStock' type='text' placeholder='" + pastureStock + "' value='" + pastureStock + "' required>",
                        status: "<td>" + status + "</td>",
                        checkbox: "<td><label for='" + userId + "' class='pure-checkbox'><input name='userPastureId' type='checkbox' userId='" + userId + "' value='" + userId + "' parentId='" + parentId + "'></label></td>"
                    }
                    if (typeof(itemRelationId) != "undefined" && itemRelationId != "") {
                        info.checkbox = "<td><label for='" + userId + "' class='pure-checkbox'><input name='userPastureId' type='checkbox' userId='" + userId + "' value='" + userId + "' parentId='" + parentId + "' itemRelationId='" + itemRelationId + "''></label></td>";
                    }

                    $("#userPasturePriceInfo").append("<tr>" + info.pastureName + info.pasturePrice + info.pastureStock + info.status + info.checkbox + "</tr>");

                };
                var savePastureInfo = "<td colspan='5' style='height: 50px;line-height: 50px;'><button id='addPasturePrice' class='layui-btn button-red' type='submit'>保存 </button> <button class='layui-btn layui-btn-primary CloseItemRelation' id='closePasture' style='margin-left: 20px;'>取消</button></td>";
                $("#userPasturePriceInfo").append("" + savePastureInfo + "");
                layer.open({
                    title: '添加/查看牧场价格',
                    area: ['850px', '500px'],
                    type: 1,
                    scrollbar: true,
                    content: $('#addPasture'),
                    success: function (layero, index) {
                    },
                    cancel: function (index) {
                        layer.close(index);
                        $("#userPasturePriceInfo").html(" ");
                        return false;
                    }
                });
            }
        });
        //关闭牧场价格弹窗
        $('.CloseItemRelation').click(function () {
            layer.closeAll();
            $("#userPasturePriceInfo").html(" ");
        });
        //关闭牧场价格弹窗
        $("#userPasturePriceInfo").on("click", "#closePasture", function () {
            layer.closeAll();
            $("#userPasturePriceInfo").html(" ");
        });
        //牧场价格保存
        $('#userPasturePriceInfo').on("click", "#addPasturePrice", function () {
            var itemId = $('input[name=itemId]').val();
            var addPasture = $('#addPasture');
            var itemPriceInfo = addPasture.find('.userPasturePriceInfo');
            var itemInfo = [];
            $('input[name=userPastureId]:checked').each(function (index, el) {
                var itemRelationId = $(el).attr('itemRelationId');
                console.log(itemRelationId);
                if (typeof(itemRelationId) != "undefined") {
                    itemInfo.push("{'userId':'" + $(el).attr('userId') + "','parentId':'" + $(el).attr('parentId') + "','id':'" + itemRelationId + "','itemPrice':'" + $(el).parents('tr').find('input[name=pasturePrice]').val() + "','itemStock':'" + $(el).parents('tr').find('input[name=pastureStock]').val() + "'}");
                } else {
                    itemInfo.push("{'userId':'" + $(el).attr('userId') + "','parentId':'" + $(el).attr('parentId') + "','itemPrice':'" + $(el).parents('tr').find('input[name=pasturePrice]').val() + "','itemStock':'" + $(el).parents('tr').find('input[name=pastureStock]').val() + "'}");
                }

            });
            if (itemInfo.length == 0) {
                layer.msg('未勾选任何条目！', {icon: 2});
                return;
            }
            var itemInfoStr = itemInfo.join(',');
            itemInfoStr = '[' + itemInfoStr + ']';
            $.ajax({
                type: 'POST',
                url: ctx + '/itemRelation/addItemRelation.html',
                data: {
                    itemId: itemId,
                    itemInfo: itemInfoStr
                },
                error: function () {
                    layer.msg('请求网络失败，请重试！', {
                        icon: 7
                    });
                },
                success: function (data) {
                    if (data.code == 101) {
                        layer.msg(data.message, {
                            time: 2000,
                            icon: 1
                        }, function () {
                            window.location.reload();
                            $("#userPasturePriceInfo").html(" ");
                        })
                    } else {
                        layer.msg('操作异常，请刷新后重试！', {
                            icon: 2
                        });
                    }
                }
            });
        });
    });
</script>