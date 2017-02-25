<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="pic_url" value="http://www.mihaokj.com:8081/images" />
<c:set var="photo_pic_url" value="http://mimikj.com:8081/mimikj/images/" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>嗅觉测试站－来试下对金融事件第一直觉吧</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="${ctx }/images/zm_log.ico" rel="shortcut icon"/>
    <link rel="stylesheet" href="${ctx }/css/common-vote.css"/>
    <link rel="stylesheet" href="${ctx }/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx }/css/newmain.css"/>
    <link rel="stylesheet" href="${ctx }/css/voteStudio.css"/>
    <link rel="stylesheet" href="${ctx }/css/gogounews.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/jquery.form.js" type="text/javascript"></script>
    <script src="${ctx}/js/bootstrap.js"></script>
    <script src="${ctx }/js/zmMobile.js"></script>
    <script>
        if (isMobile()) {
            //加载移动端页面
            loadjscssfile('${ctx }/css/voteStudioMobile.css', 'css');
            loadjscssfile('${ctx }/css/gogounews_mobile.css','css');
            loadjscssfile("${ctx}/css/newmain_mobile.css", "css");
        }
    </script>
    <noscript>
        <link rel="stylesheet" media="screen and (max-width:560px)" href="${ctx }/css/voteStudioMobile.css"/>
    </noscript>
    <style>
        body {
            background-color: #ffffff;
        }

        * {
            box-sizing: border-box;
        }

        .tables {
            display: table;
        }

        .table-middle {
            vertical-align: middle;
            display: table-cell;
        }

        .bgColor1 {
            background-color: #3462ff;
            color: #fff;
        }

        .bgColor1 {
            background-color: #3462ff;
            color: #fff;
        }
        .bgColor2 {
            background-color: #FFA400;
            color: #fff;
        }
        .bgColor3 {
            background-color: #A221CC;
            color: #fff;
        }
        .bgColor4 {
            background-color: #FF7B7B;
            color: #fff;
        }
        .bgColor5 {
            background-color: #4ABBD0;
            color: #fff;
        }
        .bgColor6 {
            background-color: #4A4343;
            color: #fff;
        }
        .vote_content {
            font-size: 0;
        }

        .commentsBox {
            width: 50%;
            display: inline-block;
            vertical-align: top;
        }

        .commentsBox > div {
            height: 7rem;
            width: 100%;
            position: relative;
            display: inline-block;
            padding: 0 15px;
            margin: 0 0 .88rem;
            font-size: 13px;
            overflow: hidden;
        }

        .commentDivImgSpan {
            display: inline-block;
            width: 11px;
            height: 13px;
            background: url('${ctx }/images/flower.png') center center no-repeat;
            background-size: 100%;
            vertical-align: middle;
            margin-right: 3px;
        }

        .commentsBox1 > div:first-child {
            color: #3462FF;
            text-align: center;
            line-height: 1;
        }

        .toComment {
            width: 100%;
            height: 100%;
            border: 1px dashed rgba(0, 0, 0, .1);
        }

        .commentsBox2 > div {
            padding-left: 0;
        }

        .comment {
            padding: .4rem;
            position: relative;
            height: 100%;
        }

        div.commentAutoHeight, .commentAutoHeight .commentContent {
            height: auto;
        }

        .commentAutoHeight .commentFooter {
            position: relative;
            padding-top: .2rem;
        }

        .commentAutoHeight .getMore {
            display: none !important;
        }

        .commentTitle {
            text-align: left;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            margin-bottom: 3px;
        }

        .headImg {
            width: .88rem;
            height: .88rem;
            margin-right: .28rem;
            border-radius: 50%;
            vertical-align: middle;
        }

        .commentContent {
            line-height: 1.5;
            height: 4.5rem;
            overflow: hidden;
        }

        .commentFooter {
            position: absolute;
            bottom: 0;
            width: calc(100% - .8rem);
            padding-bottom: .2rem;
        }

        .likeSpan {
            display: inline-block;
            width: .56rem;
            height: .52rem;
            background: url('${ctx }/images/dianzan_bai.png') center no-repeat;
            background-size: 100%;
            vertical-align: middle;
            margin-right: 3px;
        }

        .likeSpan.active {
            background: url('${ctx }/images/dianzan_hong.png') center no-repeat;
            background-size: 100%;
        }

        .getMore {
            position: absolute;
            bottom: .2rem;
            left: calc(50% - .28rem);
            display: inline-block;
            width: .56rem;
            height: .56rem;
            background: url('${ctx }/images/getMore.png') center no-repeat;
            background-size: 100%;
            display: none;
        }
        .commentsBox p{
            color:#fff;
        }
    </style>
</head>
<body>
<nav class="navbar-fixed-top">

    <div class="container nm_content">
        <div class="navbar-header">
            <a class="navbar-brand" href="http://www.mihaokj.com/jsp/financing_vote/vote_themes.jsp"><img src="${ctx }/images/xiujueceshizhan.png" alt="众米图标" id="nm-icon"/></a>
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
<section class="vote">
    <div class="vote_title">
        <div class="voteTitleImgBox">
            <img src="${pic_url }/${vote.cover_url }"/>
        </div>
        <div class="vote_title_description">
             <h2 class="title">${vote.title }</h2>
             <p class="description">${vote.description }</p>
        </div>
    </div>
    <div class="vote_content">
        <div class="commentsBox commentsBox1">
            <div class="commentDiv">
                <div class="tables toComment">
                    <div class="table-middle comment" onclick="toTalk();"><span class="commentDivImgSpan"></span>说点什么</div>
                </div>
            </div>
            <c:set var="index" value="0"></c:set>
            <c:forEach var="comment" items="${comment_list }" varStatus="status">
            <c:set var="index" value="${index+1 }"></c:set>
            	<c:if test="${status.index>6 }">
            		 <c:set var="index" value="1"></c:set>
            	</c:if>
	    		<c:if test="${status.index%2==1 }">
	    			<div class="">
		                <div class="comment bgColor${index }">
		                    <div class="commentTitle">
		                    	<img  alt="${comment.nickname }" src="${photo_pic_url }/${comment.avatar }" class="headImg">${comment.nickname }
		                    </div>
		                    <div class="commentContent">
			                    <p>${comment.content }</p>
		                    </div>
		                    <div class="commentFooter">
		                        <span class="likeSpan"></span><span class="likeNum" id="${comment.id }">${comment.praise_count }</span>
		                        <span class="getMore"></span>
		                    </div>
		                </div>
		
		            </div>
	    		</c:if>
	    	</c:forEach>
        </div>
        <div class="commentsBox commentsBox2">
        	<c:set var="index" value="0"></c:set>
            <c:forEach var="comment" items="${comment_list }" varStatus="status">
            <c:set var="index" value="${index+1 }"></c:set>
            	<c:if test="${status.index>6 }">
            		 <c:set var="index" value="1"></c:set>
            	</c:if>
	    		<c:if test="${status.index%2==0 }">
	    			<div class="">
		                <div class="comment bgColor${index }">
		                    <div class="commentTitle">
		                    	<img  alt="${comment.nickname }" src="${photo_pic_url }/${comment.avatar }" class="headImg">${comment.nickname }
		                    </div>
		                    <div class="commentContent">
								<p> ${comment.content }</p>
		                    </div>
		                    <div class="commentFooter">
		                        <span class="likeSpan"></span><span class="likeNum" id="${comment.id }">${comment.praise_count }</span>
		                        <span class="getMore"></span>
		                    </div>
		                </div>
		
		            </div>
	    		</c:if>
	    	</c:forEach>
        </div>
    </div>
    <script>
        $('.likeSpan,.likeNum').click(function () {
            var $likeNumEle = $(this).parents('.commentFooter').find('.likeNum');
            var $likeSpanEle = $(this).parents('.commentFooter').find('.likeSpan');
            if (!$likeSpanEle.hasClass('active')) {
            	var id =  $likeNumEle.attr("id");
                $.post("${ctx}/financing_vote_comment/praise",{id:id},function(data){
          		 	if(data.success==false){
          		 		alert("点赞失败");
          		 	}else{
          		 		$likeSpanEle.addClass('active');
                        var likeNum = $likeNumEle.text() || 0;
                        $likeNumEle.text(++likeNum);
        		 	}
          		 });
            }

        });
        $(".getMore").click(function () {
            var $commentParent = $(this).parents('.comment').parent();
            $commentParent.addClass('commentAutoHeight');
        });
        $(function () {
            $(".comment").each(function () {
                var pHeight = $(this).find(".commentContent p").height();
                var commentContentHeight = $(this).find(".commentContent").height();
                if (pHeight > commentContentHeight) {
                    $(this).find('.getMore').show();
                }
            });
        });
        function toTalk(){
        	var cli_user="${cli_user}";
        	if(cli_user==""){
        		//alert("请先登录");
        		toLogin();
        		return false;
        	}else{
        		location.href='${ctx}/financing_vote_comment/save_talk?vote_id=${vote.id}'
        	}
        }
    </script>
</section>
<%@include file="/jsp/comm_part/login_register.jsp"%>
</body>
</html>