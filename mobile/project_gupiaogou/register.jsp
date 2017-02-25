<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>注册</title>
    <link href="${ctx }/images/zm_log.ico" rel="shortcut icon"/>
    <link rel="stylesheet" href="${ctx }/css/bootstrap2.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery.form.js"></script>
    <style>
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
            margin-bottom: 500px;
        }

        #aw_login img {
            padding: 25px 0 0 50px;
        }

        .aw-mod-body {
            margin-left: auto;
            margin-right: auto;
            width: 500px;
            background-color: #fff;
            border: none;
            box-shadow: 0 0 3px 1px #999;
            margin-bottom: 180px;
            margin-top:20px;
        }

        .aw-mod-body li {
            list-style: none;
        }

        .aw-mod-body input {
            background-color: #F8F8F7;
            margin-top: 10px;
        }

        #mobile {
            margin-top: 58px;
        }

        ul {
            margin-left: 40px;
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

        /*记住我复选框样式*/
        input[type="checkbox"] {
            display: none;
        }

        .aw-mod-body ul li.last label {
            background: url("${ctx}/images/jizhuwohou.png") no-repeat;
            padding-left: 25px;
            background-size: auto 100%;
            font-size: 20px;
        }

        /*end 记住我复选框样式*/
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
            width: 180px;
            height: 58px;
            background-color: #f45531;
            color: #fff;
            margin-bottom: 10px;
            margin-left: -10px;
            cursor: pointer;
            background-image: none;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
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
    	$('label').click(function () {
    		if($("#register_checkbox").is(':checked')==false){
    			 $(this).css("background-image", 'url("${ctx}/images/jizhuwohou.png")');
    			 $("#register_submit").removeAttr("disabled");
			}else{
				$(this).css("background-image", 'url("${ctx}/images/jizhuwoqian.png")');
				 $("#register_submit").attr("disabled","true");
			}
        });
		verify_register_form('#register_form');
		if(isMobile() == true){
    		location.href="${ctx }/jsp/mobile/users/register.jsp";
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
            $.get(G_BASE_URL + '/users/send_sms', {phone : mobileValue, flag : 1} , function (result) {
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
			var pwd = $("#password").val();
			var vcode = $("#vcode").val();
			var username = $("#user_name").val();
			$(".error-message").css("display","none")
			if(phone==null||phone==""){
				$("#mobile").parent().find('.aw-reg-tips').detach();
				$("#mobile").parent().append('<p class="aw-reg-tips aw-reg-err">请输入手机号码</p>');
				return false;
			}
			if(username==null||username==""){
				$("#user_name").parent().find('.aw-reg-tips').detach();
				$("#user_name").parent().append('<p class="aw-reg-tips aw-reg-err">请输入用户昵称</p>');
				return false;
			}
			if(pwd==null||pwd==""){
				$("#password").parent().find('.aw-reg-tips').detach();
				$("#password").parent().append('<p class="aw-reg-tips aw-reg-err">请输入登录密码</p>');
				return false;
			}
			if(vcode==null||vcode==""){
				$("#vcode").parent().find('.aw-reg-tips').detach();
				$("#vcode").parent().append('<p class="aw-reg-tips aw-reg-err">请输入手机验证码</p>');
				return false;
			}
			// jquery 表单提交 
			$("#register_form").ajaxSubmit({
				type: 'post',
		        dataType: 'json',
				success:function(data){
					if(data.state=="success"){
						location.href="${ctx }/users/login_index";
					}else{
						if(data.msg=="verify_code_not_exits"){
							$("#vcode").parent().find('.aw-reg-tips').detach();
							$("#vcode").parent().append('<p class="aw-reg-tips aw-reg-err">手机验证码错误</p>');
						}else if(data.msg=="valid_code_expires"){
							$("#vcode").parent().find('.aw-reg-tips').detach();
							$("#vcode").parent().append('<p class="aw-reg-tips aw-reg-err">手机验证码过期</p>');
						}else if(data.msg=="nickname_is_error"){
							$("#user_name").parent().find('.aw-reg-tips').detach();
							$("#user_name").parent().append('<p class="aw-reg-tips aw-reg-err">用户名不合法</p>');
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
                        case 'user_name' :
                            var _this = $(this);
                            $(this).parent().find('.aw-reg-tips').detach();
                            if ($(this).val().length >= 0 && $(this).val().length < 3) {
                                $(this).parent().find('.aw-reg-tips').detach();
                                $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                                return;
                            }
                            if ($(this).val().length > 20) {
                                $(this).parent().find('.aw-reg-tips').detach();
                                $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                                return;
                            }
                            else {
                                $.get(G_BASE_URL + '/users/check_username?username=' + $(this).val(), function (result) {
                                    var msg = "";
                                    if (result.success == 1) {
                                        msg = "用户名已存在";
                                    }
                                    if (result.success == -1) {
                                        msg = "用户名为空";
                                    }
                                    if (result.success == -2) {
                                        msg = "用户名不合法";
                                    }
                                    if (result.success != 0) {
                                        _this.parent().find('.aw-reg-tips').detach();
                                        _this.parent().append('<p class="aw-reg-tips aw-reg-err">' + msg + '</p>');
                                    }
                                    else {
                                        _this.parent().find('.aw-reg-tips').detach();
                                        _this.parent().append('<p class="aw-reg-tips aw-reg-right"></p>');
                                    }
                                }, 'json');
                            }
                            return;

                        case 'email' :
                            $(this).parent().find('.aw-reg-tips').detach();
                            var emailreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                            if (!emailreg.test($(this).val())) {
                                $(this).parent().find('.aw-reg-tips').detach();
                                $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                                return;
                            }
                            else {
                                _this.parent().find('.aw-reg-tips').detach();
                                _this.parent().append('<p class="aw-reg-tips aw-reg-right"></p>');
                            }
                            return;
                        case 'vcode' :
                        	var _this = $(this);
                            if($(this).val()==""){
                            	$(this).parent().find('.aw-reg-tips').detach();
                                $(this).parent().append('<p class="aw-reg-tips aw-reg-err">请输入手机验证码</p>');
                            	return;
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
                                $.get(G_BASE_URL + '/users/check_phone?phone=' + $(this).val(), function (result) {
                                    if (result.success != 0) {
                                        var msg = "";
                                        if (result.success == 1) {
                                            msg = "手机号码已注册";
                                        }
                                        if (result.success == -1) {
                                            msg = "手机号码格式错误";
                                        }
                                        _this.parent().find('.aw-reg-tips').detach();
                                        _this.parent().append('<p class="aw-reg-tips aw-reg-err">' + msg + '</p>');
                                        $('#btnGetVerifyCode').attr('disabled', "true");
                                    }
                                    else {
                                        _this.parent().find('.aw-reg-tips').detach();
                                        _this.parent().append('<p class="aw-reg-tips aw-reg-right"></p>');
                                        $('#btnGetVerifyCode').removeAttr("disabled");
                                    }
                                }, 'json');
                            }
                            return;

                        case 'password' :
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

                    }
                }
            });
        }
    </script>
</head>
<body>
<section id="aw_login">
    <div class="container">
        <img src="${ctx }/images/shouye_icon.png" alt=""/>

        <div class="row">

            <div>
                <div class="aw-mod">
                    <div class="aw-mod-body register_body">
                        <form id="register_form"  method="post" action="${ctx }/users/sign_up"  onsubmit="return false;">
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
                                    <input class="aw-register-name" type="text" id="user_name" name="user_name" placeholder="请输入3-20个数字或字母或汉字的用户名"  errortips="用户名长度不符合" value="">
                                </li>
                                <li>
                                    <input class="aw-register-pwd" type="password" id="password" name="password" placeholder="请输入6-16位密码，区分大小写" errortips="密码不符合规则">
                                </li>
                                <li class="last">
                                    <input type="checkbox" id=register_checkbox checked="checked" value="agree" name="agreement_chk" tips="请认真阅读用户协议后勾选按钮" errortips="请勾选我同意用户协议">
                                    <label for="register_checkbox">我已阅读并同意<a href="javascript:;"  onclick="$('.aw-regiter-agreement').show();">《众米服务协议》</a></label>

                                    <div class="aw-regiter-agreement hide">
                                        <i></i>

                                        <div class="aw-register-agreement-txt" id="register_agreement">
                                            当您申请用户时，表示您已经同意遵守本规章。<br>
                                            欢迎您加入本站点参与交流和讨论，本站点为社区，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：<br>
                                            <br>
                                            一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：<br>
                                            　（一）煽动抗拒、破坏宪法和法律、行政法规实施的；<br>
                                            　（二）煽动颠覆国家政权，推翻社会主义制度的；<br>
                                            　（三）煽动分裂国家、破坏国家统一的；<br>
                                            　（四）煽动民族仇恨、民族歧视，破坏民族团结的；<br>
                                            　（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；<br>
                                            　（六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；<br>
                                            　（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；<br>
                                            　（八）损害国家机关信誉的；<br>
                                            　（九）其他违反宪法和法律行政法规的；<br>
                                            　（十）进行商业广告行为的。<br>
                                            <br>
                                            二、互相尊重，对自己的言论和行为负责。<br>
                                            三、禁止在申请用户时使用相关本站的词汇，或是带有侮辱、毁谤、造谣类的或是有其含义的各种语言进行注册用户，否则我们会将其删除。<br>
                                            四、禁止以任何方式对本站进行各种破坏行为。<br>
                                            五、如果您有违反国家相关法律法规的行为，本站概不负责，您的登录信息均被记录无疑，必要时，我们会向相关的国家管理部门提供此类信息。
                                        </div>
                                    </div>
                                </li>
                                <li class="register_submit"><a id="register_submit" class=" btn btn-default"  onclick="f_save()">注册</a></li>

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
