<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="imgBase" value="http://mimikj.com:8081/mimikj/images/" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>搜索</title>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="${ctx }/css/swiper-3.3.1.min.css"/>
    <link rel="stylesheet" href="${ctx }/css/usssg.css"/>

    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx }/js/swiper-3.3.1.jquery.min.js"></script>
    <script src="${ctx }/js/usssg.js"></script>
    <script src="${ctx }/js/jquery-autocompleter/jquery.autocomplete.js" type="text/javascript"></script>
    <link href="${ctx }/js/jquery-autocompleter/styles.css" rel="stylesheet" type="text/css"> 
    <script type="text/javascript">
    $(function () {
    $('#trade_search_text').autocomplete({
	       serviceUrl: '${ctx}/stocks/select_list2',
	       paramName: 'searchString',
	        onSelect: function (suggestion) {
	           var symbol = suggestion.data;
	           buy_stock(symbol);
	        }
	    });
    });
    function buy_stock(symbol){
    	$.ajax({
			url : "${ctx }/dv_stock_deal/buy_stock?symbol=" + symbol,
			type : 'post',
			dataType : 'json',
			success : function(data) {
				if(data.state=="success"){
					$.fn.alert({
	                    'tip': '买入成功！',
	                    cancelCallback: function() {
	                        //确定后的操作
	                    	location.href="${ctx}/dv_stock_deal/get_deal_stock_list";
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
					}else if(data.msg=="symbol_is_index"){
						$.fn.alert({tip:'指数不能买入！'});
					}else if(data.msg=="symbol_is_add_blacklist"){
						$.fn.alert({tip:'流动性差的个股不可以买卖，请选择其他个股'});
					}else if(data.msg=="symbol_is_exist"){
						$.fn.alert({tip:'不能同时持有同一只股票！'});
					}else if(data.msg=="same_time_hold_up_to_stocks_5"){
						$.fn.alert({tip:'最多只能同时持有5只个股！'});
					}else if(data.msg=="symbol_is_delisting"){
						$.fn.alert({tip:'该股票已退市不能买入！'});
					}else if(data.msg=="saturday_sundays_cannot_buy"){
						$.fn.alert({tip:'休息日不能买入！'});
					}else if(data.msg=="symbol_is_suspension"){
						$.fn.alert({tip:'该股票已停牌，不能买入！'});
					}else if(data.msg=="symbol_is_aleady_daily_limitn"){
						$.fn.alert({tip:'该股票已涨停，不能买入！'});
					}else{
						$.fn.alert({tip:'买入失败！'});
					}
				}
			}
		});
    }
    </script>
</head>
<body class="usssg_setup">
<section><div class="trade_search_box">
    <input type="text" class="trade_search_text" id="trade_search_text"/><a class="trade_search_btn" href="${ctx }/dv_stock_deal/get_deal_stock_list">&nbsp;&nbsp;&nbsp;返回</a>
</div></section>
</body>
</html>