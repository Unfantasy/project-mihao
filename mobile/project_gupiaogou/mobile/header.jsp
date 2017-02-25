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
<script type="text/javascript" src="${ctx }/js/bootstrap2.js"></script>
<head>
    <meta charset="utf-8"/>
    <title>股市合伙人---寻找自己的最佳炒股拍档</title>
    <style type="text/css">
     .nav-pills > li > span{
            padding-top: 8px;
            padding-bottom: 8px;
            margin-top: 2px;
            margin-bottom: 2px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            display:inline-block;
            line-height: 14px;
        }
        .nv_active{
	           text-decoration: underline;
	        }
    </style>
    <script>
    var navigat_stype="${navigat_stype}";
    $(function() {
    	var url="${ctx}/forum_post/list";
    	if(navigat_stype=="square"){
    		$("#square").addClass("nv_active");
    	}else if(navigat_stype=="findn"){
    		$("#findn").addClass("nv_active");
    		url="${ctx}/cattle_peoples/search_cattle_peoples";
    	}else if(navigat_stype=="comrade"){
    		$("#comrade").addClass("nv_active");
    		url="${ctx}/stock_informations/get_max_stock_price_by_user";
    	}else{
    		url=location.href;
    		url=url.replace("mt=mobile&","").replace("&mt=mobile","").replace("?mt=mobile","");
    	}
    	if(isMobile() == false){
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
    </script>
</head>

<body>
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
            		String contextpath = request.getContextPath();
            		System.out.println("=================================="+url);
            		if((!url.endsWith("index_forum_post.jsp")&&!url.endsWith("index_search_cattle_peoples.jsp")&&!url.endsWith("form_forum_post.jsp"))){
            			response.sendRedirect(contextpath+"/users/login_index?mt=mobile");
            			return;
            		}
            	}else{
            		islogin= true;
            		user_id = user.getId();
            		user_photo = StrUtils.GetString(user.getAvatar());
            	}
            %>
            <!-- 登陆&注册栏 -->
            <c:set var="islogin" value="<%=islogin %>"></c:set>
            <c:set var="user_id" value="<%=user_id %>"></c:set>
            <input type="hidden" id="is_login" value="${islogin }"/>
    <div class="row">
        <img src="${ctx }/images/banner.png" id="phone_top" alt="顶部图片"/>
        <div class="span12">
            <ul class="nav nav-pills">
                <li><a href="${ctx }/forum_post/list?mt=mobile" id="square">龙虎集市</a></li>
                <li><a href="${ctx }/cattle_peoples/search_cattle_peoples?mt=mobile" id="findn">发现牛人</a></li>
                <li><a href="${ctx }/stock_informations/get_max_stock_price_by_user?mt=mobile"  id="comrade">寻找战友</a></li>
                <li><a href="${ctx }/jsp/financing_vote/vote_themes.jsp" id="vote">嗅觉测试站</a></li>
                <li><a href="${ctx }/stock_dog_news/news_list" id="stock_dog">股狗秘闻</a></li>
                <li><a href="${ctx }/html/gupiaodog.html" id="">股票狗</a></li>
              <c:choose>
            	<c:when test="${islogin==true }">
                <li class="dropdown">
                    <a class="dropdown-toggle"
                       data-toggle="dropdown"
                       href="#">
                        我
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${ctx }/forum_post/user_info?mt=mobile">我的主页</a></li>
                        <li><a href="${ctx }/f_private_letter/index?mt=mobile">私信</a></li>
                        <li><a href="${ctx }/forum_setting/index?mt=mobile">设置</a></li>
                        <li><a href="${ctx }/users/log_out?mt=mobile">退出</a></li>
                    </ul>
                </li>
                </c:when>
            		<c:otherwise>
            		    <li><span><a href="${ctx }/users/login_index?mt=mobile">登录</a>
	                       <a href="${ctx }/jsp/mobile/users/register.jsp">注册</a></span>
	                    </li>
            		</c:otherwise>
            	</c:choose>
            </ul>
        </div>
    </div>
</body>
</html>