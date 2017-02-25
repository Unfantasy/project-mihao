<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="imgBase" value="http://mimikj.com:8081/mimikj/images/" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的交易</title>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="${ctx }/css/swiper-3.3.1.min.css"/>
    <link rel="stylesheet" href="${ctx }/css/usssg.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx }/js/swiper-3.3.1.jquery.min.js"></script>
    <script src="${ctx }/js/usssg.js"></script>
    <script>
        function toSearch(){
            location.href = '${ctx}/jsp/dv_stock_deal/index_dv_deal_search_stock.jsp';
        }
        function sell_stock(symbol){
        	$.ajax({
    			url : "${ctx }/dv_stock_deal/sell_stock?symbol=" + symbol,
    			type : 'post',
    			dataType : 'json',
    			success : function(data) {
    				if(data.state=="success"){
    					$.fn.alert({
		                    'tip': '卖出成功！',
		                    cancelCallback: function() {
		                        //确定后的操作
		                    	location.reload();
		                    }
		                });
    				}else{
    					if(data.msg=="no_login"){
    						$.fn.alert({
    		                    'tip': '页面超时，请重新登录！',
    		                    cancelCallback: function() {
    		                        //确定后的操作
    		                    	location.href="${ctx}/dv_stock_deal/get_deal_ranking";
    		                    }
    		                });
    					}else if(data.msg=="the_stock_is_already_sell_or_entrust"){
    						$.fn.alert({tip:'该股票已经委托或卖出！'});
    					}else if(data.msg=="a_share_is_t+1_model"){
    						$.fn.alert({tip:'A股采用T+1模式，次日才能卖出！'});
    					}else if(data.msg=="us_stock_is_t+0_model_sellcount10"){
    						$.fn.alert({tip:'美股T+0模式当天买卖交易次数不得大于10次！'});
    					}else {
    						$.fn.alert({tip:'"卖出失败！'});
    					}
    				}
    			}
    		});
        }
        function rescind_entrust(symbol){
        	$.ajax({
    			url : "${ctx }/dv_stock_deal/rescind_entrust?symbol=" + symbol,
    			type : 'post',
    			dataType : 'json',
    			success : function(data) {
    				if(data.state=="success"){
    						$.fn.alert({
    		                    'tip': '撤单成功！',
    		                    cancelCallback: function() {
    		                        //确定后的操作
    		                    	location.reload();
    		                    }
    		                });
    				}else{
    					if(data.msg=="no_login"){
    						$.fn.alert({
    		                    'tip': '页面超时，请重新登录！',
    		                    cancelCallback: function() {
    		                        //确定后的操作
    		                    	location.href="${ctx}/dv_stock_deal/get_deal_ranking";
    		                    }
    		                });
    					}else 
    					$.fn.alert({tip:'撤单失败！'});
    				}
    			}
        	});
        }
    </script>
</head>
<body class="usssg_my_trade">
<div class="usssg_my_trade_bg"></div>
<header >持仓<!--<a href="${ctx }/dv_deal_setting/get_deal_setting_info" class="setup"></a>--></header>
<section>

    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <div class="now_yield">
                    <p >${deal_info.total_yield_rate }%</p>
                    <p>已实现收益率</p>
                </div>
                <div class="stocks">
                    <div class="stocks_title"><span>名称代码</span><span>买入价</span><span>收益率</span></div>
                    <ul class="stocks_list">
                    <c:forEach var="buy" items="${deal_info.buy_list }">
                    	<li class="stock" >
                            <div onclick="view_remind();">
                                <span>
                                    <p class="stock_name">${buy.stock_name }</p>
                                    <p class="stock_num">${buy.symbol }</p>
                                </span>
                                <span class="num">${buy.buy_price }</span>
                                <span class="num">${buy.yield_rate }%</span>
                            </div>
                            <p><button class="sale" onclick="sell_stock('${buy.symbol}');">卖出</button></p>
                        </li>
                    </c:forEach>
                    </ul>
                    <p class="tip">最多同时持有5只个股</p>
                </div>

            </div>
            <div class="swiper-slide">
                <div class="now_yield">
                    <p>${deal_info.total_yield_rate }%</p>
                    <p>已实现收益率</p>
                </div>
                <div class="stocks">
                    <div class="stocks_title"><span>名称代码</span><span>买入价</span><span>卖出价</span></div>
                    <ul class="stocks_list">
                    <c:forEach var="stock" items="${deal_info.stocklist }">
                    	<li class="stock" >
                            <div onclick="view_remind();">
                                <span>
                                    <p class="stock_name">${stock.stock_name }</p>
                                    <p class="stock_num">${stock.symbol }</p>
                                </span>
                                <span>
                                    <p class="num">${stock.buy_price }</p>
                                    <p>${stock.buy_time }</p>
                                </span>
                                <span>
                                    <p class="num_sale">${stock.sell_price }</p>
                                    <p>${stock.sell_time }</p>
                                </span>
                            </div>
                            <c:choose>
                            	<c:when test="${stock.deal_flag=='2' or stock.deal_flag=='3' }">
                            	<p class="cancel">委托中<button onclick="rescind_entrust('${stock.symbol}');">撤销</button></p>
                            	</c:when>
                            	<c:otherwise>
                            	<p>收益率： <span class="num">${stock.yield_rate }%</span></p>
                            	</c:otherwise>
                            </c:choose>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="swiper-pagination"></div>
    </div>
    <div class="fixed_buy" onclick="toSearch()">买入</div>


    <script>
    var num = $('.swiper-slide').eq(0).find('.now_yield p:nth-child(1)').text();
    if(num.indexOf('-')!=-1){
        $(".usssg_my_trade_bg").addClass("bgdown").removeClass('bgup');
    }else{
        $(".usssg_my_trade_bg").addClass("bgup").removeClass('bgdown');
    }
    var swiper = new Swiper(".swiper-container",{
        pagination:".swiper-pagination",
        autoHeight: true,
        resistanceRatio : 0,
        onSlideChangeEnd : function(){
            var index = swiper.activeIndex;
            var positionHtml =  '持仓';//'持仓<a href="${ctx }/dv_deal_setting/get_deal_setting_info" class="setup"></a>';
            var transactionRecoidHtml = '交易记录'; //'交易记录<a href="${ctx }/dv_deal_setting/get_deal_setting_info" class="setup"></a>';
            if(index==0){
                $('header').html(positionHtml);
                $(".fixed_buy").removeAttr("hidden");
            }else if(index==1){
                $(".fixed_buy").attr("hidden","hidden");
                $('header').html(transactionRecoidHtml);
            }
            var num = $('.swiper-slide').eq(index).find('.now_yield p:nth-child(1)').text();
            if(num.indexOf('-')!=-1){
                $(".usssg_my_trade_bg").addClass("bgdown").removeClass('bgup');
            }else{
                $(".usssg_my_trade_bg").addClass("bgup").removeClass('bgdown');
            }
        }
    });
    </script>
</section>
</body>
</html>