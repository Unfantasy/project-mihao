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
    <meta name="description" content="嗅觉测试站－来试下对金融事件第一直觉吧"/>
    <link href="${ctx }/images/zm_log.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="${ctx }/css/common-vote.css"/>
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx}/css/newmain.css"/>
    <link rel="stylesheet" href="${ctx }/css/voteStudio.css"/>
    <link rel="stylesheet" href="${ctx }/css/gogounews.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/jquery.form.js" type="text/javascript"></script>
    <script src="${ctx}/js/bootstrap.js"></script>
    <script src="${ctx}/js/zmMobile.js"></script>
    <script>
        if(isMobile()){
            //加载移动端页面
        	loadjscssfile('${ctx }/css/voteStudioMobile.css', 'css');
            loadjscssfile('${ctx }/css/gogounews_mobile.css','css');
            loadjscssfile("${ctx}/css/newmain_mobile.css", "css");
        }
        function submitForm1() { 
        	if(!$(".options .option").hasClass('selected')){
        		alert("请至少选择一个");
        		return false;
        	}
    		// jquery 表单提交 
    		$("#form1").ajaxSubmit({
    			type: 'post',
    	        dataType: 'json',
    			success:function(data){
    				if(data.success){
    					var vote_id = data.result.vote_id;
    					var items = data.result.items;
    					location.href="${ctx}/financing_vote_users/"+vote_id+"/"+items;
    				} else{
    					alert("投票失败");
    				}
    			}
    		}); 
    		return false; 
    			// 必需返回false，不然表单会本人再做一次提交操作，并且页面跳转 
    	}
        function push_comment(){
        	var cli_user="${cli_user}";
        	if(cli_user==""){
        		//alert("请先登录");
        		toLogin();
        		return false;
        	}
        	submitForm2();
        }

        function submitForm2() { 
        	if($("#content").val()==""){
        		alert("请输入评论内容");
        		return false;
        	}
    		// jquery 表单提交 
    		$("#form2").ajaxSubmit({
    			type: 'post',
    	        dataType: 'json',
    			success:function(data){
    				if(data.success){
    					alert("保存成功");
    					location.reload();
    				} else{
    					alert("保存失败");
    				}
    			}
    		}); 
    		return false; 
    			// 必需返回false，不然表单会本人再做一次提交操作，并且页面跳转 
    	}
    </script>
    <noscript>
        <link rel="stylesheet" media="screen and (max-width:560px)" href="${ctx }/css/voteStudioMobile.css"/>
        <link rel="stylesheet" media="screen and (max-width:560px)" href="${ctx }/css/gogounews_mobile.css"/>
        <link rel="stylesheet" media="screen and (max-width:560px)" href="${ctx }/css/newmain_mobile.css"/>
    </noscript>
    <style>
       
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
    <form id="form1" action="${ctx }/financing_vote_users/user_vote" method="post" onsubmit="return false;" >
    	<input id="vote_id" name="vote_id" type="hidden" value="${vote.id }"/>
        <ul class="options clearfix">
        <c:forEach var="item" items="${vote_items }" varStatus="status">
        	<li class="option">
                <div class="pic"><img src="${pic_url }/${item.cover_url }" alt=""/><span class="iconfont icon-selected"></span></div>
                <div class="vertical-wrapper"><div class="vertical"><span class="text">${item.description }</span></div></div>
                <span class="iconfont icon-checkbox"></span>
                <input type="checkbox" id="q${item.id }" name="item_id" value="${item.id }"/>
            </li>
        </c:forEach>
        </ul>
        <div class="submitBtnBox text-center">
            <input type="submit" class="submitBtn" value="投票" onclick="submitForm1()"/>
        </div>
       </form>
    </div>
    <div class="comments">
        <div class="commentsHeader">
        	<form id="form2" action="${ctx }/financing_vote_comment/save" method="post"onsubmit="return false;" >
            <p class="count">${fn:length(comment_list)}条评论</p>
            <a href="javascript:;" class="avatar"><img src="${ctx }/images/missing_face.png" alt="默认头像"></a>
            <textarea id="content" name="content" onfocus='if("${cli_user}"=="")toLogin();' placeholder="我有意见"></textarea>
            <input id="vote_id" name="vote_id"  type="hidden" value="${vote.id }"/>
            <div class="commentBtnBox clearfix">
                <a href="#" class="commentBtn" onclick="push_comment()">评论</a>
            </div>
            </form>
        </div>
        <div class="commentsBody">
            <div class="items">
            <c:forEach var="comment" items="${comment_list }">
            	<div class="item">
                    <div class="commentLeft">
                        <a href="javascript:void(0)" class="avatar">
                            <img  alt="${comment.nickname }" src="${photo_pic_url }/${comment.avatar }">
                        </a>

                    </div>
                    <div class="commentRight">
                        <div class="nameDate">
                            <a href="javascript:void(0)" class="name">${comment.nickname }</a>
                            <span class="date"><fmt:formatDate value="${comment.create_time }" pattern="MM月dd日 HH:mm"/></span>
                        </div>
                        <p class="commentText">${comment.content }</p>
                    </div>
                </div>
            </c:forEach>
            </div>
            <div class="loader">
                <p class="notext">没有更多了</p>
            </div>
        </div>
    </div>
</section>
<script>
    $(function(){
        $('input[type="checkbox"]').prop('checked',false);
    });
    $(".options .option").click(function(){
        $(this).toggleClass('selected');
        if($(this).hasClass('selected')){
            $(this).find('.iconfont').removeClass('icon-checkbox').addClass('icon-checkbox-selected');
            $(this).find('input[name="item_id"]').prop('checked',true);
        }else{
            $(this).find('.iconfont').removeClass('icon-checkbox-selected').addClass('icon-checkbox');
            $(this).find('input[name="item_id"]').prop('checked',false);
        }
    });
</script>
<%@include file="/jsp/comm_part/login_register.jsp"%>
</body>
</html>