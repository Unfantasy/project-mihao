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
            <div class="tip">注册</div>
            <div class="qa-container">
                <h5 class="show"><span class="down"></span>1.需要哪些准备？</h5>
                <div class="answer answer-show">
                    <table>
                        <tr>
                            <td style="min-width:6em">【手机】 <br/><br/></td>
                            <td>本人手机用于注册登录账号和获取短信验证码</td>
                        </tr>
                        <tr>
                            <td>【身份证】<br/><br/></td>
                            <td>本人身份证件，需要提供姓名和身份证号码进行身份验证</td>
                        </tr>
                        <tr>
                            <td>【银行卡】<br/><br/></td>
                            <td>必须与身份证同一人的银行卡，输入卡号和开户行，进行银行卡绑定，作为用户资金转入和转出的唯一账户</td>
                        </tr>
                    </table>
                </div>

                <h5 class="show"><span class="down"></span>2.注册步骤</h5>
                <div class="answer answer-show">
                    <div class="answer-container">
                        <div class="register-guide register-login">
                            1.注册登录
                        </div>
                        <div class="register-guide register-phone">
                            2.输入手机号注册
                        </div>
                        <div class="register-guide set-pwd">
                            3.设置密码
                        </div>
                        <div class="register-guide img-code">
                            4.输入图像验证码
                        </div>
                        <div class="register-guide verify-code">
                            5.输入验证码
                        </div>
                        <div class="register-guide identity-verify">
                            6.身份验证
                        </div>
                        <div class="register-guide bind-bank">
                            7.绑定银行卡
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