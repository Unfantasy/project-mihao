/**
 * Created by zm on 2016/1/14.
 */
var database = "https://www.mihaokj.com";
var database_http = "http://www.mihaokj.com";
(function() {

    $.extend($.fn, {
        //提示框组件1按钮
        alert: function(options) {

            var defaults = {
                tip: '',
                cancelBtnLbl: '确定',
                maskColor: '#000',
                cancelCallback: null
            };

            var settings = $.extend(defaults, options || {}),
                $this;

            function initialize() {
                var HTML = '<div style="background:#000;opacity:.5;position:fixed;z-index:99999;left:0px;top:0px;width:100%;height:100%;"></div><div style="background-color: #fff;width: 300px;margin: auto;position: fixed;left: 50%;top: 50%;-webkit-transform:translate(-50%,-50%);-moz-transform:translate(-50%,-50%);transform:translate(-50%,-50%);text-align: center;border-radius: 5px;z-index:100000;display:table;"><div style="display:table;width:100%;border-bottom:1px solid #aaa;"><span style="display:table-cell;height:50px;line-height:50px;vertical-align:middle;text-align:center;font-size:16px;color:#000;padding-left:10px;">' + settings.tip + '</span></div><div style="display:table;width:100%;"><span style="display:table-cell;height:50px;line-height:50px;vertical-align:middle;color:#000;" id="alertBtn">' + settings.cancelBtnLbl + '</span></div></div>';
                $this = $(HTML).appendTo($('body'));
                var $btn = $this.children('div:eq(1)');
                $btn.children().eq(0).off('click', cancelBtnClickHandler).on('click', cancelBtnClickHandler);
                $btn.children().eq(1).off('click', confirmBtnClickHandler).on('click', confirmBtnClickHandler);
            }

            //取消按钮事件
            function cancelBtnClickHandler() {
                $this.remove();
                if (settings.cancelCallback && typeof settings.cancelCallback == 'function') {
                    settings.cancelCallback();
                }
            }

            function confirmBtnClickHandler() {
                $this.remove();
                if (settings.confirmCallback && typeof settings.confirmCallback == 'function') {
                    settings.confirmCallback();
                }
            }

            initialize();

        },
        //提示框组件2按钮
        alert2: function(options) {

            var defaults = {
                tip: '',
                cancelBtnLbl: '取消',
                confirmBtnLbl: '确定',
                maskColor: '#000',
                cancelCallback: null,
                confirmCallback: null
            };

            var settings = $.extend(defaults, options || {}),
                $this;

            function initialize() {
                var HTML = '<div style="background:#000;opacity:.5;position:fixed;z-index:99999;left:0px;top:0px;width:100%;height:100%;"></div><div style="background-color: #fff;width: 80%;margin: auto;position: fixed;left: 50%;top: 50%;-webkit-transform:translate(-50%,-50%);-moz-transform:translate(-50%,-50%);transform:translate(-50%,-50%);text-align: center;border-radius: 5px;z-index:100000;display:table;"><div style="display:table;width:100%;border-bottom:1px solid #aaa;"><span style="display:table-cell;height:50px;line-height:50px;vertical-align:middle;text-align:center;font-size:16px;color:#000;padding:0 10px;">' + settings.tip + '</span></div><div style="display:table;width:100%;"><span style="display:table-cell;height:50px;line-height:50px;vertical-align:middle;color:#000;" id="alertBtn">' + settings.cancelBtnLbl + '</span><span style="display:table-cell;height:50px;line-height:50px;vertical-align:middle;border-left:1px solid #EAEAEA;color:#000;">' + settings.confirmBtnLbl + '</span></div></div>';
                $this = $(HTML).appendTo($('body'));
                var $btn = $this.children('div:eq(1)');
                $btn.children().eq(0).off('click', cancelBtnClickHandler).on('click', cancelBtnClickHandler);
                $btn.children().eq(1).off('click', confirmBtnClickHandler).on('click', confirmBtnClickHandler);
            }

            //取消按钮事件
            function cancelBtnClickHandler() {
                $this.remove();
                if (settings.cancelCallback && typeof settings.cancelCallback == 'function') {
                    settings.cancelCallback();
                }
            }

            function confirmBtnClickHandler() {
                $this.remove();
                if (settings.confirmCallback && typeof settings.confirmCallback == 'function') {
                    settings.confirmCallback();
                }
            }

            initialize();

        }

    });


})(jQuery)

//是否为空
function isnull(val) {
    return val == "";
}

//电话号码验证
function ismobile(val) {
    var reg = /^1[0-9]{10}$/;
    return reg.test(val);
}

//验证邮件格式
function ismail(val) {
    var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/;
    return reg.test(val);
}

//短信验证码格式
function isSmsCode(val) {
    var reg = /^[0-9]{6}$/;
    return reg.test(val);
}
//验证密码格式
function ispwd(val) {
    var reg = /^[a-zA-Z0-9]{6,20}$/;
    return reg.test(val);
}
//身份证号
function isCardNo(val) {
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    return reg.test(val);
}

//去空格
String.prototype.NoSpace = function () {
    return this.replace(/\s+/g, "");
}
//手机格式空格
String.prototype.AddSpace = function () {
    var str = this;
    return str.substr(0, 3) + " " + str.substr(3, 4) + " " + str.substr(7, 4);
}


//60s倒计时
var intervalPhone;
var i = 61;
function countDownPhone() {
    if (i > 0) {
        i--;
        var str = i + "s";
        $(".seconds").html(str).unbind("click");

    } else {
        clearInterval(intervalPhone);
        $(".seconds").html("重新获取").bind("click", registerForWin);

    }
}
//从得到图片验证码
function getImgVerify() {
    var time = new Date().getTime();
    $.ajax({
        url: "https://api.jucaidao.com/captcha?t=" + time,
        type: 'get',
        dataType: 'jsonp',
        success: function (data) {
            if (data) {
                $("#img_code").attr("src", data.captcha_img);
                $("#captcha_key").val(data.captcha_key);
            }
        }
    });
}
function getVerifyCode() {
    var mobileValue = $('#mobile').val();
    var seccodeVerifyValue = $('#seccode_verify').val();
    if (!seccodeVerifyValue) {
        alert('请先输入正确的图片验证码再获取短信验证码！');
        return false;
    }
    if (mobileValue) {
        $('#li-register-mobile').find('.aw-reg-tips').detach();
        $('#li-register-mobile').append('<span class="aw-reg-tips">正在发送短信，请稍候...</span>');
        $.get(G_BASE_URL + '/account/ajax/get_sms_verify_code/', {
            mobile: mobileValue,
            seccode_verify: seccodeVerifyValue
        }, function (result) {
            if (result.errno == 0) {
                $('#li-register-mobile').find('.aw-reg-tips').detach();
                $('#li-register-mobile').append('<span class="aw-reg-tips">' + result.err + '</span>');
            } else {
                ON_ERR = true;
                $('#li-register-mobile').find('.aw-reg-tips').detach();
                $('#li-register-mobile').append('<span class="aw-reg-tips aw-reg-err"><i class="aw-icon i-err"></i>' + result.err + '</span>');
            }
        }, 'json');
        for (i = 0; i <= DELAY_SECS; i++) {
            window.setTimeout("updateVerifyCodeBtn(" + i + ")", i * 1000);
        }
    } else {
        $('#li-register-mobile').find('.aw-reg-tips').detach();
        $('#li-register-mobile').append('<span class="aw-reg-tips aw-reg-err"><i class="aw-icon i-err"></i>请先填写手机号</span>');
    }
}
function verify_register_form(element) {
    $(element).find(':text, :input').on({

        blur: function () {
            switch ($(this).attr('name')) {
                case 'mobile' :
                    var _this = $(this);
                    $(this).parent().find('.aw-reg-tips').detach();
                    var mobilereg = /^1[0-9]{10}$/;
                    if (!mobilereg.test($(this).val())) {
                        $(this).parent().find('.aw-reg-tips').detach();
                        $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                        $('#btnGetVerifyCode').attr('disabled', "true");
                        return;
                    }

                case 'password' :
                    $(this).parent().find('.aw-reg-tips').detach();
                    if ($(this).val().length >= 0 && $(this).val().length < 6) {
                        $(this).parent().find('.aw-reg-tips').detach();
                        $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                        return;
                    }
                    if ($(this).val().length > 21) {
                        $(this).parent().find('.aw-reg-tips').detach();
                        $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                        return;
                    }
                    else {
                        $(this).parent().find('.aw-reg-tips').detach();
                    }
                    return;
                case 'password2' :
                    $(this).parent().find('.aw-reg-tips').detach();
                    if ($(this).val()!=$("#password").val()) {
                        $(this).parent().find('.aw-reg-tips').detach();
                        $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                        return;
                    }else {
                        $(this).parent().find('.aw-reg-tips').detach();
                    }
                    return;
                case 'name' :
                    $(this).parent().find('.aw-reg-tips').detach();
                    if (!$(this).val()) {
                        $(this).parent().find('.aw-reg-tips').detach();
                        $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                        return;
                    }else {
                        $(this).parent().find('.aw-reg-tips').detach();
                    }
                    return;
                case 'student_class' :
                    $(this).parent().find('.aw-reg-tips').detach();
                    if (!$(this).val()) {
                        $(this).parent().find('.aw-reg-tips').detach();
                        $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                        return;
                    }else {
                        $(this).parent().find('.aw-reg-tips').detach();
                    }
                    return;
                case 'student_id' :
                    $(this).parent().find('.aw-reg-tips').detach();
                    if (!$(this).val()) {
                        $(this).parent().find('.aw-reg-tips').detach();
                        $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                        return;
                    }else {
                        $(this).parent().find('.aw-reg-tips').detach();
                    }
                    return;
                case 'phone' :
                    $(this).parent().find('.aw-reg-tips').detach();
                    if (!$(this).val()) {
                        $(this).parent().find('.aw-reg-tips').detach();
                        $(this).parent().append('<p class="aw-reg-tips aw-reg-err">' + $(this).attr('errortips') + '</p>');
                        return;
                    }else {
                        $(this).parent().find('.aw-reg-tips').detach();
                    }
                    return;
            }
        }
    });
}
//手机号，密码 确认密码
function registerForWin(){
    //alert("success");
    $("#register_submit").attr("disabled","disables");
    var phone = $("#mobile").val().NoSpace();
    $.ajax({
        url: database+'/user_deal/check_phone?phone='+phone,
        type: 'post',
        dataType: 'json',
        success: function (data) {
            $("#register_submit").removeAttr("disabled");
        	if(data.result==1){  //error
                //已注册
                $.fn.alert({'tip': '该手机号已注册'});
//                        alert(JSON.stringify(data));
            }else{
                $("#verify-code").removeClass("hide").siblings().addClass("hide");
                getImgVerify();
            }
        }
        ,
        error:function(e){
            $("#register_submit").removeAttr("disabled");
            alert(e);
        }
    });
}
//图片验证码
function toPhoneVerify(){
    $("#to-phone-verify").attr("disabled","disabled");
    var phone = $("#mobile").val().NoSpace();
    var password = $("#password").val();
    var imgCode = $("#verify-code-num").val();
    var captcha_key = $("#captcha_key").val();
    var client_id = "YyxOKQNKXWXiX4JUKhjs7aM0RDdbM5KTktqffUcB";
    var agency = "MI-US-STK";
    $.ajax({
        url: "https://api.jucaidao.com/bgate/register",
        type: 'post',
        dataType: 'json',
        data: {
            phone: phone,
            password: password,
            captcha_key: captcha_key,
            captcha_value: imgCode,
            client_id: client_id,
            agency: agency
        },
        success: function (data) {
            $("#to-phone-verify").removeAttr("disabled");
            //alert(JSON.stringify(data));
            if (data.errCode == 300) {
                $.fn.alert({'tip': '验证码输入错误'});
            } else if (data.errCode == 1016) {
                //alert(JSON.stringify(data));
                $.fn.alert({
                    'tip': '该手机号已注册',
                    cancelCallback: function() {
                        //确定后的操作
                        $("#register").siblings().addClass("hide");
                        $("#register").removeClass("hide");
                    }
                });
            }else if (data.statusCode == 200&&!data.errCode) {//error
                //alert(JSON.stringify(data));
                $("#auth_code").val(data.data.auth_code);  //error
                //60秒倒计时
                $("#phone-verify-code").siblings().addClass("hide");
                $("#phone-verify-code").removeClass("hide");
                i = 61;
                intervalPhone = setInterval("countDownPhone()", 1000);
            } else {
                $.fn.alert({'tip': data.errCode+":"+data.errMsg});
            }
        },
        error:function(e){
            $("#to-phone-verify").removeAttr("disabled");
            alert(e);
        }
    });
}
//手机验证码
function toVerification(){
    $("#to-verification").attr("disabled","disabled");
    var auth_code = $("#auth_code").val();
    var sms_code = $("#phone-verify-code-num").val();
    var phone = $("#mobile").val().NoSpace();
    $.ajax({
        url: database+'/user_deal/phone_auth',
        type: 'post',
        dataType: 'json',
        data: {
        	auth_code: auth_code,
        	sms_code: sms_code,
        	phone: phone
        },
        success: function (data) {
            $("#to-verification").removeAttr("disabled");
        	if (data.statusCode == 200) {
                $("#identity").siblings().addClass("hide");
                $("#identity").removeClass("hide");
            }else if (data.errCode==1018) {
                $.fn.alert({'tip': '验证码输入错误'});
            }else if (data.msg == "user_is_already_regist") {
            	 $.fn.alert({'tip': '该手机号已注册',
                     cancelCallback: function() {
                         //确定后的操作
                         $("#register").siblings().addClass("hide");
                         $("#register").removeClass("hide");
                     }
                 });
            } else if (data.errCode == 1016) {
                $.fn.alert({'tip': '该手机号已注册',
                    cancelCallback: function() {
                        //确定后的操作
                        $("#register").siblings().addClass("hide");
                        $("#register").removeClass("hide");
                    }
                });
            }else if (data.msg == "sms_code_is_null") {
                $.fn.alert({'tip': '验证码为空'});
            } else {
                if(data.errCode){
                    $.fn.alert({'tip': data.errCode+":"+data.errMsg});
                }else{
                    $.fn.alert({'tip': data.state+":"+data.msg});
                }
            }
        },
        error:function(e){
            $("#to-verification").removeAttr("disabled");
        alert(e);
    }
    });
}
//身份证号 身份证
function  identityVerification(){
    $("#identity-verification").attr("disabled","disabled");
    var user_name = $("#mobile").val().NoSpace();
    var password = $("#password").val();
    var id_name = $("#id_name").val();
    var id_num = $("#id_num").val();
    $.ajax({
        url: database+'/user_deal/auth_id_num',
        type: 'post',
        dataType: 'json',
        data: {
        	user_name: user_name,
        	password: password,
        	id_name: id_name,
        	id_num: id_num
        },
        success: function (data) {
            $("#identity-verification").removeAttr("disabled");
        	if (data.statusCode == 200) {
                //注册时身份证验证成功跳转成功页面 取数据
                window.location.href = database_http+"/index_register_complete.jsp";
            } else if(data.errCode==1219){
                $.fn.alert({'tip': '身份证验证失败'});
            } else {
                if(data.errCode){
                    $.fn.alert({'tip': data.errCode+":"+data.errMsg});
                } else {
                    $.fn.alert({'tip': data.state+":"+data.msg});
                }
            }
        },
        error:function(e){
            $("#identity-verification").removeAttr("disabled");
            alert(e);
        }
    });
}
//解绑的方法
//60s倒计时
var intervalPhone2;
var j = 61;
function countDownPhone2() {
    if (j > 0) {
        j--;
        var str = j + "s";
        $(".seconds").html(str).unbind("click");

    } else {
        clearInterval(intervalPhone);
        $(".seconds").html("重新获取").bind("click", toPhoneNum);

    }
}
function toPhoneNum(){
    $("#to-phonenum").attr("disabled","disabled");
    var phone = $("#mobile").val().NoSpace();
    if(phone==""){
    	$.fn.alert({'tip': '号码不能为空'});
    	return false;
    }
    $.ajax({
        url: database+'/users/send_sms?phone='+phone,
        type: 'get',
        dataType: 'json',
        success: function (data) {
            $("#to-phonenum").removeAttr("disabled");
			//alert(JSON.stringify(data));
        	if (data.state == "error") {
            	if(data.msg=="no_phone_num"){
            		$.fn.alert({'tip': '手机号码不能为空'});
            	}else if(data.msg=="wrong_phone_num"){
            		$.fn.alert({'tip': '手机号码格式不正确'});
            	}else if(data.msg=="user_phone_is_not_exist"){
            		$.fn.alert({'tip': '此账号不存在'});
            	}else if(data.msg=="unexpect_error"){
            		$.fn.alert({'tip': '意想不到的错误'});
            	}
            } else{
				$("#rb-phone-num").removeClass("hide").siblings().addClass("hide");
				j = 61;
				intervalPhone = setInterval("countDownPhone2()", 1000);
			}
        }
    });
}
function relieveBind(){
    $("#relieve-bind").attr("disabled","disabled");
    var phone = $("#mobile").val().NoSpace();
    var valid_code = $("#phone-verify-code-num").val().NoSpace();
    var method = 'POST';
    if(phone==""){
    	$.fn.alert({'tip': '手机号码不能为空'});
    	return false;
    }
    if(valid_code==""){
    	$.fn.alert({'tip': '短信验证码不能为空'});
    	return false;
    }
    $.ajax({
        url: database+'/user_deal/zmuser_unbind',
        type: 'post',
        dataType: 'json',
        data: {
        	phone: phone,
        	valid_code: valid_code
        },
        success: function (data) {
            $("#relieve-bind").removeAttr("disabled");
        	if (data.state == "error") {
            	if(data.msg=="no_phone_num"){
            		$.fn.alert({'tip': '手机号码不能为空'});
            	}else if(data.msg=="no_valid_code"){
            		$.fn.alert({'tip': '手机验证码为空'});
            	}else if(data.msg=="user_deal_is_not_regist"){
            		$.fn.alert({'tip': '此交易账户不存在'});
            	}else if(data.msg=="verify_code_error"){
            		$.fn.alert({'tip': '验证码错误'});
            	}else if(data.msg=="verify_code_expires"){
            		$.fn.alert({'tip': '验证码过期'});
            	}else if(data.msg=="zmuser_unbind_fail"){
            		$.fn.alert({'tip': '解绑失败'});
            	}
            } else{
            	location.href=database_http+"/index_help_relievebind_complete.jsp";
            }
        }
    });
}

//展示隐藏 服务协议
function showAgreement(){
    if($(".aw-regiter-agreement1").hasClass("hide")){
        $(".aw-regiter-agreement1").removeClass("hide");
    }else{
        $(".aw-regiter-agreement1").addClass("hide");
    }
}
//展示隐藏 服务协议
function showAgreement2(){
    if($(".aw-regiter-agreement2").hasClass("hide")){
        $(".aw-regiter-agreement2").removeClass("hide");
    }else{
        $(".aw-regiter-agreement2").addClass("hide");
    }
}
//获取页面显示区域高度
function getDocHeight() {
    var D = document;
    return Math.max(
        Math.max(D.body.scrollHeight, D.documentElement.scrollHeight),
        Math.max(D.body.offsetHeight, D.documentElement.offsetHeight),
        Math.max(D.body.clientHeight, D.documentElement.clientHeight)
    );
}
//获取页面显示区域宽度
function getDocWidth() {
    var D = document;
    return Math.max(
        Math.max(D.body.scrollWidth, D.documentElement.scrollWidth),
        Math.max(D.body.offsetWidth, D.documentElement.offsetWidth),
        Math.max(D.body.clientWidth, D.documentElement.clientWidth)
    );
}

function jump(id){
    var target = document.getElementById(id);
    var e = e || window.event;
    alert(e.keyCode);
    if(e.keyCode == 13 || e.keyCode == 9){
        target.focus();
    }
}
function pressEnter(fun){
    var e = e || window.event;
    if(e.keyCode == 13 || e.keyCode == 9){
        eval(fun);
    }
}

