<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="basepath" value="https://www.mihaokj.com" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>帮助</title>
    <meta name="viewport" content="width=device-width">
    <link href="${ctx}/images/zm_log.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx}/css/newmain.css"/>
    <script src="${ctx}/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/bootstrap.js"></script>
</head>
<body>
    <%@include file="header.jsp" %>
<section class="main">
    <div class="container-fluid nm-nav-download" >
        <div class="row text-center ">
            <div class="col-xs-1 col-md-1"></div>
            <div class="col-xs-5 col-md-5 nm-downloadbox1 ">
                <img src="${ctx}/images/ios.png" alt="ios下载地址" class="nm-downloadimg"/>
                <img src="${ctx}/images/shouye_ios.png"/></div>
            <div class="col-xs-5 col-md-5 nm-downloadbox2">
                <img src="${ctx}/images/android.png" alt="android下载地址" class="nm-downloadimg"/>
                <img src="${ctx}/images/shouye_androis.png"/>
            </div>
            <div class="col-xs-1 col-md-1"></div>
        </div>
        <div class="row text-center nm-pull">

            <a  id="nm-pull-on"><img src="${ctx}/images/shouye_shouqi.png"/>
                <p>收起</p></a>
        </div>
    </div>
    <div class="middle-box">
    <div class="verify-success">
        <img src="${ctx}/images/yanzhengzhucechenggong.png" alt="success"/>
        <p>解除绑定成功</p>
    </div>
    <h2>重新注册众米账户&nbsp;&nbsp;&nbsp;绑定交易账户</h2>
    <div ><a href="#" class="download-href"><span class="download" id="download">下载众米APP</span></a></div>
    </div>
</section>
<script>
    $(".nm-nav-download").height(window.screen.availHeight);
    $("#download").click(function(){
        $(this).attr("src","${ctx}/images/shouye_anxia.png");
        $(".nm-nav-download").animate({"top":0},300).animate({"top":"-40px"},200).animate({"top":0},200);
    });
    $("#nm-pull-on").click(function(){
        $(".nm-nav-download").animate({"top":-$(".nm-nav-download").height()},300)
    });
    var height = getDocHeight();
    var width = getDocWidth();
    $(".main").height(height);
    if(isMobile()){
    $(".download").css("font-size","3.4rem");
    $(".verify-success p").css("font-size","3rem");
    $(".verify-success img").css("width","140px");
    $("#download").unbind();
    if(isiOS){
    $(".download-href").attr("href","https://itunes.apple.com/us/app/zhong-mi/id946857722?l=zh&ls=1&mt=8");
    }else{
    $(".download-href").attr("href","http://mimikj.com:8081/mimikj/app/zhongmiApp.apk");
    }
    }
    //获取页面显示区域高度
    function getDocHeight() {
        var D = document;
        return Math.max(
                Math.max(D.body.scrollHeight, D.documentElement.scrollHeight),
                Math.max(D.body.offsetHeight, D.documentElement.offsetHeight),
                Math.max(D.body.clientHeight, D.documentElement.clientHeight)
        );
    }
    //获取页面显示区域宽度
    function getDocWidth() {
        var D = document;
        return Math.max(
                Math.max(D.body.scrollWidth, D.documentElement.scrollWidth),
                Math.max(D.body.offsetWidth, D.documentElement.offsetWidth),
                Math.max(D.body.clientWidth, D.documentElement.clientWidth)
        );
    }
</script>
</body>
</html>