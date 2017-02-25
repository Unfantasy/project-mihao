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
            <div class="tip">资金转入</div>
            <div class="qa-container">
                <h5 class="show"><span class="down"></span>1.入金必读</h5>
                <div class="answer answer-show">
                    <table>
                        <tr>
                            <td>（1）&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>绑定本人银行卡后，即可以入金，使用人民币线下入金的方式，将资金汇款至指定的银行账户。 <br/><br/></td>
                        </tr>
                        <tr>
                            <td>（2）&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>
                                人民币入金后的资金相应的会按照固定汇率转换成美元，最快在提交入金通知后2个小时（工作日）到达你
                                的交易账户。<br/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>（3）&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>入金的限制金额为不超过50000美元，超过的部分，会即时返还到你的银行账户中<br/><br/></td>
                        </tr>
                        <tr>
                            <td>（4）&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>入金支持的银行：工商银行、农业银行、中国银行、建设银行、交通银行、邮储银行、光大银行、招商银行、
                                上海银行、北京银行、中信银行、兴业银行、平安银行、广发银行、浦发银行、华夏银行、民生银行、兰州
                                银行。<br/><br/></td>
                        </tr>

                        <tr>
                            <td>（5）&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>通过银行柜台汇款或者网银汇款后，请及时提交入金通知，以便资金可以快速的到达你的交易账户。<br/><br/></td>
                        </tr>
                        <tr>
                            <td>（6）&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>请在汇款备注中填写本人唯一的入金识别码（可在入金提示中获取），保障资金的核对安全无误。</td>
                        </tr>

                    </table>
                </div>
                <h5 class="show"><span class="down"></span>2.入金步骤</h5>
                <div class="answer answer-show">
                    <div class="answer-container">
                        <div class="register-guide gold-in">
                            1.资金转入
                        </div>
                        <div class="register-guide in-tip">
                            2.入金提示
                        </div>
                        <div class="register-guide gold-detailin">
                            3.资金明细
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