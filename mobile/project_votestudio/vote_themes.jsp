<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="pic_url" value="http://www.mihaokj.com:8081/images" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>嗅觉测试站－来试下对金融事件第一直觉吧</title>
    <link href="${ctx }/images/zm_log.ico" rel="shortcut icon"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="嗅觉测试站－来试下对金融事件第一直觉吧"/>
    <link rel="stylesheet" href="${ctx }/css/common-vote.css"/>
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx}/css/newmain.css"/>
    <link rel="stylesheet" href="${ctx }/css/voteStudioList.css"/>
    <link rel="stylesheet" href="${ctx }/css/gogounews.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/bootstrap.js"></script>
    <script src="${ctx}/js/zmMobile.js"></script>
    <script>
        if(isMobile()){
            //加载移动端页面
            loadjscssfile('${ctx}/css/voteStudioListMobile.css','css');
            loadjscssfile('${ctx }/css/gogounews_mobile.css','css');
            loadjscssfile('${ctx}/css/newmain_mobile.css','css');
        }
    </script>
    <noscript>
        <link rel="stylesheet" media="screen and (max-width:560px)" href="${ctx }/css/voteStudioMobile.css"/>
        <link rel="stylesheet" media="screen and (max-width:560px)" href="${ctx }/css/gogounews_mobile.css"/>
        <link rel="stylesheet" media="screen and (max-width:560px)" href="${ctx }/css/newmain_mobile.css"/>
    </noscript>
    <style>
        html, body {
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body class="web papers index">
<nav class="navbar-fixed-top">

    <div class="container nm_content">
        <div class="navbar-header">
            <a class="navbar-brand" href="${ctx }/jsp/financing_vote/vote_themes.jsp"><img src="${ctx }/images/xiujueceshizhan.png" alt="众米图标" id="nm-icon"/></a>
            <button class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse"
                    type="button">
                <span class="nm-list"></span>
                <!-- <span class="glyphicon glyphicon-menu-hamburger" style="font-size: 20px;color:#000"></span> -->
            </button>

        </div>
        <div class="collapse navbar-collapse navbar-right" id="navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="${ctx }/" id="index">首页</a></li>
                <li><a id="forum" href="${ctx }/forum_post/list" target="_blank">官方论坛</a>
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
                <li><a href="/stock_dog_news/news_list" id="stock_dog">股狗秘闻</a></li>
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
<div class="page-content">
    <div class="papers clearfix">
    </div>
</div>
<script>
	var total_count=0;
	var page=2;
	$(function(){
		load_date(1)
	});
	function load_date(page){
		$.ajax({
	        url:"${ctx}/financing_vote/list",
	        type:'get',
	        datatype:"json",
	        data:{page:page},
	        success:function(data){
	        	total_count=data.Total;
	        	for(var i=0;i<data.Rows.length;i++){
	        		addItem(data.Rows[i]);
	        	}
	        }
	    });
	}
	function addItem(vote){
		 var voteStudio = '<a href="${ctx}/financing_vote_item/to_vote?vote_id='+vote.id+'" class="com-grid-paper small"><div class="grid-paper-bd"><div class="imgcover pic"><img class=" lazyloaded" src="${pic_url}/'+vote.cover_url+'"></div>';
		 /*if(vote.type=='1'){
			 voteStudio += '<img class=" lazyloaded" src="${ctx}/images/toupiao.png"></p>';
		 }else{
			 voteStudio += '<img class=" lazyloaded" src="${ctx}/images/woshuo.png"></p>';
		 }*/
		 if(vote.join_count>3){
			 //voteStudio += '<div class="count" ><span class="iconfont icon-join"></span><span class="num">'+vote.join_count+'</span><span class="text">人已参加</span></div>';
		 }else{
			 voteStudio += '<div class="count new" ></div>';
		 }
		 voteStudio += '</div><div class="grid-paper-ft"><div class="title-description"><h3 class="title">'+vote.title+'</h3><p class="description">'+vote.description+'</p><p class="ticketNum">参与人数：<span>'+vote.join_count+'</span></p></div></div></a>';
		    $('.page-content .papers').append(voteStudio);
	}

</script>
<%@include file="/jsp/comm_part/login_register.jsp"%>
</body>
</html>