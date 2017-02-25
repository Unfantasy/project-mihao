/**
 * Created by zm on 2016/1/14.
 */
var database = "https://mimikj.com"; //"http://192.168.31.176:8080";"https://mimikj.com";https://test.mimikj.com
var DATABASE_TRUBUZZ = "https://proxy.jucaidao.com/jucaidao";
setupWebViewJavascriptBridge(function(bridge) {
    bridge.registerHandler('backHandler', function(e,responseCallback) {
        var responseData = {back:true};
        responseCallback(responseData)
    })
});

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
                var HTML = '<div style="background:#000;opacity:.5;position:fixed;z-index:99999;left:0px;top:0px;width:100%;height:100%;"></div><div style="background-color: #fff;width: 60%;margin: auto;position: fixed;left: 50%;top: 50%;-webkit-transform:translate(-50%,-50%);-moz-transform:translate(-50%,-50%);transform:translate(-50%,-50%);text-align: center;border-radius: 5px;z-index:100000;display:table;"><div style="display:table;width:100%;border-bottom:1px solid #aaa;"><span style="display:table-cell;height:50px;line-height:2;vertical-align:middle;text-align:center;font-size:16px;color:#000;padding:10px 20px;">' + settings.tip + '</span></div><div style="display:table;width:100%;"><span style="display:table-cell;height:50px;line-height:50px;vertical-align:middle;color:#0075ff;font-size:16px;" id="alertBtn">' + settings.cancelBtnLbl + '</span></div></div>';
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
                var HTML = '<div style="background:#000;opacity:.5;position:fixed;z-index:99999;left:0px;top:0px;width:100%;height:100%;"></div><div style="background-color: #fff;width: 60%;margin: auto;position: fixed;left: 50%;top: 50%;-webkit-transform:translate(-50%,-50%);-moz-transform:translate(-50%,-50%);transform:translate(-50%,-50%);text-align: center;border-radius: 5px;z-index:100000;display:table;"><div style="display:table;width:100%;border-bottom:1px solid #aaa;"><span style="display:table-cell;height:50px;line-height:2;vertical-align:middle;text-align:center;font-size:16px;color:#000;padding:10px 20px;">' + settings.tip + '</span></div><div style="display:table;width:100%;"><span style="display:table-cell;height:50px;line-height:50px;vertical-align:middle;color:#000;font-size:16px;" id="alertBtn">' + settings.cancelBtnLbl + '</span><span style="display:table-cell;height:50px;line-height:50px;vertical-align:middle;border-left:1px solid #EAEAEA;color:#0075ff;font-size:16px;">' + settings.confirmBtnLbl + '</span></div></div>';
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
function isnull(obj) {
    return obj.value == "";
}

//电话号码验证
function isnum(obj) {
    var reg = /^1[0-9]{10}$/;
    if (!reg.test(obj.value.NoSpace())) {
        return false;
    }
    return true;
}

//验证邮件格式
function ismail(obj) {
    var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/;
    if (!reg.test(obj.value)) {
        return false;
    }
    return true;
}

//短信验证码格式
function isSmsCode(obj) {
    var reg = /^[0-9]{6}$/;
    return reg.test(obj.value.NoSpace());
}
//验证密码格式
function ispwd(obj) {
    var reg = /^[a-zA-Z0-9]{6,20}$/;
    if (!reg.test(obj.value)) {
        return false;
    }
    return true;
}
//身份证号
function isCardNo(card) {
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    if (reg.test(card) === false) {
        return false;
    }
    return true;
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
var intervalPhone1, intervalPhone2;
var i = 61;
function countDownPhone1() {
    if (i > 0) {
        i--;
        var str = i + "s";
        $(".seconds").html(str).unbind("click");

    } else {
        clearInterval(intervalPhone1);
        $(".seconds").html("重新获取").bind("click", toImgCode);

    }
}
function countDownPhone2() {
    if (i > 0) {
        i--;
        var str = i + "s";
        $(".seconds").html(str).unbind("click");
    } else {
        clearInterval(intervalPhone2);
        $(".seconds").html("重新获取").bind("click", toImgCode);
    }
}
//从得到图片验证码
function getImgVerify() {
    var time = new Date().getTime();
    $.ajax({
        url: DATABASE_TRUBUZZ+"/captcha?t=" + time,
        type: 'get',
        dataType: 'jsonp',
        success: function (data) {
            if (data) {
                $("#img_code").attr("src", data.captcha_img);
                $("#captcha_key").val(data.captcha_key);
            }
        },
        error:function(){
            hideLoading();
            $.fn.alert({'tip': '服务器错误，请稍后重试'});
        }
    });

}
/*注册 phone function */
function toVerifyPhone() {
    showLoading();
    var time = new Date().getTime();
    var phone = $("#phone").val().NoSpace();
    phone = phone.NoSpace();
    var password = $("#password").val();
    var imgCode = $("#verity_code").val();
    var captcha_key = $("#captcha_key").val();
    var client_id = "YyxOKQNKXWXiX4JUKhjs7aM0RDdbM5KTktqffUcB";
    var agency = "MI-US-STK";
    $.ajax({
        url: DATABASE_TRUBUZZ+"/bgate/register",
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
            hideLoading();
            if (data.statusCode == 200) {
//                        alert(JSON.stringify(data));
                $("#auth_code").val(data.data.auth_code);
                //60秒倒计时
                $("#verify_phone header h1").html(phone.AddSpace());
                $("#verify_phone").siblings().addClass("hide");
                $("#verify_phone").removeClass("hide");
                i = 61;
                intervalPhone1 = setInterval("countDownPhone1()", 1000);
            } else if (data.errCode == 300) {
                $.fn.alert({'tip': '验证码输入错误'});
            } else if (data.errCode == 1016) {
                $.fn.alert({
                    'tip': '该手机号已注册',
                    cancelCallback: function() {
                        //确定后的操作
                        $("#register_phone").siblings().addClass("hide");
                        $("#register_phone").removeClass("hide");
                    }
                });

            } else {
                if(data.errCode){
                    if(data.msg){
                        $.fn.alert({'tip': data.errCode+":"+data.msg});
                    }else{
                        $.fn.alert({'tip': data.errCode+":"+data.errMsg});
                    }

                }else{
                    if(data.msg){
                        $.fn.alert({'tip': data.state+":"+data.msg});
                    }else{
                        $.fn.alert({'tip': data.state+":"+data.errMsg});
                    }
                }
            }
        },
        error:function(xhr){
            hideLoading();
            $.fn.alert({'tip': '服务器错误，请稍后重试'});
        }
    })
}

/*手机号码注册*/
function registerForPhone() {
    showLoading();
    var auth_code = $("#auth_code").val();
    var sms_code = $("#verification_code").val();
    var phone = $("#phone").val().NoSpace();
    var auth_token = $("#auth_token").val();
    var data = {auth_code:auth_code,sms_code:sms_code,phone:phone,auth_token:auth_token};
    var url = database+'/mimikj/user_deal/phone_auth';
    $.ajax({url:url,type:'post',dataType:"json",data:data,success:function(data){
        hideLoading();
        if (data.statusCode == 200) {
            $("#verify_identity_phone").siblings().addClass("hide");
            $("#verify_identity_phone").removeClass("hide");
        }else if (data.msg == "zmuser_is_already_regist_other_deal_user") {
            $.fn.alert({'tip': '该众米账户已绑定另一聚财道账户，请直接登录，或注册新的众米账户'});
        }else if (data.errCode==1018) {
            $.fn.alert({'tip': '验证码输入错误'});
        }else if (data.errCode == 1016) {
            $.fn.alert({'tip': '该手机号已注册',
                cancelCallback: function() {
                    //确定后的操作
                    $("#register_phone").siblings().addClass("hide");
                    $("#register_phone").removeClass("hide");
                }
            });
        }else if (data.msg == "sms_code_is_null") {
            $.fn.alert({'tip': '验证码为空'});
        }else if (data.msg == "user_is_already_regist") {
            $.fn.alert({
                'tip': '该众米账户已注册',
                cancelCallback: function() {
                    //确定后的操作
                    $("#register_phone").siblings().addClass("hide");
                    $("#register_phone").removeClass("hide");
                }
            });
        } else {
            if(data.errCode){
                if(data.msg){
                    $.fn.alert({'tip': data.errCode+":"+data.msg + "["+phone+'，' + auth_token + ']'});
                }else{
                    $.fn.alert({'tip': data.errCode+":"+data.errMsg + "["+phone+'，' + auth_token + ']'});
                }
            }else{
                if(data.msg){
                    $.fn.alert({'tip': data.state+":"+data.msg + "[" +phone+'，' + auth_token + ']'});
                }else{
                    $.fn.alert({'tip': data.state+":"+data.errMsg + "[" +phone+'，' + auth_token + ']'});
                }
            }
        }
    },error:function(){
        hideLoading();
        $.fn.alert({'tip': '服务器异常，请稍后再试'});
    }});
    /*var data = "auth_code="+ auth_code+ "&sms_code="+ sms_code+ "&phone="+ phone+ "&auth_token="+ auth_token;
    var method = 'POST';

    var xhr = new XMLHttpRequest();
    //alert(auth_code + auth_token);
    if ("withCredentials" in xhr) {
        xhr.open(method, url, true);
    } else if (typeof XDomainRequest != "undefined") {
        // 否则检查是否支持XDomainRequest，IE8和IE9支持
        // XDomainRequest仅存在于IE中，是IE用于支持CORS请求的方式
        xhr = new XDomainRequest();
        xhr.open(method, url);
    }else{
        xhr = null;
    }
    if (!xhr) {
        $.fn.alert({'tip': '注册失败'});
        return false;
    }
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    xhr.send(data);
    xhr.onerror=function(){
        $.fn.alert({'tip': '服务器错误，请稍后重试'});
        return false;
    }
    xhr.onload = function(){
        hideLoading();
        //alert(xhr.responseText);
        var data = JSON.parse(xhr.responseText);
        //alert(JSON.stringify(data));
        if (data.statusCode == 200) {
            $("#verify_identity_phone").siblings().addClass("hide");
            $("#verify_identity_phone").removeClass("hide");
        }else if (data.msg == "zmuser_is_already_regist_other_deal_user") {
            $.fn.alert({'tip': '该众米账户已绑定另一聚财道账户，请直接登录，或注册新的众米账户'});
        }else if (data.errCode==1018) {
            $.fn.alert({'tip': '验证码输入错误'});
        }else if (data.errCode == 1016) {
            $.fn.alert({'tip': '该手机号已注册',
                cancelCallback: function() {
                    //确定后的操作
                    $("#register_phone").siblings().addClass("hide");
                    $("#register_phone").removeClass("hide");
                }
            });
        }else if (data.msg == "sms_code_is_null") {
            $.fn.alert({'tip': '验证码为空'});
        }else if (data.msg == "user_is_already_regist") {
            $.fn.alert({
                'tip': '该众米账户已注册',
                cancelCallback: function() {
                    //确定后的操作
                    $("#register_phone").siblings().addClass("hide");
                    $("#register_phone").removeClass("hide");
                }
            });
        } else {
            if(data.errCode){
                if(data.msg){
                    $.fn.alert({'tip': data.errCode+":"+data.msg});
                }else{
                    $.fn.alert({'tip': data.errCode+":"+data.errMsg});
                }
            }else{
                if(data.msg){
                    $.fn.alert({'tip': data.state+":"+data.msg});
                }else{
                    $.fn.alert({'tip': data.state+":"+data.errMsg});
                }
            }
        }
    }*/
}
/*身份证验证*/
function verifyIdentityPhoneRegister() {
    showLoading();
    var auth_token = $("#auth_token").val();
    var user_name = $("#phone").val().NoSpace();
    var password = $(".password").val();
    var id_name = $("#id_name").val();
    var id_num = $("#id_num").val();
    if (id_name && id_num) {} else {
        $.fn.alert({'tip': '用户名或身份证号为空'});
        return false;
    }
    var data = "password="+ password+ "&user_name="+ user_name+ "&auth_token="+ auth_token+ "&id_name="+ id_name+ "&id_num="+ id_num;
    var method = 'POST';
    var url = database+'/mimikj/user_deal/auth_id_num';
    var xhr = new XMLHttpRequest();
    if ("withCredentials" in xhr) {
        xhr.open(method, url, true);
    } else if (typeof XDomainRequest != "undefined") {
        // 否则检查是否支持XDomainRequest，IE8和IE9支持
        // XDomainRequest仅存在于IE中，是IE用于支持CORS请求的方式
        xhr = new XDomainRequest();
        xhr.open(method, url);
    }else{
        xhr = null;
    }
    if (!xhr) {
        $.fn.alert({'tip': '验证失败'});
        return false;
    }
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    xhr.send(data);
    xhr.onerror=function(){
        $.fn.alert({'tip': '服务器错误，请稍后重试'});
        return false;
    }
    xhr.onload = function(){
        hideLoading();
        var data = JSON.parse(xhr.responseText);
        if (data.statusCode == 200) {
            //注册时身份证验证成功跳转登录页面 取数据
            showSuccess("注册成功");
            setTimeout(function(){
                setupWebViewJavascriptBridge(function(bridge) {
                    data.guide = true;
                    //alert("success" + JSON.stringify(data));
                    data.user_name = user_name;
                    bridge.callHandler('registerHandler', data, function(data) {
                        var responseData = data;
                        //alert("success" + JSON.stringify(data));
                        responseCallback(responseData)
                    })
                });
                window.location.href = "golden_guide.html";//打开入金指引
            },1500);
			/*$.fn.alert({
                'tip': '注册成功',
                cancelCallback: function() {
                    //绑定众米并跳转回交易界面。 取数据
                    setupWebViewJavascriptBridge(function(bridge) {
                        data.guide = true;
                        //alert("success" + JSON.stringify(data));
                        data.user_name = user_name;
                        bridge.callHandler('registerHandler', data, function(data) {
                            var responseData = data;
                            //alert("success" + JSON.stringify(data));
                            responseCallback(responseData)
                        })
                    });
                    window.location.href = "golden_guide.html";//打开入金指引
                }
            });*/
        } else if(data.errCode==1219){
            $.fn.alert({'tip': '身份证验证失败'});
        }else if(data.errCode==101){
            $.fn.alert({'tip': '该身份证已经被绑定'});
        }else {
            if(data.errCode){
                if(data.msg){
                    $.fn.alert({'tip': data.errCode+":"+data.msg});
                }else{
                    $.fn.alert({'tip': data.errCode+":"+data.errMsg});
                }

            }else{
                if(data.msg){
                    $.fn.alert({'tip': data.state+":"+data.msg});
                }else{
                    $.fn.alert({'tip': data.state+":"+data.errMsg});
                }
            }
        }
    }
}
/*end 注册 phone function */

//下一步弹出图片验证码
function toImgCode() {
    if ($(".all_page").parent().hasClass("hide")) {
        $(".all_page").parent().removeClass("hide");
        $(".all_page").parent().siblings().addClass("hide");
    }
    $(".all_page").animate({top: 0}, 300).animate({"top": "-20px"}, 200).animate({"top": 0}, 200);
    getImgVerify();
}

/*忘记密码 phone function*/
function toVerifyPhoneFw() {
    showLoading();
    var username = $("#phone_fw").val();
    username = username.NoSpace();
    var captcha_key = $("#captcha_key").val();
    var captcha_value = $("#verity_code").val();
    $.ajax({
        url: " https://proxy.jucaidao.com/jucaidao/web/sso/forget-password/web",
        type: 'post',
        dataType: 'json',
        data: {username: username, captcha_key: captcha_key, captcha_value: captcha_value},
        success: function (data) {
            hideLoading();
            if (data.statusCode == 200) {
                //alert(JSON.stringify(data));
                $("#intl_code").val(data.data.intl_code);
                $("#forget_pwd_phone").addClass("hide");
                $("#verify_phone_fw").removeClass("hide");
                $("#verify_phone_fw header h1").html(username.AddSpace());
                i = 61;
                intervalPhone2 = setInterval("countDownPhone2()", 1000);
            } else if (data.errCode == 100) {//can not find this user
                $.fn.alert({'tip': '该号码未注册'});
            } else {
                //alert(JSON.stringify(data));
                if(data.errCode){
                    if(data.msg){
                        $.fn.alert({'tip': data.errCode+":"+data.msg});
                    }else{
                        $.fn.alert({'tip': data.errCode+":"+data.errMsg});
                    }

                }else{
                    if(data.msg){
                        $.fn.alert({'tip': data.state+":"+data.msg});
                    }else{
                        $.fn.alert({'tip': data.state+":"+data.errMsg});
                    }
                }
            }
        },
        error:function(){
            $.fn.alert({'tip': '服务器错误，请稍后重试'});
        }
    });
}
function toSetPwdPhone() {
    $("#set_pwd_phone").removeClass("hide");
    $("#verify_phone_fw").addClass("hide");
}
function toLogin() {
    showLoading();
    var phone = $("#phone_fw").val().NoSpace();
    var intl_code = $("#intl_code").val();
    var password = $("#password").val();
    var sms_code = $("#sms_code").val();
    $.ajax({
        url: "https://proxy.jucaidao.com/jucaidao/web/phone-reset-pass",
        type: 'put',
        dataType: 'json',
        data: {phone: phone, intl_code: intl_code, password: password, sms_code: sms_code},
        success: function (data) {
            hideLoading();
            if (data.statusCode == 200) {
                showSuccess("密码修改成功");
                setTimeout(function(){
                    window.location.href = "login_phone.html";
                },1500);
                /*$.fn.alert({
                    'tip': '密码修改成功', cancelCallback: function () {
                        window.location.href = "login_phone.html";
                    }
                });*/

            } else if (data.errCode == 1031) {
                $.fn.alert({'tip': '手机号或验证码错误'});
            } else {
                //alert(JSON.stringify(data));
                if(data.errCode){
                    if(data.msg){
                        $.fn.alert({'tip': data.errCode+":"+data.msg});
                    }else{
                        $.fn.alert({'tip': data.errCode+":"+data.errMsg});
                    }

                }else{
                    if(data.msg){
                        $.fn.alert({'tip': data.state+":"+data.msg});
                    }else{
                        $.fn.alert({'tip': data.state+":"+data.errMsg});
                    }
                }
            }
        },
        error:function(){
            $.fn.alert({'tip': '服务器错误，请稍后重试'});
        }
    });
}
/* end 忘记密码 function*/

function historyBack(){
//    alert('haha');
    window.history.back(-1);
}
/*login*/

function loginPhone() {
    showLoading();
    var user_name = $("#phone").val().NoSpace();
    var password = $("#password").val();
    var auth_token = $("#auth_token").val();
    var data = "user_name="+ user_name+ "&password="+ password+ "&auth_token="+ auth_token;
    //alert(data);
    var method = 'POST';
    var url = database+'/mimikj/user_deal/log_in';
    var xhr = new XMLHttpRequest();
    if ("withCredentials" in xhr) {
        xhr.open(method, url, true);
    } else if (typeof XDomainRequest != "undefined") {
        xhr = new XDomainRequest();
        xhr.open(method, url);
    }else{
        xhr = null;
    }
    if (!xhr) {
        $.fn.alert({'tip': '登录失败'});
        return false;
    }
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    xhr.send(data);
    xhr.onerror=function(){
        $.fn.alert({'tip': '服务器错误，请稍后重试'});
        return false;
    }
    xhr.onload = function(){
        hideLoading();
        //alert(xhr.responseText);
        var data = JSON.parse(xhr.responseText);
        //alert(data);
        if (data.msg == "identity_card_is_not_verified") {
            $.fn.alert({
                'tip': '身份证号码未验证', cancelCallback: function () {
                    $("#verify_identity_phone").siblings().addClass("hide");
                    $("#verify_identity_phone").removeClass("hide");
                }
            });
        } else if (data.statusCode == 200&&data.state != "error") {
            //alert("success" + JSON.stringify(data));
            //console.log(JSON.stringify(data));
            //跳转回APP 取数据
            showSuccess("登录成功");
            setTimeout(function(){
                setupWebViewJavascriptBridge(function(bridge) {
                    //alert("success" + JSON.stringify(data));
                    data.user_name = user_name;
                    bridge.callHandler('loginInHandler', data, function(data) {
                        var responseData = data;
                        //alert("success" + JSON.stringify(data));
                        responseCallback(responseData)
                    })
                });
            },1500);
            /*setupWebViewJavascriptBridge(function(bridge) {
                //alert("success" + JSON.stringify(data));
                data.user_name = user_name;
                bridge.callHandler('loginInHandler', data, function(data) {
                    var responseData = data;
                    //alert("success" + JSON.stringify(data));
                    responseCallback(responseData)
                })
            });*/
        } else if (data.msg == "user_name_is_null") {
            //alert(JSON.stringify(data));
            $.fn.alert({'tip': '用户名为空'});
        } else if (data.msg == "password_is_null") {
            $.fn.alert({'tip': '密码为空'});
        } else if (data.msg == "login_user_already_bind_other_zmuser") {
            $.fn.alert2({'tip': '此账号已绑定其他众米登录账号，请注册新的聚财道交易账号',
                cancelBtnLbl: '关闭',
                confirmBtnLbl: '注册',
                confirmCallback: function(){
                    window.location = "register_phone.html"
                }});
        } else if (data.msg == "zmuser_already_bind_other_deal_user") {
            $.fn.alert2({'tip': '请使用注册绑定的聚财道交易账号进行登录',
                cancelBtnLbl: '关闭',
                confirmBtnLbl: '重新登录'});
        } else if (data.msg == "login_user_nobind_zmuser_and_zmuser_nobind") {
            $.fn.alert2({'tip': '此账号尚未绑定任何众米登录账号，是否绑定此众米登录账号',
                cancelBtnLbl: '关闭',
                confirmBtnLbl: '绑定',
                confirmCallback: function(){
                    //绑定众米
                    //alert(JSON.stringify(data));
                    var data = this.data;
                    var data = "user_name="+ user_name+ "&access_token="+ data.access_token+ "&auth_token="+ auth_token;
                    var method = 'POST';
                    var url = database+'/mimikj/user_deal/bind_user_deal';
                    var xhr = new XMLHttpRequest();
                    if ("withCredentials" in xhr) {
                        xhr.open(method, url, true);
                    } else if (typeof XDomainRequest != "undefined") {
                        // 否则检查是否支持XDomainRequest，IE8和IE9支持
                        // XDomainRequest仅存在于IE中，是IE用于支持CORS请求的方式
                        xhr = new XDomainRequest();
                        xhr.open(method, url);
                    }else{
                        xhr = null;
                    }
                    if (!xhr) {
                        $.fn.alert({'tip': '绑定失败'});
                        return false;
                    }
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
                    xhr.send(data);
                    xhr.onerror=function(){
                        $.fn.alert({'tip': '服务器错误，请稍后重试'});
                        return false;
                    }
                    xhr.onload = function(){
                        var e = JSON.parse(xhr.responseText);
                        //alert(e);
                        if(e.state=="success"){
                            showSuccess("绑定成功");
                            setTimeout(function(){
                                //传数据
                                setupWebViewJavascriptBridge(function(bridge) {
                                    //alert("success" + JSON.stringify(data));
                                    data.user_name = user_name;
                                    bridge.callHandler('loginInHandler', data, function(data) {
                                        var responseData = data;
                                        //alert("success" + JSON.stringify(data));
                                        responseCallback(responseData)
                                    })
                                });
                            },1500);
                            /*$.fn.alert({'tip': '绑定成功！',cancelCallback:function(){
                                //传数据
                                setupWebViewJavascriptBridge(function(bridge) {
                                    //alert("success" + JSON.stringify(data));
                                    data.user_name = user_name;
                                    bridge.callHandler('loginInHandler', data, function(data) {
                                        var responseData = data;
                                        //alert("success" + JSON.stringify(data));
                                        responseCallback(responseData)
                                    })
                                });
                            }});*/

                        }else if(e.msg=="identity_card_is_not_verified"){
                            $.fn.alert({'tip': '身份证未验证，请验证你的身份',cancelCallback:function(){
                                //alert(1);
                                $("#verify_identity_phone").siblings().addClass("hide");
                                $("#verify_identity_phone").removeClass("hide");
                            }});
                        }else if(e.msg=="user_name_is_null"){
                            $.fn.alert({'tip': '用户名为空'});
                        }else{
                            $.fn.alert({'tip': '绑定失败'});
                        }
                    }
            },data:data});
        } else if (data.errCode == 401) {
            $.fn.alert({'tip': '用户名或密码错误'});
        } else {
            //alert(JSON.stringify(data));
            if(data.errCode){
                if(data.msg){
                    $.fn.alert({'tip': data.errCode+":"+data.msg});
                }else{
                    $.fn.alert({'tip': data.errCode+":"+data.errMsg});
                }

            }else{
                if(data.msg){
                    $.fn.alert({'tip': data.state+":"+data.msg});
                }else{
                    $.fn.alert({'tip': data.state+":"+data.errMsg});
                }
            }
        }

    }
}
function verifyIdentityPhoneLogin() {
    showLoading();
    var auth_token = $("#auth_token").val();
    var user_name = $("#phone").val().NoSpace();
    var password = $(".password").val();
    var id_name = $("#id_name").val();
    var id_num = $("#id_num").val();
    if (id_name && id_num) {} else {
        $.fn.alert({'tip': '用户名或身份证号为空'});
        return false;
    }
    var data = "user_name="+ user_name+ "&password="+ password+ "&auth_token="+ auth_token+ "&id_name="+ id_name+ "&id_num="+ id_num;
    var method = 'POST';
    var url = database+'/mimikj/user_deal/auth_id_num';
    var xhr = new XMLHttpRequest();
    if ("withCredentials" in xhr) {
        xhr.open(method, url, true);
    } else if (typeof XDomainRequest != "undefined") {
        // 否则检查是否支持XDomainRequest，IE8和IE9支持
        // XDomainRequest仅存在于IE中，是IE用于支持CORS请求的方式
        xhr = new XDomainRequest();
        xhr.open(method, url);
    }else{
        xhr = null;
    }
    if (!xhr) {
        $.fn.alert({'tip': '身份证验证失败'});
        return false;
    }
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    xhr.send(data);
    xhr.onerror=function(){
        $.fn.alert({'tip': '服务器错误，请稍后重试'});
        return false;
    }
    xhr.onload = function(){
        hideLoading();
        var data = JSON.parse(xhr.responseText);
        if (data.statusCode == 200&&data.state!="error") {
            //alert("success" + JSON.stringify(data));
            //绑定众米并跳转回交易界面。 取数据
            data.guide = true;
            var responseData = data;
            showSuccess("身份证验证成功");
            setTimeout(function(){
                setupWebViewJavascriptBridge(function(bridge) {
                    bridge.callHandler('guideHandler', responseData, function(responseData) {
                        //alert(responseData);
                        responseCallback(responseData)
                    })
                });
                window.location.href = "golden_guide.html";//打开入金指引
            },1500);
            //$.fn.alert({
            //    'tip': '验证成功',
            //    cancelCallback: function() {
            //           //alert();
            //        //绑定众米并跳转回交易界面。 取数据
            //        setupWebViewJavascriptBridge(function(bridge) {
            //            bridge.callHandler('guideHandler', responseData, function(responseData) {
            //                //alert(responseData);
            //                responseCallback(responseData)
            //            })
            //        });
            //        window.location.href = "golden_guide.html";//打开入金指引
            //    }
            //});
            
        } else if(data.errCode==1219){
            //alert(JSON.stringify(data));
            $.fn.alert({'tip': '身份证验证失败'});
        }else {
            if(data.errCode){
                if(data.msg){
                    $.fn.alert({'tip': data.errCode+":"+data.msg});
                }else{
                    $.fn.alert({'tip': data.errCode+":"+data.errMsg});
                }

            }else{
                if(data.msg){
                    $.fn.alert({'tip': data.state+":"+data.msg});
                }else{
                    $.fn.alert({'tip': data.state+":"+data.errMsg});
                }
            }
        }

    }
}
/*end login*/
/*loading*/
//显示加载提示
function showLoading(msg) {
    var dh = getDocHeight();
    var dw = getDocWidth();
    $("#loading_area").height(dh);
    $("#loading_area").width(dw);
    $("#loading_area").show();
    if(msg==undefined){
        msg="";
    }
    $("#loading_messagehtml").html(msg);
    $("#loading_messagehtml").css("left",(dw-$("#loading_messagehtml").width())/2+"px");
    $("#loading_messagehtml").css("top",(dh-$("#loading_messagehtml").height())/2+"px");
    $("#loading_messagehtml").show();
}
//隐藏加载提示
function hideLoading() {
    $("#loading_area").hide();
    $("#loading_messagehtml").hide();
}

//显示登录成功
function showSuccess(msg){
    var html = '<div id="success_messagehtml" class="success_messagehtml"></div>';
    $(html).appendTo($("body"));
    $("#success_messagehtml").html(msg).fadeIn();
    setTimeout(function () {
        $("#success_messagehtml").fadeOut();
    }, 1000);
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
/*end loading*/
$(function () {
    //密码可见与否
    $(".login_turn_pwd").click(function () {
        var $this = $(this);
        $this.toggleClass("login_show_pwd");
        $this.toggleClass("login_hide_pwd");
        if ($this.hasClass("login_show_pwd")) {
            $(".password").attr("type", "text");
        } else {
            $(".password").attr("type", "password");
        }
    });
  setupWebViewJavascriptBridge(function(bridge){
    bridge.registerHandler('tokenHandler', function(object, responseCallback) {
        $("#auth_token").val(object.auth_token);
        if(object.phone) {
            $("#login_phone #phone,#forget_pwd_phone .phone").val(object.phone);
            $("#to_verify_phone_fw").addClass("btn_red").removeAttr("disabled");
        }
//        alert(object.login_phone + ":" + $("#login_phone").val());
    })
  });
});

function setupWebViewJavascriptBridge(callback) {
    if (window.WebViewJavascriptBridge) { return callback(WebViewJavascriptBridge); }
    if (window.WVJBCallbacks) { return window.WVJBCallbacks.push(callback); }
    window.WVJBCallbacks = [callback];
    var WVJBIframe = document.createElement('iframe');
    WVJBIframe.style.display = 'none';
    WVJBIframe.src = 'wvjbscheme://__BRIDGE_LOADED__';
    document.documentElement.appendChild(WVJBIframe);
    setTimeout(function() { document.documentElement.removeChild(WVJBIframe) }, 0)
}

//展示隐藏 服务协议
function showAgreement(){
    if($("#register-agreement1").hasClass("hide")){
        $("#register-agreement1").removeClass("hide");
    }else{
        $("#register-agreement1").addClass("hide");
    }
}
//展示隐藏 服务协议
function showAgreement2(){
    if($("#regiter-agreement2").hasClass("hide")){
        $("#regiter-agreement2").removeClass("hide");
    }else{
        $("#regiter-agreement2").addClass("hide");
    }
}
