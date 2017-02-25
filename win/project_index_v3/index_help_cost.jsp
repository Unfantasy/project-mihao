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
            <div class="tip">费用</div>
            <div class="qa-container">
                <h5 class="show"><span class="down"></span>1.费用标准</h5>
                <div class="answer answer-show cost-container">
                    <table>
                        <tr>
                            <td>类型</td>
                            <td>费用</td>
                        </tr>
                        <tr>
                            <td>交易佣金</td>
                            <td>$0.01/股，最低$2.88/单。买卖双向收费</td>
                        </tr>

                    </table>
                </div>

                <h5 class="show"><span class="down"></span>2.其他美股交易平台最低费用对比</h5>
                <div class="answer answer-show cost-container">
                    <table>
                        <tr>
                            <td style="width:11em">众米美股交易</td>
                            <td>$2.88</td>
                        </tr>
                        <tr>
                            <td>老虎证券</td>
                            <td>$2.99</td>
                        </tr>
                        <tr>
                            <td>史考特证券</td>
                            <td>$7</td>
                        </tr>
                        <tr>
                            <td>富途证券</td>
                            <td>$8</td>
                        </tr>
                        <tr>
                            <td>国泰君安证券</td>
                            <td>$20</td>
                        </tr>
                        <tr>
                            <td>中银国际</td>
                            <td>$25</td>
                        </tr>
                    </table>
                </div>
                <h5 class="show"><span class="down"></span>3.示例</h5>
                <div class="answer answer-show">
                    <table>
                        <tr>
                            <td>（1）&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>假设A股票市价$20，交易100股，总成交金额为$2000</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                买入时：$2.88(100股X$0.01/股=$1<$2.88每单最低收费）
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>卖出时：$2.88(100股X$0.01/股=$1<$2.88每单最低收费） <br/><br/></td>
                        </tr>
                        <tr>
                            <td>（2）&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>假设A股票市价$10，交易300股，总成交金额为$3000</td>
                        </tr>

                        <tr>
                            <td></td>
                            <td>买入时：$3（300股X$0.01/股=$3>$2.88每单最低收费）</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>卖出时：$3（300股X$0.01/股=$3>$2.88每单最低收费）</td>
                        </tr>
                    </table>
                </div>

            </div>
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
        $("#help").parent().addClass("active");
    })
</script>
</body>
</html>