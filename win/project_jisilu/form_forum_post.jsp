<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@include file="/jsp/comm_part/common.jsp" %><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>${f_post.title}</title>
<link href="${ctx }/images/zm_log.ico" rel="shortcut icon" />
<script type="text/javascript" src="${ctx }/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.form.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap2.js"></script>
<script type="text/javascript" src="${ctx }/js/functions.js"></script>
    <script src="${ctx }/js/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${ctx }/js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="${ctx }/js/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    
<link rel="stylesheet" type="text/css" href="${ctx }/css/bootstrap2.css" />
 <link href="${ctx }/js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css"> 
<link rel="stylesheet" type="text/css" href="${ctx }/css/common.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/link.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/btn-sprite.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/icon-sprite.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/style.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/jsl.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/JiSiLu.css" />

<script>
var type = "${type}";
var sort_type = "${sort_type}";
var praise_flag = "${praise_flag}";
var unpraise_flag = "${unpraise_flag}";
var report_flag = "${report_flag}";
var black_flag = "${black_flag}";
var store_up_count = "${f_post.store_up_count}";
var rel_count ="${f_post.rel_count}";
var item_ids = '${item_ids}';
$(function (){
	if(item_ids){
		item_ids = item_ids.split(',');
		// 回复高亮
		$('html,body').animate({scrollTop: $('#answer_list_' + item_ids[0]).offset().top}, 1000);
		$.each(item_ids, function (i, answer_id) {
			if ($('#answer_list_' + answer_id).attr('id'))
			{
				hightlight($('#answer_list_' + answer_id), 'active');
			}
		});
	}
	
	$("#type_"+type).addClass("active");
	if(sort_type==""){
		$("#sort_new").addClass("active");
	}else{
		$("#"+sort_type).addClass("active");
	}
	if(store_up_count>0){
		$("#favorite_id").removeClass("aw-active");
		$("#favorite_id").html('取消收藏');
	}
	if(rel_count>0){
		$("#follow_id").removeClass("aw-active");
		
	}
});

function f_save(){
	if($("#is_login").val()=="false"){
		location.href="${ctx}/users/login_index";
		return;
	}
	submitForm();
}
function submitForm() { 
	if($("#operation-history-text").val()==""){
		alert("请输入评论内容");
		return false;
	}
	// jquery 表单提交 
	$("#answer_form").ajaxSubmit({
		type: 'post',
        dataType: 'json',
		success:function(data){
			if(data.success){
				alert("保存成功");
				location.reload();
			}
			else{
				alert("保存失败");
			}
		}
	}); 
	return false; 
		// 必需返回false，不然表单会本人再做一次提交操作，并且页面跳转 
}
function f_praise(flag){
	//alert("flag:"+flag+"===praise_flag:"+praise_flag+"======unpraise_flag:"+unpraise_flag);
	if($("#is_login").val()=="false"){
		location.href="${ctx}/users/login_index";
		return;
	}
	if(flag==-1&&praise_flag=="1"){
		return ;
	}
	if(flag==1&&unpraise_flag=="1"){
		return ;
	}
	var post_id ="${f_post.id}";
	 $.post("${ctx}/forum_praise/save",{flag:flag,post_id:post_id},function(data){
		 	if(data.success==true){
		 		if(flag==1&&praise_flag=="1"){
		 			praise_flag="0"
		 		}else if(flag==1&&praise_flag=="0"){
		 			praise_flag="1"
		 		}
		 		if(flag==-1&&unpraise_flag=="1"){
		 			unpraise_flag="0"
		 		}else if(flag==-1&&unpraise_flag=="0"){
		 			unpraise_flag="1"
		 		}
		 		$("#pcount").html(data.result.pcount);
		 		$("#opcount").html(data.result.opcount);
		 	}
		 });
 }
function f_push_black(){
	if($("#is_login").val()=="false"){
		location.href="${ctx}/users/login_index";
		return;
	}
	var user_name ="${f_post.nickname}";
	if(black_flag=="1"){
		  alert("你已经拉黑["+user_name+"]!");
		  return ;
	}
	if(confirm("确定要拉黑:"+user_name+"吗？")){
		var p_user_id = "${f_post.user_id}";
	  	 $.post("${ctx}/forum_blacklist/save",{p_user_id:p_user_id},function(data){
			 	if(data.success==true){
			 		black_flag="1"
			 	}else{
			 		if(data.num==-1){
			 			alert("不能拉黑自己");
			 		}else if(data.num==-2){
	        			location.href="${ctx}/users/login_index";
	        		}else{
			 			alert("拉黑失败");
			 		}
			 	}
		});
	}
   }
function f_save_report(){
	submitForm1();
}
function submitForm1() { 
	if($("#reason").val()==""){
		alert("请输入举报理由！");
		return false;
	}
	// jquery 表单提交 
	$("#form1").ajaxSubmit({
		type: 'post',
        dataType: 'json',
		success:function(data){
			if(data.success){
				report_flag="1";
				alert("保存成功");
				dlgedit.hide();
			}
			else{
				if(data.num==-2){
					location.href="${ctx}/users/login_index";
				}else
					alert("保存失败");
			}
		}
	}); 
	return false; 
		// 必需返回false，不然表单会本人再做一次提交操作，并且页面跳转 
}
var dlgedit=null;
function f_report(){
	if($("#is_login").val()=="false"){
		location.href="${ctx}/users/login_index";
		return;
	}
	var title = "${f_post.title}";
	if(report_flag=="1"){
		  alert("你已经举报过["+title+"] 主题!");
		  return ;
	}
	var dialog_name = "ligerwindow"+new Date().getTime();
    dlgedit=$.ligerDialog.open({
				 target:$("#divedit"),
				 width : 430,
				 height : 199,
				 showMax : true,
				 name:dialog_name,
				 title : "问题举报",
	                  buttons: [  { text: '提交', onclick: function (i, d) {  f_save_report(); }},
	                              { text: '取消', onclick: function (i, d) { d.hide(); }}
	                           ]                                  
	         });
	 }
function follow_people(obj,relation_id){
	if($("#is_login").val()=="false"){
		location.href="${ctx}/users/login_index";
		return;
	}
        $.post('${ctx}/user_relation/add',{relation_id : relation_id}, function(rst){
        	if(rst.success==true){
        		if(rst.num==1){
        			$(obj).removeClass("aw-active");
        		}
        		if(rst.num==-1){
        			$(obj).addClass("aw-active");
        		}
        	}else{
        		if(rst.num==-2){
        			location.href="${ctx}/users/login_index";
        		}else if(rst.num==-3){
        			alert("不能关注自己");
        		}else
        			alert("关注失败");
        	}
        }, 'json');
}
function favorite_question(obj,post_id){
	if($("#is_login").val()=="false"){
		location.href="${ctx}/users/login_index";
		return;
	}
    $.post('${ctx}/forum_store_up/save',{post_id : post_id}, function(rst){
    	if(rst.success==true){
    		if(rst.num==1){
    			$(obj).removeClass("aw-active");
    			$(obj).html('取消收藏');
    		}
    		if(rst.num==-1){
    			$(obj).addClass("aw-active");
    			$(obj).html('收藏');
    		}
    	}else{
    		if(rst.num==-2){
    			alert("请重新登录！");
    		}else
    			alert("收藏失败");
    	}
    }, 'json');
}
</script>
</head>

<body>
	<%@include file="/jsp/comm_part/header.jsp"%>
	<div class="aw-container-wrap">
    <div class="aw-container aw-wecenter">
        <div class="row aw-content-wrap">
            <div class="span9 aw-main-content">
                <div class="aw-mod aw-item aw-question-detail-title">
                    <div class="aw-mod-head">
                        <h1>${f_post.title }</h1>
                        <div class="aw-question-follow">
                            <a id="favorite_id" href="javascript:;" onclick="favorite_question(this, ${f_post.id });" class="btn btn-mini pull-left aw-follow-question aw-active">收藏</a>
                        </div>

                        <div class="aw-topic-editor" id="question_topic_editor" data-type="question" data-id="49999">
                        <c:choose>
                               <c:when test="${f_post.type==1 }"><a href="${ctx }/forum_post/list?type=1" class="aw-topic-name">龙虎数据</a></c:when>
                               <c:when test="${f_post.type==2 }"><a href="${ctx }/forum_post/list?type=2" class="aw-topic-name">投资大咖秀</a></c:when>
                               <c:when test="${f_post.type==3 }"><a href="${ctx }/forum_post/list?type=3" class="aw-topic-name">操盘手日志</a></c:when>
                               <c:otherwise> <a href="${ctx }/forum_post/list?type=4" class="aw-topic-name">其他</a></c:otherwise>
                         </c:choose>
                        </div>

                    </div>
                    <div class="aw-mod-body">
                        <div class="aw-question-detail-txt markitup-box">
							${f_post.content }
                        </div>
                        <div class="aw-question-detail-meta">
                            <span class="pull-left aw-text-color-999">${f_post.create_time }</span>
                             <!-- Baidu Button BEGIN -->
      						<div class="bdsharebuttonbox" style="display:inline-table; margin-left: 0">
      						<a href="javascript:;" onclick="" class="aw-text-color-999" data-cmd="more"  style="float: none; background: none;"><i class="aw-icon i-share"></i>分享</a>
      						 <a href="#" style="float: none;" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" style="float: none;" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" style="float: none;" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
							<script>
							window._bd_share_config={"common":{"bdSnsKey":{},
								"bdText":"",
								"bdMini":"1",
								"bdMiniList":false,
								"bdDesc":"",
								"bdPic":"",
								"bdStyle":"0",
								"bdSize":"16"},
								"share":{}};
							with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
								<!-- Baidu Button END -->
								
                            <a href="javascript:;" class="aw-text-color-999"  id="report" onclick="f_report()"><i class="aw-icon i-no-help"></i>举报</a>														
                            <a href="javascript:;" class="aw-text-color-999" title="点击拉黑" id="push_black" onclick="f_push_black()">拉黑</a>

                            <!-- 投票栏 -->
                            <a id="praise_flag" title="给楼主点赞" class="aw-text-color-999 aw-question-vote-bar" onclick="f_praise(1)" >
                            <i data-original-title="给楼主点赞" class="aw-icon i-question-agree" data-toggle="tooltip" title="" data-placement="right"></i>
                            <span id="pcount" class="aw-vote-bar-count">${f_post.praise_count }</span> 个赞同</a>
                            <a id="unpraise_flag" title="反对楼主" class="aw-text-color-999 aw-question-vote-bar " onclick="f_praise(-1)" >
                            <i data-original-title="反对楼主" class="aw-icon i-question-unagree" data-toggle="tooltip" title="" data-placement="right"></i>
                            <span id="opcount" class="aw-vote-bar-count">${f_post.opposition_count }</span> 个反对</a>
                            <!-- end 投票栏 -->
                        </div>
                    </div>
                </div>

                <div class="aw-mod aw-question-detail-box">
                    <div class="aw-mod-head">
                        <ul class="nav nav-tabs aw-reset-nav-tabs">
                            <li class="active"></li>
    <h2>${f_post.comment_count } 个评论</h2>
                        </ul>
                    </div>
                    <div class="aw-mod-body aw-dynamic-topic">
						<c:forEach var="f_comment" items="${fclist }">
							<div class="aw-item" id="answer_list_${f_comment.id }">
	                            <a name="answer_${f_comment.id }"></a>
	                            <!-- 用户头像 -->
	                            <a class="aw-user-img aw-border-radius-5 pull-right" href="${ctx }/forum_post/user_info?user_id=${f_comment.user_id}" >
	                            <img class="bd-rs-normal" alt="${f_comment.nickname }" src="${pic_url }${f_comment.user_photo }"/>
	                            </a>								
	                            <!-- end 用户头像 -->
	                            <div class="aw-mod-body clearfix">
	                                <!-- end 投票栏 -->
	                                <div class="pull-left aw-dynamic-topic-content">
	                                    <!-- 评论内容 -->
	                                    <div>
	                                        <p><a class="aw-user-name" href="${ctx }/forum_post/user_info?user_id=${f_comment.user_id}" data-id="${f_comment.id }">${f_comment.nickname }</a> </p>
	                                        <div class="markitup-box">
	                                            ${f_comment.content }																					</div>
	                                    </div>
	                                    <!-- end 评论内容 -->
	                                    <!-- 社交操作 -->
	                                    <div class="aw-dynamic-topic-meta">
	                                        <span class="pull-left aw-text-color-999">${f_comment.create_time }</span>
	                                    </div>
	                                    <!-- end 社交操作 -->
	                                </div>
	                            </div>
	                        </div>						
						</c:forEach>
                    </div>

                </div>
                <!-- end 问题详细模块 -->
                 <!-- 回复编辑器 -->
                <div class="aw-mod aw-mod-replay-box">
                    <form action="${ctx  }/forum_comment/save" onsubmit="return submitForm();" method="post" id="answer_form">
                        <input type="hidden" name="post_id" value="${f_post.id }">
                        <div class="aw-mod-body">
                        <textarea id="operation-history-text" style="width: 590px;" name="content"></textarea>
                            <div style="position:relative;" class="clearfix">
                                <a href="#" onclick="f_save();" class="btn btn-large btn-success pull-right btn-submit">评论</a>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- end 回复编辑器 -->
                </div>
            <!-- 侧边栏 -->
            <div class="span3 aw-side-bar">
                <!-- 发起人 -->
                <div class="aw-side-bar-mod">
                    <div class="aw-side-bar-mod-head">
                        <h3>发起人</h3>
                    </div>
                    <div class="aw-side-bar-mod-body">
                        <dl>
                            <dt class="pull-left aw-border-radius-5">
                                <a href="${ctx }/forum_post/user_info?user_id=${f_post.user_id}">
                                <img class="bd-rs-normal  " alt="${f_post.nickname }" src="${pic_url }${f_post.user_photo }"/>
                                </a>
                            </dt>
                            <dd class="pull-left">
                                <a class="aw-user-name" href="${ctx }/forum_post/user_info?user_id=${f_post.user_id}" >${f_post.nickname }</a>
                                <i id="follow_id" data-placement="bottom" title="" onclick="follow_people(this, ${f_post.user_id });" data-toggle="tooltip" class="aw-icon i-follow aw-active" data-original-title="关注"></i> <p></p>
                            </dd>
                        </dl>
                    </div>
                </div>
                <!-- end 发起人 -->

                <!-- 相关问题 -->
                <div class="aw-side-bar-mod aw-text-align-justify">
                    <div class="aw-side-bar-mod-head">
                        <h3>相关问题</h3>
                    </div>
                    <div class="aw-side-bar-mod-body">
                        <ul class="aw-li-border-bottom">
                        <c:forEach var="f_pt" items="${fp_list }">
                        	 <li><a href="${ctx }/forum_post/form?id=${f_pt.id}">${f_pt.title }</a></li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
                <!-- end 相关问题 -->
            </div>
            <!-- end 侧边栏 -->
        </div>
    </div>
</div>
<%@include file="/jsp/comm_part/footer.jsp"%>
<!-- start 弹出举报框 -->
        <div id="divedit"  style=" display:none">     
		<form id="form1" action="${ctx}/forum_report/save"  method="post" onsubmit="return false;" >  
		<input type="hidden" name="post_id" value="${f_post.id }">
			<textarea name="reason" placeholder="请填写举报理由..." style="width: 360px;height: 70px;"></textarea>
		</form>
        </div>
 <!-- end 弹出举报框 -->
</body>
</html>