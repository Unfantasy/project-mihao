<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="basepath" value="https://www.mihaokj.com" />
<%-- <c:set var="basepath" value="http://localhost:8080/mimikj_manage" /> --%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>杭州米号科技有限公司</title>
	 <meta name="description" content="众米是由杭州米号科技有限公司于2014年末推出的一款轻量、简洁的自选股管家应用，在版本的开发中，我们深入挖掘用户的需求，着重打造了证券信息传递这一功能。">
    <meta name="keywords" content="众米,米号,米号科技,众米科技有限公司,米号科技有限公司">
    <link href="${ctx}/images/zm_log.ico" rel="shortcut icon" />
    <script type="text/javascript">
        $(function () {
            if (isMobile() == true) {
                loadjscssfile("${ctx}/css/newmain_mobile.css", "css");
				 var href = $('#forum').attr('href');
                        if(href.indexOf('?')!=-1){
                            href +='&mt=mobile';
                        }else{
                            href +='?mt=mobile';
                        }
                        $('#forum').attr('href',href);
            }
            $(".mainJoinUsLi").on('mouseover',function(){
                $('.mainJoinUsBox').slideDown();
            }).on('mouseleave',function(){
                $('.mainJoinUsBox').slideUp();
            });
        });
        // JavaScript Document
        function loadjscssfile(filename, filetype) {
            if (filetype == "js") {
                var fileref = document.createElement('script');
                fileref.setAttribute("type", "text/javascript");
                fileref.setAttribute("src", filename);
            } else if (filetype == "css") {
                var fileref = document.createElement('link');
                fileref.setAttribute("rel", "stylesheet");
                fileref.setAttribute("type", "text/css");
                fileref.setAttribute("href", filename);
            }
            if (typeof fileref != "undefined") {
                document.getElementsByTagName("head")[0].appendChild(fileref);
            }

        }
        //判断是否是手机页面
        function isMobile() {
            if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i)))
                return true;
            else
                return false;
        }
        //判断是否是ios系统
        var u = navigator.userAgent, app = navigator.appVersion;
        var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
        
    </script>
</head>
<body>
<nav class="navbar-fixed-top">

    <div class="container nm_content">
        <div class="navbar-header">
            <a class="navbar-brand" href="http://www.mihaokj.com"><img src="${ctx }/images/zhongmilogo.png" alt="众米图标" id="nm-icon"/></a>
                <button class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse"
                        type="button">
                    <span class="nm-list"></span>
                    <!-- <span class="glyphicon glyphicon-menu-hamburger" style="font-size: 20px;color:#000"></span> -->
                </button>

        </div>
        <div class="collapse navbar-collapse navbar-right" id="navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="${ctx }/" id="index">首页</a></li>
					<li><a href="${ctx }/index_company.jsp" id="company">公司</a></li>
					<li><a href="${ctx }/index_help.jsp" id="help">帮助</a></li>
					<li><a id="forum" href="${ctx }/forum_post/list" target="_blank">官方论坛</a>
					<li><a href="${ctx }/cybertron/cybertron_list" target="_blank">Cybertron工作室</a></li>
					<%-- <li><a href="${ctx }/index_invest_stock.jsp" target="_blank">活动</a></li> --%>
                    <li class="mainJoinUsLi">
                        <a href="javascript:;" class="mainJoinUs">加入我们</a>
                        <div class="mainJoinUsBox">
                            <div><a href="http://www.mihaokj.com/html/submit_main_tell.html">讲述大师</a></div><div><a
                                href="http://www.mihaokj.com/html/submit_main_race.html">发起比赛</a></div></div>
                    </li>
                    <%--<li class="register_login">
                    <a href="${basepath }/jsp/user_deal/index_user_deal_login.jsp">登录</a>&nbsp;| &nbsp;<a href="${basepath }/user_deal/index_regist">注册</a>
                    	<%-- <c:choose>
                    		<c:when test="${third_user==null }">
                    		<c:choose>
                    			<c:when test="${cli_deal_user==null }">
	                    		<a href="${basepath }/jsp/user_deal/index_user_deal_login.jsp">登录</a>&nbsp;| &nbsp;<a href="${basepath }/user_deal/index_regist">注册</a>
	                    		&nbsp;| &nbsp;<a href="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=101330854&scope=get_user_info&redirect_uri=http%3A%2F%2Fmihaokj.com%2Fusers%2Flog_in_by_qq&state=test" ><img src="${ctx }/images/qq_login.png" width="16px">登录</a>
	                    		</c:when>
	                    		<c:otherwise>
	                    		<a href="${basepath }/user_deal/deal_user_info">${cli_deal_user.user_name}</a>
	                    		</c:otherwise>
	                    		</c:choose>
                    		</c:when>
                    		<c:otherwise>
	                    		<a href="#"><img src="${ctx }/images/qq_login.png" width="16px" />${third_user.nickname}</a>
	                    	</c:otherwise>
                    	</c:choose>
                    </li>--%>
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
</body>
</html>