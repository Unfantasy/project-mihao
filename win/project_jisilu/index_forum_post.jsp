<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@include file="/jsp/comm_part/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="Chrome=1,IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title>股市合伙人---发现最搭的投资战友</title>
    <link rel="stylesheet" href="${ctx }/css/bootstrap2.css"/>
    <link href="${ctx }/css/common.css-v=20151027.css" rel="stylesheet" type="text/css"/>
    <link type="text/css" rel="stylesheet" href="${ctx }/css/page_style.css"/>
    
    <script src="${ctx }/js/jquery-2.1.4.min.js"type="text/javascript"></script>
    <script type="text/javascript" src="${ctx }/js/jqPaginator.js"></script>
    <style>
        body,html{
            width:100%;
        }

        .nav-pills{
            background-color:#F2F2F2;
        }
        .nav-pills li a{
            color:black;

        }
        .nav{
            margin-bottom:0px;
        }
        .nav-pills>li{
            width: 25%;
            text-align: center;
        }
        *{
            box-sizing:border-box;
        }
        .container-fluid{
            padding-right:0;
        }
        #phone_top{
            width:100%;
            height:50px;
        }
        .dropdown-menu{
            min-width: 50px;
        }
            /*重写common中的样式，改为手机上适应的*/
        .aw-question-list .aw-questoin-content h4{
            width:100%;
        }
        .aw-main-content{
            width:100%;
        }
        .span12{
            width:100%;
            margin:0;
        }
        .aw-main-content{
            padding-bottom:0px;
        }
        .category{
            padding-left:15px;
        }
        .category .span12 > ul > li.active {
            background: #225599;
        }
        .category .span12 > ul > li{
            height: 20px;
            line-height: 20px;
            border-radius:10px;
        }
        .aw-content-wrap{
            padding: 0;
        }
        .category .span12 > ul > li:hover, .category dl:hover {
            position: relative;
            z-index: 999;
            background: #225599;
        }
        .aw-main-content{
            padding-left:20px;
            padding-top:0px;
        }
        .aw-content-wrap .aw-all-question {
            padding-top: 10px;
        }
        hr{
            margin:0;
        }
        .phone_more{
            width:100%;
            background-color:#F0F0F0;
            height:30px;
            text-align: center;
            text-decoration:underline;
            line-height:30px;
        }
    </style>
    <script>
    var type = "${type}";
    var page =${page};
    var totalpages = ${totalPages};
        $(function(){
        	$("#type_"+type).addClass("active");
        	var prev = page - 1;
        	var next = page + 1;
        	if(prev < 1){prev = 1;}
        	if(next > totalpages){next = totalpages;}
        	$("#page").click();
        	$.jqPaginator('#pagination1', {
                totalPages: totalpages,
                visiblePages: 7,
                currentPage: page,
                first: '<li class="first"><a href="${ctx}/forum_post/list?mt=mobile&type='+type+'">首页<\/a><\/li>',
                prev: '<li class="prev"><a href="${ctx}/forum_post/list?mt=mobile&page='+prev+'&type='+type+'"><i class="arrow arrow2"><\/i>上一页<\/a><\/li>',
                next: '<li class="next"><a href="${ctx}/forum_post/list?mt=mobile&page='+next+'&type='+type+'">下一页<i class="arrow arrow3"><\/i><\/a><\/li>',
                last: '<li class="last"><a href="${ctx}/forum_post/list?mt=mobile&page={{totalPages}}&type='+type+'">末页<\/a><\/li>',
                page: '<li class="page"><a href="${ctx}/forum_post/list?mt=mobile&page={{page}}&type='+type+'">{{page}}<\/a><\/li>',
                onPageChange: function (num, type) {
                }
            });
        });
    </script>
</head>

<body>
<div class="container-fluid">
<%@include file="/jsp/mobile/comm_part/header.jsp"%>
        <div class="row category">
            <div class="span12">
                <ul>
                    <li id="type_0"><a href="${ctx }/forum_post/list?mt=mobile&type=0">全部</a></li>
                    <li id="type_1">
                        <a href="${ctx }/forum_post/list?mt=mobile&type=1">龙虎数据</a>
                    </li>
                    <li id="type_2" >
                        <a href="${ctx }/forum_post/list?mt=mobile&type=2">投资大咖秀</a>
                    </li>
                    <li id="type_3" >
                        <a  href="${ctx }/forum_post/list?mt=mobile&type=3">操盘手日志</a>
                    </li>
                </ul>
            </div>
        </div>
        <hr/>
        <div class="row aw-content-wrap">
            <div class="span12 aw-main-content aw-all-question">
                 <!-- 问题列表 -->
                <div class="aw-mod aw-question-box-mod">
                    <div class="aw-mod-body">
                        <div class="aw-question-list" id="contents_user_actions_answers">
                        <c:forEach items="${list }" var="f_post">
                        <div class="aw-item">
                                <!-- 回复数据 -->
                                <span class="aw-question-replay-count aw-border-radius-5 active">
                                    <em>${f_post.comment_count }</em>评论
                                </span>
                                <!-- end 回复数据 -->
                                <div class="aw-questoin-content">
                                    <!-- 标题 -->
                                    <h4>
                                        <a href="${ctx }/forum_post/form?mt=mobile&id=${f_post.id}"><c:if test="${f_post.top>0 }"><strong>[置顶] </strong></c:if>${f_post.title }</a>
                                        </h4>
                                    <span class="aw-text-color-999">
										<a href="${ctx }/forum_post/user_info?mt=mobile&user_id=${f_post.user_id}" class="aw-user-name" data-id="2">${f_post.nickname }</a>   
											• ${f_post.create_time } 发布						
                                    </span>
                                    <!-- end 标题 -->

                                </div>
                            </div>
                        </c:forEach>
                        </div>
                        <!-- start 页码 -->
	                <a id="page" href="${ctx}/forum_post/list?mt=mobile&page=2"></a>
	    			<ul class="pagination" id="pagination1"></ul>
					<!-- end 页码 -->
                    </div>
                </div>
                <!-- end 问题列表 -->
        </div>
        </div>
        <%@include file="/jsp/mobile/comm_part/footer.jsp"%>
</div>
</body>
</html>