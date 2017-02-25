<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="basepath" value="https://www.mihaokj.com" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="${ctx }/images/zm_log.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="${ctx }/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx }/css/newmain.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/jquery.form.js"></script>
    <script src="${ctx}/js/bootstrap.js"></script>
    <script src="${ctx }/js/register.js"></script>
    <script>
        $(function () {
            //登录验证
            verify_register_form('#login_form');
            //全部成功后
            $(document).on("keyup focus","#mobile,#password",function(){
                var phone = $("#mobile").val().NoSpace();
                var password = $("#password").val().NoSpace();
                if(ismobile(phone)&&ispwd(password)){
                    $("#login_submit").removeAttr("disabled").removeClass("nm-noactive").addClass("nm-active");
                }else{
                    $("#login_submit").attr("disabled","disabled").removeClass("nm-active").addClass("nm-noactive");
                }
            });
            if(isMobile()){
                $(".aw_login > div").height(docHeight-54);
                $(".register_body li p").css({"position":"static"});
                $(".aw_login > div").height(docHeight-54);
                var docHeight = document.documentElement.clientHeight;
                var eleHeight = $(".aw-mod").height();


                $(".aw-mod").css({"position":"absolute","top":docHeight/2+"px","margin-top":-eleHeight/2});
            }
        });
        
      //判断是否是手机页面
        function isMobile() {
            if((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i)))
                return true;
            else
                return false;
        }
        function f_save(){
    		submitForm();
    	}
    	function submitForm() { 
    		var username = $("#mobile").val();
    		var pwd = $("#password").val();
    		if(username==null||username==""){
    			alert("请输入手机号码！");
    			return false;
    		}
    		if(pwd==null||pwd==""){
    			alert("请输入密码！");
    			return false;
    		}
    		// jquery 表单提交 
    		$("#login_form").ajaxSubmit({
    			type: 'post',
    	        dataType: 'json',
    			success:function(data){
    				if(data.state=="success"){
    					location.href="${ctx }/user_deal/deal_user_info";
    				}else{
    					alert("登录失败，用户名或密码错误！");
    				}
    			},error:function(xhr){alert('动态页出错\n\n'+xhr.responseText);}
    		}); 
    		return false; 
    	}
    </script>
</head>
<body>
<%@include file="/header.jsp" %>
<section class="main_page_1 aw_login">
    <div class="container">
        <div class="row">
            <div>
                <div class="aw-mod">
                    <div class="aw-mod-body register_body">
                        <form id="login_form" action="${ctx }/user_deal/log_in" method="post" onsubmit="return false">
                            <ul class="">
                                <li class="aw-register-first">
                                    <div class="register_placeholder">手机号</div>
                                    <input class="aw-register-mobile" type="text" id="mobile" name="mobile" errortips="请输入11位大陆地区手机号码">
                                </li>
                                <li>
                                    <div class="register_placeholder">密码</div>
                                    <input class="aw-register-name" type="password" name="password"  errortips="密码限定6—20位数字或字母" id="password" value="">
                                </li>
                                <li>
                                    <button id="login_submit" onclick="f_save()" disabled="disabled" class="nm-noactive">交易帐号登录</button>
                                </li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<input type="hidden" id="captcha_key" name="captcha_key"/>
<input type="hidden" name="auth_code" id="auth_code"/>
<input type="hidden" name="auth_token" id="auth_token" value="web_reg"/>
<input id="client_id" name="client_id" type="hidden" value="2MBy2FRYkaEXBYDYdAljjCbQROudlwDlWrqIQbDZ"/>
<input id="agency" name="agency" type="hidden" value="MI-US-STK"/>
<div id='loading_area' class='loading_area'></div>