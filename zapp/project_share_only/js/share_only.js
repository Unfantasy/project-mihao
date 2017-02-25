/**
 * Created by zm on 2015/10/20.
 */

//获取用户头像地址，用户名，股票信息,盈利,涨幅
var usernamesrc,username,stock,money,increase,userId,value;
var src = '?usernamesrc=images/fenxiang_baiwan.png&username=名侦探柯南&stock=北京高速&increase=2.50&money=100';
//var src = window.location.search;
var theRequest = new Object();
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
    $(".s_number").css("color","##00C93A");
}
//将用户头像，用户名插入页面
$(".s_bg").append('<img src="'+usernamesrc+'" alt="你的头像" class="s_headimg"/>');
$(".s_headimg").height($(".s_headimg").width());
$(".s_bg").append('<span class="s_name">'+stock+'</span>');
$(".s_bg").append('<span class="s_data">'+increase+'%</span>');
$(".s_bg").append('<div class="s_ucenter"><span class="s_username">'+username+'</span></div>');









