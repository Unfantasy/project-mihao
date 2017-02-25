<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title>众米俱乐部讲述大师报名表</title>
    <link rel="stylesheet" href="${ctx }/html/css/submitcss.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${ctx }/js/jquery.form.js" ></script>
    <script src="${ctx }/html/js/submitjs.js"></script>

    <script>
        $(function(){
        	areaChange("province_code","");
        	
            $('#name').on('blur',function(){
                if($(this).val()==''){
                    $(this).showSubmitWarn('请填写名字');
                }else{
                    $(this).hideSubmitWarn();
                }
            });
            $('#organization').on('blur',function(){
                if($(this).val()==''){
                    $(this).showSubmitWarn('请填写机构');
                }else{
                    $(this).hideSubmitWarn();
                }
            });
            $('#place').on('blur',function(){
                if($(this).val()==''){
                    $(this).showSubmitWarn('请填写职位');
                }else{
                    $(this).hideSubmitWarn();
                }
            });
            $('#email').on('blur',function(){
                if($(this).val()==''){
                    $(this).showSubmitWarn('请填写邮箱');
                }else{
                    $(this).hideSubmitWarn();
                }
            });
            $('#phone').on('blur',function(){
                if($(this).val()==''){
                    $(this).showSubmitWarn('请填写手机');
                }else{
                    $(this).hideSubmitWarn();
                }
            });
            $('#business').on('blur',function(){
                if($(this).val()==''){
                    $(this).showSubmitWarn('请填写擅长业务领域');
                }else{
                    $(this).hideSubmitWarn();
                }
            });
            $('#speech_content').on('blur',function(){
                if($(this).val()==''){
                    $(this).showSubmitWarn('请填写申请主讲内容');
                }else{
                    $(this).hideSubmitWarn();
                }
            });
            $('#self_description').on('blur',function(){
                if($(this).val()==''){
                    $(this).showSubmitWarn('请填写简要自荐说明');
                }else{
                    $(this).hideSubmitWarn();
                }
            });
            $('#address').on('blur',function(){
                if($(this).val()==''){
                    $(this).showSubmitWarn('请填写详细地址');
                }else{
                    $(this).hideSubmitWarn();
                }
            });
        });
        function areaChange(idname,supervisor_code){
   		 if(supervisor_code=="-1"){supervisor_code="";}
      		 $.ajax({
      	       url: "${ctx}/area/get_list?supervisor_code=" + supervisor_code + "&t="+new Date().getTime(), 
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
      					$("#"+idname).append(option);
      				});
                 }
             });
      	   }
        function f_save(){
			submitForm();
		}
		function submitForm() { 
			 if($("#name").val()==''){
				 $("#name").showSubmitWarn('请填写名字');
                 return false;
             }
			 if($("#organization").val()==''){
				 $("#organization").showSubmitWarn('请填写机构');
                 return false;
             }
			 if($("#place").val()==''){
				 $("#place").showSubmitWarn('请填写职位');
                 return false;
             }
			 if($("#email").val()==''){
				 $("#email").showSubmitWarn('请填写邮箱');
                 return false;
             }
			 if($("#phone").val()==''){
				 $("#phone").showSubmitWarn('请填写手机');
                 return false;
             }
			 if($("#business").val()==''){
				 $("#business").showSubmitWarn('请填写擅长业务领域');
                 return false;
             }
			 if($("#speech_content").val()==''){
				 $("#speech_content").showSubmitWarn('请填写申请主讲内容');
                 return false;
             }
			 if($("#self_description").val()==''){
				 $("#self_description").showSubmitWarn('请填写简要自荐说明');
                 return false;
             }
			 var address = $("#address").val();
			 var province = $("#province_code option:selected").text();
			 var city = $("#city_code option:selected").text();
			 var district = $("#district_code option:selected").text();
			 if(province=="-1"||address==""){
				 $("#address").showSubmitWarn('请填写地址');
                 return false;
			}
			 var addr="";
			 if($("#province_code").val()!="-1"){
				 addr=province;
			 }
			 if($("#city_code").val()!="-1"){
				 addr=addr+city;
			 }
			 if($("#district_code").val()!="-1"){
				 addr=addr+district;
			 }
			 addr = addr+" "+address;
			 $("#address").val(addr);
			// jquery 表单提交 
			$("#_form1").ajaxSubmit({
				type: 'post',
		        dataType: 'json',
				success:function(data){
					if(data.success==true){
						alert("提交成功！");
					}else{
						alert("提交失败");
					}
				},error:function(xhr){alert('动态页出错\n\n'+xhr.responseText);}
			}); 
			return false; 
		}
    </script>
</head>
<body class="signUp">
    <h2>众米俱乐部讲述大师报名表</h2>
    <form id="_form1" method="post" action="${ctx }/speaker/save" onsubmit="return false;">
    <div class="main">
        <div class="field">
            <p class="fieldLable">姓名 <span class="red">*</span></p>
            <div class="fieldContent">
                <p>*用于统计您的积分及礼品发放~</p>
                <input type="text" class="fieldInput" name="name" id="name"/>
                <div class="error"></div>
            </div>
        </div>
        <div class="field">
            <p class="fieldLable">机构 <span class="red">*</span></p>
            <div class="fieldContent">
                <p>*保证快递小哥能送到您手中~</p>
                <input type="text" class="fieldInput" name="organization" id="organization"/>
                <div class="error"></div>
            </div>
        </div>
        <div class="field">
            <p class="fieldLable">职位 <span class="red">*</span></p>
            <div class="fieldContent">
                <p>*是中奖的凭证及我们联系您的唯一方式</p>
                <input type="text" class="fieldInput" name="place" id="place"/>
                <div class="error"></div>
            </div>
        </div>
        <div class="field">
            <p class="fieldLable">邮箱 <span class="red">*</span></p>
            <div class="fieldContent">
                <p>*当我们有重大活动时，方便与您取得联系</p>
                <input type="text" class="fieldInput" name="email" id="email"/>
                <div class="error"></div>
            </div>
        </div>
        <div class="field">
            <p class="fieldLable">手机 <span class="red">*</span></p>
            <div class="fieldContent">
                <p>填数字就ok啦</p>
                <input type="text" class="fieldInput" name="phone" id="phone"/>
                <div class="error"></div>
            </div>
        </div>
        <div class="field">
            <p class="fieldLable">联系地址 <span class="red">*</span></p>
            <div class="fieldContent">
                <p>*请详细填写哦</p>
                <select name="province_code" id="province_code" onchange="areaChange('city_code',$(this).val())">
                    <option value="-1">- 省/自治区/直辖市 -</option>
                </select>
                <select name="city_code" id="city_code" onchange="areaChange('district_code',$(this).val())">
                    <option value="-1">- 市 -</option>
                </select>
                <select name="district_code" id="district_code">
                    <option value="-1">- 区 -</option>
                </select>
                <input type="text" class="fieldInput" name="address" id="address" placeholder="详细地址"/>
                <div class="error"></div>
            </div>
        </div>
        <div class="field">
            <p class="fieldLable">擅长业务领域 <span class="red">*</span></p>
            <div class="fieldContent">
                <textarea rows="3" class="fieldTextarea" name="business" id="business"></textarea>
                <div class="error"></div>
            </div>
        </div>
        <div class="field">
            <p class="fieldLable">申请主讲内容 <span class="red">*</span></p>
            <div class="fieldContent">
                <textarea rows="3" class="fieldTextarea" name="speech_content" id="speech_content"></textarea>
                <div class="error"></div>
            </div>
        </div>
        <div class="field">
            <p class="fieldLable">简要自荐说明 <span class="red">*</span></p>
            <div class="fieldContent">
                <textarea rows="3" class="fieldTextarea" name="self_description" id="self_description"></textarea>
                <div class="error"></div>
            </div>
        </div>
    </div>
<div class="footer">
    <button onclick="f_save()">提交</button>
</div>
</form>
</body>
</html>