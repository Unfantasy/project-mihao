<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
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
<script type="text/javascript" src="${ctx }/js/bootstrap2.js"></script>
    <script src="${ctx }/js/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${ctx }/js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="${ctx }/js/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="${ctx }/js/jquery-autocompleter/jquery.autocomplete.js" type="text/javascript"></script>
    <script src="${ctx}/js/common.js" type="text/javascript" ></script>
    
<link rel="stylesheet" type="text/css" href="${ctx }/css/bootstrap2.css" />
 <link href="${ctx }/js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css"> 
 <link href="${ctx }/js/jquery-autocompleter/styles.css" rel="stylesheet" type="text/css"> 

 <style>
    .aw-content-wrap{
    padding-bottom:50px;
    }
    /*我的自选股样式*/
    .sss-title{
    margin-top:30px;
    }
    .sss-title input[type="file"]{
    line-height: normal;
    margin-left:10px;
    width:30%;
    }

    .sss-title input[type="text"],.sss-title-prepend span{
    font-size:20px;
    }
    .sss-title-prepend{
    margin-bottom: 30px;
    color: #fff;
    position:relative;
    margin-top:-70px;
    padding-left:20px;
    z-index: 10;
    }
    .table td{
    text-align:center;
    vertical-align:middle;
    }
    .table tbody {
    font-size: 20px;
    }
    .sss-delete{
    width:20px;
    margin-bottom:5px;
    }
    .sss-footer,.sss-footer-prepend{
    font-size:16px;
    }
    input[type="text"].sss-theme{
    color:#000;
    width:50%;
    border: none;
    border-bottom:1px solid #ddd;
    border-radius: 0;
    box-shadow: none;
    outline: none;
    margin-left:10px;
    margin-right:30px;
    }
    input[type="text"].sss-title-input{
    width:26%;
    }
    .footer-span{
    color:#000;
    }
    .footer-span span{
    color:#333;
    padding-right:30px;
    }
    .prepend{
    clear:both;
    position: relative;
    padding-top:50px;
    }
    .sss-title-prepend .sss-img{
    width:100px;
    height:100px;
    display: inline-block;
    vertical-align: middle;
    margin-right:10px;
    border-radius: 5px;
    background: url("../images/sss_default.jpg") center center;
    background-size:cover;
    }
    .nav-img{
    width:100%;
    height:150px;
    position: absolute;
    top:0;
    background: url("../images/sss_default.jpg") no-repeat center center;
    background-size:cover;
    -webkit-filter: blur(22px);
    filter: blur(22px);
    -moz-filter: blur(22px);
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=64);
    -khtml-opacity: 0.64;
    -moz-opacity: 0.64;
    opacity: 0.64;
    }
    .sss-content-prepend{
    box-shadow: 0 -5px 6px -1px #ccc;
    }
    .sss-footer-prepend>span:nth-child(1){
    width:50%;
    display: inline-block;
    }
    .dividerLineGradient {
    border: none;
    color: white;
    height: 1px;
    background: white;
    background-color: #ffffff;
    margin: -2px 0px 5px;
    width:500px;
    filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=1, StartColorStr=#ffffff, EndColorStr=#ffffff);
    background: -webkit-gradient(linear, left top, right top, color-stop(10%, #ffffff), color-stop(75%, rgba(255, 255, 255, 0)));
    background: -webkit-linear-gradient(left, #ffffff 10%, rgba(255, 255, 255, 0) 75%);
    background: -moz-linear-gradient(left, #ffffff 10%, rgba(255, 255, 255, 0) 75%);
    background: -ms-linear-gradient(left, #ffffff 10%, rgba(255, 255, 255, 0) 75%);
    background: -o-linear-gradient(left, #ffffff 10%, rgba(255, 255, 255, 0) 75%);
    background: linear-gradient(to right, #ffffff 10%, rgba(255, 255, 255, 0) 75%);
    -pie-background: linear-gradient(#ffffff, rgba(255, 255, 255, 0));
    }
    /* end 我的自选股样式*/
    .aw-main-content {
    width: 90%;
    height: 100%;
    padding: 10px 20px 99999px 30px;
    margin: 0 0 -99999px;
    border-right: none;
    }
    </style>
<script>

function readFile(obj){
    var file = obj.files[0];
//这里我们判断下类型如果不是图片就返回 去掉就可以上传任意文件
    if(!/image\/\w+/.test(file.type)){
        alert("请确保文件为图像类型");
        return false;
    }
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function(e){
        $("#img_src").val(this.result);
    }
}
$(function(){
	 $('#stock_name').autocomplete({
	       serviceUrl: '${ctx}/stocks/select_list',
	       paramName: 'searchString',
	        onSelect: function (suggestion) {
	            $("#stock_id").val(suggestion.data);
	            set_stock_price(suggestion.data);
	        }
	    });
	 
	 $(".sss-minusyield").click(function(){
       var yieldStock = parseInt($("#hope_percent").val());
       var min = 0;
       if(yieldStock>min){
           yieldStock-=1;
           $("#hope_percent").val(yieldStock);
           $('.sss-addyield').attr("src","${ctx }/images/tixingshezhi_jia.png");
       }else{
           $(this).attr("src","${ctx }/images/tixingshezhi_jianzhihou.png");
       }
   });
   $(".sss-addyield").click(function(){
       var yieldStock = parseInt($("#hope_percent").val());
       var max = 99;
       if(yieldStock < max){
           yieldStock+=1;
           $("#hope_percent").val(yieldStock);
           $(".sss-minusyield").attr("src","${ctx }/images/tixingshezhi_jian.png");
       }else{
           $(this).attr("src","${ctx }/images/tixingshezhi_jiahou.png")
       }
   });
   function set_stock_price(stock_id){
		$.ajax({
			url : "${ctx }/stock_informations/get_stock_price?stock_id="+stock_id,
			type : 'get',
			dataType : 'json',
			success : function(data) {
				var orig_price = data.orig_price;
				var hope_percent = $("#hope_percent").val();
				$("#orig_price").val(orig_price);
				$("#orig_price_v").text(formatNumber(orig_price,2,1));
				var target_price = hope_percent*orig_price/100+orig_price;
				$("#target_price").text(formatNumber(target_price,2,1));
			}
		});
	}
   /* end 目标收益率点击增加减少*/
   //收益必须是数字的判断
   $("#hope_percent").blur(function(){
       if(isNaN($(this).val())){
    	   $.ligerDialog.error("请输入数字！");
           $(this).val("0");
       }
       if($(this).val()==''){
           $(this).val("0");
       }
   });
   $("#holding_num").blur(function(){
       var val = $(this).val();
       if(isNaN(val)||val<=0 || val>1000000){
    	   $.ligerDialog.error("股票数量只能是1-1000000");
           $(this).val("0");
       }
       if($(this).val()==''){
           $(this).val("0");
       }
   });
    //删除按钮的显示隐藏
    $(".table tbody tr").mouseover(function(){
        $(this).find(".sss-delete").css("visibility","visible");

    });
    $(".table tbody tr").mouseout(function(){
        $(this).find(".sss-delete").css("visibility","hidden");
    });
    $("#sss-prepend").click(function(){
    	create_view();
    });
});
function create_view(){
    $(".prepend").show();
    var title1 = $(".sss-title-input-1").val()||"&nbsp;";
    var title2 = $(".sss-title-input-2").val()||"&nbsp;";
    var title3 = $(".footer-span span:nth-child(1)").eq(0).text() || "&nbsp;";
    var titlesrc = $("#img_src").val() || "${ctx }/images/sss_default.jpg";
    //                console.log(titlesrc);
    var footer = $(".sss-footer input[type='text']").val()||"";
    var contentHtml = $(".sss-content").html();
    var footerHtml = $(".sss-footer>span").prop("outerHTML");
    $(".sss-title-prepend .sss-img").css({"background-image":"url("+titlesrc+")","background-size":"cover"});
    $(".nav-img").css({"background-image":"url("+titlesrc+")","background-size":"cover"});
    $(".sss-title-prepend span:nth-of-type(1)").html(title1);
    $(".sss-title-prepend span:nth-of-type(2)").html(title2);
    $(".sss-title-prepend span:nth-of-type(3)").html(title3);
    var title3Num = title3.replace("%","");
    if(title3Num>0){
    $(".sss-title-prepend span:nth-of-type(3)").addClass("up").removeClass("down");
    }else if(title3Num<0){
    $(".sss-title-prepend span:nth-of-type(3)").addClass("down").removeClass("up");
    }else{
    $(".sss-title-prepend span:nth-of-type(3)").removeClass("down,up");
    }
    $(".sss-content-prepend").html(contentHtml);
    $(".sss-content-prepend tbody tr").unbind("mouseover,mouseout");
    $(".sss-footer-prepend").html("");
    $("<span>"+footer+"</span>").appendTo(".sss-footer-prepend");
    $(".sss-footer-prepend").append(footerHtml);
    $("#the_title").val($("#m_title").val());
}
function delete_stock_expect(obj,expected_id,stock_name){
	   $.ligerDialog.confirm('确定要删除【'+stock_name+'】吗?', function (yes){
		   if(yes){
			   $(obj).parent().parent().detach();
				$.ajax({
					url : "${ctx }/stock_informations/delete_stock_expect?expected_id="+expected_id,
					type : 'get',
					dataType : 'json',
					success : function(data) {
						if(data.success==false){
							$.ligerDialog.error("删除失败");
						}
					}
				}); 
		   }
	   });
	}
var dlgedit=null;
function f_add(){
	var dialog_name = "ligerwindow"+new Date().getTime();
    dlgedit=$.ligerDialog.open({
				 target:$("#divedit"),
				 width : 530,
				 height : 530,
				 showMax : true,
				 name:dialog_name,
				 title : "添加自选股",
	                  buttons: [  { text: '添加', onclick: function (i, d) {  f_save(); }},
	                              { text: '取消', onclick: function (i, d) { d.hide(); }}
	                           ]                                  
	         });
	 }
function f_save(){
	submitForm();
}
function submitForm() { 
	if($("#stock_id").val()==""){
		$.ligerDialog.error('请输入股票名称');
		return false;
	}
	// jquery 表单提交 
	$("#form1").ajaxSubmit({
		type: 'post',
        dataType: 'json',
		success:function(data){
			if(data.success){
				dlgedit.hide();
				location.reload();
			}else{
				if(data.msg=="hope_percent_not_found"){
					$.ligerDialog.error("目标收益率不能为空");
				}else if(data.msg=="holding_num_not_found"){
					$.ligerDialog.error("持有数量不能为空");
				}else if(data.msg=="stock_is_exist"){
					$.ligerDialog.error($("#stock_name").val()+":已经添加过了!");
				}else{
					$.ligerDialog.error('添加失败');
				}
			}
		}
	}); 
	return false; 
		// 必需返回false，不然表单会本人再做一次提交操作，并且页面跳转 
}
function f_save2(){
	create_view();
	 var the_text = $("#view001").html();
        $("#the_text").val(the_text);
	submitForm2();
}
function submitForm2() { 
    var title = $("#the_title").val();
    var type = $("#type").val();
    var the_text =  $("#the_text").val();
    if (the_text == '' || title == '') {
    	 alert("标题,正文不可为空");
	        return false; 
    }
	// jquery 表单提交 
	$("#form2").ajaxSubmit({
		type: 'post',
        dataType: 'json',
		success:function(data){
			if(data.success){
				alert(data.msg);
			}
		}
	}); 
	return false; 
		// 必需返回false，不然表单会本人再做一次提交操作，并且页面跳转 
}
</script>
</head>

<body>
	<%@include file="/jsp/comm_part/header.jsp"%>
	<div class="aw-container-wrap">
    <div class="aw-container aw-wecenter">
        <div class="row aw-content-wrap">
            <div class="span9 aw-main-content aw-all-question" style="width: 90%; border-right: none;">
                <a href="javascript:;" class="btn btn-info pull-right" style="margin-left:20px;" onclick="f_add()">添加自选股</a>
                <a href="javascript:history.go(-1);" class="btn btn-info pull-right">返回</a>
                <div class="row text-center" style="margin-top: 60px;font-size: 30px;line-height:50px;">我的自选股</div>
                <div class="sss-title">
                <input type="file" onchange="readFile(this)"/> 
                <input id="img_src" name="img_src" type="hidden"/>
                <input type="text" id="m_title" placeholder="请输入主标题" class="sss-theme sss-title-input sss-title-input-1"/><input type="text" placeholder="请输入副标题" class="sss-theme sss-title-input sss-title-input-2"/></div>
                <table class="table sss-content">
                    <thead>
                    <tr>
                        <td>日期</td>
                        <td>名称代码</td>
                        <td>初始价格</td>
                        <td>累积收益</td>
                        <td>今日涨跌幅<img src="${ctx }/images/delete.png" class="sss-delete" style="visibility: hidden" /></td>
                    </tr></thead>
                    <tbody>
                    <c:forEach var="ret" items="${retlist }">
                    <tr >
                    	<td class="sss-time" > <span >${ret.created_at }</span></td>
                        <td class="sss-stock"><span >${ret.stock_name }</span> <div class="stock-num">${ret.symbol }</div></td>
                        <td class="sss-init-price" > <span ><c:choose>
                        <c:when test="${fn:contains(ret.stock_type, 'us_') }">$</c:when>
                        <c:otherwise>￥</c:otherwise>
                    </c:choose> ${ret.orig_price }</span></td>
                        <td class="sss-stock-increase" ><span>${ret.total_earn_percent }%</span></td>
                        <td class="sss-stock-select" >
                        <c:choose>
                            <c:when test="${fn:contains(ret.change_percent, '-')}"><span style="color: green;">${ret.change_percent }% </span></c:when>
                            <c:otherwise><span style="color: red;">${ret.change_percent }% </span></c:otherwise>
                        </c:choose>
                        <img src="${ctx }/images/delete.png" class="sss-delete" style="visibility: hidden;" onclick="delete_stock_expect(this,${ret.id},'${ret.stock_name }')"/>
                        </td>
                    </tr>
                    <c:set var="total_earn" value="${total_earn+ret.total_earn_percent }"></c:set>
                    </c:forEach>
                    </tbody>
                </table>
				<div class="sss-footer">
                    <input type="text" placeholder="请输入主题" class="sss-theme"/><span class="pull-right footer-span">总收益：<span>
                    <fmt:formatNumber type="number" value="${total_earn/fn:length(retlist) }" pattern="0.00" maxFractionDigits="2"/>%</span>
                    日期：<span>${create_date }</span></span>
                </div>
                <form action="${ctx }/forum_post/save" accept-charset="UTF-8" enctype="multipart/form-data" method="post" id="form2" name="form2" onsubmit="return false;">
                	<input id="the_text" name="the_text" type="hidden"/>
                	<input id="the_title" name="the_title" type="hidden"/>
                	<input id="type" name="type" type="hidden" value="4"/>
	                <button class="btn btn-primary pull-right" id="sss-commit" style="margin-bottom:30px;" onclick="f_save2()" >发布</button>
	                <button class="btn btn-primary pull-right" id="sss-prepend" style="margin-right:10px;">预览</button>
                </form>
                <div class="prepend" style="display: none" id="view001">
                    <div style="position: relative;height: 130px;overflow: hidden">
                    <div class="nav-img"></div>
                    </div>
                    <div class="sss-title-prepend"><div class="sss-img"></div><div style="display: inline-block;vertical-align: top;"><span></span><div class="dividerLineGradient"></div><span></span><span></span></div></div>
                    <table class="sss-content-prepend table"></table>
                    <div class="sss-footer-prepend"><span></span></div>
                </div>
            </div>

        </div>
    </div>
</div>
	<%@include file="/jsp/comm_part/footer.jsp"%>
	<!-- start 弹出举报框 -->
	<div id="divedit"  style=" display:none">     
            <div class="span9 aw-main-content aw-all-question" style="width: 90%; border-right: none;padding: 0px;">
                <form id="form1" action="${ctx}/stock_informations/add_stock_expect"  method="post" onsubmit="return false;" >  
                <div class="sss-content-pro"> 
                    <div class="row text-center stock-search">
                        <span><input type="text" class="span5" id="stock_name" placeholder="请输入股票代码"/>
                        <input type="hidden" id="stock_id" name="stock_id" ></span><span><button class="btn" style="margin-bottom: 10px">搜索</button></span>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <td colspan="2" id="orig_price_v">0</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="sss-promp">目标收益率(%)</td>
                            <td><img src="${ctx }/images/tixingshezhi_jian.png"class="sss-minusyield"/><input id="hope_percent" name="hope_percent" type="text" value="7"/><img src="${ctx }/images/tixingshezhi_jia.png"class="sss-addyield"/></td>
                        </tr>
                        <tr>
                            <td class="sss-promp">持有数量(股)</td>
                            <td><input type="text" id="holding_num" name="holding_num" value="100"/></td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td class="sss-promp"><img src="${ctx }/images/tixingshezhi_chushijiage.png"/>初始价格(元)</td>
                            <td><input type="text" id="orig_price" name="orig_price" readonly="readonly" value="6.06"/></td>
                        </tr>
                        <tr>
                            <td class="sss-promp"><img src="${ctx }/images/tixingshezhi_mubiaojiage.png"/>目标价格(元)</td>
                            <td id="target_price">6.48</td>
                        </tr>
                        <tr>
                            <td class="sss-promp"><img src="${ctx }/images/tixingshezhi_yutixing.png"/>预提醒</td>
                            <td >3%</td>
                        </tr>
                        <tr>
                            <td class="sss-promp"><img src="${ctx }/images/tixingshezhi_fengxianyujin.png"/>风险预警</td>
                            <td>-7%</td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
			  </form>
            </div>
	</div>
 <!-- end 弹出举报框 -->
</body>
</html>