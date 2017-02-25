/**
 * Created by zm on 2015/12/9.
 */

$(function(){
    $(window).resize(function(){
        var dpi = window.devicePixelRatio;
        var w = document.documentElement.clientWidth;
        var cur_w = w*dpi/10;
        $('html').css({"fontSize":cur_w,'width':'100%','height':"100%"});
        //如果页面高度不足 footer元素位于底部
        var docHeight = getDocHeight();
        var bodyHeight = $("body").height();
        if(bodyHeight<=docHeight){
            $("footer").css({"position":"fixed","bottom":"0","width":"100%"});
        }else{
            $("footer").css({"position":"relative","width":"100%"});
        }
    });
    $(window).resize();

    //判断是否是手机
    if(isMobile()){//手机
        loadjscssfile("css/newmain_mobile.css","css");
        $("#nm-register").attr("href","register_wechat.html");
        $(".nm_download").click(function(e){
            e.preventDefault();
            if(isiOS){//IOS系统
                window.location.href="https://itunes.apple.com/us/app/zhong-mi/id946857722?l=zh&ls=1&mt=8";
            }else{//非IOS系统全部转为android链接
                window.location.href="http://mimikj.com:8081/mimikj/app/zhongmiApp.apk";
            }
        });
        //
        $(".share_erweima").on("click",function(){
            $(".stock_guide").removeClass("hide");
        });
        $(".stock_guide").click(function(){
            $(this).addClass("hide");
        });
    }else{//电脑
        $(".nm-nav-download").css("display","block");
        $(".nm_download").click(function(){
            $(".nm-nav-download").animate({"top":0},300).animate({"top":"-40px"},200).animate({"top":0},200);
        });
        $("#nm-pull-on").click(function(){
            $(".nm-nav-download").animate({"top":-$(".nm-nav-download").height()},300)
        });
        //模拟股票
        //显示隐藏二维码
        $(".share_erweima").hover(function(){$(this).next().toggle(300);},function(){$(this).next().toggle(300);});
    }
    //公司页面顶部高度控制
    $('.nm-mycompany-headbg img').load(function(){
        $(".nm-mycompany-headbg").height($(".nm-mycompany-headbg img").height()*0.8);
    });

    //帮助
    $(".request-answers h5").click(function () {
        if ($(this).hasClass("show")) {
            $(this).removeClass("show").next().slideUp();
            $(this).find("span").removeClass("down");
        } else {
            $(this).addClass("show").next().slideDown();
            $(this).find("span").addClass("down");
        }
    });
    //页面底部高度控制
    var docHeight = getDocHeight();
    var bodyHeight = $("body").height();
    if($("body").height()<docHeight){
        $("footer").css({"position":"fixed","bottom":"0"});
    }
    $(".fixed-btn").hide();
    //回到顶部
    var windowHeight = window.innerHeight
    $(document).scroll(function(){
       var scrollTop = document.body.scrollTop;
        if(scrollTop>windowHeight/2){
            $(".fixed-btn").fadeIn();
            return false;
        }
        $(".fixed-btn").fadeOut();
    });
    $(".go-top").click(function(){
        $("body").animate({scrollTop:0});
    });

});
//判断是否是手机页面
function isMobile() {
    if((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i)))
        return true;
    else
        return false;
}
//判断是否是ios系统
var u = navigator.userAgent, app = navigator.appVersion;
var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
//获取页面高度
function getDocHeight(){
    return document.documentElement.clientHeight;
}
// JavaScript Document
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
function jump(id){
    var target = document.getElementById(id);
    var e = e || window.event;
    alert(e.keyCode);
    if(e.keyCode == 13 || e.keyCode == 9){
        target.focus();
    }
}
function target(fun){
    var e = e || window.event;
    if(e.keyCode == 13 || e.keyCode == 9){
        eval(fun);
    }
}
