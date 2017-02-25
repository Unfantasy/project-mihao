<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="basepath" value="https://www.mihaokj.com" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta property="qc:admins" content="11441646476510173263757" />
    <title>杭州米号科技有限公司</title>
    <meta name="description" content="众米是由杭州米号科技有限公司于2014年末推出的一款轻量、简洁的自选股管家应用，在版本的开发中，我们深入挖掘用户的需求，着重打造了证券信息传递这一功能。">
    <meta name="keywords" content="众米,米号,米号科技,众米科技有限公司,米号科技有限公司">
    <link href="${ctx}/images/zm_log.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="${ctx}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/css/zmStyle.css"/>
    <link rel="stylesheet" href="${ctx}/css/index_v5.css"/>
    <!--<link rel="stylesheet" href="css/index_v5_m.css"/>-->
    <script src="${ctx}/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/bootstrap.min.js"></script>
    <script src="${ctx}/js/zmMobile.js"></script>
    <script>
        if (isMobile()) {
            loadjscssfile('css/index_v5_m.css', 'css');
        }
    </script>
</head>
<body>

<body>
<nav class="page1Nav">
    <div class="container">
        <div class="pull-left">
            <a href="#" class="zmIcon"><img src="images/home_icon1.png" class="zmIconImg" alt=""/></a>
        </div>
        <div class="zmTab pull-right">
            <ul>
                <li class="active"><a href="#">首页</a></li>
                <li><a href="${ctx }/index_company.jsp">公司</a></li>
                <li><a href="${ctx }/index_help.jsp">帮助</a></li>
                <li><a href="${ctx }/forum_post/list">官方论坛</a></li>
                <li><a href="${ctx }/cybertron/cybertron_list">cybertron工作室</a></li>
                <li class="tipsBox">
                    <a href="javascript:;">加入我们</a>
                    <div class="mainJoinUsBox">
                        <div><a href="http://www.mihaokj.com/html/submit_main_tell.html">讲述大师</a></div>
                        <div><a href="http://www.mihaokj.com/html/submit_main_race.html">发起比赛</a></div>
                    </div>
                </li>
                <!--<li class="tipsBox"><a href="#" class="loginRegister"><img src="images/home_head.png"/></a>

                    <div class="mainJoinUsBox">
                        <div><a href="http://www.mihaokj.com/html/submit_main_tell.html">注册</a></div>
                        <div><a href="http://www.mihaokj.com/html/submit_main_race.html">登录</a></div>
                    </div>
                </li>-->
            </ul>
        </div>
    </div>
</nav>
<nav class="page2Nav navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a href="#" class="zmIcon"><img src="images/home_icon2.png" alt=""/></a>
            <button class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse"
                    type="button">
                <div class="navLineBox navLineBoxTop">
                    <span class="navLine"></span>
                </div>
                <div class="navLineBox navLineBoxBottom">
                    <span class="navLine"></span>
                </div>
            </button>
        </div>
        <div class="zmTab collapse navbar-collapse navbar-right" id="navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${ctx }/">首页</a></li>
                <li><a href="${ctx }/index_company.jsp">公司</a></li>
                <li><a href="${ctx }/index_help.jsp">帮助</a></li>
                <li><a href="${ctx }/forum_post/list" target="_blank">官方论坛</a></li>
                <li><a href="${ctx }/cybertron/cybertron_list" target="_blank">cybertron工作室</a></li>
                <li class="tipsBox"><a href="javascript:;">加入我们</a>

                    <div class="mainJoinUsBox">
                        <div><a href="http://www.mihaokj.com/html/submit_main_tell.html">讲述大师</a></div>
                        <div><a href="http://www.mihaokj.com/html/submit_main_race.html">发起比赛</a></div>
                    </div>
                </li>
                <!--<li class="tipsBox"><a href="#" class="loginRegister"><img src="images/home_head.png"/></a>

                    <div class="mainJoinUsBox">
                        <div><a href="http://www.mihaokj.com/html/submit_main_tell.html">注册</a></div>
                        <div><a href="http://www.mihaokj.com/html/submit_main_race.html">登录</a></div>
                    </div>
                </li>-->
            </ul>
        </div>
    </div>
</nav>
<script>
    //nav
    $(".tipsBox").hover(function () {
        $(this).find('.mainJoinUsBox').slideDown().siblings().find('.mainJoinUsBox').hide();
    }, function () {
        $(this).find('.mainJoinUsBox').hide();
    });
    if(isMobile()){
        $(".navbar-toggle").click(function(){
            if(!$("#navbar-collapse").hasClass("in")){
                $(this).addClass('navAopen');
            }else{
                $(this).removeClass('navAopen');
            }
        });
    }
</script>
<div class="page1 text-center">
    <div class="vertical-center">
        <h1>众米，股票人的社交应用</h1>

        <div class="yelloLine"></div>
        <p class="">查看股票实时行情</p>

        <p>好友分享投资信息</p>

        <div class="loadBtnBox">
            <button class="loadBtn" onclick="showDownloadCode()">免费下载</button>
        </div>
    </div>
</div>
<div class="downloadCodeBox">
    <div class="downloadExit" onclick="hideDownloadCode()"></div>
    <div class="downloadCode vertical-center">
        <img src="images/zm_download.png" alt=""/>

        <p>扫一扫二维码下载APP</p>
    </div>
</div>
<div class="absolute">
    <div class="page2 text-center">

        <div class="container">
            <div class="tipBox">
                <div class="tip">
                    <p class="tipTile">A股、美股实时行情数据</p>

                    <p class="tipDescription">QUOTATION DATA</p>

                    <p class="number">01.</p>
                </div>
                <div class="tip">
                    <p class="tipTile">通过语音关键词搜索个股</p>

                    <p class="tipDescription">VOICE SEARCH</p>

                    <p class="number">02.</p>
                </div>
                <div class="tip">
                    <p class="tipTile">通讯录扫一扫添加好友</p>

                    <p class="tipDescription">ADD FRIENDS</p>

                    <p class="number">03.</p>
                </div>
                <div class="tip">
                    <p class="tipTile">打赏个股分享</p>

                    <p class="tipDescription">REWARD</p>

                    <p class="number">04.</p>
                </div>
                <div class="tip">
                    <p class="tipTile">私密信息</p>

                    <p class="tipDescription">CONFIDENTIAL INFORMATION</p>

                    <p class="number">05.</p>
                </div>
                <div class="tip">
                    <p class="tipTile">好友投资动态</p>

                    <p class="tipDescription">DYNAMIC INVESTMENT</p>

                    <p class="number">06.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="page3">
        <div class="container">
            <div class="aboutUs text-center pull-right">
                <p class="title">关于我们</p>

                <div class="blackLine"></div>
                <p class="description">众米是由杭州米号科技有限公司于2014年末推出的一款轻量简洁的自选股管家应用，在版本的开发中，我们深入挖掘用户的需求，着重打造了证券信息传递这一功能。</p>
                <br/>

                <p class="description">产品反馈及讨论QQ群： 419619824</p>

                <p class="description">微信服务号：微信搜索“众米订阅号”</p>
                <div class="showQrcodeBox">
                    <div class="showQrcode">查看二维码</div>
                    <img src="images/zm_subscription.jpg" class="zmSubscriptionImg"/>
                </div>
            </div>
        </div>

    </div>

    <div class="footer">
        <div class="container text-center">
            <div>杭州米号科技有限公司版权所有 浙ICP备14016681号 <a href="newmain_pravicy.html">隐私条款</a><br/>
                <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010602003615"
                   style="display:inline-block;text-decoration:none;height:20px;line-height:20px;width: auto"><img
                        src="http://www.mihaokj.com/images/beiantubiao.png" style="float:left;"/>

                    <p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#fff;">浙公网安备
                        33010602003615号</p></a>
            </div>
        </div>
    </div>
</div>

<script>
    if (!isMobile()) {
        $(document).scroll(function () {
            var $page1 = $(".page1");
            var $page2 = $(".page2");
            var $page3 = $('.page3');
            var $nav = $("nav");
            var page1Height = $page1.outerHeight(true);
            var scrollTop = $(this).scrollTop();
            var page2Top = $page2.offset().top;
            var page3Top = $page3.offset().top;
//        console.log('scrollTop:'+scrollTop+'，page2Top:'+page2Top);
            var page2AbsTop = page2Top - scrollTop;
            var page3AbsTop = page3Top - scrollTop;
            if (page2AbsTop > 50) {
                $(".page1Nav").css({'opacity': '1'}).show();
                $(".page2Nav").css({'opacity': '0'}).hide();
            }

            if ((0 <= page2AbsTop && page2AbsTop <= 50)) {
                var percent = page2AbsTop / 50;
                $(".page1Nav").css({'opacity': percent});
                $(".page2Nav").css({'opacity': 1 - percent}).show();
            }
            if (page2AbsTop < 0) {
                $(".page1Nav").css({'opacity': '0'});
                $(".page2Nav").css({'opacity': '1'}).show();
            }
            if ((0 <= page3AbsTop && page3AbsTop <= 50)) {
                var percent = page3AbsTop / 50;
                $(".page2Nav").css({'opacity': percent}).show();
                $(".page1Nav").css({'opacity': 1 - percent});
            }
            if (page3AbsTop < 0) {
                $(".page2Nav").css({'opacity': '0'}).hide();
                $(".page1Nav").css({'opacity': '1'}).show();
            }
        });
    }else{
        var index = 1;
        $(".showQrcode").click(function(){
            if(index++>1){
                $(".zmSubscriptionImg").css({'width':'10rem','height':'10rem'}).toggle(300);
            }
        });
    }
    function showDownloadCode() {
        if(isMobile()){
            location.href="https://www.mihaokj.com/html/downloadZm.html";

        }else{
            $('.downloadCodeBox').animate({'left': '0'});
        }
    }
    function hideDownloadCode() {
        $('.downloadCodeBox').animate({'left': '-100%'});
    }
</script>
</body>
</html>