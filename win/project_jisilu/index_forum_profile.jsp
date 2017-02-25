<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@include file="/jsp/comm_part/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>股市合伙人---发现最搭的投资战友</title>
<link href="${ctx }/images/zm_log.ico" rel="shortcut icon" />
<script type="text/javascript" src="${ctx }/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap2.js"></script>
<script type="text/javascript" src="${ctx }/js/jsl.js" ></script>
<script type="text/javascript" src="${ctx }/js/jquery.form.js" ></script>

<link rel="stylesheet" type="text/css" href="${ctx }/css/bootstrap2.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/common.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/link.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/btn-sprite.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/icon-sprite.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/style.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/jsl.css-v=20151027.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/JiSiLu.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/user-setting.css"/>
<style type="text/css">
.error-message{position: relative;}
.error{height:30px;line-height:30px;padding-left:12px;background: #FFF480;border: 1px solid #EBEBEB;border-radius: 5px;color:#666;}
.error .i-no{position:relative;top:4px;*top:0;margin-right: 2px;}
#otherinfo dt{height:20px; }
</style>
<script type="text/javascript">
	 function changeimg( obj ) {
	     var _this = obj;
	     var file = obj.files[0];
	     //这里我们判断下类型如果不是图片就返回 去掉就可以上传任意文件
	     if(!/image\/\w+/.test(file.type)){
	         alert("请确保文件为图像类型");
	         return false;
	     }
	     var reader = new FileReader();
	     reader.readAsDataURL(file);
	     reader.onload = function(e){
	         $("#avatar_src").attr("src",this.result);
	     }
	 }
	 function f_save(){
			submitForm();
		}
		function submitForm() { 
			var nickname = $("#nickname").val();
			$(".error-message").css("display","none");
			if(nickname==null||nickname==""){
				$(".error-message").css("display","block").animate({left:"30px"},50).animate({left:"0px"},50);
				$(".error-message em").text("请输入昵称！！");
				return false;
			}
			if($("#province_code").val()!="-1"){
				 var province_code = $("#province_code").find("option:selected").text();
				 var city_code = $("#city_code").find("option:selected").text();
				 var district_code = $("#district_code").find("option:selected").text();
				$("#city").val(province_code+city_code+district_code)
			}else{
				$("#province_code").val("");
				$("#city_code").val("");
				$("#district_code").val("");
			}
			// jquery 表单提交 
			$("#setting_form").ajaxSubmit({
				type: 'post',
		        dataType: 'json',
				success:function(data){
					if(data.state=="success"){
						alert("修改成功！");
						window.top.location.reload(true);
					}else{
						if(data.state=="error"&&data.msg=="nickname_is_exist"){
							$(".error-message").css("display","block").animate({left:"30px"},50).animate({left:"0px"},50);
							$(".error-message em").text("用户名已存在！");
						}else if(data.state=="error"&&data.msg=="uploadfile_user_photo_fail"){
							$(".error-message").css("display","block").animate({left:"30px"},50).animate({left:"0px"},50);
							$(".error-message em").text("上传头像失败！");
						}else if(data.state=="error"&&data.msg=="nickname_is_error"){
							$(".error-message").css("display","block").animate({left:"30px"},50).animate({left:"0px"},50);
							$(".error-message em").text("失败，昵称不合法！");
						}else if(data.state=="error"&&data.msg.indexOf("days_later_update_nickname")>=0){
							$(".error-message").css("display","block").animate({left:"30px"},50).animate({left:"0px"},50);
							$(".error-message em").text("失败，修改昵称间隔"+data.msg.replace("_days_later_update_nickname","")+"天！");
						}else{
							$(".error-message").css("display","block").animate({left:"30px"},50).animate({left:"0px"},50);
							$(".error-message em").text("修改失败！");
						}
					}
				},error:function(xhr){alert('动态页出错\n\n'+xhr.responseText);}
			}); 
			return false; 
		}
	 function modify(){
		 $("#sel_area").show();
		 var province_code = "${user.province_code}";
		 var city_code = "${user.city_code}";
		 var district_code = "${user.district_code}";
		 areaChange("province_code","",city_code);
		 if(city_code!=""){
			 setTimeout(function(){areaChange("city_code",province_code,city_code);},100);
			 if(district_code!=""){
				 setTimeout(function(){areaChange("district_code",city_code,district_code);},300);
				 
			 }
		 }
	 }
	 
	 function areaChange(idname,supervisor_code,cu_city_code){
		 if(supervisor_code=="-1"){supervisor_code="";}
		 var province_code = "${user.province_code}";
		 var city_code = "${user.city_code}";
		 var district_code = "${user.district_code}";
   		 $.ajax({
   	       url: "${ctx}/area/get_list?supervisor_code=" + supervisor_code+"&city_code="+cu_city_code+"&t="+new Date().getTime(), 
              type: 'post',
              dataType: 'json',
              success: function (data) {
            	  if(idname=="city_code"){
            		  $("#city_code option[value!='-1']").remove();
            		  $("#district_code option[value!='-1']").remove();
               	}
             	if(idname=="district_code"){
             		$("#district_code option[value!='-1']").remove();
             	}
   				var list = data.result;
   				$(list).each(function(i) {
   					var option = new Option();
   					option.value = list[i].city_code;
   					option.innerText = list[i].city_name;
   					if(idname == "province_code"){
   						if(list[i].city_code == province_code){
   							option.selected = true; 
   							//alert(province_code);
   						}
   					}else if(idname == "city_code"){
   						if(list[i].city_code == city_code){
   							option.selected = true; 
   							city = list[i].city_name;
   							//alert(city_code);
   						}
   					}else if(idname == "district_code"){
   						if(list[i].city_code == district_code){
   							option.selected = true; 
   						}
   					}
   					$("#"+idname).append(option);
   				});
              }
          });
   	   }
	 </script>
</head>

<body>
	<div class="aw-container-wrap" style="padding-bottom:0">
    <div class="aw-container-sub aw-wecenter-sub aw-user" >
        <div class="aw-user-setting" style="padding: 0px;">
            <div class="tab-content">
             <!-- 基本信息 -->
                <div class="aw-mod">
                    <div class="aw-mod-head">
                        <h4>基本信息</h4>
                    </div>
                    <form id="setting_form"  enctype="multipart/form-data" method="post" action="${ctx }/users/update_attr" onsubmit="return false;">
                        <div class="aw-mod-body aw-user-setting-layout aw-user-setting-base">
                            <dl>
                                <dt>绑定手机:</dt>
                                <dd>${user.phone }</dd>
                             </dl>
                            <dl>
                                <dt>我的昵称:</dt>
                                <dd>
                                <input type="text" id="nickname" name="nickname" placeholder="3-20个数字或字母或汉字的昵称"  value="${user.nickname }">
                                <input type="hidden" id="oldnickname" name="oldnickname" value="${user.nickname }">
                                	<input type="hidden" id="id" name="id" value="${user.id }"> 
                                </dd>
                            </dl>
                            <dl>
                                <dt>最牛投资经历:</dt>
                                <dd><input type="text" id="signature" name="signature" value="${user.signature }"></dd>
                            </dl>
                            <dl>
                                <dt>地区:</dt>
                                <dd><input type="text" id="city" name="city" value="${user.city }" readonly="readonly" style="width: 150px;">&nbsp;&nbsp;&nbsp;<a href="javascript:modify()">修改</a>
                                	<div id="sel_area" style="display: none;">
                                		<select id="province_code" name="province_code" onchange="areaChange('city_code',$(this).val(),'${user.city_code }')">
                                			<option value="-1">请选择</option>
                                		</select>
                                		<select id="city_code" name="city_code" onchange="areaChange('district_code',$(this).val(),'${user.district_code }')">
                                			<option value="-1">请选择</option>
                                		</select>
                                		<select id="district_code" name="district_code">
                                			<option value="-1">请选择</option>
                                		</select>
                                	</div>
                                </dd>
                            </dl>
                            <dl>
                                <dt>工作:</dt>
                                <dd><input type="text" id="workinfo" name="workinfo" value="${user.workinfo }"></dd>
                            </dl>
                            <dl>
                                <dt>学校:</dt>
                                <dd><input type="text" id="school" name="school" value="${user.school }"></dd>
                            </dl>
                            <label class="error error-message" style="left: 0px;width: 200px;display: none; margin-left: 90px;">
									  <i class="aw-icon i-no"></i><em></em>
									</label>
                            <!-- 上传头像 -->
                            <div class="aw-user-setting-upload-img-box">
                                <dl>
                                    <dt class="pull-left">
                                     <img id="avatar_src" class="aw-border-radius-5"  alt="${user.nickname }" src="${pic_url }${user.avatar }"/>
                                    </dt>
                                    <dd class="pull-left">
                                        <h5>头像设置</h5>
                                        <p>支持 jpg、gif、png 等格式的图片</p>
                                        <input id="file" name="file" type="file" class="onloadImg" onchange="changeimg(this)"/>
                                    </dd>
                                </dl>
                             <div id="otherinfo" style="margin-top: 38px;">
                           		 <dl>
                                <dt>其他手机号:</dt>
                                <dd><input type="text" id="telephone" name="telephone" value="${user.telephone }"></dd>
                            </dl>
                             <dl>
                                <dt>QQ:</dt>
                                <dd><input type="text" id="qq" name="qq" value="${user.qq }"></dd>
                            </dl>
                             <dl>
                                <dt>微信:</dt>
                                <dd><input type="text" id="wechat" name="wechat" value="${user.wechat }"></dd>
                            </dl>
                           </div>
                            </div>
                            <!-- end 上传头像 -->
                        </div>
                    </form>
                    </div>
                <!-- end 基本信息 -->
                 <a href="javascript:;" class="btn btn-large btn-success pull-right aw-user-setting-save" onclick="f_save()">保存</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>