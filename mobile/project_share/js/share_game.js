/**
 * Created by zm on 2016/5/17.
 */
var dpr, rem, scale;
var docEl = document.documentElement;
var fontEl = document.createElement('style');
var metaEl = document.querySelector('meta[name="viewport"]');
dpr = window.devicePixelRatio || 1;
rem = docEl.clientWidth * dpr / 10;
scale = 1 / dpr;
// 设置viewport，进行缩放，达到高清效果
metaEl.setAttribute('content', 'width=' + dpr * docEl.clientWidth + ',initial-scale=' + scale + ',maximum-scale=' + scale + ', minimum-scale=' + scale + ',user-scalable=no');
// 设置data-dpr属性，留作的css hack之用
docEl.setAttribute('data-dpr', dpr);
// 动态写入样式
docEl.firstElementChild.appendChild(fontEl);
fontEl.innerHTML = 'html{font-size:' + rem + 'px!important;}';
// 给js调用的，某一dpr下rem和px之间的转换函数
window.rem2px = function(v) {
    v = parseFloat(v);
    return v * rem;
};
window.px2rem = function(v) {
    v = parseFloat(v);
    return v / rem;
};
window.dpr = dpr;
window.rem = rem;

function hide(e){
    $(e).attr("hidden","true");
}
function wechatTip(){
    if(is_weixn()){
        $(".wechatLead").removeAttr("hidden");
    }
}
//是否是在微信浏览器里面
function is_weixn(){
    var ua = navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i)=="micromessenger") {
        return true;
    } else {
        return false;
    }
}

//判断是否是手机页面
function isMobile() {
    if((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i)))
        return true;
    else
        return false;

}
//判断是否是IOS
var u = navigator.userAgent, app = navigator.appVersion;
var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
$(function(){
        var xx,yy,XX,YY,swipeX,swipeY,bodyEle;
        bodyEle = $("body")[0];
        bodyEle.addEventListener('touchstart',function(event){
            xx = event.targetTouches[0].screenX ;
            yy = event.targetTouches[0].screenY ;
            swipeX = true;
            swipeY = true ;
        });
        bodyEle.addEventListener('touchmove',function(event){
            XX = event.targetTouches[0].screenX ;
            YY = event.targetTouches[0].screenY ;
            if(swipeX && Math.abs(XX-xx)-Math.abs(YY-yy)>0)  //左右滑动
            {
                event.stopPropagation();//组织冒泡
                event.preventDefault();//阻止浏览器默认事件
                swipeY = false ;
                //左右滑动
            }
            else if(swipeY && Math.abs(XX-xx)-Math.abs(YY-yy)<0){  //上下滑动
                swipeX = false ;
                //上下滑动，使用浏览器默认的上下滑动
            }
        });

    var download = document.getElementById("download");
    if(isiOS){
        download.href = "https://itunes.apple.com/us/app/zhong-mi/id946857722?l=zh&ls=1&mt=8";
    }else{
        download.href = "http://mimikj.com:8081/mimikj/app/zhongmiApp.apk";
    }
    $('#share_shave').eraser('reset');
    $('#share_shave').eraser( {
        size:60,
        completeRatio: .5,
        completeFunction: showResetButton
    });
    var usernameEle = document.getElementsByTagName("title")[0];
    var timer = setInterval('isCompleteCanvas()',200);
});
function isCompleteCanvas(){
    if($('canvas').length>0){
        clearInterval('timer');
        //网址获取参数并注入
        var username,ranking,goal,money,lastTime,rankingEle,usernameEle,goalEle,lastTimeEle;
        var theRequest = new Object();
var src = window.location.search; //获取url中"?"符后的字串
//        var src= "?username=名侦探柯&ranking=未参与1&goal=500&money=￥200&lastTime=3月20日";
        if (src.indexOf("?") != -1) {
            var str = src.substr(1);
            strs = str.split("&");
            for (var i = 0; i < strs.length; i++) {
                theRequest[strs[i].split("=")[0]] = decodeURI(strs[i].split("=")[1]);
            }
        }
        usernameEle = document.getElementsByTagName("title")[0];
        rankingEle = document.getElementById("ranking");
        goalEle = document.getElementById("goal");
        moneyEle = document.getElementById("money");
        lastTimeEle = document.getElementById("lastTime");
        username = theRequest['username']||"";
        usernameEle.innerText = username+"的分享";
        $(".username").text(username);
        theRequest['ranking'] = theRequest['ranking']||"0";
        if(theRequest['ranking'] == 0){
            theRequest['ranking'] = '未参与';
        }
        rankingEle.innerText = parseInt(theRequest['ranking'])?"第"+theRequest['ranking']+"名":theRequest['ranking'];
        theRequest['goal'] = parseInt(theRequest['goal']);
        goalEle.innerText = theRequest['goal']||"0";
        moneyEle.innerText = theRequest['money']||"￥0";
        lastTimeEle.innerText = theRequest['lastTime']||"";
    }
}
function showResetButton(){
    $('#share_shave').eraser('clear');
}