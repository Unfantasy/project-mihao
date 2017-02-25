/**
 * Created by zm on 2016/10/17.
 */
//判断是否是IOS
var u = navigator.userAgent, app = navigator.appVersion;
var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //android终端或者uc浏览器
var isIOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
//移动端控制
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
//判断是否是手机页面
function isMobile() {
    if((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i)))
        return true;
    else
        return false;

}
// JavaScript 加载文件
function loadjscssfile(filename,filetype){

    if(filetype == "js"){
        var fileref = document.createElement('script');
        fileref.setAttribute("type","text/javascript");
        fileref.setAttribute("src",filename);
    }else if(filetype == "css"){

        var fileref = document.createElement('link');
        fileref.setAttribute("rel","stylesheet");
        fileref.setAttribute("type","text/css");
        fileref.setAttribute("href",filename);
    }
    if(typeof fileref != "undefined"){
        document.getElementsByTagName("head")[0].appendChild(fileref);
    }

}
//网址获取参数
var src = window.location.search; //获取url中"?"符后的字串
var theRequest = new Object();
if (src.indexOf("?") != -1) {
    var str = src.substr(1);
    strs = str.split("&");
    for (var i = 0; i < strs.length; i++) {
        theRequest[strs[i].split("=")[0]] = decodeURI(strs[i].split("=")[1]);
    }
}
//提示框
function showTip(msg,callback,time){
    var html = '<div id="success_messagehtml" class="success_messagehtml"></div>';
    if(isNaN(time)){
        time = 1000;
    }
    $(html).appendTo($("body"));
    $("#success_messagehtml").html(msg).fadeIn();
    setTimeout(function () {
        $("#success_messagehtml").fadeOut();
        if(callback)
        callback();
    }, time);
}
//加载框
//显示加载提示
function showLoading(msg) {
    var dh = getDocHeight();
    var dw = getDocWidth();
    var loading_area =  '<div id="loading_area" class="loading_area"></div>';
    var loading_messagehtml = '<div id="loading_messagehtml" class="loading_messagehtml"></div>';
    $(loading_area).appendTo($("body"));
    $(loading_messagehtml).appendTo($("body"));
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
//ios 桥接
function setupWebViewJavascriptBridge(callback) {
    if (window.WebViewJavascriptBridge) {
        return callback(WebViewJavascriptBridge);
    }
    if (window.WVJBCallbacks) {
        return window.WVJBCallbacks.push(callback);
    }
    window.WVJBCallbacks = [callback];
    var WVJBIframe = document.createElement('iframe');
    WVJBIframe.style.display = 'none';
    WVJBIframe.src = 'wvjbscheme://__BRIDGE_LOADED__';
    document.documentElement.appendChild(WVJBIframe);
    setTimeout(function () {
        document.documentElement.removeChild(WVJBIframe)
    }, 0)
}

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
