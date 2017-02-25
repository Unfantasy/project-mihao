<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="imgBase" value="http://mimikj.com:8081/mimikj/images/"/>
<!DOCTYPE html>
<html style="height:100%;">
<head lang="en">
    <meta charset="UTF-8">
    <title>周比赛</title>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="${ctx }/css/usssg.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx }/js/usssg.js"></script>
    <script>
        //60s倒计时
        var i = 61;
        function countDownPhone() {
            if (i > 0) {
                i--;
                var str = i + "s";
                $(".count").html(str).unbind("click");

            } else {
                clearInterval(intervalPhone1);
                $(".count").html("重新获取").bind("click", getIndentifyCode);

            }
        }
        function getIndentifyCode() {
            var phone = $(".phone").val();
            if (phone == "") {
                $.fn.alert({tip: '请输入手机号码！'});
                return;
            }
            if (phone.length < 11) {
                $.fn.alert({tip: '手机号码格式不正确！'});
                return;
            }
            $.ajax({
                url: "${ctx }/users/send_sms?flag=1&phone=" + phone,
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    if (data.state == "success") {
                        i = 61;
                        countDownPhone();
                        intervalPhone1 = setInterval("countDownPhone()", 1000);
                    } else {
                        if (data.msg == "wrong_phone_num") {
                            $.fn.alert({tip: '手机号码格式错误！'});
                        } else if (data.msg == "user_phone_is_exist") {
                            $.fn.alert({tip: '手机号码已经存在！'});
                        } else
                            $.fn.alert({tip: '发送失败！'});
                    }
                }
            });
        }
        function sendData() {
            var phone = $(".phone").val();
            var password = $(".password").val();
            var identifyCode = $('.identify_code').val();
            if (phone == '') {
                $.fn.alert({tip: '手机号不能为空'});
                return false;
            }
            if (identifyCode == '') {
                $.fn.alert({tip: '验证码不能为空'});
                return false;
            }
            if (password == '') {
                $.fn.alert({tip: '密码不能为空'});
                return false;
            }
            $.ajax({
                url: "${ctx }/users/update_user_phone",
                type: 'post',
                data: {phone: phone, new_password: password, valid_code: identifyCode},
                dataType: 'json',
                success: function (data) {
                    if (data.state == "success") {
                        $("#body").removeClass("model_register");
                        $(".register_box").hide();
                        $.fn.alert({tip: '注册成功！'});
                    } else {
                        if (data.msg == "no_user") {
                            $.fn.alert({tip: '页码超时请重新登录！'});
                        } else if (data.msg == "wrong_phone_num") {
                            $.fn.alert({tip: '手机号码格式错误！'});
                        } else if (data.msg == "user_phone_is_exist") {
                            $.fn.alert({tip: '该号码已经注册，请下载众米APP参与模拟交易比赛！'});
                        } else if (data.msg == "no_valid_code" || data.msg == "verify_code_error") {
                            $.fn.alert({tip: '短信验证码错误！'});
                        } else if (data.msg == "valid_code_expires") {
                            $.fn.alert({tip: '短信验证码过期！'});
                        } else if (data.msg == "password_length_must_be_6_up") {
                            $.fn.alert({tip: '密码长度必须6位以上！'});
                        } else
                            $.fn.alert({tip: '注册失败！'});
                    }
                }
            });
        }
        function closeRegister() {
            $("#body").removeClass("model_register");
            $(".mask").hide();
            bindTouch();
        }

        function to_deal(flag) {
            if (login_state == "false") {
                $('.loading_area').hide();
                $('.loading_messagehtml').hide();
                $("#body").addClass("model_register");
                $(".mask").show();
                $(".usssg").unbind();
            } else {
                if (flag == 1) {
                    location.href = "${ctx }/dv_stock_deal/get_deal_stock_list";
                } else if (flag == 2) {
                    location.href = "${ctx }/dv_stock_deal/get_deal_ranking?flag=1";
                } else if (flag == 3) {
                    location.href = "${ctx }/dv_payview_deal_record/get_payview_record";
                } else if (flag == 4) {
                    location.href = "${ctx }/dv_stock_deal/get_buddy_ranking_list";
                }
            }
        }
        function bindTouch(){
            $(".usssg").on("touchstart", function (e) {
//                e.preventDefault();
                startX = e.originalEvent.changedTouches[0].pageX,
                        startY = e.originalEvent.changedTouches[0].pageY;
                Y = 0;
            });
            $(".usssg").on("touchmove", function (e) {
                e.preventDefault();
                moveEndX = e.originalEvent.changedTouches[0].pageX,
                        moveEndY = e.originalEvent.changedTouches[0].pageY,
                        X = moveEndX - startX,
                        Y = moveEndY - startY;
                $('.main').css('top', Y);

            });
            $(".usssg").on('touchend', function () {
                $('.main').animate({'top': 0});
                if (Y < -120) {
                    $('.loading_area').show();
                    $('.loading_messagehtml').show();
                    to_deal(1);
                    setTimeout(function () {
                        $('.loading_area').hide();
                        $('.loading_messagehtml').hide();
                    }, 10000);

                }
            });
        }
        var login_state = "${login_state}";
        $(function () {
            $("#body").removeClass("model_register");
            $(".mask").hide();
            bindTouch();
        });
    </script>
</head>
<body id="body" class="usssg model_register">
<div class="mask">
    <div class="register_box">
        <div class="register_text">
            <div class="register_title">注册众米账号</div>
            <div class="register_content">
                <ul>
                    <li><input type="tel" class="phone" placeholder="请输入手机号"/></li>
                    <li><input type="text" class="identify_code" placeholder="请输入验证码"/> <span class="count"
                                                                                              onclick="getIndentifyCode()">获取验证码</span>
                    </li>
                    <li><input type="password" class="password" placeholder="设置密码"/></li>
                    <li><input type="button" value="完成" onclick="sendData();"/></li>
                </ul>
            </div>
        </div>
        <div class="reverse" onclick="closeRegister()"></div>
    </div>
</div>
<div class="main">
    <section>
        <div class="rankingBox">
            <img src="${imgBase }${third_login.avatar}" class="usssgUserPhoto"/>

            <div>
                <c:choose>
                    <c:when test="${rankinginfo.ranking!=-1 }"><span class="ranking" id="ranking">${rankinginfo.ranking }</span>名
                    </c:when>
                    <c:otherwise>未参与 <span hidden>名</span></c:otherwise>
                </c:choose>
                <p>当前排名</p>
            </div>
        </div>
        <div class="all_rank"><a href="javascript:void(0);" onclick="to_deal(2);">全部排名</a></div>
        <div class="flexBox">
            <div class="flex3">
                <div class="goal"></div>
                <p><span id="goal"><fmt:formatNumber value="${rankinginfo.score }" pattern="#0"/></span>分</p>
            </div>
            <div class="flex3">
                <div class="money"></div>
                <p><c:if test="${rankinginfo.reward!='众星卡' }">￥</c:if><span id="money">${rankinginfo.reward }</span></p>
            </div>
            <div class="flex3">
                <div class="last_time"></div>
                <p><span id="lastTime">${rankinginfo.end_date }</span></p>
            </div>
        </div>
        <c:if test="${login_state=='true'}">
            <a href="javascript:void(0);" class="friendRanking" onclick="to_deal(4)">与好友之间的比赛，第<span>${rankinginfo.ranking_in_buddy }</span>名
            	<img src="${ctx }/images/touxiangdian.png" class="friendImg"/>
                <c:forEach var="b_ranking" items="${rankinginfo.buddy_ranking }">
                    <img src="${imgBase }${b_ranking.avatar}" class="friendImg"/>
                </c:forEach>
            </a>
        </c:if>
        <a href="http://mihaokj.com/html/trade_rule_web.html" class="ruleTip">交易规则提示</a>
        <a href="javascript:void(0);" class="remind" onclick="to_deal(3);"></a>

        <div class="wechatLead" hidden="" onclick="hide(this)"></div>
    </section>
    <footer>

    </footer>
</div>
<div id="loading_area" class="loading_area"></div>
<div id="loading_messagehtml" class="loading_messagehtml"></div>
</body>
</html>