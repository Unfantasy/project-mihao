<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>米号科技有限公司</title>
    <link href="images/zm_log.ico" rel="shortcut icon" />
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx}/css/newmain.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/bootstrap.js"></script>
    <script src="${ctx}/js/newmain.js"></script>
</head>
<body>
    <%@include file="header.jsp" %>
<section>
    <div class="container container-c nm-privacy-content">
        <div class="row "><img src="${ctx}/images/yinsi_gelan.png"/><h2>买卖美股&nbsp;投资全球</h2></div>
        <div class="row ">
            <br/>
            <p class="nm-top">1.注册审核：</p>
            <p>&nbsp;&nbsp;&nbsp;10分钟即可完成交易账号的注册以及审核通过，入金后就可下单交易。</p>
            <br/>
            <p class="nm-top">2.资金安全：</p>
            <p>&nbsp;&nbsp;&nbsp;本人银行卡人民币出入金，SIPC最高50万美元资金保险，资金最快2小时到账，固定汇率不用担心波动风险。</p>
            <br/>
            <p class="nm-top">3.交易下单：</p>
            <p>&nbsp;&nbsp;&nbsp;盈透证券交易通道，最低买卖1股，可T+0交易，24小时随时下单，界面交互友好，美股三大交易所个股和基金。</p>
            <br/>
            <p class="nm-top">4.佣金费用：</p>
            <p>&nbsp;&nbsp;&nbsp;无行情使用费，无出入金手续费，无资金汇率转换费，佣金$0.01/股，最低$2.88/单。</p>
            <br/>
            <p class="nm-top">5.海外投资：</p>
            <p>&nbsp;&nbsp;&nbsp;熟知的与A股相关的指数基金和个股，生活中经常接触到的知名公司股票，多个国家的指数基金和商品基金配置全球资产。</p>
            <br/>
            <p class="nm-top">5.合作伙伴：</p>
            <p>&nbsp;&nbsp;&nbsp;交易服务由聚财道（TRUBUZZ Holdings Inc）提供，TRUBUZZ Inc 是美国证劵交易委员会的合规成员（SEC）,接受美国证劵交易委员会（SEC）的监管,
    TRUBUZZ Inc 的服务采用美国盈透证券INTERACTIVE BROKERS的交易通道进行结算与交收.美国盈透证券INTERACTIVE BROKERS 盈透证劵有限公司是纽约证券交易所（NYSE）、金融监管局（FINRA）、证券投资者保护公司（SIPC）成员, 并受美国证劵交易委员会（SEC）和商品期货交易委员会（CFTC）监管。</p>

        </div>
    </div>
</section>
<footer>
    <div class="container-fluid">
        <div class="row nm-footer">杭州米号科技有限公司版权所有 浙ICP备14016681号 <a href="${ctx }/index_pravicy.jsp">隐私条款</a></div>
    </div>
</footer>
<script>
    $(function(){
        $("#help").addClass("active");
    })
</script>
</body>
</html>