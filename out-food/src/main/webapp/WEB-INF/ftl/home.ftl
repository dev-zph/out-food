<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title id="title">一站路</title>  
    <%@ taglib uri="/tags/c" prefix="c"%>
    <%@ include file="common/init.jsp" %>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/home/css/cssreset.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/resources/home/css/index.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/resources/home/css/slides.css">
	<script src="${ctx}/resources/js/jquery-1.10.1.min.js"></script>
</head>
<body ctx="${ctx}">
	<div class="main">
		<%@ include file="common/head.jsp" %>
		<%@ include file="common/head_web.jsp" %>
		<!--菜单 Banner-->
		<%@ include file="common/nav_dd.jsp" %>
		<div class="banner">
			<div class="flexslider">
				<ul class="slides">
					<li style="background:url(${ctx}/resources/home/images/pic/banner_01.jpg) 50% 0 no-repeat;"></li>
					<li style="background:url(${ctx}/resources/home/images/pic/banner_02.jpg) 50% 0 no-repeat;"></li>
					<li style="background:url(${ctx}/resources/home/images/pic/banner_03.jpg) 50% 0 no-repeat;"></li>
					<li style="background:url(${ctx}/resources/home/images/pic/banner_04.jpg) 50% 0 no-repeat;"></li>
				</ul>
			</div>
		</div>
		<div class="sidebar">
			<div class="container">
				<div class="sidebar-left fl">
					<div class="sidebar-left-menu fl">
						<ul>
							<li>
								<i class="icon icon-menu-01"></i>工商/财务/税务
							</li>
							<li>
								<i class="icon icon-menu-02"></i>法律事务
							</li>
							<li>
								<i class="icon icon-menu-03"></i>广告/设计/制作
							</li>
							<li>
								<i class="icon icon-menu-04"></i>IT基础建设
							</li>
							<li>
								<i class="icon icon-menu-05"></i>采购/租赁/维修
							</li>
							<li>
								<i class="icon icon-menu-06"></i>场地/装修
							</li>
							<li>
								<i class="icon icon-menu-07"></i>商标/版权/专利
							</li>
							<li>
								<i class="icon icon-menu-08"></i>认证/检测/报告
							</li>
							<li>
								<i class="icon icon-menu-09"></i>人事/咨询/培训
							</li>
						</ul>
					</div>
					<div class="sidebar-left-sub fl">
						<div class="sub-box">
							<div class="sub-b-tit">
								工商
							</div>
							<div class="sub-b-list">
								 <a href="#">公司代办注册</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">公司名称变更</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">注册资本变更</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">法人变更</a>
								 <a href="#">股权变更</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">年检验资</a>             
							</div>
							<div class="sub-b-tit">
								财务                   
							</div>
							<div class="sub-b-list">
								 <a href="#">代理记账</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">年度审计</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">报表审计</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">资产评估</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
							<div class="sub-b-tit">
								税务                                     
							</div>
							<div class="sub-b-list">
								 <a href="#">税务合规</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">减免税</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">所得税汇算清缴</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">一般纳税人资格</a>
								 <a href="#">其他</a>
							</div>
						</div>
						<div class="sub-box">
							<div class="sub-b-tit">
								法务                      
							</div>
							<div class="sub-b-list">
								 <a href="#">合伙协议</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">合同法务</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">融资法务</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">劳动纠纷</a>
								 <a href="#">合同纠纷</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">法律顾问</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>               
							</div>
						</div>
						<div class="sub-box">
							<div class="sub-b-tit">
								网络营销                      
							</div>
							<div class="sub-b-list" style="height:50px">
								 <a href="#">搜索引擎</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">网盟广告</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">门户广告</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">软文营销</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">移动营销</a>
								 <a href="#">其他</a>             
							</div>
							<div class="sub-b-tit">
								网络营销                   
							</div>
							<div class="sub-b-list"  style="height:50px">
								 <a href="#">天猫全店托管</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">客服外包</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">美工外包</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">直通车托管</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
							<div class="sub-b-tit">
								传统媒体广告                           
   							</div>
							<div class="sub-b-list"  style="height:30px">
								 <a href="#">杂志</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">报纸</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">路牌</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">车体</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">广播</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">电视</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
							<div class="sub-b-tit">
								设计                                           
   							</div>
							<div class="sub-b-list"  style="height:30px">
								 <a href="#">LOGO设计</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">礼品设计</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">视频制作</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">店面设计</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
							<div class="sub-b-tit">
								制作                                                          
   							</div>
							<div class="sub-b-list"  style="height:30px">
								 <a href="#">灯箱/招牌</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">企业画册</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">展架制作</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">户外广告标牌</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
						</div>
						<div class="sub-box">
							<div class="sub-b-tit">
								网络建设                  
							</div>
							<div class="sub-b-list">
								 <a href="#">网站建设</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">微站建设</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">企业邮箱</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">企业OA</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>             
							</div>
							<div class="sub-b-tit">
								通信建设                        
							</div>
							<div class="sub-b-list">
								 <a href="#">办公电话</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">办公宽带</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
						</div>
						<div class="sub-box">
							<div class="sub-b-tit">
								办公采购                               
							</div>
							<div class="sub-b-list">
								 <a href="#">电脑</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">投影仪</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">电话机</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">扫描仪</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">传真机</a> &nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">打印机</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">复印机</a>
								 <a href="#">办公桌</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">办公椅</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">办公茶几</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">办公沙发</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">会议桌</a> &nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">书柜</a> 
								 <a href="#">储物柜</a> &nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>            
							</div>
							<div class="sub-b-tit">
								办公租赁                              
							</div>
							<div class="sub-b-list">
								 <a href="#">花卉租赁</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">办公设备租赁</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
							<div class="sub-b-tit">
								办公维修                              
							</div>
							<div class="sub-b-list">
								 <a href="#">办公设备维修</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
						</div>
						<div class="sub-box">
							<div class="sub-b-tit">
								办公场地                                
							</div>
							<div class="sub-b-list">
								 <a href="#">写字楼</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">园区</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">厂房</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">仓库</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">商住两用</a> &nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">商铺店面</a>&nbsp;&nbsp;|&nbsp;&nbsp;    
							</div>
							<div class="sub-b-tit">
								办公装修                                       
							</div>
							<div class="sub-b-list">
								 <a href="#">公司装修队</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">个人装修队</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
						</div>
						<div class="sub-box">
							<div class="sub-b-tit">
								商标标志                               
							</div>
							<div class="sub-b-list">
								 <a href="#">商标注册</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>  
							</div>
							<div class="sub-b-tit">
								软件版权          
							</div>
							<div class="sub-b-list">
								 <a href="#">软件著作权登记</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">软件登记事项或补充登记</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">版权评估</a>
								 <a href="#">软件著作权变更</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">著作权版本升级</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
							<div class="sub-b-tit">
								专利技术                            
							</div>
							<div class="sub-b-list">
								 <a href="#">发明专利申请</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">外观设计专利申请</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">五年专利独占许可登记</a>
								 <a href="#">专利变更</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">专利评</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
						</div>
						<div class="sub-box">
							<div class="sub-b-tit">
								产品认证                                               
							</div>
							<div class="sub-b-list">
								 <a href="#">3C认证</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">CE认证</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">CB认证</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">FCC认证</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>    
							</div>
							<div class="sub-b-tit">
								检测报告          
							</div>
							<div class="sub-b-list">
								 <a href="#">软件评测报告</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">安全评价报告</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">环境影响评价报告</a>
								 <a href="#">节能评估报告</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">征信报告</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
							<div class="sub-b-tit">
								企业认证                                      
							</div>
							<div class="sub-b-list">
								 <a href="#">ISO9001质量管理认证</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">ISO14001认证</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">ISO13485认可</a>
								 <a href="#">其他</a>
							</div>
						</div>
						<div class="sub-box">
							<div class="sub-b-tit">
								人事代理                                                                   
							</div>
							<div class="sub-b-list">
								 <a href="#">社保代理</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">招聘外包</a>>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">高端猎头</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">商业保险</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">劳务派遣</a>>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>    
							</div>
							<div class="sub-b-tit">
								企业培训                           
							</div>
							<div class="sub-b-list">
								 <a href="#">战略管理</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">市场营销</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">销售管理</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">生产管理</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">财务管理</a>
								 <a href="#">人力资源</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">MBA</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">总裁班</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
							<div class="sub-b-tit">
								企业咨询                                      
							</div>
							<div class="sub-b-list">
								 <a href="#">企业管理咨询</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								 <a href="#">其他</a>
							</div>
						</div>
					</div>
				</div>
				<div class="sidebar-right fr">
					<div class="side-news">
						<div class="side-news-tit">
							公告
						</div>
						<div class="side-news-list">
							<ul>
								<li>
									<a href="#">列表显示信息标题，点击标题便可进入二级页面阅读……</a>
								</li>
								<li>
									<a href="#">列表显示信息标题，点击标题便可进入二级页面阅读……</a>
								</li>
								<li>
									<a href="#">列表显示信息标题，点击标题便可进入二级页面阅读……</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="fast-show">
						<ul>
							<li class="fast-s-01"></li>
							<li class="fast-s-02"></li>
							<li class="fast-s-03"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--菜单 Banner-->
		<div class="gold-provider container">
			<div class="gold-tit">
				精选品牌/金牌服务商
			</div>
			<div class="gold-list">
				<ul>
					<li>
						<div class="gold-l-01">

						</div>
					</li>
					<li>
						<div class="gold-l-02">

						</div>
					</li>
					<li>
						<div class="gold-l-03">

						</div>
					</li>
					<li>
						<div class="gold-l-04">

						</div>
					</li>
					<li>
						<div class="gold-l-05">

						</div>
					</li>
					<li>
						<div class="gold-l-06">

						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="adv container">
			<img src="${ctx}/resources/home/images/pic/ad_01.jpg">
		</div>
		<div  class="recommend container anchorgo">
			<div class="rec-tit">
				<i class="icon icon-star"></i>今日推荐
			</div>
			<div class="rec-list">
				<div class="rec-list-tit fl">
					<img src="${ctx}/resources/home/images/pic/rec_list_zi.jpg">
					<span class="des-txt">
						今日平台推荐的是刚起步的公司或是即将要成立公司的你都要用到的企业服务，小编货比三家后特地精选出了四款商品以助力大家起步和成长。
					</span>
				</div>
				<ul class="fl">
					<li class="red-bg-01">
						<div class="red-show hide">
							<img src="${ctx}/resources/home/images/pic/red_img_01.jpg">
							<span class="red-show-tit">商标注册</span>
							<span class="red-show-des">企业验资，出具验资报告，协助银行开户<br>5-10个工作日完成(仅包含服务费）</span>
							<span class="red-show-price">￥<b>300</b></span>
							<span class="red-show-link"><a href="#">查看详情</a></span>
						</div>
					</li>
					<li class="red-bg-02">
						<div class="red-show hide">
							<img src="${ctx}/resources/home/images/pic/red_img_02.jpg">
							<span class="red-show-tit">验资开户</span>
							<span class="red-show-des">为拥有营业执照的企业或个体<br>工商户提供商标注册服务</span>
							<span class="red-show-price">￥<b>500</b></span>
							<span class="red-show-link"><a href="#">查看详情</a></span>
						</div>
					</li>
					<li class="red-bg-03">
						<div class="red-show hide">
							<img src="${ctx}/resources/home/images/pic/red_img_03.jpg">
							<span class="red-show-tit">工商注册代办</span>
							<span class="red-show-des">为企业提供工商注册一条龙服务</span>
							<span class="red-show-price">￥<b>800</b></span>
							<span class="red-show-link"><a href="#">查看详情</a></span>
						</div>
					</li>
					<li class="red-bg-04">
						<div class="red-show hide">
							<img src="${ctx}/resources/home/images/pic/red_img_04.jpg">
							<span class="red-show-tit">代理记账</span>
							<span class="red-show-des">为企业提供工商注册一条龙服务</span>
							<span class="red-show-price">￥<b>3000</b></span>
							<span class="red-show-link"><a href="#">查看详情</a></span>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<!--商品楼层-->
		<div  class="sort container anchorgo">
			<div class="sort-tit">
				<i class="icon icon-s-01"></i>工商/财务/税务
				<div class="tit-more fr">
					<a href="#">工商注册</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">企业变更</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">代理记账</a><a href="#" class="more">more</a>
				</div>
			</div>
			<div class="sort-list">
				<ul>
					<li>
						<img src="${ctx}/resources/home/img/sort_1_01.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								公司注册
							</div>
							<div class="sort-l-des">
								公司核名，企业工商登记，组织机构代码证办理，税务登记证办理，银行基本户开户
							</div>
							<div class="sort-l-price">
								<span>¥ <b>1000</b></span> <span class="y-price">原价：¥1500</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_1_02.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								代理记账（一般纳税人）<span class="choice-tip">精选</span>
							</div>
							<div class="sort-l-des">
								为您提供一整套的财务服务：制单-审帐-记账-编制财务报表-纳税申报表；有专人负责纳税申报工作
							</div>
							<div class="sort-l-price">
								<span>¥ <b>6288</b></span> <span class="y-price">原价：¥7200</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_1_03.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								企业变更
							</div>
							<div class="sort-l-des">
								公司名称、住所、法定代表人、注册资本、公司组织形式、经营范围、营业期限等姓名或名称变更
							</div>
							<div class="sort-l-price">
								<span>¥ <b>1000</b></span> <span class="y-price">原价：¥1500</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_1_04.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								资产评估<span class="choice-tip">精选</span>
							</div>
							<div class="sort-l-des">
								为有限责任公司，集团公司，民营企业，合资、外资企业提供资产评估业务，出具评估报告
							</div>
							<div class="sort-l-price">
								<span>¥ <b>1500</b></span> <span class="y-price">原价：¥1700</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
				</ul>
			</div>
		</div>
		<div  class="sort container anchorgo">
			<div class="sort-tit">
				<i class="icon icon-s-02"></i>人事/咨询/培训
				<div class="tit-more fr">
					<a href="#">企业咨询</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">企业培训</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">人事代理</a><a href="#" class="more">more</a>
				</div>
			</div>
			<div class="sort-list">
				<ul>
					<li>
						<img src="${ctx}/resources/home/img/sort_2_01.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								人事代理（每人每月）
							</div>
							<div class="sort-l-des">
								提供企业社保、公积金账户管理、工伤 、医疗申报、社保人事代理
							</div>
							<div class="sort-l-price">
								<span>¥ <b>300</b></span> <span class="y-price">原价：¥800</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_2_01.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								劳务派遣（每人每月）
							</div>
							<div class="sort-l-des">
								提供事务服务、社保服务、代发工资、质量监控、企业突发事件管理
							</div>
							<div class="sort-l-price">
								<span>¥ <b>28.8</b></span> <span class="y-price">原价：¥100</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_2_02.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								企业咨询<span class="choice-tip">精选</span>
							</div>
							<div class="sort-l-des">
								提供能力模型构建、能力现状诊断、培养方案设计、培养机制构建、个人辅导机制、团队机制分享等服务
							</div>
							<div class="sort-l-price">
								<span>¥ <b>8500</b></span> <span class="y-price">原价：¥10000</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_2_02.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								PDP人才测评
							</div>
							<div class="sort-l-des">
								PDP能广泛运用于招聘选才、组织调整、领导力开发、有效沟通、组织人力资源诊断等方面
							</div>
							<div class="sort-l-price">
								<span>¥ <b>8500</b></span> <span class="y-price">原价：¥10000</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
				</ul>
			</div>
		</div>
		<div  class="sort container anchorgo">
			<div class="sort-tit">
				<i class="icon icon-s-03"></i>广告/设计/制作
				<div class="tit-more fr">
					<a href="#">传统媒体广告</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">VI设计</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">户外广告</a><a href="#" class="more">more</a>
				</div>
			</div>
			<div class="sort-list">
				<ul>
					<li>
						<img src="${ctx}/resources/home/img/sort_3_01.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								视觉识别系统（基础型）<span class="choice-tip">精选</span>
							</div>
							<div class="sort-l-des">
								提供LOGO设计、创意说明、多项基础、多项应用、多种格式源文件、LOGO应用效果展示
							</div>
							<div class="sort-l-price">
								<span>¥ <b>12000</b></span> <span class="y-price">原价：¥18000</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_3_01.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								LOGO设计（普及型）
							</div>
							<div class="sort-l-des">
								提供创意说明，标准色，标准字,名片/工作证/PPT模板/word模板/LOGO效果展示
							</div>
							<div class="sort-l-price">
								<span>¥ <b>5000</b></span> <span class="y-price">原价：¥10000</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_3_02.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								铁皮烤漆吸塑发光字（每平米）<span class="choice-tip">精选</span>
							</div>
							<div class="sort-l-des">
								为房产、商场、酒店、写字楼、实体门市部提供铁皮烤漆吸塑发光字的激光切割、机器开槽制作等服务
							</div>
							<div class="sort-l-price">
								<span>¥ <b>680</b></span> <span class="y-price">原价：¥750</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_3_02.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								背面水晶板背发光字（50公分以下）
							</div>
							<div class="sort-l-des">
								为房产、商场、酒店、写字楼、实体门市部提供背面水晶版背发光字的激光切割、机器开槽制作等服务
							</div>
							<div class="sort-l-price">
								<span>¥ <b>1050</b></span> <span class="y-price">原价：¥1200</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
				</ul>
			</div>
		</div>
		<div  class="sort container anchorgo">
			<div class="sort-tit">
				<i class="icon icon-s-04"></i>采购/租赁/维修
				<div class="tit-more fr">
					<a href="#">办公采购</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">办公租赁</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">办公维修</a><a href="#" class="more">more</a>
				</div>
			</div>
			<div class="sort-list">
				<ul>
					<li>
						<img src="${ctx}/resources/home/img/sort_4_01.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								彩色多功能数码机租赁（每月）
							</div>
							<div class="sort-l-des">
								租期三年起，每月限定4000张印量，超印0.6元/张租金一年一付，超印一季度一付
							</div>
							<div class="sort-l-price">
								<span>¥ <b>2500</b></span> <span class="y-price">原价：¥2700</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_4_02.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								上门专业打印机维修<span class="choice-tip">精选</span>
							</div>
							<div class="sort-l-des">
								上门维修打印机，如卡纸，不进纸，无法打印，打印效果不好等（不含配件费用）
							</div>
							<div class="sort-l-price">
								<span>¥ <b>80</b></span> <span class="y-price">原价：¥100</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_4_03.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								奥图码商务机-OTS466<span class="choice-tip">精选</span>
							</div>
							<div class="sort-l-des">
								采用德州仪器DLP®技术/最新一代SVGA DMD芯片分辨率800×600，PC信号1600×1200 60Hz
							</div>
							<div class="sort-l-price">
								<span>¥ <b>2700</b></span> <span class="y-price">原价：¥3000</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_4_04.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								黑白打印复印机租赁（全新/每月）
							</div>
							<div class="sort-l-des">
								提供复印机租赁、本机维修、配件墨粉更换，上门安装等服务（仅纸张费用由客户自行承担）
							</div>
							<div class="sort-l-price">
								<span>¥ <b>400</b></span> <span class="y-price">原价：¥500</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
				</ul>
			</div>
		</div>
		<div  class="sort container anchorgo">
			<div class="sort-tit"> 
				<i class="icon icon-s-05"></i>场地/装修      
				<div class="tit-more fr">
					<a href="#">办公采购</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">办公场地</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">办公装修</a><a href="#" class="more">more</a>
				</div>
			</div>
			<div class="sort-list">
				<ul>
					<li>
						<img src="${ctx}/resources/home/img/sort_5_01.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								店面/办公室装修（每平米）
							</div>
							<div class="sort-l-des">
								提供方案设计、施工设计、装修施工，并提供水电、泥工、木工、油漆、安装、清洁、售后服务等
							</div>
							<div class="sort-l-price">
								<span>¥ <b>120</b></span> <span class="y-price">原价：¥150</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_5_01.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								施工设计（每平米）
							</div>
							<div class="sort-l-des">
								提供方案设计、工程预算、施工图纸以及效果图制作
							</div>
							<div class="sort-l-price">
								<span>¥ <b>80</b></span> <span class="y-price">原价：¥100</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_5_02.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								高管区空间规划设计<span class="choice-tip">精选</span>
							</div>
							<div class="sort-l-des">
								提供高管区空间规划免费设计（后续装修施工服务费用需致电详谈）
							</div>
							<div class="sort-l-price">
								<span>¥ <b>1</b></span> <span class="y-price">原价：¥2000</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
					<li>
						<img src="${ctx}/resources/home/img/sort_5_02.jpg">
						<div class="sort-border">
							<div class="sort-l-tit">
								员工区空间规划<span class="choice-tip">精选</span>
							</div>
							<div class="sort-l-des">
								提供员工区空间规划免费设计（后续装修施工服务费用需致电详谈）
							</div>
							<div class="sort-l-price">
								<span>¥ <b>1</b></span> <span class="y-price">原价：¥2000</span>
							</div>
							<div class="sort-l-btn fr">
								<a href="#">查看详情</a>
							</div>
						</div>		
					</li>
				</ul>
			</div>
		</div>
		
		<div class="footer">
			<div class="container">
				<ul class="advantage">
					<li>
						<i class="icon icon-service"></i>
						<span>
							<b>阳光服务</b>
							<p>种类齐全，一站服务</p>
						</span>
					</li>
					<li>
						<i class="icon icon-price"></i>
						<span>
							<b>阳光价格</b>
							<p>性价比高，实惠省心</p>
						</span>
					</li>
					<li>
						<i class="icon icon-ensure"></i>
						<span>
							<b>阳光保障</b>
							<p>严格筛选，实地认证</p>
						</span>
					</li>
					<li style="border-right:0">
						<i class="icon icon-open"></i>
						<span>
							<b>阳光透明</b>
							<p>流程清晰，明明白白</p>
						</span>
					</li>
				</ul>
				<div class="about">
					<div class="about-tel fl">
						<p>1站路客服热线：</p>
						<p class="tel">400-990-2133</p>
						<p class="time">周一至周日：08:00-24:00</p>
						<p class="mail">客服邮箱：kefu@ezhanlu.com</p>
					</div>
					<div class="about-info fl">
						<ul>
							<li class="about-tit">
								关于我们
							</li>
							<li>
								<a href="#">关于1站路</a>
							</li>
							<li>
								<a href="#">联系我们</a>
							</li>
							<li>
								<a href="#">加入1站路</a>
							</li>
							<li>
								<a href="#">媒体报道</a>
							</li>
						</ul>
						<ul>
							<li class="about-tit">
								购买指南
							</li>
							<li>
								<a href="#">购买流程</a>
							</li>
							<li>
								<a href="#">服务保障</a>
							</li>
							<li>
								<a href="#">免费注册</a>
							</li>
							<li>
								<a href="#">帮助中心</a>
							</li>
						</ul>
						<ul>
							<li class="about-tit">
								商家服务
							</li>
							<li>
								<a href="#">商家入驻</a>
							</li>
							<li>
								<a href="#">运营服务</a>
							</li>
							<li>
								<a href="#">招商标准</a>
							</li>
							<li>
								<a href="#">1站路规则</a>
							</li>
						</ul>
					</div>
					<div class="about-code fl">
						<div class="code-wx">
							<img src="${ctx}/resources/home/images/pic/code_wx.jpg" width="146" height="146">
							<i class="icon icon-wx"></i>官方服务号
						</div>
						<div class="code-app">
							<img src="${ctx}/resources/home/images/pic/code_app.jpg" width="146" height="146">
							<i class="icon icon-app"></i>扫描下载APP
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright">
			<div class="container">
				<div class="copyright-l fl">
					<p>增值电信业务经营许可证：浙B2-20150116   备案号：浙ICP备15004644号-2  </p>
					<p><span>&copy;</span>2015 ezhanlu.com&nbsp;版权所有：城云科技（杭州）有限公司 & 杭州云际视界科技有限公司    </p>
				</div>
				<div class="copyright-r fl">
					<img src="${ctx}/resources/home/images/pic/copyright_img_01.jpg" width="94" height="36">
					<img src="${ctx}/resources/home/images/pic/copyright_img_02.jpg" width="94" height="36">
					<img src="${ctx}/resources/home/images/pic/copyright_img_03.jpg" width="94" height="36">
				</div>
			</div>
		</div>
	</div>
	<div class="anchor">
		<a href="javascript:;" class="anchor-01">
		</a>
		<a href="javascript:;" class="anchor-02">
		</a>
		<a href="javascript:;" class="anchor-03">
		</a>
		<a href="javascript:;" class="anchor-04">
		</a>
		<a href="javascript:;" class="anchor-05">
		</a>
		<a href="javascript:;" class="anchor-06">
		</a>
	</div>
	<div class="gotop">
		<img src="${ctx}/resources/home/images/btn/gotop.png">
	</div>
</body>
<script type="text/javascript">
//查询商品列表
$('body').on('click','.threeClass',function(){
	var id = this.id;
	$("<form action=\"${ctx}/item/getItemList.html\" method=\"post\" id=\"actionForm\" target=\"_self\"><input type=\"hidden\" id=\"classifyThree\" name=\"classifyThree\" value=\""+id+"\"/> </form>").appendTo("body");
	$("#actionForm").submit();
});
$('body').on('click','.oneClass',function(){
	var id = this.id;
	$("<form action=\"${ctx}/item/getItemList.html\" method=\"post\" id=\"actionForm\" target=\"_self\"><input type=\"hidden\" id=\"classifyOne\" name=\"classifyOne\" value=\""+id+"\"/> </form>").appendTo("body");
	$("#actionForm").submit();
});
$('body').on('click','.twoClass',function(){
	var id = this.id;
	$("<form action=\"${ctx}/item/getItemList.html\" method=\"post\" id=\"actionForm\" target=\"_self\"><input type=\"hidden\" id=\"classifyTwo\" name=\"classifyTwo\" value=\""+id+"\"/> </form>").appendTo("body");
	$("#actionForm").submit();
});
$(".search-btn").click(function(){
	var key = $(".search-key").val();
	window.location.href = "${ctx}/item/getItemList.html?itemName="+key;
});
$(".hot-search").click(function(){
	var key = $(this).text();
	window.location.href = "${ctx}/item/getItemList.html?itemName="+key;
});
</script>
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/home/js/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="${ctx}/resources/home/js/index.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.flexslider').flexslider({
			directionNav: true,
			pauseOnAction: false
		});
	});
</script>
</html>
</html>