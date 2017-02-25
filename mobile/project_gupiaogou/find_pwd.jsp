<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title>找回密码</title>
    <link href="${ctx }/images/zm_log.ico" rel="shortcut icon"/>
    <link rel="stylesheet" href="${ctx }/css/bootstrap2.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery.form.js"></script>
    <style>
       body, html{
            margin:0;
            padding:0;
            font-family:"Mecrosoft Yahei";
        }
        a:hover{
            text-decoration:none;
        }
        #aw_login>div{
            background-color:#3A3937;
            width:100%;
            height:250px;
            font-size: 20px;
        }
        #aw_login img {
            padding:20px 0 0 20px;
            width:50px;
        }
        #aw_login .aw-tab-right{
            color:#fff;
            line-height: 90px;
            padding:0 20px 0 0;
        }

        .aw-mod-body{
            margin-left: auto;
            margin-right: auto;
            margin-top: -30px;
            width: 90%;
            background-color: #fff;
            border: none;
            padding-left: 15px;
            padding-bottom: 0;
            padding-right: 20px;
            margin-bottom: -10px;
        }
        .aw-mod-body li{
            list-style: none;
        }
        .aw-mod-body input{
            background-color: #F8F8F7;

        }

        /*记住我复选框样式*/
        input[type="checkbox"]{
            display: none;
        }
        .aw-mod-body ul li.last label{
            background:url("images/jizhuwohou.png") no-repeat;
            padding-left:25px;
            background-size:auto 100%;
            font-size:20px;
        }
        /*end 记住我复选框样式*/
        .aw-mod-body ul li.last a{
            font-size:20px;
            color:#f45531;
            cursor:pointer;
        }
        .aw-mod-body ul li.last a:hover{
            color:#f45531;
        }
        body, html {
            margin: 0;
            padding: 0;
            font-family: "Mecrosoft Yahei";
        }

        a:hover, a:active, a:focus {
            text-decoration: none;
        }

        #aw_login > div {
            background-color: #3A3937;
            width: 100%;
            height: 210px;
            font-size: 18px;
        }

        .aw-mod-body {
            margin-left: auto;
            margin-right: auto;
            width: 100%;;
            background-color: #fff;
            border: none;
            margin-top:20px;
        }

        .aw-mod-body li {
            list-style: none;
        }

        .aw-mod-body input {
            background-color: #F8F8F7;
            margin-top: 10px;
        }

        .aw-mod-body ul li input {
            width: 85%;
            height: 50px;
            font-size: 18px;
            padding-left: 18px;
            border-left: 1px solid #EBEBEB;
            -webkit-box-shadow: none -moz-box-shadow : none;
            box-shadow: none;
            border: none;
        }
        .aw-mod-body ul li input:focus{
            outline:none;
            box-shadow: none;
        }
        .aw-mod-body ul li.last a {
            font-size: 18px;
            color: #f45531;
            cursor: pointer;
        }

        .aw-mod-body ul li.last a:hover {
            color: #f45531;
        }

        #register_submit {
            width: 85%;
            height: 50px;
            margin-top: 10px;
            background-color: #f45531;
            background-image: none;
            line-height: 50px;
            color: #fff;
            letter-spacing: 10px;
            font-size: 20px;
            margin-bottom: 60px;
        }

        #vcode {
            width: 46%;
        }

        #btnGetVerifyCode {
            width: 40%;
            height: 58px;
            background-color: #f45531;
            color: #fff;
            margin-bottom: 10px;
            margin-left: -10px;
            padding-left: 10px;
            background-image: none;
        }
         /* 注册提示*/
        .register_body li {
            position: relative;
        }

        .register_body li p {
            text-align: left;
            margin:0;
            padding:0;
        }

        .aw-reg-err {
            line-height: 18px;
            color: #f45531;
        }

        .aw-reg-right {
            background: none;
            border: none;
        }

        .aw-reg-right .i-followed {
            position: relative;
            top: 5px;
        }

        /* 注册提示*/
        .aw-register-agreement-txt {
            max-height: 100px;
            overflow-x: hidden;
            overflow-y: auto;
        }
        .aw-regiter-agreement {
            position: relative;
            padding: 20px 5px 20px 20px;
            background: #DEDEDE;
            border-radius: 10px;
            width: 500px;
            margin: 10px 0 0 -25px;
            font-size: 13px;
            color: #666;
        }
        .last {
            margin-top: 10px;
        }
    </style>
    <script>
    var G_BASE_URL = '${ctx}';
	var DELAY_SECS = 60;
    var ON_ERR = false;
    $(function (){
		verify_register_form('#find_pwd_form');
		if(isMobile() == false){
    		location.href=G_BASE_URL+"/jsp/users/find_pwd.jsp";
    	}
	});
  //判断是否是手机页面
    function isMobile() {
        if((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i)))
            return true;
        else
            return false;

    }
	 var t1=null;
    function getVerifyCode(){
        var mobileValue = $('#mobile').val();
        if(mobileValue){
            $.get(G_BASE_URL + '/users/send_sms', {phone : mobileValue, flag : 0} , function (result) {
                if (result.state == "error"){
                	$("#vcode").parent().find('.aw-reg-tips').detach();
    				$("#vcode").parent().append('<p class="aw-reg-tips aw-reg-err">' + result.msg  + '</p>');
                }
            }, 'json');
           t1 = setInterval("updateVerifyCodeBtn()", 1000);
        }else{
        	
            $('#mobile').find('.aw-reg-tips').detach();
            $('#mobile').append('<p class="aw-reg-tips aw-reg-err">请输入手机号码</p>');
        }
    }

    function updateVerifyCodeBtn(){
        if( DELAY_SECS==0) {
        	clearInterval(t1);
            $('#btnGetVerifyCode').val("获取验证码").removeAttr("disabled");
        }else{
            $('#btnGetVerifyCode').val(DELAY_SECS + "秒后重新获取").attr('disabled',"true");
        }
        DELAY_SECS--;
    }

		function f_save(){
			submitForm();
		}
		function submitForm() {
			var phone = $("#mobile").val();
			var new_pwd = $("#input-password-new").val();
			var vcode = $("#vcode").val();
			var re_new_pwd = $("#input-password-re-new").val();
			$(".error-message").css("display","none")
			if(phone==null||phone==""){
				$("#mobile").parent().find('.aw-reg-tips').detach();
				$("#mobile").parent().append('<p class="aw-reg-tips aw-reg-err">请输入手机号码</p>');
				return false;
			}
			if(vcode==null||vcode==""){
				$("#vcode").parent().find('.aw-reg-tips').detach();
				$("#vcode").parent().append('<p class="aw-reg-tips aw-reg-err">请输入手机验证码</p>');
				return false;
			}
			if(new_pwd==null||new_pwd==""){
				$("#input-password-new").parent().find('.aw-reg-tips').detach();
				$("#input-password-new").parent().append('<p class="aw-reg-tips aw-reg-err">请输入新密码</p>');
				return false;
			}
			if(re_new_pwd==null||re_new_pwd==""){
				$("#input-password-re-new").parent().find('.aw-reg-tips').detach();
				$("#input-password-re-new").parent().append('<p class="aw-reg-tips aw-reg-err">请输入确认新密码</p>');
				return false;
			}
			// jquery 表单提交 
			$("#find_pwd_form").ajaxSubmit({
				type: 'post',
		        dataType: 'json',
				success:function(data){
					if(data.state=="success"){
						location.href="${ctx }/users/login_index";
					}else{
						if(data.msg=="no_user"){
							$("#input-password-new").parent().find('.aw-reg-tips').detach();
							$("#input-password-new").parent().append('<p class="aw-reg-tips aw-reg-err">手机号码未注册</p>');
						}else if(data.msg=="verify_code_not_exits"){
							$("#vcode").parent().find('.aw-reg-tips').detach();
							$("#vcode").parent().append('<p class="aw-reg-tips aw-reg-err">手机验证码错误</p>');
						}else if(data.msg=="valid_code_expires"){
							$("#vcode").parent().find('.aw-reg-tips').detach();
							$("#vcode").parent().append('<p class="aw-reg-tips aw-reg-err">手机验证码过期</p>');
						}else{
							$("#mobile").parent().find('.aw-reg-tips').detach();
							$("#mobile").parent().append('<p class="aw-reg-tips aw-reg-err">'+data.msg+'</p>');
						}
					}
				},error:function(xhr){alert('动态页出错\n\n'+xhr.responseText);}
			}); 
			return false; 
		}
		function verify_register_form(element) {
            $(element).find(':text, :input').on({

                blur: function () {
                    switch ($(this).attr('name')) {
                        case 'vcode' :
                        	var _this = $(this);
                            if($(this).val()==""){
                            	$(this).parent().find('.aw-reg-tips').detach();
                                $(this).parent().append('<p class="aw-reg-tips aw-reg-err">请输入手机验证码</p>');
                            	return;
                            }else {
                                _this.parent().find('.aw-reg-tips').detach();
                                _this.parent().append('<p class="aw-reg-tips aw-reg-right"></p>');
                                $('#btnGetVerifyCode').removeAttr("disabled");
                            }
                            return;
                        case 'mobile' :
                            var _this = $(this);
                            $(this).parent().find('.aw-reg-tips').detach();
                            var mobilereg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
                            if($(this).val()==""){
                            	$(this).parent().find('.aw-reg-tips').detach();
                                $(this).parent().append('<p class="aw-reg-tips aw-reg-err">请输入手机号码</p>');
                            	return;
                            }
                            if (!mobilereg.test($(this).val())) {
                                $(this).parent().find('.aw-reg-tips').detach();
                                $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                                $('#btnGetVerifyCode').attr('disabled', "true");
                                return;
                            }else {
                                $.get(G_BASE_URL + '/users/check_phone?phone=' + $(this).val()+'&flag=1', function (result) {
                                    if (result.success != 0) {
                                        var msg = "";
                                        if (result.success == 1) {
                                            msg = "手机号码未注册";
                                        }
                                        if (result.success == -1) {
                                            msg = "手机号码格式错误";
                                        }
                                        _this.parent().find('.aw-reg-tips').detach();
                                        _this.parent().append('<p class="aw-reg-tips aw-reg-err">' + msg + '</p>');
                                        $('#btnGetVerifyCode').attr('disabled', "true");
                                    }else {
                                        _this.parent().find('.aw-reg-tips').detach();
                                        _this.parent().append('<p class="aw-reg-tips aw-reg-right"></p>');
                                        $('#btnGetVerifyCode').removeAttr("disabled");
                                    }
                                    
                                }, 'json');
                            }
                            return;

                        case 'new_password' :
                            $(this).parent().find('.aw-reg-tips').detach();
                            if ($(this).val().length >= 0 && $(this).val().length < 6) {
                                $(this).parent().find('.aw-reg-tips').detach();
                                $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                                return;
                            }
                            if ($(this).val().length > 17) {
                                $(this).parent().find('.aw-reg-tips').detach();
                                $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                                return;
                            }
                            else {
                                $(this).parent().find('.aw-reg-tips').detach();
                                $(this).parent().append('<p class="aw-reg-tips aw-reg-right"></p>');
                            }
                            return;
                        case 're_new_password' :
                            $(this).parent().find('.aw-reg-tips').detach();
                            if ($(this).val()!=$("#input-password-new").val()) {
                                $(this).parent().find('.aw-reg-tips').detach();
                                $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                                return;
                            }else {
                            	$(this).parent().find('.aw-reg-tips').detach();
                            	$(this).parent().append('<p class="aw-reg-tips aw-reg-right"></p>');
                                $('#btnGetVerifyCode').removeAttr("disabled");
                            }
                            return;

                    }
                }
            });
        }
    </script>
</head>
<body>
<section id="aw_login">
    <div class="container">
        <img src="${ctx }/images/shouye_icon.png"/><a href="${ctx }/users/login_index?mt=mobile" class="pull-right aw-tab-right">登录</a>

        <div class="row">
            <div>
                <div class="aw-mod">
                    <div class="aw-mod-body register_body">
                        <form id="find_pwd_form"  method="post" action="${ctx }/users/find_password"  onsubmit="return false;">
                            <ul>
                                <li class="aw-register-first">
                                    <input class="aw-register-mobile" type="text" placeholder="请输入常用手机号" id="mobile"  name="mobile" errortips="手机号格式不正确">
                                </li>
                                <li>
                                    <input type="text" placeholder="请输入短信验证码" id="vcode" name="vcode">

                                    <input disabled="disabled"  class="btn" type="button" id="btnGetVerifyCode"
                                           value="获取短信验证码" onclick="getVerifyCode();">
                                </li>
                                <li>
                                    <input class="aw-register-pwd" type="password" id="input-password-new" name="new_password" placeholder="请输入6-16位新密码，区分大小写"  errortips="用户名长度不符合" value="">
                                </li>
                                <li>
                                    <input class="aw-register-pwd" type="password" id="input-password-re-new" name="re_new_password" placeholder="请输入确认密码" errortips="新密码与确认密码不同">
                                </li>
                                <li class="register_submit"><a id="register_submit" class=" btn btn-default"  onclick="f_save()">确定</a></li>

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
