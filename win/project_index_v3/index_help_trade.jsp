<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>帮助</title>
    <meta name="viewport" content="width=device-width">
    <link href="${ctx}/images/zm_log.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx}/css/newmain.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/bootstrap.js"></script>
    <script src="${ctx}/js/newmain.js"></script>
</head>
<body>
    <%@include file="header.jsp" %>
<section>
    <div class="container nm-help-content">
        <div class="request-answers">
            <div class="tip">交易</div>
            <div class="qa-container">
                <h5 class="show"><span class="down"></span>1.交易时间</h5>
                <div class="answer answer-show">
                    美国东部时间（EDT）：周一至周五9:30～16:00 <br/><br/>
                    美夏令时（4月－11月）：北京时间21:30～4:00 <br/><br/>
                    美冬令时（11月－次年4月）：北京时间22:30～5:00
                </div>

                <h5 class="show"><span class="down"></span>2.下单时间</h5>
                <div class="answer answer-show">
                    现阶段只支持交易时间才能提交委托订单，我们会逐步完善交易，尽快提供24小时的订单委托服务。
                </div>
                <h5 class="show"><span class="down"></span>3.交易订单类型</h5>
                <div class="answer answer-show">
                    <table>
                        <tr>
                            <td style="width:7em;">当日现订单：</td>
                            <td>订单以用户限定的价格或者“更好”的价格成交，订单当日有效，类似于A股的普通下单 <br/><br/></td>
                        </tr>
                        <tr>
                            <td>限时市价单：</td>
                            <td>
                                订单按照买/卖对手方一方的要价成交，订单即时成交有效，不能成交立即撤销委托，类似于A股的扫单功能，可以保证订单成交，但是会一定的成交价格风险。
                            </td>
                        </tr>


                    </table>
                </div>
                <h5 class="show"><span class="down"></span>4.下单交易流程</h5>
                <div class="answer answer-show">
                    <div class="answer-container">
                        <div class="register-guide usstock-trade">
                            1.美股交易（卖出）
                        </div>
                        <div class="register-guide input-price">
                            2.输入价格
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<footer>
    <div class="container-fluid">
        <div class="row nm-footer">杭州米号科技有限公司版权所有 浙ICP备14016681号 <a href="${ctx }/index_pravicy.jsp">隐私条款</a><br>
            <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010602003615" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;width: auto"><img src="images/beiantubiao.png" style="float:left;"/><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#fff;">浙公网安备 33010602003615号</p></a>
        </div>
    </div>
</footer>
<script>
    $(function(){
        $("#help").parent().addClass("active");
    })
</script>
</body>
</html>