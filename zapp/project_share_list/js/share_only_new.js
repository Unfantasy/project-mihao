/**
 * Created by zm on 2015/10/20.
 */
//模拟数据
//获取用户头像地址，用户名，股票信息,盈利,涨幅
users = '[{"usernamesrc":"images/fenxiang_baiwan.png","username":"名侦探狄仁杰","stock":"北京高速","increase":"2.50","money":"-1000"},{"usernamesrc":"images/fenxiang_baiwan.png","username":"名侦探狄仁杰","stock":"中国电信","increase":"2.50","money":"-1000"},{"usernamesrc":"images/fenxiang_baiwan.png","username":"名侦探狄仁杰","stock":"GOOD","increase":"2.50","money":"1000"},{"usernamesrc":"images/fenxiang_baiwan.png","username":"名侦探狄仁杰","stock":"HHKB","increase":"2.50","money":"1000"},{"usernamesrc":"images/fenxiang_baiwan.png","username":"名侦探狄仁杰","stock":"RF","increase":"2.50","money":"1000"},{"usernamesrc":"images/fenxiang_baiwan.png","username":"名侦探狄仁杰","stock":"HELLOKITTY","increase":"2.50","money":"1000"},{"usernamesrc":"images/fenxiang_baiwan.png","username":"名侦探狄仁杰","stock":"CHINA","increase":"2.50","money":"1000"},{"usernamesrc":"images/fenxiang_baiwan.png","username":"名侦探狄仁杰","stock":"PAIRS","increase":"2.50","money":"1000"},{"usernamesrc":"images/fenxiang_baiwan.png","username":"名侦探狄仁杰","stock":"PAIRS","increase":"2.50","money":"1000"},{"usernamesrc":"images/fenxiang_baiwan.png","username":"名侦探狄仁杰","stock":"PAIRS","increase":"2.50","money":"-1000"}]';
users = eval(users);
//模拟数据结束
//添加页面

$("body").append('<div class="s_all"><div class="inner"></div> <div class="footer"> <ul class="s_nav"></ul> </div></div>');
//设置图片宽高
var imageWidth = parseInt(document.body.clientWidth*0.85);
var imageHeight = parseInt(document.body.clientHeight*0.73);
$(".inner").width(document.body.clientWidth*users.length*0.9);
var innerMarginLeft = document.body.clientWidth*0.05;
$(".inner").css("margin-left",innerMarginLeft);
//循环添加数据
for(var i=0;i<users.length;i++){
    if (users[i].usernamesrc == "") {
        users[i].usernamesrc = "images/user_avatar.png";
    }
    $(".inner").append('<div class="s_content s_content'+(i+1)+'"><div class="s_bg"></div></div>');
    $(".s_content"+(i+1)+" .s_bg").width(imageWidth);
    $(".s_content"+(i+1)+" .s_bg").height(imageHeight);
    $(".s_content").width(document.body.clientWidth*0.9);
    $(".s_content").height();
//判断股票涨跌
if(users[i].money>0){//股票涨
    $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_zhangbeijing.png" class="s_bgimg" alt="股票涨的背景"/>');
    $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_zhangdubai.png" alt="盈亏" class="s_yingkui"/>');

    //赚了多少个东西
    if(users[i].money>1000000){//首富
        $(".s_content"+(i+1)+" .s_bg").append('<span class="s_number"></span>');
        $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_zhangshoufu.png" alt="获利" class="s_earn"/>');
    }else if(users[i].money>700000){//车子
        $(".s_content"+(i+1)+" .s_bg").append('<span class="s_number"></span>');
        $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_zhangchezi.png" alt="获利" class="s_earn"/>');
    }else if(users[i].money>60000){//北京三环房子
        var number = parseInt(users[i].money/50000);
        $(".s_content"+(i+1)+" .s_bg").append('<span class="s_number" style="font-size: 1.5rem">+'+number+'m<sup>2</sup></span>');
        $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_zhangbeijingsanhuan.png" alt="获利" class="s_earn"/>');
    }else if(users[i].money>10000){//iphone6
        var number = parseInt(users[i].money/6000);
        $(".s_content"+(i+1)+" .s_bg").append('<span class="s_number">+'+number+'部</span>');
        $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_zhangshouji.png" alt="获利" class="s_earn"/>');
    }else if(users[i].money>2000){//虾
        var number = parseInt(users[i].money/38);
        $(".s_content"+(i+1)+" .s_bg").append('<span class="s_number">+'+number+'只</span>');
        $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_zhangdaxia.png" alt="获利" class="s_earn"/>');
    }else if(users[i].money>0){//茶叶蛋
        if(users[i].money==1) var number = 1;
        number = parseInt(users[i].money/2);
        $(".s_content"+(i+1)+" .s_bg").append('<span class="s_number">+'+number+'个</span>');
        $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_zhangchayedan.png" alt="获利" class="s_earn"/>');
    }
    //改变数字颜色为红色
    $(".s_content"+(i+1)+" .s_number").css("color","#FF4028");
}else if(users[i].money==0){//不涨不降
    $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_baiwanbeijing.png" class="s_bgimg" alt="不涨不降的背景"/>');
    $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_dubai.png" alt="盈亏" class="s_yingkui"/>');
    $(".s_content"+(i+1)+" .s_bg").append('<span class="s_number"></span>');
    $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_baiwan.png" alt="白玩" class="s_earn"/>');
}else{//股票跌
    $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_diebeijing.png" class="s_bgimg" alt="股票跌的背景"/>');
    $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_diedubai.png" alt="盈亏" class="s_yingkui"/>');
    //亏了多少个东西
    if(users[i].money<-1000000){//首富
        $(".s_content"+(i+1)+" .s_bg").append('<span class="s_number"></span>');
        $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_dieshoufu.png" alt="获利" class="s_earn"/>');
    }else if(users[i].money<-700000){//车子
        $(".s_content"+(i+1)+" .s_bg").append('<span class="s_number"></span>');
        $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_diechezi.png" alt="获利" class="s_earn"/>');
    }else if(users[i].money<-60000){//北京三环房子
        var number = parseInt(users[i].money/50000);
        $(".s_content"+(i+1)+" .s_bg").append('<span class="s_number" style="font-size: 1.5rem">'+number+'m<sup>2</sup></span>');
        $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_diebeijingsanhuan.png" alt="获利" class="s_earn"/>');
    }else if(users[i].money<-10000){//iphone6
        var number = parseInt(users[i].money/6000);
        $(".s_content"+(i+1)+" .s_bg").append('<span class="s_number">'+number+'部</span>');
        $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_dieshouji.png" alt="获利" class="s_earn"/>');

    }else if(users[i].money<-2000){//虾
        var number = parseInt(users[i].money/38);
        $(".s_content"+(i+1)+" .s_bg").append('<span class="s_number">'+number+'只</span>');
        $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_diedaxia.png" alt="获利" class="s_earn"/>');
    }else if(users[i].money<0){//茶叶蛋
        if(users[i].money== -1) var number = -1;
        number = parseInt(users[i].money/2);
        $(".s_content"+(i+1)+" .s_bg").append('<span class="s_number">'+number+'个</span>');
        $(".s_content"+(i+1)+" .s_bg").append('<img src="images/fenxiang_diechayedan.png" alt="获利" class="s_earn"/>');
    }
    //改变数字颜色为绿色
    $(".s_content"+(i+1)+" .s_number").css("color","#00C93A");
}
//将用户头像，用户名插入页面
$(".s_content"+(i+1)+" .s_bg").append('<img src="'+users[i].usernamesrc+'" alt="你的头像" class="s_headimg"/>');
$(".s_headimg").height($(".s_headimg").width());
$(".s_content"+(i+1)+" .s_bg").append('<span class="s_name">'+users[i].stock+'</span>');
$(".s_content"+(i+1)+" .s_bg").append('<span class="s_data">'+users[i].increase+'%</span>');
$(".s_content"+(i+1)+" .s_bg").append('<div class="s_ucenter"><span class="s_username">'+users[i].username+'</span></div>');
$(".footer ul").append('<li ><span>'+users[i].stock+'</span></li>');
}
//默认第一个为active
$(".footer ul li:first").addClass("active");









