<%@page import="com.utils.StrUtils"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="org.apache.commons.httpclient.HttpURL"%>
<%@page import="com.mimikj.model.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>股市合伙人---寻找自己的最佳炒股拍档</title>
    <link rel="stylesheet" type="text/css" href="${ctx }/css/bootstrap2.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/css/common.css-v=20151027.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/css/link.css-v=20151027.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/css/btn-sprite.css-v=20151027.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/css/icon-sprite.css-v=20151027.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/css/style.css-v=20151027.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/css/jsl.css-v=20151027.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/css/JiSiLu.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/css/indexuser-faqi.css"/>
    
    <script>
    var navigat_stype="${navigat_stype}";
    $(function() {
    	load_notice_letter();
    	var url="${ctx}/forum_post/list?mt=mobile";
    	if(navigat_stype=="follow"){
    		$("#follow").addClass("active");
    	}else if(navigat_stype=="square"){
    		$("#square").addClass("active");
    	}else if(navigat_stype=="findn"){
    		$("#findn").addClass("active");
    		url="${ctx}/cattle_peoples/search_cattle_peoples?mt=mobile";
    	}else if(navigat_stype=="add"){
    		$("#header_publish").addClass("active");
    	}else if(navigat_stype=="comrade"){
    		$("#comrade").addClass("active");
    		url="${ctx}/stock_informations/get_max_stock_price_by_user?mt=mobile";
    	}else{
    		url=location.href+"&mt=mobile";
    	}
    	if(isMobile() == true){
    		location.href=url;
    	}
    });
  //判断是否是手机页面
    function isMobile() {
        if((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i)))
            return true;
        else
            return false;

    }
    function load_notice_letter(){
    	if($("#is_login").val()=="false"){
    		return;
    	}
    	$.ajax({
    		url : "${ctx }/forum_notice/notice_remind_list",
    		type : 'get',
    		dataType : 'json',
    		success : function(data) {
    			if(data.result.length==0){
    				$("#notifications_unread").text("");
    				$("#header_notification_list").html('<p style="padding: 0" align="center">没有未读通知</p>');
    			}else{
    				$("#notifications_unread").text(data.num);
    				for(var i=0; i<data.result.length;i++){
    					add_notifications(data.result[i]);
    				}
    			}
    		}
    	});
    	$.ajax({
    		url : "${ctx }/f_private_letter/get_unread_count",
    		type : 'get',
    		dataType : 'json',
    		success : function(data) {
    			if(data==0){
    				$("#inbox_unread").text("");
    			}else{
    				$("#inbox_unread").text(data);
    			}
    		}
    	});
    }
    function add_notifications(data){
    	var strhtml = '<li class="notification">'
            +'<p>'
            +'<span class="pull-right aw-new-message-tips-close">'
            +'<a href="javascript:;" onclick="read_notification(-1)"><i class="aw-icon i-close"></i></a>'
            +'</span>';
            if(data.type==2){
            	strhtml = strhtml+ '<span class="message">'+data.count+' 项关于问题 <a href="${ctx}/forum_post/form?id='+data.post_id+'&answer_id='+data.comment_ids+'&notice_id='+data.notice_ids+'">'+data.post_name+'</a></span>'
                +'</p>'
                +'<p class="aw-message-dropdown-more">'
                +'<span class="pull-right">'
                +'<a class="aw-text-color-999" onclick="$(\'#extend_message_'+data.post_id+'\').fadeIn();$(this).hide();" style="font-size: 20px; font-weight: bold;">+</a>'
                +'</span>'
                +'<span class="aw-text-color-999"><small>'+data.create_time+'</small></span>'
                +'</p>'
                +'<div class="hide" id="extend_message_'+data.post_id+'">'
                +'<small>'
                +'<p>'+data.count+' 个新评论, 按回答人查看: ';
            	for(var i=0; i<data.detail.length;i++){
            		if(i==data.detail.length-1){
            			strhtml = strhtml + '<a href="${ctx}/forum_post/form?id=' + data.post_id + '&answer_id=' + data.detail[i].comment_id + '&notice_id='+data.detail[i].id+'">'+data.detail[i].nickname+'</a>' ;
            		}else
            			strhtml = strhtml + '<a href="${ctx}/forum_post/form?id=' + data.post_id + '&answer_id=' + data.detail[i].comment_id + '&notice_id='+data.detail[i].id+'">'+data.detail[i].nickname+'</a>,' ;
				}
                strhtml = strhtml + '</p>'
                +'</small>'
                +'</div>';
            }else{
            	strhtml =strhtml + '<span class="message"><a href="${ctx }/forum_post/user_info?user_id='+data.rel_user_id+'&notice_id='+data.id+'">'+data.nickname+'</a>关注了我</span>'
            }
            +'</li>';
    	$("#header_notification_list").append(strhtml);
    }
   // setInterval("load_notice_letter()", 60000);
    </script>
</head>

<body>
<div class="aw-top-menu-wrap">
    <div class="aw-wecenter aw-top-menu">
        <div class="row">
            <!-- logo -->
            <div class="span6 aw-logo">
                <a href="${ctx }/index.jsp" style="font-family:Microsoft YaHei;font-size:95%;margin-left:10px; color:#F8F8F8;">»首 页</a>

                <a href="#" style="font-family:Microsoft YaHei;font-size:95%;margin-left:10px; color:#F8F8F8;font-weight: normal;letter-spacing: 0.1em">专注做龙虎榜数据专数据的论坛</a>
            </div>
            <!-- end logo -->
            <%
            	Users user = (Users)session.getAttribute("cli_user");
                        	boolean islogin = false;
                        	String user_photo = "";
                        	String user_id = "-1";
                        	Object navigat_stype = request.getAttribute("navigat_stype");
                    		System.out.println("=================================="+navigat_stype);
                        	if(user==null){
                        		String url = request.getRequestURI();
                        		String countextpath = request.getContextPath();
                        		System.out.println("=================================="+url);
                        		if ((!url.endsWith("index_forum_post.jsp")
            				&& !url.endsWith("index_search_cattle_peoples.jsp")
            				&& !url.endsWith("form_forum_post.jsp"))
            				|| "follow".equals(navigat_stype)) {
            			response.sendRedirect(countextpath + "/users/login_index");
            			return;
            		}
            	} else {
            		islogin = true;
            		user_id = user.getId();
            		user_photo = StrUtils.GetString(user.getAvatar());
            	}
            %>
            <!-- 登陆&注册栏 -->
            <c:set var="islogin" value="<%=islogin %>"></c:set>
            <c:set var="user_id" value="<%=user_id %>"></c:set>
            <div class="span6 aw-login-register">
            <input type="hidden" id="is_login" value="${islogin }"/>
            	<c:choose>
            		<c:when test="${islogin==true }">
	            		<div class="pull-right offset1 aw-user-nav-dropdown">
	                    <a href="${ctx }/forum_post/user_info">
	                        <span class="pull-left"><%=user.getNickname()%></span>
	                        <%
	                        out.print("<img class='pull-left' id='user_pic' src='http://mimikj.com:8081/mimikj/images/"+user.getAvatar()+"'/>");
	                        	/* if(user_photo.startsWith("user/")){
	                        		out.print("<img class='pull-left' id='user_pic' src='http://mimikj.com:8081/mimikj/images/"+user.getAvatar()+"'/>");
	                        	}else{
	                        		out.print("<img class='pull-left' id='user_pic' src='http://mimikj.com/uploads/user/avatar/"+user.getId()+"/"+user.getAvatar()+"'/>");
	                        	} */
	                        %>
	                    </a>
	                    <div class="dropdown-menu aw-dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
	                        <span><i class="aw-icon i-dropdown-triangle active"></i></span>
	                        <ul>
	                            <li><a href="${ctx }/forum_post/user_info" tabindex="-1">主页 <i class="aw-icon i-user-post"></i></a></li>
	                            <li><a href="${ctx }/forum_post/list?user_id=${user_id}" tabindex="-1">我的关注</a></li>
	                            <li><a href="${ctx }/forum_store_up/list" tabindex="-1">我的收藏</a></li>
	                            <li><a href="${ctx }/users/setting_index?type=black" tabindex="-1">黑名单</a></li>
	
	                            <li><a href="${ctx }/users/setting_index?type=profile" tabindex="-2">设置 <i class="aw-icon i-setting-no-hover"></i></a></li>
	                            <li><a href="${ctx }/users/log_out">退出 <i class="aw-icon i-logout"></i></a></li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="pull-right aw-logined-nav">
	                    <ul>
	                    	<li>
	                            <a href="${ctx }/forum_notice/list">通知<span id="notifications_unread" class="badge badge-important" style=""></span></a>
	                            <div class="aw-message-dropdown">
	                                <span><i class="aw-icon i-dropdown-triangle active"></i></span>
	                                <ul id="header_notification_list">	
	                                </ul>
	                            </div>
	                        </li>
	                        <li><a href="${ctx }/f_private_letter/index">私信<span id="inbox_unread" class="badge badge-important" style=""></span></a></li>
	                    </ul>
	                </div>
            		</c:when>
            		<c:otherwise>
            		<p class="pull-right">
	                    <a href="${ctx }/users/login_index">登录</a>
	                    <a href="${ctx }/jsp/users/register.jsp">注册</a>
	                </p>
            		</c:otherwise>
            	</c:choose>
            </div>
            <!-- end 登陆&注册栏 -->
        </div>
    </div>
    <div class="aw-wecenter aw-nav">
        <div class="row">
            <div class="span10 aw-nav-wrap">
                <div class="aw-nav-left"></div>
                <div class="aw-nav-middle">
                    <!-- 导航条 -->
                    <div class="aw-nav-main pull-left">
                        <ul class="aw-top-nav">
                         	<c:if test="${islogin==true }">
	                            <li><a href="${ctx }/forum_post/list?user_id=${user_id}" id="follow"><i class="aw-icon i-index-no-hover"></i>我的关注<i class="aw-icon i-nav-hover-triangle"></i></a></li>
	                        </c:if>
                            <li><a href="${ctx }/forum_post/list" id="square"><i class="aw-icon i-question-no-hover"></i>龙虎集市<i class="aw-icon i-nav-hover-triangle"></i></a></li>
                            <li><a href="${ctx }/cattle_peoples/search_cattle_peoples" id="findn" ><i class="aw-icon i-question-no-hover"></i>发现牛人<i class="aw-icon i-nav-hover-triangle"></i></a></li>
                            <li><a href="${ctx }/stock_informations/get_max_stock_price_by_user" id="comrade"><i  class="aw-icon i-question-no-hover"></i>寻找战友<i  class="aw-icon i-nav-hover-triangle"></i></a></li>
                            <li><a href="${ctx }/jsp/financing_vote/vote_themes.jsp" id="vote"><i  class="aw-icon i-question-no-hover"></i>嗅觉测试站<i  class="aw-icon i-nav-hover-triangle"></i></a></li>
                            <li><a href="${ctx }/stock_dog_news/news_list" id="stock_dog"><i  class="aw-icon i-question-no-hover"></i>股狗秘闻<i  class="aw-icon i-nav-hover-triangle"></i></a></li>
                        </ul>
                    </div>
                    <!-- end 导航条 -->

                </div>

                <div class="aw-nav-right"></div>
            </div>
            <div class="span2 aw-pulish">
                <a id="header_publish" href="${ctx }/forum_post/index" class="aw-btn b-start-question" style="padding-left: 35px;padding-right: 35px;" id="add">观点建仓</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>