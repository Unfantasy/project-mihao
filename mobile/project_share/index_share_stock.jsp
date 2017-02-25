<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<script type="text/javascript">
	username = "${username}"
	usernamesrc = "${usernamesrc}";
	stock = "${stock}";
	money = "${money}";
	increase = "${increase}";
</script>
<head lang="en">
    <meta charset="UTF-8">
  <title>我的分享</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0"/>
    <link rel="stylesheet" href="${ctx }/css/share.css" />

</head>
<body>
<div class="notice_mark"></div>
<div class="notice_img">
    <img src="${ctx }/images/wechat_lead.png" onclick="hideThis(this)">
</div>
<script src="${ctx }/js/jquery.js"></script>
<script src="${ctx }/js/share.js"></script>
</body>
</html>