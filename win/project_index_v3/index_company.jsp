<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <title>杭州米号科技有限公司</title>
    <link href="${ctx }/images/zm_log.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="${ctx }/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx }/css/newmain.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx }/js/bootstrap.js"></script>
    <script src="${ctx }/js/newmain.js"></script>
</head>
<body>
<%@include file="header.jsp" %>
<section>
    <div class="container-fluid nm-mycompany-headbg">
        <div class="row text-center">
            <img src="${ctx }/images/gongsi_diyizhang.png" />
        </div>
    </div>
    <div class="container container-c">
        <div class="row nm-mycompany-content">
            <h1>2014年</h1>
            <div class="">
                <p>2014年5月：杭州米号科技有限公司正式成立</p>
                <p>2014年8月：“众米”自选股管家APP版本一正式上线</p>
                <p>2014年11月：增加了投资顾问和信息推送功能</p>
            </div>
        </div>
        <div class="row nm-mycompany-content nm-mycompany-content2">
            <h1>2015年</h1>
            <div class="">
                <p>2015年1月:增加了推送投顾信息卡片功能。</p>
                <p>2015年2月:增加了投顾的后台信息编辑发送等组合功能。</p>
                <p>2015年5月:增加了模拟组合产品的功能。</p>
                <p>2015年7月:成功获得首轮天使融资。</p>
                <p>2015年8月:版本重大更改，软件侧重开发图片分享功能。</p>
                <p>2015年10月:增加了个股信息，公司公告和相关个股查询功能。</p>
                <p>2015年11月:增加了美股行情的实时查看功能。</p>
            </div>
        </div>
        <div class="row nm-mycompany-content" style="margin-top:-150px;margin-bottom:200px;">
            <h1>2016年</h1>
            <div class="">
                <p>2016年2月：增加好友投资信息分享功能，列表和栏目也做了一些调整（2.2.0版本）</p>
                <p>2016年3月：美股交易正式上线，软件在线客服全面开通（2.3.0版本）</p>
                <p>2016年5月：A股美股模拟比赛来了，每周比赛奖金等你拿（2.4.0版本）</p>
            </div>
        </div>
    </div>
    <div class="nm-company-img2"></div>
    <div class="container container-c nm-mycompany-service">
        <div class="row ">
            <img src="${ctx }/images/gongsi_gelan.png"/>
            <h3>服务项目</h3>
        </div>
        <div class="row">
            <p>股票移动应用开发，为用户提供查看股票，寻找潜在投资机会的良好平台。我们推出的各个股票信息榜单，将庞杂的股票信息总结出背后最关键的内容，清晰，简洁的展现给我们的用户。</p>
        </div>
    </div>
    <!--about us-->
    <div class="container-fluid ">
    <div class="row nm-last">
    <div class="col-xs-12 col-md-3 col-sm-3 col-sm-push-8 col-md-push-8 text-center full_v_box"><img src="${ctx }/images/erweima.png" alt="数据" class="nm-content-type middle_box"/>
    </div>
    <div class="col-xs-12 col-md-6 col-sm-6 col-sm-pull-3 col-md-pull-3 full_v_box">
    <div class="middle_box">
    <h4>关于我们</h4>
    <p>众米是由杭州米号科技有限公司于2014年末推出的一款轻量、简洁的自选股管家应用，在版本的开发中，我们深入挖掘用户的需求，着重打造了证券信息传递这一功能。</p><br/>
    <p>产品反馈及讨论QQ群： 419619824</p>
    <p>微信服务号：微信搜索“众米订阅号”</p>
    </div>

    </div>
    </div>
    </div>
    <!--end about us-->
</section>
<footer>
    <div class="container-fluid">
        <div class="row nm-footer">杭州米号科技有限公司版权所有 浙ICP备14016681号 <a href="${ctx }/index_pravicy.jsp">隐私条款</a><br>
            <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010602003615" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;width: auto"><img src="images/beiantubiao.png" style="float:left;"/><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#fff;">浙公网安备 33010602003615号</p></a>
        </div>
    </div>
</footer>
<script type="text/javascript">
    $(function () {
    	$("#company").parent().addClass("active");
	});
 </script>
</body>
</html>