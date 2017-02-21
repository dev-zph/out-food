var pams = {};
var url = "getItemList.html?";
var name = '';
var area = "";
var sortType = '';
var loadItmsUrl = ctx + "/item/load/itms.html.json?tt=" + Math.random(0, 100);
var loadClassifyUrl = ctx + "/item/load/classify.json?tt=" + Math.random(0, 100);
// var shopRecommendUrl = ctx + "/getShop.json"
var href = window.location.href;
var classifyArry = [];
var areaArry = [];
var oneName = "";
var twoName = "";
var threeName = "";
var areaName = "";

$(function($) {
	$(".areachoose span").click(function() {
		$(".areachoose").css("border", "1px solid #dcdcdc");
		$(".icon-down").show();
		$(".areaswitch ul").show();
	});
	$(document).click(function() {
		$(".areachoose").css("border", "1px solid #fff");
		$(".icon-down").hide();
		$(".areaswitch ul").hide();
	});
	$('.areaswitch').click(function(event) {
		event.stopPropagation();
	});

	$.ajax({
		type:"POST",
		url:ctx+"/getSearch.html",
		data:"",
		dataType:"json",
		async:false,
		success:function(data){
			$("#searchHot").html('<span>热门搜索:</span><a href="javascript:;" class="hot-search">苜蓿</a><a href="javascript:;" class="hot-search">青贮</a><a href="javascript:;" class="hot-search">兽用蜡笔</a>');
		}
	});
	$(".logo").click(function(){
		window.location.href =ctx+"/home.html";
	});
	var city='杭州市';

	$.ajax({
		async : false,
		url : loadClassifyUrl,
		data:{area:city},
		dataType:"json",
		success : function(data){
			classifyArry=data.classify;
			areaArry=data.area;
			serviceArea();
			servicehotArea();
			}
		});

	// $.ajax({
	// 	async: false,
	// 	url: shopRecommendUrl,
	// 	dataType: "json",
	// 	success: function(data) {
	// 		shopRecommend = data.data;
	// 		$.each(shopRecommend, function (key, val) {
	// 			$('.shopRecommend').append('<li><a href="' + val.requestUrl + '" target="_blank"><img src="' + val.logoUrl + '"></a></li>')
	// 		});
	// 	}
	// });

	var oneSb = "";
	var twoSb = "";
	var threeSb = "";
	var navigation = "";
	history.pushState && window.addEventListener("popstate", function(e) {
		// 获取history.state对象中的状态信息
		// 在这里state将自动成为event的子对象，可直接通过event.state访问
		if (history.state) {
			var state = e.state;
			goOrback(state.pams); //
			loadDataAjax(state.pams);
		}
	}, false);
	$('.select').click(function() {
		$(".select").removeClass("def");
		$(this).addClass("def");
		sortType = $(this).attr('id');
		loadData(pams, getUrl());
	});
	//单击搜索事件
	$(".search-btn,.select-all").bind('click', function() {
        var name = $(this).parent().find(".search-key").val();
        if(typeof(name) == "undefined"|| name == 'undefined'){
        	name='';
        }
		searchProduct(name);
	});
	//回车搜索事件
	$('.search-key').bind('keypress', function(event) {
		var name = $(this).val();
		keyPressEvent(name);
	});

	$(".hot-search").click(function() {
		name = $(this).text();

		if(typeof(name)=="undefined" || name == "" || name == "undefined"){
			name="";
		}
		$(".search-key").val(name);

		area = "";
		sortType = "";
		oneName = "";
		twoName = "";
		threeName = "";
		areaName = "";
		var serachUrl = "";
		pams = {};
		url = "getItemList.html?";

		if (typeof(name)!="undefined" && name != "" && name != "undefined") {
			serachUrl = ctx + "/item/getItemList.html?name=" + name;
		} else {
			serachUrl = ctx + "/item/getItemList.html";
		}
		if (href.indexOf('item/getItemList.html') > 0) {
			$(".classify-select").html("");
			$('.area-select').show();
			loadData(pams, getUrl());
		} else {
			window.location.href = serachUrl;
		}
	});
	$('body').on('click', '.oneClass', function() {
		var id = this.id;

		if (href.indexOf('item/getItemList.html') > 0) {
			oneClassify(id);
			loadData(pams, getUrl());
			if (area == "") {
				$('.sltarea').show();
			}
		} else {
			window.location.href = ctx + "/item/getItemList.html?classifyOne=" + id;
		}

	});
	$('body').on('click', '.twoClass', function() {
		var id = this.id;
		if (href.indexOf('item/getItemList.html') > 0) {
			twoClassify(id);
			loadData(pams, getUrl());
			if (area == "") {
				$('.sltarea').show();
			}
		} else {
			window.location.href = ctx + "/item/getItemList.html?classifyTwo=" + id;
		}
	});
	$('body').on('click', '.fourClass', function() {
		area = $(this).attr("citycode");
		var areaname = $(this).text();
		debugger;
		var Provincecode = $(this).attr("citycode");
		var ctype = $(this).attr("ctype");
		var code = $(this).attr("citycode");
		var pcode = $(this).attr("pcode");
		fourClassify(code, pcode, areaname, ctype);
		serviceitemcity(Provincecode, ctype);
		loadData(pams, getUrl());

	});
	$('body').on('click', '.areaClass', function() {
		area = "";
		areaName = "";
		debugger;
		var ctype = $(this).attr("ctype");

		if (ctype == "c") {
			var pcode = $(this).attr("pcode");
			var arrProvince = window.arrProvince;
			for (var i = 0; i < arrProvince.length; i++) {
				if (pcode == arrProvince[i][0]) {
					area = arrProvince[i][0];
					areaName = '<a class=\"areaClass choosetip\"   ctype="p"  href=\"javascript:;\">地区&nbsp;:&nbsp;' + arrProvince[i][2] + '<i class=\"icon icon-greyx\"></i></a>';
					break;
				}
			}

			$('.sltarea').hide();
			$('.itemcity-select').show();
		} else {
			$('.sltarea').show();
			$('.itemcity-select').hide();
		}
		loadData(pams, getUrl());
	});
	$('body').on('click', '.threeClass', function() {
		var id = this.id;
		if (href.indexOf('item/getItemList.html') > 0) {
			threeClassify(id);
			loadData(pams, getUrl());
			if (area == "") {
				$('.sltarea').show();
			}
		} else {
			window.location.href = ctx + "/item/getItemList.html?classifyThree=" + id;
		}
	});

});
//回车事件
function keyPressEvent(name) {
	if (event.keyCode == "13") {
		searchProduct(name);
	}
}

//搜索产品
function searchProduct(searchName) {
  name = searchName;
	area = "";
	sortType = "";
	oneName = "";
	twoName = "";
	threeName = "";
	areaName = "";
	pams = {};
	url = "getItemList.html?";
	var serachUrl = "";
	if (typeof(name) != "undefined" && name != "" && name != "undefined") {
		serachUrl = ctx + "/item/getItemList.html?name=" + name;
	} else {
		serachUrl = ctx + "/item/getItemList.html";
	}

	if (href.indexOf('item/getItemList.html') > 0) {
		$(".classify-select").html("");
		$('.area-select').show();
		loadData(pams, getUrl());
	} else {
		window.location.href = serachUrl;
	}
}

function serviceitemcity(Provincecode, ctype) {
	if (ctype == "c") {
		return;
	}
	var city = window.arrCity;
	if (!city) {
		return;
	}
	var areaStr = '<div class="sub cityarea"><div class="h3"><span style="line-height: 22px;">城市</span></div><div class="add-are clear-float"><div class="threeBox">';
	for (var i = 0; i < city.length; i++) {
		if (Provincecode == city[i][1]) {
			areaStr += '<a href="javascript:;" ctype="c"  pcode ="' + Provincecode + '"  citycode="' + city[i][0] + '"  class="fourClass">' + city[i][2] + '</a>';
		}
	}
	areaStr += '</div></div></div>';
	$('.itemcity-select').html(areaStr);
}

function servicehotArea() {
	var arrHotselect = window.arrHotselect;
	if (!arrHotselect) {
		return;
	}
	var areaStr = '<div class="sub"><div class="h3" style="height:80px"><span style="line-height: 22px;">热门城市</span></div><div class="add-are clear-float"><div class="threeBox">';
	for (var i = 0; i < arrHotselect.length; i++) {
		areaStr += '<a href="javascript:;" ctype="h"  pcode ="' + arrHotselect[i][1] + '"   citycode="' + arrHotselect[i][0] + '"  class="fourClass">' + arrHotselect[i][2] + '</a>';
	}
	areaStr += '</div></div></div>';
	$('.hotcity-select').html(areaStr);
}

function serviceArea() {
	var arrProvince = window.arrProvince;
	if (!arrProvince) {
		return;
	}
	var areaStr = '<div class="sub sltarea"><div class="h3" style="height:80px"><span style="line-height: 22px;">省份</span></div><div class="add-are clear-float"><div class="threeBox">';
	for (var i = 0; i < arrProvince.length; i++) {
		areaStr += '<a href="javascript:;" ctype="p" pcode ="' + arrProvince[i][1] + '"  citycode="' + arrProvince[i][0] + '"  class="fourClass">' + arrProvince[i][2] + '</a>';
	}
	areaStr += '</div></div></div>';
	$('.area-select').html(areaStr);
}

function fourClassify(code, pcode, area, ctype) {
	areaName = '<a class=\"areaClass choosetip\"  pcode ="' + pcode + '" code ="' + code + '"  ctype="' + ctype + '"  href=\"javascript:;\">地区&nbsp;:&nbsp;' + area + '<i class=\"icon icon-greyx\"></i></a>';
	$('.sltarea').hide();
	if (ctype == "h") {
		$(".itemcity-select").hide();
	}
	if (ctype == "p") {
		$(".itemcity-select").show();
	}

}

function oneClassify(id) {
	oneName = "";
	twoName = "";
	threeName = "";
	oneSb = "";
	for (var k = 0; k < classifyArry.length; k++) {
		if (id == classifyArry[k].id) {
			one = classifyArry[k].name;
			oneName = "<a id=" + classifyArry[k].id + " href=\"javascript:;\" style=\"cursor:text;\">" + one + "</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;";
		}
		if (id == classifyArry[k].parentId) {
			oneSb += "<div class=\"sub\">";
			oneSb += "<div class=\"h3\"><a id=" + classifyArry[k].id + " class=\"twoClass choosetip\" href=\"javascript:;\" style=\"color: #424242;\">" + classifyArry[k].name + "<i class=\"icon icon-greyx\"></i></a></div>";
			oneSb += "<div class=\"add-are clear-float\">";
			oneSb += "<div class=\"threeBox\">";
			for (var j = 0; j < classifyArry.length; j++) {
				if (classifyArry[j].parentId == classifyArry[k].id) {
					oneSb += "<a id=" + classifyArry[j].id + " class=\"threeClass choosetip\" href=\"javascript:;\" style=\"color: #424242;\">" + classifyArry[j].name + "<i class=\"icon icon-greyx\"></i></a>";
				}
			}
			oneSb += "</div></div></div>";
		}
	}
	/*	oneSb+=serviceArea();
		$('.sltarea').hide();
		if(area==""){
			$('.sltarea').show();
		}*/
	$(".classify-select").html("");
	$(".classify-select").html(oneSb);
	pams = {
		classifyOne: id
	};
	url = 'getItemList.html?classifyOne=' + id;
}

function twoClassify(id) {
	twoName = "";
	threeName = "";
	twoSb = "";
	for (var k = 0; k < classifyArry.length; k++) {
		if (id == classifyArry[k].id) {
			/*if(oneName!=""){*/
			for (var j = 0; j < classifyArry.length; j++) {
				if (classifyArry[j].id == classifyArry[k].parentId) {
					oneName = "<a id=" + classifyArry[j].id + "href=\"javascript:;\" style=\"cursor:text;\">" + classifyArry[j].name + "</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;";
					twoName = "<a id=" + classifyArry[j].id + " class=\"oneClass choosetip\" href=\"javascript:;\">" + classifyArry[k].name + "<i class=\"icon icon-greyx\"></i></a>";
				}
			}
			/*	}else{
					debugger
					twoName ="&nbsp;&nbsp;&gt;&nbsp;&nbsp;"
			        + "<a id=" + id
			        + " class=\"twoClass choosetip\" href=\"javascript:;\">"
			        + classifyArry[k].name+ "<i class=\"icon icon-greyx\"></i></a>";
				}*/
			twoSb += "<div class=\"sub\">";
			twoSb += "<div class=\"h3\"><a id=" + id + " class=\"twoClass choosetip\" href=\"javascript:;\">" + classifyArry[k].name + "<i class=\"icon icon-greyx\"></i></a></div>";
		}
	}
	twoSb += "<div class=\"add-are clear-float\">";
	twoSb += "<div class=\"threeBox\">";
	for (var i = 0; i < classifyArry.length; i++) {
		if (id == classifyArry[i].parentId) {
			twoSb += "<a id=" + classifyArry[i].id + " class=\"threeClass choosetip\" href=\"javascript:;\">" + classifyArry[i].name + "<i class=\"icon icon-greyx\"></i></a>";
		}
	}
	twoSb += "</div></div></div>";
	/*twoSb+=serviceArea();
	$('.sltarea').hide();
	if(area==""){
		$('.sltarea').show();
	}*/
	$(".classify-select").html("");
	$(".classify-select").html(twoSb);
	pams = {
		classifyTwo: id
	};
	url = 'getItemList.html?classifyTwo=' + id;
}

function threeClassify(id) {
	threeName = "";
	threeSb = "";
	var twoId;
	var two;
	var three;
	for (var i = 0; i < classifyArry.length; i++) {
		if (id == classifyArry[i].id) {
			three = classifyArry[i].name;
			twoId = classifyArry[i].parentId;
			/*threeName = "&nbsp;&nbsp;&gt;&nbsp;&nbsp;"
			        + "<a id="
			        + id
			        + " class=\"threeClass choosetip\" href=\"javascript:;\"  style=\"color: #424242;\">"
			        + three + "<i class=\"icon icon-greyx\"></i></a>";*/
		}
	}
	for (var j = 0; j < classifyArry.length; j++) {
		if (twoId == classifyArry[j].id) {
			two = classifyArry[j].name;
			twoName = "<a id=" + classifyArry[j].parentId + " class=\"oneClass choosetip\" href=\"javascript:;\" style=\"color: #424242;\">" + two + "&nbsp;:&nbsp;" + three + "<i class=\"icon icon-greyx\"></i></a>";
			for (var k = 0; k < classifyArry.length; k++) {
				if (classifyArry[k].id == classifyArry[j].parentId) {
					oneName = "<a id=" + classifyArry[k].id + "href=\"javascript:;\" style=\"cursor:text;\">" + classifyArry[k].name + "</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;";
				}
			}
		}
	}
	$(".classify-select").html("");
	/*	if(area==""){
			$(".classify-select").html(serviceArea());
		}*/
	pams = {
		classifyThree: id
	};
	url = 'getItemList.html?classifyThree=' + id;
}

function loadData(pams, url) {
	history.pushState && history.pushState({
		pams: pams,
		url: url
	}, '', encodeURI(url));
	loadDataAjax(pams);
}

function loadDataAjax(pams) {
	$.ajax({
		async: false,
		url: loadItmsUrl,
		data: pams,
		dataType: "json",
		success: function(data) {

			/*	if(name!=""){
					var typeName="<a id=class=\"typeName\" href=\"javascript:;\">"
				        + name+ "</a>";
					$(".navigation").html(typeName+oneName+twoName+threeName+areaName);
				}else{*/
			$(".navigation").html(oneName + twoName + threeName + areaName);
			/*}*/

			$('.total').html(data.total + '件');
			var pageCon = '';
			pageCon += '<div class="pro-list-sub clear-float">';
			var list = data.records;
			for (var p = 0; p < list.length; p++) {
				pageCon += '<div class="pro-list-sub-div">';
				pageCon += '<div class="pro-list-sub-tit">';
				pageCon += '<div class="pro-list-sub-company float-left">';
				pageCon += '<span class="float-left">服务商：<a href="' + ctx + '/item/getItemById.html?itemId=' + list[p].id + '"  target="_blank">' + list[p].nickName + '</a></span>';
				if (list[p].userType == 4) {
					pageCon += '<p style="margin-left:10px;margin-top:15px"  class="float-left"><img src="' + ctx + '/resources/ezhanlu/images/shop/gold_search.jpg"></p>';
				}
				if (list[p].userType >= 3) {
					/*pageCon+='<p class="ylticon float-left"><img src="'+ctx+'/resources/ezhanlu/images/shop/ylticon.jpg" class="float-left"><span class="float-left">第1年</span></p>';*/
				}
				if (list[p].recommend == 1) {
					pageCon += '<span class="recommend-icon"></span>';
				}
				pageCon += '</div>';
				pageCon += '<div class="pro-list-sub-honor  float-right"><img src="' + ctx + '/resources/ezhanlu/images/icon/diamond.png"></div>';
				pageCon += '</div>';
				pageCon += '<div class="pro-list-sub-div-txt">';
				pageCon += '<div class="pro-list-sub-div-info float-left">';
				pageCon += '<div class="pro-list-sub-div-name">';
				pageCon += '<a href="' + ctx + '/item/getItemById.html?itemId=' + list[p].id + '"  target="_blank">' + list[p].name + '</a>';
				pageCon += '<span>' + list[p].title + '</span>';
				pageCon += '</div>';
				pageCon += '<div class="pro-list-sub-div-items">';
				pageCon += '<span class="items-deal">成交：<b>';
				if (list[p].itemSumCount == "") {
					pageCon += '0';
				} else {
					pageCon += list[p].itemSumCount;
				}
				pageCon += '笔</b></span>';
				pageCon += '<span class="items-eva">评价：<b>' + list[p].itemCommCount + '条</b></span>';
				if (list[p].orderType == '1') {
					pageCon += '<span class="dingjintip">可订金支付</span>';
				}
				pageCon += '<a href="' + ctx + '/item/getItemById.html?itemId=' + list[p].id + '" class="float-right">查看详情&nbsp;></a>';
				pageCon += '</div></div>';
				pageCon += '<div class="pro-list-sub-div-buy float-right">';
				pageCon += '<div class="pro-list-sub-div-price">平台价：<p>¥<span>' + list[p].price.toFixed(2) + '</span></p></div>';
				pageCon += '<div class="pro-list-sub-div-buybtn">';
				if (list[p].status == '3') {
					pageCon += '<a  id="' + list[p].id + '"  href="javascript:;" class="addCarOne">加入购物车</a>';
				} else {
					pageCon += '<a  href="javascript:;" >已下架</a>';
				}
				pageCon += '</div></div></div></div>';
			}
			pageCon += '</div>';
			pageCon += data.pageBar;
			$(".pageCon").html(pageCon);
		}
	});
}

function goOrback(data) {
	if (data.area && data.area != "") {
		areaName = '&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a class=\"areaClass\" href=\"javascript:;\">地区</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp;<a class=\"fourClass\" href=\"javascript:;\">' + data.area + '</a>';
	}
	if (data.name && data.name != "") {
		$(".search-key").val(data.name);
	}
	if (data.classifyOne && data.classifyOne != "") {
		oneClassify(data.classifyOne);
	}
	if (data.classifyTwo && data.classifyTwo != "") {
		twoClassify(data.classifyTwo);
	}
	if (data.classifyThree && data.classifyThree != "") {
		threeClassify(data.classifyThree);
	}
	if (data.sortType && data.sortType != "") {
		$(".select").removeClass("def");
		$('#' + sortType).addClass("def");
	}
}

function toPageAjax(pageNo, uri) {
	var newUrl = getUrl();
	if (pageNo != "") {
		newUrl += '&pageNo=' + pageNo;
	}
	pams.pageNo = pageNo;
	loadData(pams, newUrl);
}

function getUrl() {
	var newUrl = url;
	if (name != "") {
		if (newUrl.split("?")[1] == "") {
			newUrl += 'name=' + name;
		} else {
			newUrl += '&name=' + name;
		}
	}
	if (sortType != "") {
		if (newUrl.split("?")[1] == "") {
			newUrl += 'sortType=' + sortType;
		} else {
			newUrl += '&sortType=' + sortType;
		}

	}
	if (area != "") {
		if (newUrl.split("?")[1] == "") {
			newUrl += 'area=' + area;
		} else {
			newUrl += '&area=' + area;
		}
	}
	if (newUrl.split("?")[1] == "") {
		newUrl = newUrl.replace("?", "");
	}
	pams.area = area;
	pams.name = name;
	pams.sortType = sortType;
	return newUrl;
}

function searchStoreKeyPress(event) {
	if (event.keyCode == '13') {
		searchStore();
	}
}

function searchStore() {
	var name = $(".search-key").val();
	if(name == 'undefined'){
		name='';
	}
	$('#searchelement').val(name);
	$('[name=searchform]').submit();
}
