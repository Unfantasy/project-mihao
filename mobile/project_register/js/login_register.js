/**
 * Created by zm on 2016/1/14.
 */

(function() {

    $.extend($.fn, {

        //提示框组件
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
                var HTML = '<div style="background:#000;opacity:.5;position:fixed;z-index:99999;left:0px;top:0px;width:100%;height:100%;"></div><div style="background-color: #fff;width: 80%;margin: auto;position: fixed;left: 50%;top: 50%;-webkit-transform:translate(-50%,-50%);-moz-transform:translate(-50%,-50%);transform:translate(-50%,-50%);text-align: center;border-radius: 5px;z-index:100000;display:table;"><div style="display:table;width:100%;border-bottom:1px solid #aaa;"><span style="display:table-cell;height:50px;line-height:50px;vertical-align:middle;text-align:center;font-size:16px;color:#000;padding-left:10px;">' + settings.tip + '</span></div><div style="display:table;width:100%;"><span style="display:table-cell;height:50px;line-height:50px;vertical-align:middle;" id="alertBtn">' + settings.cancelBtnLbl + '</span></div></div>';
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
        url: "https://tb2devapi.trubuzz.com/captcha?t=" + time,
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
    var time = new Date().getTime();
    var phone = $("#phone").val();
    phone = phone.NoSpace();
    var password = $("#password").val();
    var imgCode = $("#verity_code").val();
    var captcha_key = $("#captcha_key").val();
    var client_id = "2MBy2FRYkaEXBYDYdAljjCbQROudlwDlWrqIQbDZ";
    var agency = "MI-US-STK";
    $.ajax({
        url: "https://tb2devapi.trubuzz.com/bgate/register",
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
                $.fn.alert({'tip': data.errCode+":"+data.errMsg});
            }
        },
        error:function(){}
    })
}

function registerForPhone() {
    var auth_code = $("#auth_code").val();
    var sms_code = $("#verification_code").val();
    var phone = $("#phone").val().NoSpace();
    var auth_token = $("#auth_token").val();
    $.ajax({
        url: "http://121.41.22.169:6060/mimikj/user_deal/phone_auth",
        type: 'post',
        dataType: 'jsonp',
        data: {auth_code: auth_code, sms_code: sms_code, phone: phone, auth_token: auth_token},
        success: function (data) {
            //alert(JSON.stringify(data));
            if (data.statusCode == 200) {
                //
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
            } else {
                if(data.errCode){
                    $.fn.alert({'tip': data.errCode+":"+data.errMsg});
                }else{
                    $.fn.alert({'tip': data.state+":"+data.msg});
                }
            }
        }
    });

}
function verifyIdentityPhoneRegister() {
    var auth_token = $("#auth_token").val();
    var user_name = $("#phone").val();
    var password = $(".password").val();
    var id_name = $("#id_name").val();
    var id_num = $("#id_num").val();
    if (id_name && id_num) {} else {
        $.fn.alert({'tip': '用户名或身份证号为空'});
        return false;
    }
    $.ajax({
        url: "http://121.41.22.169:6060/mimikj/user_deal/auth_id_num",
        type: "post",
        dataType: "jsonp",
        data: {id_name: id_name, id_num: id_num, auth_token: auth_token, user_name: user_name, password: password},
        success: function (data) {
            if (data.statusCode == 200) {
                //alert("success" + JSON.stringify(data));

                window.location.href = "golden_guide.html";
            } else if(data.errCode==1219){
                $.fn.alert({'tip': '身份证验证失败'});
            }else {
                if(data.errCode){
                    $.fn.alert({'tip': data.errCode+":"+data.errMsg});
                }else{
                    $.fn.alert({'tip': data.state+":"+data.msg});
                }
            }
        }
    });
}
/*end 注册 phone function */
/*register mail function*/
function toVerifyMailbox() {
    var agency = $("#agency").val();
    var client_id = $("#client_id").val();
    var email = $(".mailbox").val();
    email = email.NoSpace();
    var captcha_key = $("#captcha_key").val();
    var imgCode = $("#verity_code").val();
    var password = $("#password").val();
    $.ajax({
        url: "https://tb2devapi.trubuzz.com/bgate/register",
        type: 'post',
        dataType: 'json',
        data: {
            email: email,
            agency: agency,
            client_id: client_id,
            captcha_key: captcha_key,
            captcha_value: imgCode,
            password: password
        },
        success: function (data) {
            if (data.statusCode == 200) {
                //alert(JSON.stringify(data));
                //console.log(JSON.stringify(data));
                $("#set_pwd_mailbox").addClass("hide");
                $("#verify_mailbox .mark").html(email);
                $("#verify_mailbox").removeClass("hide");
            } else if (data.errCode == 300) {
                alert("验证码校验失败");
            } else if (data.errCode == 1012) {
                alert("该邮箱已注册");
            } else {
                alert(data.errMsg);
            }
        }
    });
}
/* end register mail function*/
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
        url: " https://tb2devapi.trubuzz.com/web/sso/forget-password/web",
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
        url: " https://tb2devapi.trubuzz.com/web/phone-reset-pass",
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
/*忘记密码 email function*/
function toVerifyMailFw() {
    var username = $("#mail_fw").val();
    username = username.NoSpace();
    $.ajax({
        url: " https://tb2devapi.trubuzz.com/web/sso/forget-password/web",
        type: 'post',
        dataType: 'json',
        data: {username: username},
        success: function (data) {
            if (data.statusCode == 200) {
                alert(JSON.stringify(data));
            }
        }
    })
}
/* end 忘记密码 email function*/
/*login*/
function loginPhone() {
    var user_name = $("#phone").val().NoSpace();
    var password = $("#password").val();
    var auth_token = $("#auth_token").val();
    $.ajax({
        url: "http://121.41.22.169:6060/mimikj/user_deal/log_in",
        type: "post",
        dataType: "jsonp",
        data: {user_name: user_name, password: password, auth_token: auth_token},
        success: function (data) {
            if (data.msg == "identity_card_is_not_verified") {
                $.fn.alert({
                    'tip': '身份证号码未验证', cancelCallback: function () {
                        $("#verify_identity_phone").siblings().addClass("hide");
                        $("#verify_identity_phone").removeClass("hide");
                    }
                });
            } else if (data.statusCode == 200) {
                //alert("success" + JSON.stringify(data));
                //console.log(JSON.stringify(data));
                //跳转回APP
            } else if (data.msg == "user_name_is_null") {
                $.fn.alert({'tip': '用户名为空'});
                alert("用户名为空");
            } else if (data.msg == "password_is_null") {
                $.fn.alert({'tip': '密码为空'});
            } else {
                //alert(JSON.stringify(data));
                $.fn.alert({'tip': '用户名或密码错误'});
            }
        }
    });
}
function verifyIdentityPhoneLogin() {
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
    $.ajax({
        url: "http://121.41.22.169:6060/mimikj/user_deal/auth_id_num",
        type: "post",
        dataType: "jsonp",
        data: {id_name: id_name, id_num: id_num, auth_token: auth_token, user_name: user_name, password: password},
        success: function (data) {
            if (data.statusCode == 200) {
                //alert("success" + JSON.stringify(data));
                window.location.href = "golden_guide.html";
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
    });
}
/*end login*/
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