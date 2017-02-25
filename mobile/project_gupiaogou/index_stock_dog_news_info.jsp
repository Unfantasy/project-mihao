<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="pic_url" value="http://www.mihaokj.com:8081/images" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>股狗秘闻－中国证券人常看的行业匿闻</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="股狗秘闻－中国证券人常看的行业匿闻"/>
    <link href="${ctx}/images/zm_log.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx}/css/newmain.css"/>
    <link rel="stylesheet" href="${ctx}/css/swiper-3.3.1.min.css"/>
    <link rel="stylesheet" href="${ctx }/css/nfooter_v6.css"/>
    <link rel="stylesheet" href="${ctx }/css/gogounews.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/jquery.form.js" type="text/javascript"></script>
    <script src="${ctx}/js/bootstrap.js"></script>
    <script src="${ctx}/js/swiper-3.3.1.jquery.min.js"></script>
    <script src="${ctx}/js/bdmain.js"></script>
    <script src="${ctx}/js/jweixin-1.1.0.js"></script>
    <!--<script src="${ctx}/js/clipboard.min.js"></script>-->
    <script src="${ctx}/js/zmMobile.js"></script>
    <script src="${ctx}/js/common.js"></script>
    <style>
        *,*:before,*:after{
            box-sizing: border-box;
        }
        .loadingBox {
            background: url('${ctx}/images/loading.gif') center center no-repeat;
            height: 48px;
            width: 100%;
            margin-bottom: 17px;
            display: none;
        }
        .loadingFail{
            background:#fff url('');
            text-align: center;
            color: #f45531;
            font-size: 20px;
        }
        .pbox img {
            display: none;
        }
        .comment a .zan{
            margin-right:4px;
        }
        .commentLink {
            padding-left: 6px;
        }

        .newslist .comment {
            font-size: 0;
        }
        .swiper-container{
            max-width: 100%;
        }
        .swiper-slide a, .swiper-slide a img {
            width: 100%;
        }

        span.swiper-pagination-bullet-active {
            background: rgba(0, 0, 0, .8);
        }

        .navbar-fixed-top {
            border-bottom: 1px solid rgba(0, 0, 0, .1);
        }
        .copyBox{
            position:relative;
        }
        .copyBtn{
            display: none;
            background-color: rgba(0,0,0,.8);
            border:none;
            border-radius: 5px;
            font-size:14px;
            padding:5px 10px;
            outline: none;
            color:#fff;
            position:absolute;
            top:16px;
            left:50%;
            -webkit-transform: translate(-50%,0);
            -moz-transform: translate(-50%,0);
            -ms-transform: translate(-50%,0);
            -o-transform: translate(-50%,0);
            transform: translate(-50%,0);
            -webkit-tap-highlight-color: rgba(0,0,0,0);
        }
        .copyBtn:before{
            content:'';
            position:absolute;
            width:10px;
            height:10px;
            top:100%;
            left:calc(50% - 10px);
            border-top:10px solid rgba(0,0,0,.8);
            border-left:10px solid transparent;
            border-right:10px solid transparent;
            background-color: #fff;
        }
    </style>
    <script>
        $(function () {
            $(".share_box>p").click(function () {
                $(this).parent().find('ul').fadeToggle();
            });
            $('.pbox img').css('max-width', '100%');
        });
        if (isMobile()) {
            //加载移动端页面
            loadjscssfile("${ctx}/css/newmain_mobile.css", "css");
            loadjscssfile('${ctx }/css/gogounews_mobile.css', 'css');
        }
        function f_praise(id, e) {
            $.post("${ctx}/stock_dog_news/praise", {
                id: id
            }, function (data) {
                if (data.success == false) {
                    alert("点赞失败");
                } else {
                    if (!$(e).find('.zan').hasClass('active')) {
                        var count = Number($(e).find('#pcount').text()) + 1;
                        $(e).find('#pcount').text(count);
                        $(e).find('.zan').addClass('active');
                    }
                }
            });
        }
    </script>
    <noscript>
        <link rel="stylesheet" media="screen and (max-width:560px)" href="${ctx }/css/newmain_mobile.css"/>
        <link rel="stylesheet" media="screen and (max-width:560px)" href="${ctx }/css/gogounews_mobile.css"/>
    </noscript>
</head>
<body>
<!--分享链接图片-->
<div hidden><img src="${ctx }/images/stock_dog_news_0.png" alt="share_picture"/></div>
<nav class="navbar-fixed-top">
    <div class="container nm_content">
        <div class="navbar-header">
            <a class="navbar-brand" href="http://www.mihaokj.com/stock_dog_news/news_list"><img src="${ctx }/images/gugou.png" id="nm-icon"/></a>
            <button class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse"
                    type="button">
                <span class="nm-list"></span>
                <!-- <span class="glyphicon glyphicon-menu-hamburger" style="font-size: 20px;color:#000"></span> -->
            </button>

        </div>
        <div class="collapse navbar-collapse navbar-right" id="navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="${ctx }/" id="index">首页</a></li>
                <li><a id="forum" href="${ctx }/forum_post/list" target="_blank">官方论坛</a></li>
                <script>
                    if(isMobile()){
                        var href = $('#forum').attr('href');
                        if(href.indexOf('?')!=-1){
                            href +='&mt=mobile';
                        }else{
                            href +='?mt=mobile';
                        }
                        $('#forum').attr('href',href);
                    }
                </script>
                <li><a href="/jsp/financing_vote/vote_themes.jsp" id="vote">嗅觉测试站</a></li>
                <li><a href="http://www.mihaokj.com/html/gupiaodog.html" id="">股票狗</a></li>
                <li class="register_login">
                    <c:choose>
                         <c:when test="${cli_user==null }">
                              <a href="javascript:;" onclick="toLogin()">登录</a>&nbsp;| &nbsp;<a href="javascript:;" onclick="toRegister()">注册</a>
                         </c:when>
                         <c:otherwise>
                             <a href="${ctx }/forum_post/user_info">${cli_user.nickname}</a>
                         </c:otherwise>
                     </c:choose>
                </li>
            </ul>
        </div>
    </div>
</nav>
<script>
    $(".navbar-toggle").click(function () {
        if (!$("#navbar-collapse").hasClass("in")) {
            if ($(this).children().hasClass("nm-list")) {
                $(this).children().removeClass("nm-list").addClass("to-remove");
            } else {
                $(this).children().removeClass("to-list").addClass("to-remove");
            }
            $(".to-remove").css({
                "background-image": "url('${ctx }/images/toremove.gif')",
                "background-repeat": "no-repeat",
                "background-size": "100% 100%"
            });
        } else {
            $(this).children().removeClass("to-remove").addClass("to-list");
            $(".to-list").css({
                "background-image": "url('${ctx }/images/tolist.gif')",
                "background-repeat": "no-repeat",
                "background-size": "100% 100%"
            });
        }
    });
</script>
<div class="main">
    <div class="newscontent">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><a href="https://www.mihaokj.com/forum_post/form?id=405"><img src="${ctx}/images/gugounewsbanner1.png"/></a></div>
                <div class="swiper-slide"><a href="https://www.mihaokj.com/forum_post/form?id=406"><img src="${ctx}/images/gugounewsbanner2.png"/></a></div>
                <div class="swiper-slide"><a href="http://www.mihaokj.com/forum_post/form?id=404"><img src="${ctx}/images/gugounewsbanner3.png"/></a></div>
            </div>
            <div class="swiper-pagination"></div>
            <script>
                $('.swiper-container').width(window.innerWidth);
                var mySwiper2 = new Swiper('.swiper-container', {
                    autoplay: 4000,//可选选项，自动滑动
//                    width : window.innerWidth,
                    loop:'true',
                    pagination : '.swiper-pagination',//分页器
                    paginationClickable: true,
                    autoplayDisableOnInteraction : false//点击前进后退按钮还可以自动播放
                })
                if(isMobile()){
                    $('.swiper-slide a').each(function(){
                        var href = $(this).attr('href');
                        if(href.indexOf('?')!=-1){
                            href +='&mt=mobile';
                        }else{
                            href +='?mt=mobile';
                        }
                        $(this).attr('href',href);
                    });
                }
            </script>
        </div>

        <ul class="newslist">
        <c:forEach var="news" items="${news_list }" varStatus="status">
        	<c:if test="${status.index==0 and vote3 !=null }">
					<li><a href="${ctx}/financing_vote_item/to_vote?vote_id=${vote3.id }" class="com-grid-paper"><div class="grid-paper-bd">
			 		<div class="imgcover pic"><img class=" lazyloaded" src="${pic_url}/${vote3.cover_url }"></div>
					<div class="count new"></div></div>
					<div class="grid-paper-ft"><div class="title-description"><h3 class="title">${vote3.title }</h3>
					<p class="description">${vote3.description }</p></div></div></a></li>
				</c:if>
				<c:if test="${status.index==2 and vote1 !=null }">
					<li><a href="${ctx}/financing_vote_item/to_vote?vote_id=${vote1.id }" class="com-grid-paper"><div class="grid-paper-bd"><div class="imgcover pic">
		            <img class=" lazyloaded" src="${pic_url}/${vote1.cover_url }"></div><div class="count new"></div></div><div class="grid-paper-ft"><div class="title-description">
		            <h3 class="title">${vote1.title}</h3><p class="description">${vote1.description }</p>
		            <p class="ticketNum">参与人数：<span>${vote1.join_count}</span></p></div></div></a></li>
				</c:if>
				<c:if test="${status.index==4 and vote2 !=null }">
					<li><a href="${ctx}/financing_vote_item/to_vote?vote_id=${vote2.id }" class="com-grid-paper"><div class="grid-paper-bd"><div class="imgcover pic">
		            <img class=" lazyloaded" src="${pic_url}/${vote2.cover_url }"></div><div class="count new"></div></div><div class="grid-paper-ft"><div class="title-description">
		            <h3 class="title">${vote2.title}</h3><p class="description">${vote2.description }</p>
		            <p class="ticketNum">参与人数：<span>${vote2.join_count}</span></p></div></div></a></li>
				</c:if>
         		<li>
                <div class="newtime"><fmt:formatDate value="${news.create_time}" pattern="HH:mm"/> </div>
                <div class="newcontent">
                    <div class="circle"><img src="${ctx }/images/stock_dog_news_${news.come_from }.png" alt=""/>
                    来自<c:if test="${news.come_from=='0' }">网络</c:if>
                    	<c:if test="${news.come_from=='1' }">东方财富</c:if>
                    	<c:if test="${news.come_from=='2' }">微信</c:if>
                    	<c:if test="${news.come_from=='3' }">无秘</c:if>
                    	<c:if test="${news.come_from=='4' }">雪球</c:if>
                    	<c:if test="${news.come_from=='5' }">微博</c:if>
                    	<c:if test="${news.come_from=='6' }">集思录</c:if>
                    	<c:if test="${news.come_from=='7' }">华尔街见闻</c:if>
                    </div>
                    <div class="pbox copyDiv${news.id} copyBox" id='copyDiv${news.id}'onclick="toComment(this)">
                        ${news.content }

                    </div>
                    <button id="copyButton" class="copyBtn copyBtn${news.id}">复制</button>
                    <div class="comment">
                        <a class="zanLink" onclick="f_praise('${news.id}',this)"><span class="zan"></span><span id="pcount" class="aw-vote-bar-count">${news.praise_count }</span></a>
                        <span class="text-right newLabel" >${news.stock_label }</span>
                        <a class="commentLink" href="${ctx }/stock_dog_news/${news.id}#form2"><span class="pinglun"></span>
                            <!--${news.comment_count }--></a>

                    </div>
                    <div class="controlbox">
                        <!-- share -->
                        <div class="share_box" style="z-index:999; ">
                            <p>分享</p>
                            <ul>
                                <li><a href="javascript:void(0);" onclick="shareQQWeiXin(this); return false;" class="icon_1"></a></li>
                                <li><a href="javascript:void(0);" onclick="shareQzone('${news.title }','http://www.mihaokj.com/stock_dog_news/news_list',$('#content').text(),'http://www.mihaokj.com/stock_dog_news/news_list','http://www.mihaokj.com/images/zhongmilogo.png'); return false;"  class="icon_3"></a></li>
                                <li><a href="javascript:void(0);" onclick="shareTSina('${news.title }','http://www.mihaokj.com/stock_dog_news/news_list',$('#content').text(),'http://www.mihaokj.com/stock_dog_news/news_list','http://www.mihaokj.com/images/zhongmilogo.png'); return false;" class="icon_4"></a></li>
                            </ul>
                        </div>
                        <!-- end share -->
                    </div>
                </div>
                    <!--<script>
                    //自定义复制
                        myCopy(document.getElementById('copyDiv${news.id}'),${news.id});
                    </script>-->
            </li>
        </c:forEach>
            <script>
                $('.pbox p,.pbox span').css('line-height','24px');
            </script>
        </ul>
    </div>
    <script>
        //to comment;
       function toComment(e){
            var commentLink = $(e).parents('.newcontent').find('.commentLink').attr('href');
           if(commentLink.indexOf('#')){
               commentLink = commentLink.split('#')[0];
           }
            location.href = commentLink;
        }

        /*$(function(){
        //change news'color
            /!*
            var length = $('.newslist>li').length;
            for(var i=0;i<length;i++){
                if(i%2==0){
                    switch(i%7){
                        case 0:
                            $('.newslist>li').eq(i).addClass('colour1');
                            break;
                        case 1:
                            $('.newslist>li').eq(i).addClass('colour2');
                            break;
                        case 2:
                            $('.newslist>li').eq(i).addClass('colour3');
                            break;
                        case 3:
                            $('.newslist>li').eq(i).addClass('colour4');
                            break;
                        case 4:
                            $('.newslist>li').eq(i).addClass('colour5');
                            break;
                        case 5:
                            $('.newslist>li').eq(i).addClass('colour6');
                            break;
                        case 6:
                            $('.newslist>li').eq(i).addClass('colour7');
                    }
                }
            }*!/
            /!* var vote1 = ${vote1};
            var vote2 = ${vote2};
            var vote3 = ${vote3};
            if(vote3){
            	var addHtml = '<li><a href="${ctx}/financing_vote_item/to_vote?vote_id='+vote3.id+'" class="com-grid-paper"><div class="grid-paper-bd"><div class="imgcover pic">'
		            +'<img class=" lazyloaded" src="${pic_url}/'+vote3.cover_url+'"></div><div class="count new"></div></div><div class="grid-paper-ft"><div class="title-description">'
		            +'<h3 class="title">'+vote3.title+'</h3><p class="description">'+vote3.description+'</p>'
		            +'</div></div></a></li>';
    			$('.newslist>li:nth-child(1)').before(addHtml);
            }
            if(vote1){
            	var addHtml = '<li><a href="${ctx}/financing_vote_item/to_vote?vote_id='+vote1.id+'" class="com-grid-paper"><div class="grid-paper-bd"><div class="imgcover pic">'
		            +'<img class=" lazyloaded" src="${pic_url}/'+vote1.cover_url+'"></div><div class="count new"></div></div><div class="grid-paper-ft"><div class="title-description">'
		            +'<h3 class="title">'+vote1.title+'</h3><p class="description">'+vote1.description+'</p>'
		            +'<p class="ticketNum">参与人数：<span>'+vote1.join_count+'</span></p></div></div></a></li>';
    			$('.newslist>li:nth-child(3)').before(addHtml);
            }
            if(vote2){
            	var addHtml = '<li><a href="${ctx}/financing_vote_item/to_vote?vote_id='+vote2.id+'" class="com-grid-paper"><div class="grid-paper-bd"><div class="imgcover pic">'
		            +'<img class=" lazyloaded" src="${pic_url}/'+vote2.cover_url+'"></div><div class="count new"></div></div><div class="grid-paper-ft"><div class="title-description">'
		            +'<h3 class="title">'+vote2.title+'</h3><p class="description">'+vote2.description+'</p>'
		            +'<p class="ticketNum">参与人数：<span>'+vote2.join_count+'</span></p></div></div></a></li>';
    			$('.newslist>li:nth-child(5)').before(addHtml);
            } *!/
        });*/
        var pageNum = 2;
        var pageTotalNum = 0;
        $(document).scroll(function(){
            var scrollBottomHeight = $(this).scrollTop()+window.innerHeight;
//        console.log('scrollBottomHeight:'+scrollBottomHeight+',dHeight:'+getDocHeight());
            if(getDocHeight()-scrollBottomHeight<550){
//            console.log('ok');
                var hasGetContent = false;
                if (!hasGetContent) {
                    hasGetContent = true;
                    $.ajax({
                        url: '${ctx}/stock_dog_news/list?page=' + pageNum,
                        type: 'get',
                        success: function (data) {
                            if (data) {
                                var news = data.Rows;
                                var Total = data.Total;
                                pageTotalNum = Math.ceil(Total / 15);
                                if (pageTotalNum >= pageNum) {
                                    for (var i = 0; i < news.length; i++) {
                                        var comeFrom = '网络';
                                        switch (news[i].come_from) {
                                            case '0':
                                                comeFrom = '网络';
                                                break;
                                            case '1':
                                                comeFrom = '东方财富';
                                                break;
                                            case '2':
                                                comeFrom = '微信';
                                                break;
                                            case '3':
                                                comeFrom = '无秘';
                                                break;
                                            case '4':
                                                comeFrom = '雪球';
                                                break;
                                            case '5':
                                                comeFrom = '微博';
                                                break;
                                            case '6':
                                                comeFrom = '集思录';
                                                break;
                                            case '7':
                                                comeFrom = '华尔街见闻';
                                                break;
                                        }
                                        var dd = new Date(news[i].create_time);
//                                        console.log(dd);
                                        var liHtml = '<li><div class="newtime">' +dd.format('hh:mm') + '</div><div class="newcontent"><div class="circle"><img src="${ctx }/images/stock_dog_news_' + news[i].come_from + '.png"/>来自' + comeFrom + '</div><div class="pbox copyDiv' + news[i].id + ' copyBox" id="copyDiv' + news[i].id + '" onclick="toComment(this)">' + news[i].content + '</div><button class="copyBtn copyBtn' + news[i].id + '">复制</button><div class="comment"><a class="zanLink"  onclick="f_praise(' + news[i].id + ',this)"><span class="zan"></span><span id="pcount" class="aw-vote-bar-count">' + news[i].praise_count + '</span></a><a class="commentLink" href="${ctx }/stock_dog_news/' + news[i].id + '#form2"><span class="pinglun"></span></a><span class="text-right newLabel" >' + (news[i].stock_label || "") + '</span></div><div class="controlbox"><div class="share_box" style="z-index:999; "><p>分享</p><ul><li><a href="javascript:void(0);" onclick="shareQQWeiXin(this); return false;" class="icon_1"></a></li><li><a href="javascript:void(0);" onclick="shareQzone(' + news[i].title + ',"http://www.mihaokj.com/stock_dog_news/news_list",$("#content").text(),"http://www.mihaokj.com/stock_dog_news/news_list","http://www.mihaokj.com/images/zhongmilogo.png"); return false;"  class="icon_3"></a></li><li><a href="javascript:void(0);" onclick="shareTSina(' + news[i].title + ',"http://www.mihaokj.com/stock_dog_news/news_list",$("#content").text(),"http://www.mihaokj.com/stock_dog_news/news_list","http://www.mihaokj.com/images/zhongmilogo.png"); return false;" class="icon_4"></a></li></ul></div></div> </div></li>';
                                        $('.newslist').append(liHtml);
//                                        myCopy(document.getElementById('copyDiv' + news[i].id), news[i].id);//自定义复制
                                    }
                                    //分享点击
                                    $(".share_box>p").click(function () {
                                        $(this).parent().find('ul').fadeToggle();
                                    });
                                    $('.pbox img').css('max-width', '100%');
                                }
                                pageNum++;
                                hasGetContent = false;
                            }
                        },
                        error: function (e) {
                            alert('获取失败');
                        }
                    })

                }
            }
        });
    </script>
</div>
<%@include file="/jsp/comm_part/login_register.jsp"%>
<script>
    // share  分享信息 微信
    var shareData = {
        title: '股狗秘闻－中国证券人常看的行业匿闻。',
        desc: '汇聚行业精英，主打知识服务，让证券同行彼此获取必备讯息和技能包。',
        img: 'http://www.mihaokj.com/images/stock_dog_news_0.png',
        link: location.href
    };
    document.addEventListener("WeixinJSBridgeReady", function () {
        getWeixinToken();
    });
    //只是图片的时候
    $('.pbox').each(function(){
        if($(this).text().NoSpace()=='' && $(this).find('img').length>0)
        $(this).append('点击显示图片<br/><br/>');
    });
    $(document).on('ajaxStop',function(){
        //只是图片的时候
        $('.pbox').each(function(){
            if($(this).text().NoSpace()=='' && $(this).find('img').length>0)
                $(this).append('点击显示图片<br/><br/>');
        });
    });
</script>
</body>
</html>