<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title></title>
    <style>
        *,*:before,*:after{
            box-sizing: border-box;
        }
        .returnLeft{
            width: 24px;
            padding-left:12px;
        }
        .returnRight{
            width: 12px;
            padding-right:12px;
        }
        .returnLeft,.returnRight{
            float: left;
            height: 24px;
            position: relative;
            background-color:#fff;
        }
        .returnLeft:after{
            content:'';
            position: absolute;
            width: 16px;
            height: 24px;
            border-right:12px solid #fff;
            border-bottom:12px solid transparent;
            border-top:12px solid transparent;
            right: 0;
            top: 0;
            background-color: #3DB0FF;
        }
        .returnRight:before{
            content:'';
            position: absolute;
            left: -16px;
            border-right:12px solid transparent;
            border-bottom:12px solid #fff;
            border-top:12px solid #fff;
        }
        .register,.login,.forgetPwd{
            position: relative;
            max-width: 500px;
            min-height:100vh;
            padding-top: 54px;
            margin-top:0;
        }
    </style>
</head>

<body>
    <div class="register newscontent hidden">
        <div class="return" style="width:55px;height:35px;position: absolute;top:15px;left:13px;text-align: left;padding-left:0;font-size:30px;color:#f45531;background-color:#fff;font-family: 'Microsoft Yahei'" onclick="returnMain('register')"><span class="returnLeft"></span><span class="returnRight"></span></div>
    <form id="register_form"  method="post" action="${ctx }/users/sign_up"  onsubmit="return false;">
        <div class="inputBox">
        	<input type="hidden" name="flag" id="reg_flag" value="1"/>
            <input type="text" name="mobile" id="mobile" class="mobile"/>
            <span class="littleTip">手机号</span>
        </div>
        <div class="inputBox">
            <input type="text" name="vcode" id="vcode" class="vcode"/>
            <span class="littleTip">验证码</span>
            <div class="verifyCode none">获取验证码</div>
            <i class="errVerifyCode"></i>
        </div>
        <div class="inputBox">
            <input type="password" name="password" id="password" class="password"/>
            <span class="littleTip">密码</span>
        </div>
        <div class="inputBox">
            <input type="text" name="user_name" id="user_name" class="user_name"/>
            <span class="littleTip">昵称 </span>
        </div>
        <div class="errorMsg inputBox">
            <p></p>
        </div>
        <div class="inputBtnBox">
            <button class="registerBtn" disabled onclick="register()">注册</button>
        </div>
        <p class="bottomTip">如果你已经有帐号请前往 <a href="javascript:;" onclick="toLogin()">登录</a></p>
        <script>
        var G_BASE_URL = '${ctx}';
            //输入完毕之后下一步显示 注册
            $(document).on("input propertychange", ".mobile,.vcode,.password,.user_name", function () {
                if (isPhone($(".mobile")[0]) && isPwd($(".password")[0]) && !isNull($(".vcode")[0]) && !isNull($(".user_name")[0])) {
                    $(".registerBtn").removeAttr("disabled");
                } else {
                    $(".registerBtn").attr("disabled", "disabled");
                }
            });
            //手机号以空格隔开
            $(".mobile").on("input propertychange", function (e) {
                var phone = $(this).val();
                //'-'用空格替换
                if(phone.length>=13 && phone.indexOf('-')!=-1){
                    phone = phone.replace(/-/g,' ');
                    $(this).val(phone);
                }
            }).on('keyup',function(e){
                var phone = $(this).val();
                if ((phone.length == 3 || phone.length == 8) && e.keyCode != 8)
                    this.value += " ";
            });
            function register(){
                var phone = $("#mobile").val().NoSpace();
                $("#mobile").val(phone);
                // jquery 表单提交
                $("#register_form").ajaxSubmit({
                    type: 'post',
                    dataType: 'json',
                    success:function(data){
                        if(data.state=="success"){
                        	toLogin();
                        }else{
                            $(".errorMsg").removeAttr('hidden');
                            if(data.msg=="verify_code_not_exits"){
                                $(".errorMsg").html('<p>手机验证码错误</p>');
                            }else if(data.msg=="valid_code_expires"){
                                $(".errorMsg").html('<p>手机验证码过期</p>');
                            }else if(data.msg=="nickname_is_error"){
                                $(".errorMsg").html('<p>用户名不合法</p>');
                            }else{
                                $(".errorMsg").html('<p>'+data.msg+'</p>');
                            }
                        }
                    },error:function(xhr){alert('动态页出错\n\n'+xhr.responseText);}
                });
                return false;
            }
            //点击获取验证码
            $('.verifyCode').click(function(){

                if($(this).hasClass('none')){
                    $(this).removeClass('none');
                    $(this).parents('.inputBox').find('input').focus();
                    getVerifyCode();
                }
            });
            function getVerifyCode(){
                var mobileValue = $('#mobile').val();
                if(mobileValue){
                    $.get(G_BASE_URL + '/users/send_sms', {phone : mobileValue, flag : 1} , function (result) {
                        if (result.state == "error"){
                            $(".errVerifyCode").html('<p class="aw-reg-tips aw-reg-err">' + result.msg  + '</p>');
                        }
                    }, 'json');
                    //成功发送短信之后
                    var count = 60;
                    var countInterval = setInterval(function(){
                        count--;
                        if(count<0){
                            clearInterval(countInterval);
                            $('.verifyCode').text('请重新获取').addClass('none');
                        }else{
                            $('.verifyCode').text(count+'s');
                        }
                    },1000);
                }else{
                    $('.errVerifyCode').html('请输入手机号码');
                }
            }
        </script>
    </form>
</div>
    <div class="login newscontent hidden">
        <div class="return" style="width:55px;height:35px;position: absolute;top:15px;left:13px;text-align: left;padding-left:0;font-size:30px;color:#f45531;background-color:#fff;" onclick="returnMain('login')"><span class="returnLeft"></span><span class="returnRight"></span></div>
        <form id="login_form" method="post"  onsubmit="return false;" action="${ctx }/users/log_in" >
            <div class="inputBox">
                <input type="hidden" name="flag" id="log_flag" value="1"/>
                <input type="text" autocomplete="off" name="login_phone" id="login_phone" class="login_phone"/>
                <span class="littleTip">手机号</span>
            </div>
            <div class="inputBox">
                <input type="password"  autocomplete="off" name="login_password" id="login_password" class="login_password"/>
                <span class="littleTip">密码</span>
            </div>
            <div class="gotoForgetPwd"><a href="javascript:;" onclick="toForgetPwd()">忘记密码？</a></div>
            <div class="errorMsg inputBox">
                <p></p>
            </div>
            <div class="inputBtnBox">
                <button class="loginBtn" disabled onclick="login()">登陆</button>
            </div>
            <p class="bottomTip">如果你没有帐号请先 <a href="javascript:;" onclick="toRegister()">注册</a></p>
        </form>
        <script>
            //输入完毕之后下一步显示 登陆
            $(document).on("input propertychange", ".login_phone,.login_password", function () {
                if (isPhone($(".login_phone")[0]) && isPwd($(".login_password")[0])) {
                    $(".loginBtn").removeAttr("disabled");
                } else {
                    $(".loginBtn").attr("disabled", "disabled");
                }
            });
            //手机号以空格隔开
            $(".login_phone").on("input propertychange", function (e) {
                var phone = $(this).val();
                //'-'用空格替换
                if(phone.length>=13 && phone.indexOf('-')!=-1){
                    phone = phone.replace(/-/g,' ');
                    $(this).val(phone);
                }
            }).on('keyup',function(e){
                var phone = $(this).val();
                if ((phone.length == 3 || phone.length == 8) && e.keyCode != 8)
                    this.value += " ";
            });
            function login(){
                var username = $("#login_phone").val().NoSpace();
                $("#login_phone").val(username);
                // jquery 表单提交
                $("#login_form").ajaxSubmit({
                    type: 'post',
                    dataType: 'json',
                    success:function(data){
                        if(data.state=="success"){
                            location.reload();
                        }else{
                            $(".errorMsg").html('<p>用户手机号码或密码错误</p>');
                        }
                    },error:function(xhr){alert('动态页出错\n\n'+xhr.responseText);}//
                });
                return false;
            }
        </script>
    </div>
    <div class="forgetPwd newscontent hidden ">
        <div class="return" style="width:55px;height:35px;position: absolute;top:15px;left:13px;text-align: left;padding-left:0;font-size:30px;color:#f45531;background-color:#fff;font-family: 'Microsoft Yahei'" onclick="returnMain('forgetPwd')"><span class="returnLeft"></span><span class="returnRight"></span></div>
        <form id="find_pwd_form"  method="post" action="${ctx }/users/find_password"  onsubmit="return false;">
            <div class="inputBox">
                <input type="text" name="mobile" id="fMobile" class="mobile"/>
                <span class="littleTip">手机号</span>
            </div>
            <div class="inputBox">
                <input type="text" name="vcode" id="fVcode" class="vcode"/>
                <span class="littleTip">验证码</span>
                <div class="verifyCode none">获取验证码</div>
                <i class="errVerifyCode"></i>
            </div>
            <div class="inputBox">
                <input type="password" name="password"  id="fPassword" class="password"/>
                <span class="littleTip">密码</span>
            </div>
            <div class="inputBox">
                <input type="text" name="user_name" id="fPser_name" class="user_name"/>
                <span class="littleTip">昵称 </span>
            </div>
            <div class="errorMsg inputBox">
                <p></p>
            </div>
            <div class="inputBtnBox">
                <button class="forgetPwdBtn" disabled onclick="findPwd()">确定</button>
                <p class="bottomTip">如果你已经有帐号请前往 <a href="javascript:;" onclick="toLogin()">登录</a></p>
            </div>

            <script>
                var G_BASE_URL = '${ctx}';
                //输入完毕之后下一步显示 找回密码
                $(document).on("input propertychange", ".mobile,.vcode,.password,.user_name", function () {
                    if (isPhone($(".mobile")[0]) && isPwd($(".password")[0]) && !isNull($(".vcode")[0]) && !isNull($(".user_name")[0])) {
                        $(".forgetPwdBtn").removeAttr("disabled");
                    } else {
                        $(".forgetPwdBtn").attr("disabled", "disabled");
                    }
                });
                //手机号以空格隔开
                $(".mobile").on("input propertychange", function (e) {
                    var phone = $(this).val();
                    //'-'用空格替换
                    if(phone.length>=13 && phone.indexOf('-')!=-1){
                        phone = phone.replace(/-/g,' ');
                        $(this).val(phone);
                    }
                }).on('keyup',function(e){
                    var phone = $(this).val();
                    if ((phone.length == 3 || phone.length == 8) && e.keyCode != 8)
                        this.value += " ";
                });
                function findPwd(){
                    var phone = $("#fMobile").val().NoSpace();
                    $("#mobile").val(phone);
                    // jquery 表单提交
                    $("#find_pwd_form").ajaxSubmit({
                        type: 'post',
                        dataType: 'json',
                        success:function(data){
                            if(data.state=="success"){
                                location.reload();
                            }else{
                                $(".errorMsg").removeAttr('hidden');
                                if(data.msg=="verify_code_not_exits"){
                                    $(".errorMsg").html('<p>手机验证码错误</p>');
                                }else if(data.msg=="valid_code_expires"){
                                    $(".errorMsg").html('<p>手机验证码过期</p>');
                                }else if(data.msg=="nickname_is_error"){
                                    $(".errorMsg").html('<p>用户名不合法</p>');
                                }else{
                                    $(".errorMsg").html('<p>'+data.msg+'</p>');
                                }
                            }
                        },error:function(xhr){alert('动态页出错\n\n'+xhr.responseText);}
                    });
                    return false;
                }
                //点击获取验证码
                $('.verifyCode').click(function(){

                    if($(this).hasClass('none')){
                        $(this).removeClass('none');
                        $(this).parents('.inputBox').find('input').focus();
                        getVerifyCode();
                    }
                });
                function getVerifyCode(){
                    var mobileValue = $('#fMobile').val().NoSpace();
                    if(mobileValue){
                        $.get(G_BASE_URL + '/users/send_sms', {phone : mobileValue, flag : 1} , function (result) {
                            if (result.state == "error"){
                                $(".errVerifyCode").html('<p class="aw-reg-tips aw-reg-err">' + result.msg  + '</p>');
                            }
                        }, 'json');
                        //成功发送短信之后
                        var count = 60;
                        var countInterval = setInterval(function(){
                            count--;
                            if(count<0){
                                clearInterval(countInterval);
                                $('.verifyCode').text('请重新获取').addClass('none');
                            }else{
                                $('.verifyCode').text(count+'s');
                            }
                        },1000);
                    }else{
                        $('.errVerifyCode').html('请输入手机号码');
                    }
                }
            </script>
        </form>
    </div>
<script>
    $('input').focus(function(){
        $(this).parents('.inputBox').find('.littleTip').animate({'top':'30px'});
        $(this).parents('.inputBox').addClass('active').siblings().removeClass('active');
    }).blur(function(){
        if(!$(this).val()){
            $(this).parents('.inputBox').find('.littleTip').animate({'top':'54px'});
            $(this).parents('.inputBox').addClass('active').removeClass('active');
        }else{
            $(this).parents('.inputBox').removeClass('active');
        }
    });
  //登录注册相关
    $(function(){
        $('input').each(function(){
            var val = $(this).val();
            if(!isNull($(this)[0])){
                $(this).parents('.inputBox').find('.littleTip').animate({'top':'30px'});
                $(this).parents('.inputBox').addClass('active').siblings().removeClass('active');
            }
        });
    });
    function toRegister(){$('.register').removeClass('hidden').siblings().addClass('hidden');}
    function toLogin(){$('.login').removeClass('hidden').siblings().addClass('hidden');}
    function toForgetPwd(){$('.forgetPwd').removeClass('hidden').siblings().addClass('hidden');}
    function returnMain(str){
        $('.main,section,nav').removeClass('hidden');
        $('.'+str).addClass('hidden');
    }
</script>
</body>
</html>