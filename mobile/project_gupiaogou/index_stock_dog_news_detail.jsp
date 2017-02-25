<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="pic_url" value="http://www.mihaokj.com:8081/images" />
<c:set var="photo_pic_url" value="http://mimikj.com:8081/mimikj/images/" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>股狗秘闻－中国证券人常看的行业匿闻</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="股狗秘闻－中国证券人常看的行业匿闻"/>
    <link href="${ctx }/images/zm_log.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="${ctx }/css/common-vote.css"/>
    <link rel="stylesheet" href="${ctx }/css/voteStudio.css"/>
    <link rel="stylesheet" href="${ctx }/css/icon-sprite.css"/>
    <link rel="stylesheet" href="${ctx }/css/gogounews.css"/>
    <style>
        .comment{
            display: none;
        }
    </style>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/jquery.form.js" type="text/javascript"></script>
    <script src="${ctx}/js/jweixin-1.1.0.js"></script>
    <script src="${ctx}/js/zmMobile.js"></script>
    <script>
        if(isMobile()){
            //加载移动端页面
            loadjscssfile('${ctx}/css/voteStudioMobile.css','css');
            loadjscssfile('${ctx }/css/gogounews_mobile.css','css');
        }
        function f_praise(){
            var id = "${stock_dog_news.id}";
            $.post("${ctx}/stock_dog_news/praise",{id:id},function(data){
      		 	if(data.success==false){
      		 		alert("点赞失败");
      		 	}else{
      		 	 var count = $('.aw-vote-bar-count').text();
                 $('.aw-vote-bar-count').text(++count);
                 $('.aw-icon').removeClass('i-question-agree').addClass('i-add');
    		 	}
      		 });
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
        function f_praise(id,e){
            $.post("${ctx}/stock_dog_news/praise",{id:id},function(data){
                if(data.success==false){
                    alert("点赞失败");
                }else{
                    if(!$(e).find('.zan').hasClass('active')){
                        var count = Number($(e).find('#pcount').text())+1;
                        $(e).find('#pcount').text(count);
                        $(e).find('.zan').addClass('active');
                    }
                }
            });
        }
    </script>
    <noscript>
        <link rel="stylesheet" media="screen and (max-width:560px)" href="${ctx}/css/voteStudioMobile.css"/>
        <link rel="stylesheet" media="screen and (max-width:560px)" href="${ctx}/css/gogounews_mobile.css"/>
    </noscript>
    <style>
        li{
            list-style: none;
        }
        a,a:link,a:active,a:hover{
            text-decoration: none;
        }
        li.colour1 .newcontent,li.colour1 .newcontent p{
            background-color: #64C896;
            color:#fff;
        }
        li.colour2 .newcontent,li.colour2 .newcontent p{
            background-color: #F4BE78;
            color:#fff;
        }
        li.colour3 .newcontent,li.colour3 .newcontent p{
            background-color: #FF966E;
            color:#fff;
        }
        li.colour4 .newcontent,li.colour4 .newcontent p{
            background-color: #EB96BF;
            color:#fff;
        }
        li.colour5 .newcontent,li.colour5 .newcontent p{
            background-color: #3C4145;
            color:#fff;
        }
        li.colour6 .newcontent,li.colour6 .newcontent p{
            background-color: #59B4C7;
            color:#fff;
        }
        li.colour7 .newcontent, li.colour7 .newcontent p{
            background-color: #82C369;
            color:#fff;
        }
        .circle,.newtime,.controlbox{
            display: none;
        }
        body{
            background-color: #ffffff;
        }
        body .vote, body .voteList{
            padding-top:0;
        }
        .newcontent{
            padding:15px;
            font-size: 18px;
        }

        .comment {
            padding: 5px 0;
        }
        .comment a{
            color:#ddd;
            font-size:16px;
        }
        .pbox{
            max-height: 10000px;
        }
        textarea,input{
            -webkit-tap-highlight-color: rgba(0,0,0,0);
        }
    </style>
</head>
<body>

<section class="vote">
    <!--分享链接图片-->
    <div hidden><img src="${ctx }/images/stock_dog_news_0.png" alt="share_picture"/></div>
    <div class="content">
        <li class="colour1">
            <div class="circle"><img src="${ctx }/images/testicon.jpg"/></div>
            <div class="newtime">14:57</div>
            <div class="newcontent">
                <div class="pbox">
                    ${stock_dog_news.content }
                </div>
                <div class="comment">
                    <a href="javascript:void(0);" id="commentLink"><span class="pinglun"></span>
                        ${stock_dog_news.comment_count }</a>
                    <a id="praise_flag" class="zanLink" onclick="f_praise('${stock_dog_news.id}',this)">
                        <span class="zan"></span>
                        <span id="pcount" class="aw-vote-bar-count"> ${stock_dog_news.praise_count }</span>
                    </a>
                </div>

                <div class="controlbox">
                    分享
                </div>

            </div>
        </li>
    </div>
    <div class="comments">
        <div class="commentsHeader">
        	<form id="form2" action="${ctx }/stock_dog_news_comment/save" method="post"onsubmit="return false" >
            <p class="count">${comments.Total}条评论</p>
            <a href="javascript:;" class="avatar"><img src="${ctx }/images/missing_face.png" alt="默认头像"></a>
            <textarea id="content" name="content"  onfocus='if("${cli_user}"==""){toLogin();$(this).blur();}' placeholder="我有意见"></textarea>
            <input id="dog_new_id" name="dog_new_id" type="hidden" value="${stock_dog_news.id }"/>

            <div class="commentBtnBox clearfix">
                <a href="#" class="commentBtn" onclick="push_comment()">评论</a>
            </div>
            </form>
        </div>
        <div class="commentsBody">
            <div class="items">
            <c:forEach var="comment" items="${comments.Rows }">
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

    $(".options .option").click(function(){
        $(this).toggleClass('selected');
        if($(this).hasClass('selected')){
            $(this).find('.iconfont').removeClass('icon-checkbox').addClass('icon-checkbox-selected');
            $(this).find('input[type="checkbox"]').attr('checked','checked');
        }else{
            $(this).find('.iconfont').removeClass('icon-checkbox-selected').addClass('icon-checkbox');
            $(this).find('input[type="checkbox"]').attr('checked',false);
        }
    });
</script>
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
</script>
</body>
</html>
