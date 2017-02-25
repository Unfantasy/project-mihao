/**
 * Created by zm on 2016/1/14.
 */

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
                var HTML = '<div style="background:#000;opacity:.5;position:fixed;z-index:99999;left:0px;top:0px;width:100%;height:100%;"></div><div style="background-color: #fff;width: 80%;margin: auto;position: fixed;left: 50%;top: 50%;-webkit-transform:translate(-50%,-50%);-moz-transform:translate(-50%,-50%);transform:translate(-50%,-50%);text-align: center;border-radius: 5px;z-index:100000;display:table;"><div style="display:table;width:100%;border-bottom:1px solid #aaa;"><span style="display:table-cell;height:1.5rem;line-height:1.2;vertical-align:middle;text-align:center;font-size:.5rem;color:#000;padding-left:10px;">' + settings.tip + '</span></div><div style="display:table;width:100%;"><span style="display:table-cell;height:1.5rem;line-height:1.2;vertical-align:middle;color:#000;font-size:.5rem;" id="alertBtn">' + settings.cancelBtnLbl + '</span></div></div>';
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
                var HTML = '<div style="background:#000;opacity:.5;position:fixed;z-index:99999;left:0px;top:0px;width:100%;height:100%;font-size:.5rem"></div><div style="font-size:.5rem;background-color: #fff;width: 80%;margin: auto;position: fixed;left: 50%;top: 50%;-webkit-transform:translate(-50%,-50%);-moz-transform:translate(-50%,-50%);transform:translate(-50%,-50%);text-align: center;border-radius: 5px;z-index:100000;display:table;"><div style="display:table;width:100%;border-bottom:1px solid #aaa;"><span style="display:table-cell;height:1.5rem;line-height:1.2;vertical-align:middle;text-align:center;font-size:.5rem;color:#000;padding-left:10px;">' + settings.tip + '</span></div><div style="display:table;width:100%;"><span style="display:table-cell;height:1.5rem;line-height:1.2;vertical-align:middle;color:#000;" id="alertBtn">' + settings.cancelBtnLbl + '</span><span style="display:table-cell;height:1.5rem;line-height:1.2;vertical-align:middle;border-left:1px solid #EAEAEA;color:#000;">' + settings.confirmBtnLbl + '</span></div></div>';
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
    return obj == "";
}

//电话号码验证
function isnum(obj) {
    var reg = /^1[0-9]{10}$/;
    if (!reg.test(obj.value.NoSpace())) {
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
                //alert(JSON.stringify(data))
                $.fn.alert({
                    'tip': '该手机号已注册',
                    cancelCallback: function() {
                        //确定后的操作
                        $("#register_phone").siblings().addClass("hide");
                        $("#register_phone").removeClass("hide");
                    }
                });

            } else {
                $.fn.alert({'tip': data.errCode+":"+data.errMsg});
            }
        }
    })
}

function registerForPhone() {
    showLoading();
    var auth_code = $("#auth_code").val();
    var sms_code = $("#verification_code").val();
    var phone = $("#phone").val().NoSpace();
    var auth_token = $("#auth_token").val();
    var data = "auth_code="+ auth_code+ "&sms_code="+ sms_code+ "&phone="+ phone+ "&auth_token="+ auth_token;
    var method = 'POST';
    var url = 'http://test.mimikj.com:6060/mimikj/user_deal/phone_auth';
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
        $.fn.alert({'tip': '注册失败'});
        return false;
    }
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    xhr.send(data);
    xhr.onload = function(){
        hideLoading();
        var data = JSON.parse(xhr.responseText);
        alert(JSON.stringify(data));
        if (data.statusCode == 200) {
            $("#verify_identity_phone").siblings().addClass("hide");
            $("#verify_identity_phone").removeClass("hide");
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
            //alert(JSON.stringify(data));
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
                $.fn.alert({'tip': data.errCode+":"+data.errMsg});
            }else{
                $.fn.alert({'tip': data.state+":"+data.msg});
            }
        }
    }


}
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
    var data = "auth_code="+ auth_code+ "&sms_code="+ sms_code+ "&phone="+ phone+ "&auth_token="+ auth_token+ "&id_name="+ id_name+ "&id_num="+ id_num;
    var method = 'POST';
    var url = 'http://test.mimikj.com:6060/mimikj/user_deal/auth_id_num';
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
    xhr.onload = function(){
        hideLoading();
        var data = JSON.parse(xhr.responseText);
        if (data.statusCode == 200) {
            //注册时身份证验证成功跳转入金指引页面 取数据
            window.location.href = "golden_guide.html";
        } else if(data.errCode==1219){
            $.fn.alert({'tip': '身份证验证失败'});
        } else {
            if(data.errCode){
                $.fn.alert({'tip': data.errCode+":"+data.errMsg});
            } else {
                $.fn.alert({'tip': data.state+":"+data.msg});
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
    var username = $("#phone_fw").val();
    username = username.NoSpace();
    var captcha_key = $("#captcha_key").val();
    var captcha_value = $("#verity_code").val();
    $.ajax({
        url: " https://api.jucaidao.com/web/sso/forget-password/web",
        type: 'post',
        dataType: 'json',
        data: {username: username, captcha_key: captcha_key, captcha_value: captcha_value},
        success: function (data) {
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
                $.fn.alert({'tip': data.errCode+":"+data.errMsg});
            }
        }
    });
}
function toSetPwdPhone() {
    $("#set_pwd_phone").removeClass("hide");
    $("#verify_phone_fw").addClass("hide");
}
function toLogin() {
    var phone = $("#phone_fw").val().NoSpace();
    var intl_code = $("#intl_code").val();
    var password = $("#password").val();
    var sms_code = $("#sms_code").val();
    $.ajax({
        url: " https://api.jucaidao.com/web/phone-reset-pass",
        type: 'put',
        dataType: 'json',
        data: {phone: phone, intl_code: intl_code, password: password, sms_code: sms_code},
        success: function (data) {
            if (data.statusCode == 200) {
                $.fn.alert({
                    'tip': '密码修改成功', cancelCallback: function () {
                        window.location.href = "login_phone.html";
                    }
                });

            } else if (data.errCode == 1031) {
                $.fn.alert({'tip': '手机号或验证码错误'});
            } else {
                //alert(JSON.stringify(data));
                $.fn.alert({'tip': data.errCode+":"+data.errMsg});
            }
        }
    });
}
/* end 忘记密码 function*/
/*login*/
function loginPhone() {
    showLoading()
    var user_name = $("#phone").val().NoSpace();
    var password = $("#password").val();
    var auth_token = $("#auth_token").val();
    var data = "user_name="+ user_name+ "&password="+ password+ "&auth_token="+ auth_token;
    var method = 'POST';
    var url = 'http://test.mimikj.com:6060/mimikj/user_deal/log_in';
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
        $.fn.alert({'tip': '登陆失败'});
        return false;
    }
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    xhr.send(data);
    xhr.onload = function(){
        hideLoading();
        var data = JSON.parse(xhr.responseText);
        if (data.msg == "identity_card_is_not_verified") {
            $.fn.alert({
                'tip': '身份证号码未验证', cancelCallback: function () {
                    $("#verify_identity_phone").siblings().addClass("hide");
                    $("#verify_identity_phone").removeClass("hide");
                }
            });
        } else if (data.statusCode == 200&&data.state != "error") {
            alert("success" + JSON.stringify(data));
            console.log(JSON.stringify(data));
            //跳转回APP 传数据
        } else if (data.msg == "user_name_is_null") {
            $.fn.alert({'tip': '用户名为空'});
        } else if (data.msg == "password_is_null") {
            $.fn.alert({'tip': '密码为空'});
        } else if (data.msg == "login_user_already_bind_other_zmuser") {
            $.fn.alert2({'tip': '此账号已绑定其他众米登陆账号，请注册新的聚财道交易账号',
                cancelBtnLbl: '关闭',
                confirmBtnLbl: '注册',
                confirmCallback: function(){
                    window.location = "register_phone.html"
                }});
        } else if (data.msg == "zmuser_already_bind_other_deal_user") {
            $.fn.alert2({'tip': '请使用注册绑定的聚财道交易账号进行登陆',
                cancelBtnLbl: '关闭',
                confirmBtnLbl: '重新登陆'});
        } else if (data.msg == "login_user_nobind_zmuser_and_zmuser_nobind") {
            $.fn.alert2({'tip': '此账号尚未绑定任何众米登陆账号，是否绑定此众米登陆账号',
                cancelBtnLbl: '关闭',
                confirmBtnLbl: '绑定',
                confirmCallback: function(){
                    //绑定众米
                    //alert(JSON.stringify(data));
                    var data = "user_name="+ user_name+ "&access_token="+ data.access_token+ "&auth_token="+ auth_token;
                    var method = 'POST';
                    var url = 'http://test.mimikj.com:6060/mimikj/user_deal/bind_user_deal';
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
                    xhr.onload = function(){
                        var e = JSON.parse(xhr.responseText);
                        if(e.state=="success"){
                            $.fn.alert({'tip': '绑定成功！'});
                            //传数据
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
                }});
        } else {
            //alert(JSON.stringify(data));
            $.fn.alert({'tip': '用户名或密码错误'});
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
    if (id_name && id_num) {

    } else {
        $.fn.alert({'tip': '用户名或身份证号为空'});
        return false;
    }
    var data = "user_name="+ user_name+ "&password="+ password+ "&auth_token="+ auth_token+ "&id_name="+ id_name+ "&id_num="+ id_num;
    var method = 'POST';
    var url = 'http://test.mimikj.com:6060/mimikj/user_deal/auth_id_num';
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
    xhr.onload = function(){
        hideLoading();
        var data = JSON.parse(xhr.responseText);
        if (data.statusCode == 200&&data.state!="error") {
            //alert("success" + JSON.stringify(data));
            $.fn.alert({
                'tip': '注册成功',
                cancelCallback: function() {
                    //绑定众米并跳转回交易界面。 取数据
                    login.setValue(JSON.stringify(data), user_name);
                    window.location.href = "golden_guide.html";
                }
            });
        } else if(data.errCode==1219){
            //alert(JSON.stringify(data));
            $.fn.alert({'tip': '身份证验证失败'});
        }else {
            if(data.errCode){
                $.fn.alert({'tip': data.errCode+":"+data.errMsg});
            }else{
                $.fn.alert({'tip': data.state+":"+data.msg});
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
});

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