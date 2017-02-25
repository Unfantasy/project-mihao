/**
 * Created by zm on 2015/10/20.
 */
//根据浏览器判断是否是IOS
var u = navigator.userAgent, app = navigator.appVersion;
var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
var usernamesrc,username,stock,money,increase,userId,value;
var theRequest = new Object();
var src = window.location.search; //获取url中"?"符后的字串
src = 'http://www.mihaokj.com/html/share.html?username=%E5%88%98%E9%92%A2&usernamesrc=http://www.mimikj.com:8081/mimikj/images/user/45/user45.jpg?up_time=1460728570578&stock=XIV&money=561.00&increase=2.76';
if (src.indexOf("?") != -1) {
    var str = src.substr(1);
    strs = str.split("&");
    for (var i = 0; i < strs.length; i++) {
        theRequest[strs[i].split("=")[0]] = decodeURI(strs[i].split("=")[1]);
    }
}
username = theRequest["username"];
usernamesrc = theRequest["usernamesrc"];
userId=usernamesrc.substring(0,usernamesrc.indexOf("/"));
value=usernamesrc.substring(usernamesrc.indexOf("/")+1);
stock = theRequest["stock"];
money = theRequest["money"];
increase = theRequest["increase"];

if (usernamesrc == "") {
    usernamesrc = "images/user_avatar.png";
}
//添加页面
$("body").append('<div class="s_content"><div class="s_bg"></div></div>');
//获取当前屏幕的宽高
var screenHeight = parseInt(document.body.clientHeight*0.73);
$(".s_bg").height(screenHeight);
$(".s_bg").width(parseInt(0.63855*screenHeight));
$(".s_content").height(parseInt(1.367*$(".s_bg").height()));
//背景居中
var left = (1-$(".s_bg").width()/document.body.clientWidth)/2*100;
$(".s_bg").css("left",left+"%");
//判断股票涨跌
if(money>0){//股票涨
    $(".s_bg").append('<img src="images/fenxiang_zhangbeijing.png" class="s_bgimg" alt="股票涨的背景"/>');
    $(".s_bg").append('<img src="images/fenxiang_zhangdubai.png" alt="盈亏" class="s_yingkui"/>');

    //赚了多少个东西
    if(money>1000000){//首富
        $(".s_bg").append('<span class="s_number"></span>');
        $(".s_bg").append('<img src="images/fenxiang_zhangshoufu.png" alt="获利" class="s_earn"/>');
    }else if(money>700000){//车子
        $(".s_bg").append('<span class="s_number"></span>');
        $(".s_bg").append('<img src="images/fenxiang_zhangchezi.png" alt="获利" class="s_earn"/>');
    }else if(money>60000){//北京三环房子
        var number = parseInt(money/50000);
        $(".s_bg").append('<span class="s_number" style="font-size: 1.5rem">+'+number+'m<sup>2</sup></span>');
        $(".s_bg").append('<img src="images/fenxiang_zhangbeijingsanhuan.png" alt="获利" class="s_earn"/>');
    }else if(money>10000){//iphone6
        var number = parseInt(money/6000);
        $(".s_bg").append('<span class="s_number">+'+number+'部</span>');
        $(".s_bg").append('<img src="images/fenxiang_zhangshouji.png" alt="获利" class="s_earn"/>');
    }else if(money>2000){//虾
        var number = parseInt(money/38);
        $(".s_bg").append('<span class="s_number">+'+number+'只</span>');
        $(".s_bg").append('<img src="images/fenxiang_zhangdaxia.png" alt="获利" class="s_earn"/>');
    }else if(money>0){//茶叶蛋
        if(money==1) var number = 1;
        number = parseInt(money/2);
        $(".s_bg").append('<span class="s_number">+'+number+'个</span>');
        $(".s_bg").append('<img src="images/fenxiang_zhangchayedan.png" alt="获利" class="s_earn"/>');
    }
    //改变数字颜色为蓝色
    $(".s_number").css("color","#FF4028");
}else if(money==0){//不涨不降
    $(".s_bg").append('<img src="images/fenxiang_baiwanbeijing.png" class="s_bgimg" alt="不涨不降的背景"/>');
    $(".s_bg").append('<img src="images/fenxiang_dubai.png" alt="盈亏" class="s_yingkui"/>');
    $(".s_bg").append('<span class="s_number"></span>');
    $(".s_bg").append('<img src="images/fenxiang_baiwan.png" alt="白玩" class="s_earn"/>');
}else{//股票跌
    $(".s_bg").append('<img src="images/fenxiang_diebeijing.png" class="s_bgimg" alt="股票跌的背景"/>');
    $(".s_bg").append('<img src="images/fenxiang_diedubai.png" alt="盈亏" class="s_yingkui"/>');
    //亏了多少个东西
    if(money<-1000000){//首富
        $(".s_bg").append('<span class="s_number"></span>');
        $(".s_bg").append('<img src="images/fenxiang_dieshoufu.png" alt="获利" class="s_earn"/>');
    }else if(money<-700000){//车子
        $(".s_bg").append('<span class="s_number"></span>');
        $(".s_bg").append('<img src="images/fenxiang_diechezi.png" alt="获利" class="s_earn"/>');
    }else if(money<-60000){//北京三环房子
        var number = parseInt(money/50000);
        $(".s_bg").append('<span class="s_number" style="font-size: 1.5rem">'+number+'m<sup>2</sup></span>');
        $(".s_bg").append('<img src="images/fenxiang_diebeijingsanhuan.png" alt="获利" class="s_earn"/>');
    }else if(money<-10000){//iphone6
        var number = parseInt(money/6000);
        $(".s_bg").append('<span class="s_number">'+number+'部</span>');
        $(".s_bg").append('<img src="images/fenxiang_dieshouji.png" alt="获利" class="s_earn"/>');

    }else if(money<-2000){//虾
        var number = parseInt(money/38);
        $(".s_bg").append('<span class="s_number">'+number+'只</span>');
        $(".s_bg").append('<img src="images/fenxiang_diedaxia.png" alt="获利" class="s_earn"/>');
    }else if(money<0){//茶叶蛋
        if(money== -1) var number = -1;
        number = parseInt(money/2);
        $(".s_bg").append('<span class="s_number">'+number+'个</span>');
        $(".s_bg").append('<img src="images/fenxiang_diechayedan.png" alt="获利" class="s_earn"/>');
    }
    //改变数字颜色为红色
    $(".s_number").css("color","#00C93A");
}
//将用户头像，用户名插入页面
$(".s_bg").append('<img src="'+usernamesrc+'" alt="头像显示不出来了" class="s_headimg"/>');
$(".s_headimg").height($(".s_headimg").width());
$(".s_bg").append('<span class="s_name">'+stock+'</span>');
$(".s_bg").append('<span class="s_data">'+increase+"%"+'</span>');
$(".s_bg").append('<div class="s_ucenter"><span class="s_username">'+username+'</span></div>');
//将底部内容加入页面
var footerHtml = '<div class="fixTab"><div class="img"><img src="images/zhongmilogo2.png"/></div><ul class="zm"><li class="zmTitle">众米</li><li class="zmIntro">证券人的社交应用</li></ul><button id="openApp" class="openApp">立即打开</button></div>';
$("body").append(footerHtml);
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
    if (config.device.weixin || config.device.other) {
        open_hint_ui();
    } else {
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

window.addEventListener("DOMContentLoaded", function(){
    document.getElementById("openApp").addEventListener('click',open_client,false);
}, false);








