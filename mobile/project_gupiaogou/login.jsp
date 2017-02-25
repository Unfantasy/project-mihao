<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>登陆</title>
    <link href="${ctx }/images/zm_log.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="${ctx }/css/bootstrap2.css"/>
    <link rel="stylesheet" href="${ctx }/css/login.css-v=20151027.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery.form.js"></script>
    <style>
        body, html{
            margin:0;
            padding:0;
            font-family:"Mecrosoft Yahei";
        }
        a:hover{
            text-decoration:none;
        }
        #aw_login>div{
            background-color:#3A3937;
            width:100%;
            height:250px;
            font-size: 20px;
            margin-bottom:500px;
        }
        #aw_login img{
            padding:50px 0 50px 100px;
        }
        .aw-mod-body{
            margin-left:auto;
            margin-right:auto;
            margin-top:-30px;
            width:495px;
            background-color: #fff;
            border: none;
            box-shadow:0 0 7px 1px #999;
            padding-left:15px;
            padding-top:60px;
            padding-bottom: 0;
            margin-bottom:-10px;
        }
        .aw-mod-body li{
            list-style: none;
        }
        .aw-mod-body input{
            background-color: #F8F8F7;

        }
        .aw-mod-body #aw-login-user-name, .aw-mod-body #aw-login-user-password{
            width:95%;
            height:60px;
            font-size:20px;
            padding-left: 20px;
            border-left: 1px solid #EBEBEB;
            -webkit-box-shadow: none
            -moz-box-shadow: none;
            box-shadow: none;
            border:none;
        }

        /*记住我复选框样式*/
        input[type="checkbox"]{
            display: none;
        }
        .aw-mod-body ul li.last label{
            background:url("${ctx}/images/jizhuwohou.png") no-repeat;
            padding-left:25px;
            background-size:auto 100%;
            font-size:20px;
        }
        /*end 记住我复选框样式*/
        .aw-mod-body ul li.last a{
            font-size:20px;
            color:#f45531;
            cursor:pointer;
        }
        .aw-mod-body ul li.last a:hover{
            color:#f45531;
        }

        #login_submit{
            width:92%;
            height:60px;
            margin-top: 10px;
            background-color:#f45531;
            background-image: none;
            line-height:60px;
            color:#fff;
            letter-spacing: 10px;
            font-size:20px;
        }

        .aw-mod-foot{
            width:64px;
            height:51px;
            box-shadow:0 0 7px 1px #999;
            text-align:center;
            background-color:#fff;
            position:relative;
            top:-290px;
            left:535px;

        }
        .aw-mod-foot a{
            color:#f45531;
            font-size:20px;
            line-height:51px;
        }
        .aw-white{
            width:10px;
            height:51px;
            background-color: #fff;
            position:relative;
            left:-10px;
            top:-51px;
        }
    </style>
    <script>
    $(function() {
        //点击切换样式
        $('label').click(function () {
    		if($("#login-radio").is(':checked')==false){
    			 $(this).css("background-image", 'url("${ctx}/images/jizhuwohou.png")');
			}else{
				$(this).css("background-image", 'url("${ctx}/images/jizhuwoqian.png")');
			}
        });
        //回车提交事件
        $("body").keydown(function() {
            if (event.keyCode == "13") {//keyCode=13是回车键
            	 f_save();
            }
        });   
        if(isMobile() == true){
    		location.href="${ctx }/users/login_index?mt=mobile";
    	}
    });
  //判断是否是手机页面
    function isMobile() {
        if((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i)))
            return true;
        else
            return false;

    }
    function f_save(){
		submitForm();
	}
	function submitForm() { 
		var username = $("#aw-login-user-name").val();
		var pwd = $("#aw-login-user-password").val();
		$(".error-message").css("display","none");
		if(username==null||username==""){
			$(".error-message").css("display","list-item").animate({left:"30px"},50).animate({left:"0px"},50);
			$(".error-message em").text("请输入手机号码！！");
			return false;
		}
		if(pwd==null||pwd==""){
			$(".error-message").css("display","list-item").animate({left:"30px"},50).animate({left:"0px"},50);
			$(".error-message em").text("请输入登录密码！！");
			return false;
		}
		var mobilelog = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
         if (!mobilelog.test(username)) {
        	 $(".error-message").css("display","list-item").animate({left:"30px"},50).animate({left:"0px"},50);
				$(".error-message em").text("手机号码格式不正确！");
				return false;
         }
		// jquery 表单提交 
		$("#login_form").ajaxSubmit({
			type: 'post',
	        dataType: 'json',
			success:function(data){
				if(data.state=="success"){
					location.href="${ctx }/forum_post/list";
				}else{
					$(".error-message").css("display","list-item").animate({left:"30px"},50).animate({left:"0px"},50);
					$(".error-message em").text("用户手机号码或密码错误！");
				}
			},error:function(xhr){alert('动态页出错\n\n'+xhr.responseText);}//
		}); 
		return false; 
	}
    </script>
</head>
<body>
    <section id="aw_login">
        <div class="container">
            <img src="${ctx }/images/shouye_icon.png" alt=""/>
            <div class="row">

                    <div class="aw-login-box">
                        <div class="aw-mod">
                            <div class="aw-mod-body ">
                                <form id="login_form" method="post" method="post" onsubmit="return false;" action="${ctx }/users/log_in" >
                                    <ul>
                                        <li>
                                            <input type="text" id="aw-login-user-name" placeholder="请输入手机号码" name="login_phone" value="${login_phone }" />
                                        </li>
                                        <li>
                                            <input type="password" id="aw-login-user-password" placeholder="密码" name=login_password value="${login_password }" />
                                        </li>
                                        <li class="error error-message hide">
                                            <p><i class="aw-icon i-no"></i><em></em></p>
                                        </li>
                                        <li class="last">

                                            <input id="login-radio" type="checkbox" value="1" checked="checked" name="net_auto_login" checked="checked"/>
                                            <label for="login-radio">记住我</label>
                                            <a class="pull-right" href="${ctx }/jsp/users/find_pwd.jsp" >忘记密码?</a>
                                        </li>
                                        <li class="login_submit"><a id="login_submit" onclick="f_save();" class=" btn btn-default">登录</a></li>
                                    </ul>
                                </form>
                                <div class="aw-mod-foot">
                                    <a href="${ctx }/jsp/users/register.jsp">注册</a>
                                    <div class="aw-white"></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
        </div>
    </section>
</body>
</html>
