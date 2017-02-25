/**
 * Created by zm on 2016/8/24.
 */
var DOMAIN = 'https://mimikj.com/mimikj';
//根据浏览器判断是否是IOS
var u = navigator.userAgent, app = navigator.appVersion;
var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
//移动端约束
(function(doc, win) {
    var docEl = doc.documentElement,
        resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
        recalc = function() {
            var clientWidth = docEl.clientWidth;
            if (!clientWidth) return;
            docEl.style.fontSize = 20 * (clientWidth / 300) + 'px';
        };

    if (!doc.addEventListener) return;
    win.addEventListener(resizeEvt, recalc, false);
    doc.addEventListener('DOMContentLoaded', recalc, false);
})(document, window);

//根据URL获取参数
var src = window.location.search; //获取url中"?"符后的字串
var theRequest = new Object();
if (src.indexOf("?") != -1) {
    var str = src.substr(1);
    strs = str.split("&");
    for (var i = 0; i < strs.length; i++) {
        theRequest[strs[i].split("=")[0]] = decodeURI(strs[i].split("=")[1]);
    }
}
var msg_code = theRequest['message_code']||'';
var text = '';
var seconds = theRequest['time']||15;//默认15s阅后即焚
//固定秒数后关闭页面
function closeHtml(s){
    var t = setInterval(function(){
        s--;
        if(s==0){
            clearInterval(t);
//                    window.close();
            $(".game_time").remove();
            $("#txt").remove();
            $('.after_look').show();
        }
    },1000);
}
//圆形倒计时
i = 0;
j = 0;
count = 0;
MM = 0;
SS = 60;  // 秒 90s
MS = 0;
totle = (MM+1)*600;
d = 180*(MM+1);
MM = "0" + MM;
var gameTime = 15;
//count down
var showTime = function(){
    totle = totle - 1;
    if (totle == 0) {
        clearInterval(s);
        clearInterval(t1);
        clearInterval(t2);
        $(".pie2").css("-o-transform", "rotate(" + d + "deg)");
        $(".pie2").css("-moz-transform", "rotate(" + d + "deg)");
        $(".pie2").css("-webkit-transform", "rotate(" + d + "deg)");
    } else {
        if (totle > 0 && MS > 0) {
            MS = MS - 1;
            if (MS < 10) {
                MS = "0" + MS
            }
        }
        if (MS == 0 && SS > 0) {
            MS = 10;
            SS = SS - 1;
            if (SS < 10) {
                SS = "0" + SS
            }
        }
        if (SS == 0 && MM > 0) {
            SS = 60;
            MM = MM - 1;
            if (MM < 10) {
                MM = "0" + MM
            }
        }
    }
    $(".time").html(SS);
};

var start1 = function(){
    //i = i + 0.6;
    i = i + 360/((gameTime)*10);  //旋转的角度  90s 为 0.4  60s为0.6
    count = count + 1;
    if(count <= (gameTime/2*10)){  // 一半的角度  90s 为 450

        $(".pie1").css("-o-transform","rotate(" + i + "deg)");
        $(".pie1").css("-moz-transform","rotate(" + i + "deg)");
        $(".pie1").css("-webkit-transform","rotate(" + i + "deg)");
    }else{
        $(".pie2").css("backgroundColor", "#fff");
        $(".pie2").css("-o-transform","rotate(" + i + "deg)");
        $(".pie2").css("-moz-transform","rotate(" + i + "deg)");
        $(".pie2").css("-webkit-transform","rotate(" + i + "deg)");
    }
};

var start2 = function(){
    j = j + 0.6;
    count = count + 1;
    if (count == 300) {
        count = 0;
        clearInterval(t2);
        t1 = setInterval("start1()", 100);
    }
    $(".pie2").css("-o-transform","rotate(" + j + "deg)");
    $(".pie2").css("-moz-transform","rotate(" + j + "deg)");
    $(".pie2").css("-webkit-transform","rotate(" + j + "deg)");
}

var countDown = function() {
    //80*80px 时间进度条
    i = 0;
    j = 0;
    count = 0;
    MM = 0;
    SS = gameTime;
    MS = 0;
    totle = (MM + 1) * gameTime * 10;
    d = 180 * (MM + 1);
    MM = "0" + MM;

    showTime();

    s = setInterval("showTime()", 100);
    start1();
    //start2();
    t1 = setInterval("start1()", 100);
};
//打开APP方法
var parameters = '';
if(src.indexOf("?")!=-1){
    var parameters = src.substring(src.indexOf("?"));
}
var configIos = {
    scheme: 'zhongmiCode://space/'+parameters,
    path: 'https://itunes.apple.com/us/app/zhong-mi/id946857722?l=zh&ls=1&mt=8'
};
var configAdr = {
    scheme: 'zhongmicode://space/'+parameters,
    path: 'http://mimikj.com:8081/mimikj/app/zhongmiApp.apk'
};
var pc_path = 'http://mimikj.com:8081/mimikj/app/zhongmiApp.apk';

//doc加载完成初始化数据
$(document).ready(function() {
    init_argument();
});

/**
 浏览器版本信息
 * @type {Object}
 * @return {Boolean}  返回布尔值
 */
function browser(){
    var u = window.navigator.userAgent.toLowerCase();
    var app = navigator.appVersion.toLowerCase();
    return {
        txt: u, // 浏览器版本信息
        version: (u.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/) || [])[1], // 版本号
        msie: /msie/.test(u) && !/opera/.test(u), // IE内核
        mozilla: /mozilla/.test(u) && !/(compatible|webkit)/.test(u), // 火狐浏览器
        safari: /safari/.test(u) && !/chrome/.test(u), //是否为safair
        chrome: /chrome/.test(u), //是否为chrome
        opera: /opera/.test(u), //是否为oprea
        presto: u.indexOf('presto/') > -1, //opera内核
        webKit: u.indexOf('applewebkit/') > -1, //苹果、谷歌内核
        gecko: u.indexOf('gecko/') > -1 && u.indexOf('khtml') == -1, //火狐内核
        mobile: !!u.match(/applewebkit.*mobile.*/), //是否为移动终端
        ios: !!u.match(/\(i[^;]+;( u;)? cpu.+mac os x/), //ios终端
        android: u.indexOf('android') > -1, //android终端
        iPhone: u.indexOf('iphone') > -1, //是否为iPhone
        iPad: u.indexOf('ipad') > -1, //是否iPad
        webApp: !!u.match(/applewebkit.*mobile.*/) && u.indexOf('safari/') == -1, //是否web应该程序，没有头部与底部
        weiXin:u.match(/MicroMessenger/i) == 'micromessenger'
    };
}

//页面参数信息体
var config = {
    scheme: '',
    path: '',
    device:{
        weixin:false,
        ios:false,
        android:false,
        other:false
    }
};

function init_argument() {
    var b=browser();

    if (b.weiXin) {
        config.device.weixin = true;
    }

    if(b.ios||b.iPhone||b.iPad){
        config.scheme = configIos.scheme;//初始化替换
        config.path = configIos.path;//初始化替换
        config.device.ios = true;

    }else if(b.android){
        config.scheme = configAdr.scheme;//初始化替换
        config.path = configAdr.path;//初始化替换
        config.device.android = true;
    }else {
        //非客户端浏览器打开
        config.device.other = true;
        config.path = pc_path;
    }
}

function open_appstore() {
    window.location= config.path;
}

function open_client() {
    //alert('open_client');

    if (config.device.weixin || config.device.other) {
        //alert('1'+JSON.stringify(config));
        open_hint_ui();
    } else {
        //alert('2'+JSON.stringify(config));
        window.location=config.scheme;
    }

}


//非客户端浏览器打开页面
function open_hint_ui() {

    $(".notice_mark").click(function(){
        $(".notice_mark,.notice_img").hide();
    });
    if(config.device.ios){
        //alert('ios ui');
        $(".notice_mark,.notice_img").show();
    }else if(config.device.android){
        $(".notice_mark,.notice_img").show();
    }else {
        open_appstore();
        //非客户端浏览器打开
        //$(".notice_mark,.notice_img").show();
    }
}

function hideThis(e){
    $('.notice_img').hide();
    $(".notice_mark").hide();
}

//ajax获取内容
function getReadContent(){
    //data = {msg_code:msg_code,auth_token:'mixunTokenoRj6AoOXbiP3u'};
    $.ajax({
       url:DOMAIN+'/burn_after_reading/read_msg?msg_code='+msg_code+'&auth_token=mixunTokenoRj6AoOXbiP3u',
        type:'get',
        dataType:'json',
        success:function(data){
            //alert(JSON.stringify(data));
            if(data.state == 'success'){
                text = data.result;

                //alert('t:'+text);
                //解码
                text = decodeURI(decodeURIComponent(escape(window.atob(text))));
                //alert(text);
                if(!isiOS){
                    text = text.replace(/\+/g,"&nbsp;");
                    text  = text.replace(/%2B+/g,"+");
                }
                text = text.replace(/\n/g,'<br>');
                //alert(text);
                $(".game_time").show();
                var p = document.getElementById('txt');
                p.innerHTML = text;
                //单行的话居中
                var lineHeight = 1.5*$("#txt").css('fontSize').replace(/[^0-9]/ig,"");
                if($("#txt").height()<=lineHeight){
                    $("#txt").css('text-align','center');
                }
                gameTime = seconds;
                closeHtml(seconds);
                countDown();
            }else if (data.msg =='no_user'){
                $(".game_time").hide();
                $("#txt").remove();
                alert(data.msg_desc);
                $('.after_look').show();
                $('.fixTab').show();
            }  else if (data.msg =='msg_code_is_null'){
                $(".game_time").hide();
                $("#txt").remove();
                alert(data.msg_desc);
                $('.after_look').show();
                $('.fixTab').show();
            } else if (data.msg =='msg_code_is_error'){
                $(".game_time").hide();
                $("#txt").remove();
                $('.after_look').show();
                $('.fixTab').show();
            }else{
                alert(JSON.stringify(data));
                $(".game_time").hide();
                $("#txt").remove();
                $('.after_look').show();
                $('.fixTab').show();
            }
        },
        error:function(e){
            alert(JSON.stringify(e));
        }
    });
}
window.addEventListener("DOMContentLoaded", function(){
    document.getElementById("openApp").addEventListener('click',open_client,false);
}, false);
$(function(){
    getReadContent();
});
