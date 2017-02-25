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
            <div class="tip">资金转出</div>
            <div class="qa-container">
                <h5 class="show"><span class="down"></span>1. 出金必读</h5>
                <div class="answer answer-show">
                    <table>
                        <tr>
                            <td>（1）&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>转出资金只能回到绑定的银行卡账户，到帐资金也为人民币，使用与入金时相同的固定汇率，不会有汇率波
                                动风险。 <br/><br/></td>
                        </tr>
                        <tr>
                            <td>（2）&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>提出转出资金申请后，最快2个小时（工作日）资金即可到达你的银行账户。<br/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>（3）&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>工作日出金申请时间（9：00—18：00）<br/><br/></td>
                        </tr>
                        <tr>
                            <td>（4）&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>在资金明细中可以查询出金到账情况。<br/><br/></td>
                        </tr>

                    </table>
                </div>
                <h5 class="show"><span class="down"></span>2.出金步骤</h5>
                <div class="answer answer-show">
                    <div class="answer-container">
                        <div class="register-guide gold-out">
                            1.资金转出
                        </div>
                        <div class="register-guide gold-detailout">
                            2.资金明细
                        </div>

                    </div>
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