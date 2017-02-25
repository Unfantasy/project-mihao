<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@include file="/jsp/comm_part/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>股市合伙人---发现最搭的投资战友</title>
<link href="${ctx }/images/zm_log.ico" rel="shortcut icon" />
<script type="text/javascript" src="${ctx }/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.form.js"></script>
<script type="text/javascript" src="${ctx }/js/summernote.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap2.js"></script>
<script src="${ctx }/js/jquery-autocompleter/jquery.autocomplete.js" type="text/javascript"></script>
<script src="${ctx }/js/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${ctx }/js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="${ctx }/js/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="${ctx }/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/summernote.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/common.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/link.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/btn-sprite.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/icon-sprite.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/style.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/jsl.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/JiSiLu.css" />
<link href="${ctx }/js/jquery-autocompleter/styles.css" rel="stylesheet" type="text/css"> 
<link href="${ctx }/js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css"> 
<script>
$(function () {
	$("#summernote").summernote({
		oninit : function() {
			$('.note-editable').css('min-height', '150px');
		}
	});
	 $('#stock_name').autocomplete({
	       serviceUrl: '${ctx}/stocks/select_list',
	       paramName: 'searchString',
	        onSelect: function (suggestion) {
	            $("#stock_id").val(suggestion.data);
	           // alert($("#stock_id").val());
	        }
	    });
	 $(".aw-dropdown-menu a").click(function() {
			$("#type").val($(this).attr("data-value"));
			$("#aw-topic-tags-select").text($(this).first().text());
			if ($("#aw-topic-tags-select").text() == "操盘手日志") {
				type_change();
				$("#stock-log").show();
				$(".note-editor").hide();
				$("#btn_sure").hide();
			} else {
				$("#stock-log").hide();
				$(".note-editor").show();
				$("#btn_sure").show();
			}
		});
		//点击索引词汇添加
		$("#operation-history td span").click(function() {
			var new_text = $(this).text();
			var old_text = $("#operation-history-text").val();
			$("#operation-history-text").val(old_text + new_text);
			<%--alert($("#operation-history-text").val());--%>
		});
		//点击选择分类
		$("#operation-history td span.index").off("click");

		$(".stock-select .dropdown .dropdown-menu li").click(
				function() {
					var label = $(this).children().text();
					$(this).parent().siblings(".dropdown-toggle")
							.children("span").text(label);
				});

		$('.dropdown-toggle').dropdown();
		var now_time = getTime();
		$(".aw-mod-head time").text(now_time);
		
		$(".star").click(
				function() {
					var index = $(this).index();
					var $this = $(this);
					var stars = $(this).parent().children();
					switch (index) {
					case 0:
						$this.removeClass("star_dark").addClass(
								"star_light");
						$this.siblings().removeClass("star_light")
								.addClass("star_dark");
						break;
					case 1:
						$this.prev().removeClass("star_dark").addClass(
								"star_light");
						$this.removeClass("star_dark").addClass(
								"star_light");
						$this.next().removeClass("star_light")
								.addClass("star_dark");
						break;
					case 2:
						stars.removeClass("star_dark").addClass(
								"star_light");
						break;
					}
				});
	});

	//获取当前时间
	function getTime() {
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		return year + "-" + month + "-" + day;
	}
	//点击预览生成页面
    function prepend(){
        //将上面的数据填进下面的预览界面
        var reg=new RegExp("\n","g");//回车换行符替换为<br>
        var title = $("#the_title").val();
        var operationContents = $("#operation-history-text").val();
        var zhubanzoushi  = $("#zhubanzoushi").val();
        var cangweikongzhi = $("#cangweikongzhi").val();
        var yujizijin = $("#yujizijin").val();
        var chugumubiao = $("#chugumubiao").val();
        var investPlan = $("#invest-plan-text").val();
        $("#v_stock_index").html($("#stock_index").html());
        operationContents = operationContents.replace(reg,"<br>");
        $(".history-content").html(operationContents);
        investPlan = investPlan.replace(reg,"<br>");
        $(".invest-content").html(investPlan);
        if(zhubanzoushi==""){
        	 $(".zhubanzoushi").remove();
        }else{
        	 $(".zhubanzoushi span").text(zhubanzoushi);
        }
        if(cangweikongzhi==""){
        	$(".cangweikongzhi").remove();
       }else{
    	  $(".cangweikongzhi span").text(cangweikongzhi);
       }
        if(yujizijin==""){
        	 $(".yujizijin").remove();
       }else{
    	   $(".yujizijin span").text(yujizijin);
       }
        if(chugumubiao==""){
        	$(".chugumubiao").remove();
      }else{
    	  $(".chugumubiao span").text(chugumubiao);
      }
    $("#aw-publish-prepend .table-in tbody").empty();
        $(".interation").each(function(){
    var stock = $(this).find(".stock").html();
    var stockIncrease = $(this).find(".stock-increase").html();
    var selectText = $(this).find(".stock-select select").find("option:selected").text()
    var stars = $(this).find(".stars").html();
    var redGreen = "";
    if($(this).find(".red_green:checked").val()=="red"){
    redGreen = '<ul class="red_get"><li class="red_first">利多</li><li>A股</li></ul>';
    }else if($(this).find(".red_green:checked").val()=="green"){
    redGreen = '<ul class="green_get"><li class="green_first">利空</li><li>A股</li></ul>';
    }

    $("#aw-publish-prepend .table-in tbody").append(
    '<tr><td>' + stock + ' </td><td class="stock-increase"> ' + stockIncrease + '</td><td> ' + stars + '</td><td> ' + redGreen + '</td> <td class="stock-select">' + selectText+ ' </td></tr>');
    });
    $("#aw-publish-prepend .star").unbind();
        if($("#aw-publish-prepend").attr("display")!="block"){

            $("#aw-publish-prepend").css("display","block");

        }else{
            $("#aw-publish-prepend").css("display","none");
        }
    }
	function f_save(){
		var the_text = $(".note-editable").html();
		$("#the_text").val(the_text);
    	submitForm();
    }
	function f_save2(){
		prepend();
		 var the_text = $("#view001").html();
	        $("#the_text").val(the_text);
    	submitForm();
    }
    function submitForm() { 
	    var title = $("#the_title").val();
	    var type = $("#type").val();
	    var the_text =  $("#the_text").val();
	    if(type==0){
	    	 alert("请选择分类！");
	    	 return false; 
		}
	    if (the_text == '' || title == '') {
	    	 alert("标题,正文不可为空");
		        return false; 
	    }
    	// jquery 表单提交 
    	$("#form1").ajaxSubmit({
    		type: 'post',
            dataType: 'json',
    		success:function(data){
    			if(data.success){
    				alert(data.msg);
    				location.href="${ctx }/forum_post/list";
    			}
    		}
    	}); 
    	return false; 
    		// 必需返回false，不然表单会本人再做一次提交操作，并且页面跳转 
    }
    var dlgedit=null;
    function f_add_stock(){
    	var dialog_name = "ligerwindow"+new Date().getTime();
        dlgedit=$.ligerDialog.open({
    				 target:$("#divedit"),
    				 width : 430,
    				 height : 1,
    				 showMax : true,
    				 name:dialog_name,
    				 title : "添加个股",
    	                  buttons: [  { text: '添加', onclick: function (i, d) {  get_stock_info(); }},
    	                              { text: '取消', onclick: function (i, d) { d.hide(); }}
    	                           ]                                  
    	         });
    	 }
    function get_stock_info(){
    	var stock_id = $("#stock_id").val();
    	$.ajax({
			url : "${ctx }/stock_informations/get_stockinfo_by_stock_id?stock_id=" + stock_id,
			type : 'get',
			dataType : 'json',
			success : function(data) {
				addRow(data);
			}
		});
    }
    function addRow(data){
    	$("#btn_add").prev().find("table").append('<tr class="interation">'+
    '<td class="stock">'+
    '<span>'+data.stock_name+'</span>'+
    '<div class="stock-num">'+data.stock_id+'</div>'+
    '</td>'+
    '</td>'+
    '<td class="stock-increase">'+
    '<span>'+data.change_percent+'%</span>'+
    '</td>'+
    '<td class="stars">'+
    '<div class="star_light star"></div>'+
    '<div class="star_light star"></div>'+
    '<div class="star_dark star"></div>'+
    '</td>'+
    '<td><input type="radio" name="red_green'+data.stock_id+'" class="red_green " value="red"> <span class="red">利多</span> &nbsp;<input type="radio" name="red_green'+data.stock_id+'" class="red_green" value="green"> <span class="green">利空</span> </td>'+
    '<td class="stock-select">'+
    '<select>'+
    '<option value="0">选项.....</option>'+
    '<option value="1">早盘拉升</option>'+
    '<option value="2">低开高走</option>'+
    '<option value="3">盘中异动</option>'+
    '<option value="4">尾盘拉升</option>'+
    '<option value="5">横盘整理</option>'+
    '</select>'+
    '<a onclick="removeRow(this)"><img src="${ctx }/images/aw-minus.jpg" width="30px"></a>'+
    '</td>'+
    '</tr>');
    $(".star").click(selectStars);
    }
  
	function selectStars() {
		var index = $(this).index();
		var $this = $(this);
		var stars = $(this).parent().children();
		switch (index) {
		case 0:
			$this.removeClass("star_dark").addClass("star_light");
			$this.siblings().removeClass("star_light").addClass("star_dark");
			break;
		case 1:
			$this.prev().removeClass("star_dark").addClass("star_light");
			$this.removeClass("star_dark").addClass("star_light");
			$this.next().removeClass("star_light").addClass("star_dark");
			break;
		case 2:
			stars.removeClass("star_dark").addClass("star_light");
			break;
		}
	}
	function removeRow(obj) {
		$(obj).parent().parent().remove();
	}
	function type_change() {
		var type = $("#type").val();
		if (type == 3) {
			$
					.ajax({
						url : "${ctx }/stock_informations/stock_index",
						type : 'get',
						dataType : 'json',
						success : function(data) {
							for (var ii = 2; ii >= 0; ii--) {
								$("#stock_" + ii + " span").html(
										data.result[ii].price);
								$("#price_" + ii + " span").html(
										data.result[ii].change);
								$("#price_" + ii + " i").html(
										"(" + data.result[ii].change_percent
												+ "%)");
								$("#change_percent_" + ii + " div").html(
										data.result[ii].name);
							}
						}
					});
		}
	}
</script>
</head>

<body>
	<%@include file="/jsp/comm_part/header.jsp"%>
	<div class="aw-container-wrap">
		<div class="aw-container aw-wecenter">
			<div class="aw-container-wrap">
				<div class="aw-container aw-wecenter">
					<div class="row aw-content-wrap">
						<div class="span9 aw-main-content">
							<div id="other_type">
								<form action="${ctx }/forum_post/save" accept-charset="UTF-8" enctype="multipart/form-data" method="post" id="form1" name="form1" onsubmit="return false;">
									<select name="type" class="hide" id="type">
										<option value="0">- 请选择分类 -</option>
										<option value="1"> 龙虎数据</option>
										<option value="2"> 投资大咖秀</option>
										<option value="3"> 操盘手日志</option>
										<option value="4"> 其他</option>
									</select>
									<div class="aw-mod aw-dynamic-index aw-mod-publish">
										<div class="aw-mod-head">
											<h2>发起主题/问题</h2>
											<time class="pull-right"></time>
										</div>
										<div class="aw-mod-body">
											<h3>标题:</h3>
											<!-- 标题 -->
											<div class="aw-publish-title">
												<input type="text" placeholder="标题..." name="the_title" id="the_title" value="">
												<div class="aw-dropdown aw-question-dropdown">
													<i class="aw-icon i-dropdown-triangle active"></i>
													<p class="title">没有找到相关结果</p>
													<ul class="aw-question-dropdown-list"></ul>
												</div>
												<div class="aw-publish-title-dropdown">
													<p class="dropdown-toggle" data-toggle="dropdown">
														<span id="aw-topic-tags-select">选择分类</span> 
														<a href="javascript:;">
															<i class="aw-icon i-triangle-down"></i></a>
													</p>
													<div aria-labelledby="dropdownMenu" role="menu"
														class="dropdown-menu aw-dropdown-menu">
														<span><i class="aw-icon i-dropdown-triangle"></i></span>
														<ul>
															<li><a data-value="1">龙虎数据</a></li>
															<li><a data-value="2">投资大咖秀</a></li>
															<li><a data-value="3">操盘手日志</a></li>
															<li><a data-value="4">其他</a></li>
														</ul>
													</div>
												</div>
												<div id="summernote"></div>
												<input id="the_text" name="the_text" type="hidden">
											</div>
											<!-- end 标题 -->
											<br>
										</div>
										<div class="aw-mod-footer clearfix" id="btn_sure">
											<a class="pull-right btn btn-large btn-success" id="submit1"  onclick="f_save()">确认发起</a> 
										</div>
									</div>
									<div id="stock-log" style="display: none;" >
									<table class="table">
										<thead class="text-center">
											<tr class="today-analyse">
												<td colspan="3" class="span12">今日复盘</td>

											</tr>

										</thead>
										<tbody>
											<tr class="aw-stock-zh" id="stock_index">
													<td class="span4">
														<div class="total-stock">
															<div class=" text-center param1" id="stock_0">
																<span>3568.47</span>
															</div>
															<div class=" text-center param2" id="price_0">
																<span>-36.33%</span><i>(-1.01%)</i>
															</div>
															<div class=" text-center param3" id="change_percent_0">
																<div>上证综指</div>
															</div>
														</div>
													</td>
													<td class="span4">
														<div class="total-stock">
															<div class=" text-center param1" id="stock_1">
																<span>3568.47</span>
															</div>
															<div class=" text-center param2" id="price_1">
																<span>-36.33%</span><i>(-1.01%)</i>
															</div>
															<div class=" text-center param3" id="change_percent_1">
																<div>上证综指</div>
															</div>
														</div>
													</td>
													<td class="span4">
														<div class="total-stock">
															<div class=" text-center param1" id="stock_2">
																<span>3568.47</span>
															</div>
															<div class=" text-center param2" id="price_2">
																<span>-36.33%</span><i>(-1.01%)</i>
															</div>
															<div class=" text-center param3" id="change_percent_2">
																<div>上证综指</div>
															</div>
														</div>
													</td>
											</tr>
												<tr class="table-in">
													<td colspan="3">
														<table class="in-table">
															<thead>
																<tr>
																	<td>名称代码</td>
																	<td>涨跌幅</td>
																	<td>重要性</td>
																	<td>利多利空</td>
																	<td>标签</td>
																</tr>
															</thead>
															<tbody>
															</tbody>
														</table>
													</td>
												</tr>
												<!-- start 自选股 -->
											<tr id="btn_add">
												<td colspan="3" style="text-align: center; vertical-align: middle;">
													<a onclick="f_add_stock()"><img src="${ctx }/images/aw-plus.jpg" width="50px" /></a>
												</td>
											</tr>
											<!-- end 自选股 -->
											<tr id="operation-history" class="operation-history">
												<td colspan="3">操作回顾：<br />
												<br /> <span class="index">添加索引词汇:</span><span class="btn">高抛低吸</span><span
													class="btn">逢低介入</span><span class="btn">拉高出货</span><span
													class="btn">获利了结</span><span class="btn">持股观望</span><span
													class="btn">加仓待涨</span><span class="btn">降低仓位</span><span
													class="btn">止损平仓</span> <br /> 
													<textarea name="" id="operation-history-text"></textarea>
												</td>
											</tr>
											<tr id="invest-plan" class="invest-plan">
												  <td colspan="3">投资计划：<br/><br/>
                                                <div class="input-prepend">
                                                    <span class="add-on">主 板 走 势：</span>
                                                    <input class="span6"  type="text" placeholder="..." id="zhubanzoushi" />
                                                </div>
                                                <div class="input-prepend">
                                                    <span class="add-on">仓 位 控 制：</span>
                                                    <input class="span6" type="text" placeholder="..." id="cangweikongzhi" />
                                                    
                                                </div>
                                                <div class="input-prepend">
                                                    <span class="add-on">预计资金流向：</span>
                                                    <input class="span6"  type="text" placeholder="..." id="yujizijin" />
                                                </div>
                                                <div class="input-prepend">
                                                    <span class="add-on">持股目标价位：</span>
                                                    <input class="span6"  type="text" placeholder="..." id="chugumubiao" />
                                                </div>
                                                <textarea name="" id="invest-plan-text" ></textarea>

                                            </td>
											</tr>
										</tbody>
									</table>
									<div class="aw-mod-footer clearfix">
										<a class="pull-right btn btn-large btn-success" style="margin-left: 20px;" id="submit2" onclick="f_save2();">确认发起</a>
										<a class="pull-right btn btn-large btn-success" id="view" onclick="prepend()">预览</a>
									</div>
							</div>
								</form>
							</div>
							<!-- 预览 -->
							<div id="view001">
							<div id="aw-publish-prepend" style="display:none">
    <div class="today-analyse"  ><p class="title">今日复盘</p></div>
                                    <table class="table" class="aw-stock-log" >

                                        <tbody>
                                        <tr class="aw-stock-zh" id="v_stock_index">
                                            <td class="span4">
                                                <div class="total-stock">
                                                    <div class=" text-center param1" >
    <span>3568.47</span>
    </div>
    <div class=" text-center param2">
    <span>-36.33%</span><i>-1.01%</i>
    </div>
    <div class=" text-center param3">
    <div>上证综指</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="span4">
                                                <div class="total-stock">
                                                    <div class=" text-center param1" >
    <span>3568.47</span>
    </div>
    <div class=" text-center param2">
    <span>-36.33%</span><i>-1.01%</i>
    </div>
    <div class=" text-center param3">
    <div>深圳成指</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="span4">
                                                <div class="total-stock">
                                                    <div class=" text-center param1" >
    <span>3568.47</span>
    </div>
    <div class=" text-center param2">
    <span>-36.33%</span><i>-1.01%</i>
    </div>
    <div class=" text-center param3">
    <div>创业板指</div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>


                                        <tr class="table-in">
                                            <td colspan="3">
                                                <table class="in-table">
                                                    <thead>
                                                    <tr>
                                                        <td>名称代码</td>
                                                        <td>涨跌幅</td>
                                                        <td>重要性</td>
                                                        <td>利多利空</td>
                                                        <td>标签</td>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr class="interation">
                                                        <td class="stock">
                                                            <span>川投能源</span>
                                                            <div class="stock-num">600674</div>
                                                        </td>
                                                        <td class="stock-increase">
                                                            <span>0.46%</span>
                                                        </td>
                                                        <td>
                                                            <div class="star_light star"></div>
                                                            <div class="star_light star"></div>
                                                            <div class="star_dark star"></div>
                                                        </td>
                                                        <td>
                                                            <ul class="red_get">
                                                                <li class="red_first">利多</li>
                                                                <li>A股</li>
                                                            </ul>
                                                        </td>
                                                        <td class="stock-select">
                                                            横盘整理
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>

                                    </table>
                                    <div class="aw-history-content">
                                        <p class="little-title">操作回顾</p>
                                        <p class="history-content" >刘亦菲，1987年8月25日出生于湖北省武汉市，影视女演员、歌手，毕业于北京电影学院2002级表演系本科班。2002年出演《金粉世家》和《天龙八部》步入演艺圈，2004年主演《仙剑奇侠传》获得关注。2006年主演《神雕侠侣》中的“小龙女”一角而受到广泛关注，同年发行首张个人专辑《刘亦菲》。</p>
                                    </div>
                                    <div class="aw-invest-plan">
                                        <p class="little-title">投资计划</p>
                                        <p class="zhubanzoushi">主 板 走 势：<span>1987年8月25日出生于湖北省武汉市</span></p>
                                        <p class="cangweikongzhi">仓 位 控 制：<span>1987年8月25日出生于湖北省武汉市</span></p>
                                        <p class="yujizijin">预计资金流向：<span>1987年8月25日出生于湖北省武汉市</span></p>
                                        <p class="chugumubiao">持股目标价位：<span>1987年8月25日出生于湖北省武汉市</span></p>
                                        <p class="invest-content" >刘亦菲，1987年8月25日出生于湖北省武汉市，影视女演员、歌手，毕业于北京电影学院2002级表演系本科班。2002年出演《金粉世家》和《天龙八部》步入演艺圈，2004年主演《仙剑奇侠传》获得关注。2006年主演《神雕侠侣》中的“小龙女”一角而受到广泛关注，同年发行首张个人专辑《刘亦菲》。</p>
                                    </div>
                                </div>
							</div>
						</div>
						<!-- 侧边栏 -->
						<div class="span3 aw-side-bar">
							<!-- 问题发起指南 -->
							<div class="aw-side-bar-mod aw-no-border-bottom aw-side-bar-mod-publish">
								<div class="aw-side-bar-mod-head">
									<h3>问题发起指南</h3>
								</div>
								<div class="aw-side-bar-mod-body">
									<p>
										<b>● 标题:</b> 请用准确的语言描述您发布的问题思想
									</p>
									<p>
										<b>● 内容:</b> 详细补充您的问题内容, 并提供一些相关的素材以供参与者更多的了解您所要问题的主题思想
									</p>
									<p>
										<b>● 选择话题:</b> 选择一个或者多个合适的话题, 让您发布的问题得到更多有相同兴趣的人参与.
										所有人可以在您发布问题之后添加和编辑该问题所属的话题
									</p>
								</div>
							</div>
							<!-- end 问题状态 -->

						</div>
						<!-- end 侧边栏 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- start 弹出举报框 -->
        <div id="divedit"  style=" display:none">     
			选择个股：<input id="stock_name" name="stock_name" type="text"  style="width: 280px; height: 20px;"  />
			<input id="stock_id" name="stock_id" type="hidden"   />
        </div>
 <!-- end 弹出举报框 -->
	<%@include file="/jsp/comm_part/footer.jsp"%>
</body>
</html>