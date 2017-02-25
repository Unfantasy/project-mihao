<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>帮助</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="${ctx}/images/zm_log.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx}/css/newmain.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/bootstrap.js"></script>
    <script src="${ctx}/js/register.js"></script>
    <script>
	//判断是否是手机页面
        function isMobile() {
            if((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i)))
                return true;
            else
                return false;
        }
		var docHeight = document.documentElement.clientHeight;
        $(function(){

            //验证
            verify_register_form('.rb');
            //解绑
            //手机号
            $(".rb #mobile").on("propertychange input",function(){
                var phone = $(this).val().NoSpace();
                if(ismobile(phone)){
                    $("#to-phonenum").removeAttr("disabled").removeClass("nm-noactive").addClass("nm-active");
                }else{
                    $("#to-phonenum").attr("disabled","disabled").removeClass("nm-active").addClass("nm-noactive");
                }
            });
            //短信验证码成功后
            $(".rb #phone-verify-code-num").on("propertychange input",function(){
                var num = $(this).val().NoSpace();
                if(isSmsCode(num)){
                    $("#relieve-bind").removeAttr("disabled").removeClass("nm-noactive").addClass("nm-active");
                }else{
                    $("#relieve-bind").attr("disabled","disabled").removeClass("nm-active").addClass("nm-noactive");
                }
            });
			if(isMobile()){
                //解绑
                $("#aw_login>div").css({"height":docHeight/2});
                $(".aw_login > div").height(docHeight-54);
                $(".register_body li p").css({"position":"static"});
                var eleHeight = $(".aw-mod").height();
                $(".aw-mod").css({"position":"absolute","top":docHeight/2+"px","margin-top":-eleHeight/2});
            }
        })

    </script>
</head>
<body>
<%@include file="/header.jsp" %>
<section class="main_page_1 aw_login">
    <div class="container">

        <div class="row rb">
            <div>
                <div class="aw-mod">
                    <div class="aw-mod-body register_body">
                        <form id="register_form" method="post" onsubmit="return false">
                            <ul class="" id="rb">
                                <li class="aw-register-first">
                                    <div class="register_placeholder">手机号</div>
                                    <input class="aw-register-mobile" type="tel" id="mobile"
                                           name="mobile" errortips="请输入11位大陆地区手机号码">
                                </li>
                                <li class="rb_submit"><button id="to-phonenum" onclick="toPhoneNum()" disabled="disabled" class="nm-noactive next">下一步</button></li>

                            </ul>
                            <ul class="hide" id="rb-phone-num">
                                <li class="aw-register-first">
                                    <div class="register_placeholder">手机验证码</div>
                                    <input class="aw-register-mobile" type="text" name="phone-verify-code-num" id="phone-verify-code-num"><div class="seconds">60s</div>
                                </li>
                                <li class="rb_submit"><button id="relieve-bind" onclick="relieveBind()" disabled="disabled" class="nm-noactive next">下一步</button></li>

                            </ul>
                        </form>

                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>