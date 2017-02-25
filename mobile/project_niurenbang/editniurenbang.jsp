<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title>编辑牛人榜</title>
    <link rel="stylesheet" href="${ctx }/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx }/css/niurenbang.css"/>
    <script type="text/javascript" src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${ctx }/js/bootstrap.js"></script>
    <script type="text/javascript" src="${ctx }/js/html2canvas.js"></script>
    <script type="text/javascript" src="${ctx }/js/canvas_scale.js"></script>
    <style>
        body{
            padding-top:50px;
            padding-bottom: 50px;
        }
        .pMsg{
            font-weight: bold;
            font-family: "Mecrosoft Yahei";
            font-size:2em;
        }
        .row .table td{
        }
        .headimg{
            width:50px;
            height:50px;
            border-radius:50%;
            display: block;
        }
        /*牛人榜生成图片*/
        #long_picture{
            width:980px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4 person1">
            <table class="table table-condensed">
                <tr class="col-md-12 pMsg"><td>人物一</td></tr>
                <tr>
                    <td><img src="${ctx }/images/jiemuzhe.jpg" alt="headimg" class="headimg" />上传头像：<input type="file" class="onloadImg" onchange="changeimg(this)"/> </td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon"> 人物名称：</span><input type="text" class="form-control username"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon"> 个人介绍：</span><input type="text" class="form-control eintrContent"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon ">文章标题1：</span><input type="text" class="form-control title1"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接1：</span><input type="text" class="form-control titleurl1"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章标题2：</span><input type="text" class="form-control title2"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接2：</span><input type="text" class="form-control titleurl2"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章标题3：</span><input type="text" class="form-control title3"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接3：</span><input type="text" class="form-control titleurl3"/></div></td>
                </tr>
                <tr>
                    <td>
                        <table class="xingjipingding">
    <tr>
    <td>活跃平台：</td>
    <td><input type="checkbox" class="sina" name="changyongpingtai1"/>&nbsp;新浪&nbsp;<input type="checkbox" class="zhihu" name="changyongpingtai1"/>&nbsp;知乎&nbsp;<input type="checkbox" class="moerjinrong" name="changyongpingtai1"/>&nbsp;摩尔金融&nbsp;<input type="checkbox" class="weixin" name="changyongpingtai1"/>&nbsp;微信&nbsp;<input type="checkbox" class="xueqiu" name="changyongpingtai1"/>&nbsp;雪球&nbsp;</td>
    </tr>
    <tr>
    <td>文章频率：</td>
    <td><input type="radio" class="wenzhangpinlv1" name="wenzhangpinlv1"/>&nbsp;一星&nbsp;<input type="radio" class="wenzhangpinlv2" name="wenzhangpinlv1"/>&nbsp;二星&nbsp;<input type="radio" class="wenzhangpinlv3" name="wenzhangpinlv1"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>模拟收益率：</td>
    <td><input type="radio" class="monishouyilv1" name="monishouyilv1"/>&nbsp;一星&nbsp;<input type="radio" class="monishouyilv2" name="monishouyilv1"/>&nbsp;二星&nbsp;<input type="radio" class="monishouyilv3" name="monishouyilv1"/>&nbsp;三星&nbsp;
    </td>
    </tr>
    <tr>
    <td>自媒体影响：</td>
    <td><input type="radio" class="zimeiti1" name="zimeiti1"/>&nbsp;一星&nbsp;<input type="radio" class="zimeiti2" name="zimeiti1"/>&nbsp;二星&nbsp;<input type="radio"  class="zimeiti3" name="zimeiti1"/>&nbsp;三星&nbsp;
    </td>
    </tr>
    <tr>
    <td>专注度：</td>
    <td><input type="radio" class="zhuanzhudu1" name="zhuanzhudu1"/>&nbsp;一星&nbsp;<input type="radio" class="zhuanzhudu2" name="zhuanzhudu1"/>&nbsp;二星&nbsp;<input type="radio" class="zhuanzhudu3" name="zhuanzhudu1"/>&nbsp;三星&nbsp;                                </td>
    </tr>
    <tr>
    <td>是否收费：</td>
    <td><input type="radio" class="shifoushoufei1" name="shifoushoufei1"/>&nbsp;一星&nbsp;<input type="radio" class="shifoushoufei2" name="shifoushoufei1"/>&nbsp;二星&nbsp;<input type="radio"  class="shifoushoufei3" name="shifoushoufei1"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>回复积极度：</td>
    <td><input type="radio" class="huifujijidu1" name="huifujijidu1"/>&nbsp;一星&nbsp;<input type="radio" class="huifujijidu2" name="huifujijidu11"/>&nbsp;二星&nbsp;<input type="radio" class="huifujijidu3" name="huifujijidu1"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>综合指数：</td>
    <td><input type="radio" class="zonghezhishu1" name="zonghezhishu1"/>&nbsp;一星&nbsp;<input type="radio" class="zonghezhishu2" name="zonghezhishu1"/>&nbsp;二星&nbsp;<input type="radio" class="zonghezhishu3" name="zonghezhishu1"/>&nbsp;三星&nbsp;<input type="radio" class="zonghezhishu4" name="zonghezhishu1"/>&nbsp;四星&nbsp;<input type="radio" class="zonghezhishu5" name="zonghezhishu1"/>&nbsp;五星&nbsp;</td>
    </tr>
    </table>
                    </td>
                </tr>
                </table>
        </div>
        <div class="col-md-4 person2">
            <table class="table table-condensed">
                <tr class="col-md-12 pMsg"><td>人物二</td></tr>
                <tr>
                    <td><img src="${ctx }/images/jiemuzhe.jpg" alt="headimg" class="headimg" />上传头像：<input type="file" class="onloadImg" onchange="changeimg(this)"/> </td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon"> 人物名称：</span><input type="text" class="form-control username"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon"> 个人介绍：</span><input type="text" class="form-control eintrContent"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon ">文章标题1：</span><input type="text" class="form-control title1"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接1：</span><input type="text" class="form-control titleurl1"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章标题2：</span><input type="text" class="form-control title2"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接2：</span><input type="text" class="form-control titleurl2"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章标题3：</span><input type="text" class="form-control title3"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接3：</span><input type="text" class="form-control titleurl3"/></div></td>
                </tr>
                <tr>
                    <td>
    <table class="xingjipingding">
    <tr>
    <td>活跃平台：</td>
    <td><input type="checkbox" class="sina" name="changyongpingtai2"/>&nbsp;新浪&nbsp;<input type="checkbox" class="zhihu" name="changyongpingtai2"/>&nbsp;知乎&nbsp;<input type="checkbox" class="moerjinrong" name="changyongpingtai2"/>&nbsp;摩尔金融&nbsp;<input type="checkbox" class="weixin" name="changyongpingtai2"/>&nbsp;微信&nbsp;<input type="checkbox" class="xueqiu" name="changyongpingtai2"/>&nbsp;雪球&nbsp;</td>
    </tr>
    <tr>
    <td>文章频率：</td>
    <td><input type="radio" class="wenzhangpinlv1" name="wenzhangpinlv2"/>&nbsp;一星&nbsp;<input type="radio" class="wenzhangpinlv2" name="wenzhangpinlv2"/>&nbsp;二星&nbsp;<input type="radio" class="wenzhangpinlv3" name="wenzhangpinlv2"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>模拟收益率：</td>
    <td><input type="radio" class="monishouyilv1" name="monishouyilv2"/>&nbsp;一星&nbsp;<input type="radio" class="monishouyilv2" name="monishouyilv2"/>&nbsp;二星&nbsp;<input type="radio" class="monishouyilv3" name="monishouyilv2"/>&nbsp;三星&nbsp;
    </td>
    </tr>
    <tr>
    <td>自媒体影响：</td>
    <td><input type="radio" class="zimeiti1" name="zimeiti2"/>&nbsp;一星&nbsp;<input type="radio" class="zimeiti2" name="zimeiti2"/>&nbsp;二星&nbsp;<input type="radio"  class="zimeiti3" name="zimeiti2"/>&nbsp;三星&nbsp;
    </td>
    </tr>
    <tr>
    <td>专注度：</td>
    <td><input type="radio" class="zhuanzhudu1" name="zhuanzhudu2"/>&nbsp;一星&nbsp;<input type="radio" class="zhuanzhudu2" name="zhuanzhudu2"/>&nbsp;二星&nbsp;<input type="radio" class="zhuanzhudu3" name="zhuanzhudu2"/>&nbsp;三星&nbsp;                                </td>
    </tr>
    <tr>
    <td>是否收费：</td>
    <td><input type="radio" class="shifoushoufei1" name="shifoushoufei2"/>&nbsp;一星&nbsp;<input type="radio" class="shifoushoufei2" name="shifoushoufei2"/>&nbsp;二星&nbsp;<input type="radio"  class="shifoushoufei3" name="shifoushoufei2"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>回复积极度：</td>
    <td><input type="radio" class="huifujijidu1" name="huifujijidu2"/>&nbsp;一星&nbsp;<input type="radio" class="huifujijidu2" name="huifujijidu2"/>&nbsp;二星&nbsp;<input type="radio" class="huifujijidu3" name="huifujijidu2"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>综合指数：</td>
    <td><input type="radio" class="zonghezhishu1" name="zonghezhishu2"/>&nbsp;一星&nbsp;<input type="radio" class="zonghezhishu2" name="zonghezhishu2"/>&nbsp;二星&nbsp;<input type="radio" class="zonghezhishu3" name="zonghezhishu2"/>&nbsp;三星&nbsp;<input type="radio" class="zonghezhishu4" name="zonghezhishu2"/>&nbsp;四星&nbsp;<input type="radio" class="zonghezhishu5" name="zonghezhishu2"/>&nbsp;五星&nbsp;</td>
    </tr>
    </table>
                    </td>
                </tr>
                </table>
        </div>
        <div class="col-md-4 person3">
            <table class="table table-condensed">
                <tr class="col-md-12 pMsg"><td>人物三</td></tr>
                <tr>
                    <td><img src="${ctx }/images/jiemuzhe.jpg" alt="headimg" class="headimg" />上传头像：<input type="file" class="onloadImg" onchange="changeimg(this)"/> </td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon"> 人物名称：</span><input type="text" class="form-control username"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon"> 个人介绍：</span><input type="text" class="form-control eintrContent"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon ">文章标题1：</span><input type="text" class="form-control title1"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接1：</span><input type="text" class="form-control titleurl1"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章标题2：</span><input type="text" class="form-control title2"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接2：</span><input type="text" class="form-control titleurl2"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章标题3：</span><input type="text" class="form-control title3"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接3：</span><input type="text" class="form-control titleurl3"/></div></td>
                </tr>
                <tr>
                    <td>
                        <table class="xingjipingding">
    <tr>
    <td>活跃平台：</td>
    <td><input type="checkbox" class="sina" name="changyongpingtai3"/>&nbsp;新浪&nbsp;<input type="checkbox" class="zhihu" name="changyongpingtai3"/>&nbsp;知乎&nbsp;<input type="checkbox" class="moerjinrong" name="changyongpingtai3"/>&nbsp;摩尔金融&nbsp;<input type="checkbox" class="weixin" name="changyongpingtai3"/>&nbsp;微信&nbsp;<input type="checkbox" class="xueqiu" name="changyongpingtai3"/>&nbsp;雪球&nbsp;</td>
    </tr>
    <tr>
    <td>文章频率：</td>
    <td><input type="radio" class="wenzhangpinlv1" name="wenzhangpinlv3"/>&nbsp;一星&nbsp;<input type="radio" class="wenzhangpinlv2" name="wenzhangpinlv3"/>&nbsp;二星&nbsp;<input type="radio" class="wenzhangpinlv3" name="wenzhangpinlv3"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>模拟收益率：</td>
    <td><input type="radio" class="monishouyilv1" name="monishouyilv3"/>&nbsp;一星&nbsp;<input type="radio" class="monishouyilv2" name="monishouyilv3"/>&nbsp;二星&nbsp;<input type="radio" class="monishouyilv3" name="monishouyilv3"/>&nbsp;三星&nbsp;
    </td>
    </tr>
    <tr>
    <td>自媒体影响：</td>
    <td><input type="radio" class="zimeiti1" name="zimeiti3"/>&nbsp;一星&nbsp;<input type="radio" class="zimeiti2" name="zimeiti3"/>&nbsp;二星&nbsp;<input type="radio"  class="zimeiti3" name="zimeiti3"/>&nbsp;三星&nbsp;
    </td>
    </tr>
    <tr>
    <td>专注度：</td>
    <td><input type="radio" class="zhuanzhudu1" name="zhuanzhudu3"/>&nbsp;一星&nbsp;<input type="radio" class="zhuanzhudu2" name="zhuanzhudu3"/>&nbsp;二星&nbsp;<input type="radio" class="zhuanzhudu3" name="zhuanzhudu3"/>&nbsp;三星&nbsp;                                </td>
    </tr>
    <tr>
    <td>是否收费：</td>
    <td><input type="radio" class="shifoushoufei1" name="shifoushoufei3"/>&nbsp;一星&nbsp;<input type="radio" class="shifoushoufei2" name="shifoushoufei3"/>&nbsp;二星&nbsp;<input type="radio"  class="shifoushoufei3" name="shifoushoufei3"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>回复积极度：</td>
    <td><input type="radio" class="huifujijidu1" name="huifujijidu3"/>&nbsp;一星&nbsp;<input type="radio" class="huifujijidu2" name="huifujijidu3"/>&nbsp;二星&nbsp;<input type="radio" class="huifujijidu3" name="huifujijidu3"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>综合指数：</td>
    <td><input type="radio" class="zonghezhishu1" name="zonghezhishu3"/>&nbsp;一星&nbsp;<input type="radio" class="zonghezhishu2" name="zonghezhishu3"/>&nbsp;二星&nbsp;<input type="radio" class="zonghezhishu3" name="zonghezhishu3"/>&nbsp;三星&nbsp;<input type="radio" class="zonghezhishu4" name="zonghezhishu3"/>&nbsp;四星&nbsp;<input type="radio" class="zonghezhishu5" name="zonghezhishu3"/>&nbsp;五星&nbsp;</td>
    </tr>
    </table>
                    </td>
                </tr>

                </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 person4">
            <table class="table table-condensed">
                <tr class="col-md-12 pMsg"><td>人物四</td></tr>
                <tr>
                    <td><img src="${ctx }/images/jiemuzhe.jpg" alt="headimg" class="headimg" />上传头像：<input type="file" class="onloadImg" onchange="changeimg(this)"/> </td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon"> 人物名称：</span><input type="text" class="form-control username"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon"> 个人介绍：</span><input type="text" class="form-control eintrContent"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon ">文章标题1：</span><input type="text" class="form-control title1"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接1：</span><input type="text" class="form-control titleurl1"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章标题2：</span><input type="text" class="form-control title2"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接2：</span><input type="text" class="form-control titleurl2"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章标题3：</span><input type="text" class="form-control title3"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接3：</span><input type="text" class="form-control titleurl3"/></div></td>
                </tr>
                <tr>
                    <td>
                        <table class="xingjipingding">
    <tr>
    <td>活跃平台：</td>
    <td><input type="checkbox" class="sina" name="changyongpingtai4"/>&nbsp;新浪&nbsp;<input type="checkbox" class="zhihu" name="changyongpingtai4"/>&nbsp;知乎&nbsp;<input type="checkbox" class="moerjinrong" name="changyongpingtai4"/>&nbsp;摩尔金融&nbsp;<input type="checkbox" class="weixin" name="changyongpingtai4"/>&nbsp;微信&nbsp;<input type="checkbox" class="xueqiu" name="changyongpingtai4"/>&nbsp;雪球&nbsp;</td>
    </tr>
    <tr>
    <td>文章频率：</td>
    <td><input type="radio" class="wenzhangpinlv1" name="wenzhangpinlv4"/>&nbsp;一星&nbsp;<input type="radio" class="wenzhangpinlv2" name="wenzhangpinlv4"/>&nbsp;二星&nbsp;<input type="radio" class="wenzhangpinlv3" name="wenzhangpinlv4"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>模拟收益率：</td>
    <td><input type="radio" class="monishouyilv1" name="monishouyilv4"/>&nbsp;一星&nbsp;<input type="radio" class="monishouyilv2" name="monishouyilv4"/>&nbsp;二星&nbsp;<input type="radio" class="monishouyilv3" name="monishouyilv4"/>&nbsp;三星&nbsp;
    </td>
    </tr>
    <tr>
    <td>自媒体影响：</td>
    <td><input type="radio" class="zimeiti1" name="zimeiti4"/>&nbsp;一星&nbsp;<input type="radio" class="zimeiti2" name="zimeiti4"/>&nbsp;二星&nbsp;<input type="radio"  class="zimeiti3" name="zimeiti4"/>&nbsp;三星&nbsp;
    </td>
    </tr>
    <tr>
    <td>专注度：</td>
    <td><input type="radio" class="zhuanzhudu1" name="zhuanzhudu4"/>&nbsp;一星&nbsp;<input type="radio" class="zhuanzhudu2" name="zhuanzhudu4"/>&nbsp;二星&nbsp;<input type="radio" class="zhuanzhudu3" name="zhuanzhudu4"/>&nbsp;三星&nbsp;                                </td>
    </tr>
    <tr>
    <td>是否收费：</td>
    <td><input type="radio" class="shifoushoufei1" name="shifoushoufei4"/>&nbsp;一星&nbsp;<input type="radio" class="shifoushoufei2" name="shifoushoufei4"/>&nbsp;二星&nbsp;<input type="radio"  class="shifoushoufei3" name="shifoushoufei4"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>回复积极度：</td>
    <td><input type="radio" class="huifujijidu1" name="huifujijidu4"/>&nbsp;一星&nbsp;<input type="radio" class="huifujijidu2" name="huifujijidu4"/>&nbsp;二星&nbsp;<input type="radio" class="huifujijidu3" name="huifujijidu4"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>综合指数：</td>
    <td><input type="radio" class="zonghezhishu1" name="zonghezhishu4"/>&nbsp;一星&nbsp;<input type="radio" class="zonghezhishu2" name="zonghezhishu4"/>&nbsp;二星&nbsp;<input type="radio" class="zonghezhishu3" name="zonghezhishu4"/>&nbsp;三星&nbsp;<input type="radio" class="zonghezhishu4" name="zonghezhishu4"/>&nbsp;四星&nbsp;<input type="radio" class="zonghezhishu5" name="zonghezhishu4"/>&nbsp;五星&nbsp;</td>
    </tr>
    </table>
                    </td>
                </tr>
                </table>
        </div>
        <div class="col-md-4 person5">
            <table class="table table-condensed">
                <tr class="col-md-12 pMsg"><td>人物五</td></tr>
                <tr>
                    <td><img src="${ctx }/images/jiemuzhe.jpg" alt="headimg" class="headimg" />上传头像：<input type="file" class="onloadImg" onchange="changeimg(this)"/> </td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon"> 人物名称：</span><input type="text" class="form-control username"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">个人介绍：</span><input type="text" class="form-control eintrContent"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon ">文章标题1：</span><input type="text" class="form-control title1"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接1：</span><input type="text" class="form-control titleurl1"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章标题2：</span><input type="text" class="form-control title2"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接2：</span><input type="text" class="form-control titleurl2"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章标题3：</span><input type="text" class="form-control title3"/></div></td>
                </tr>
                <tr>
                    <td><div class="input-group"><span class="input-group-addon">文章链接3：</span><input type="text" class="form-control titleurl3"/></div></td>
                </tr>
                <tr>
                    <td>
                        <table class="xingjipingding">
    <tr>
    <td>活跃平台：</td>
    <td><input type="checkbox" class="sina" name="changyongpingtai5"/>&nbsp;新浪&nbsp;<input type="checkbox" class="zhihu" name="changyongpingtai5"/>&nbsp;知乎&nbsp;<input type="checkbox" class="moerjinrong" name="changyongpingtai5"/>&nbsp;摩尔金融&nbsp;<input type="checkbox" class="weixin" name="changyongpingtai5"/>&nbsp;微信&nbsp;<input type="checkbox" class="xueqiu" name="changyongpingtai5"/>&nbsp;雪球&nbsp;</td>
    </tr>
    <tr>
    <td>文章频率：</td>
    <td><input type="radio" class="wenzhangpinlv1" name="wenzhangpinlv5"/>&nbsp;一星&nbsp;<input type="radio" class="wenzhangpinlv2" name="wenzhangpinlv5"/>&nbsp;二星&nbsp;<input type="radio" class="wenzhangpinlv3" name="wenzhangpinlv5"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>模拟收益率：</td>
    <td><input type="radio" class="monishouyilv1" name="monishouyilv5"/>&nbsp;一星&nbsp;<input type="radio" class="monishouyilv2" name="monishouyilv5"/>&nbsp;二星&nbsp;<input type="radio" class="monishouyilv3" name="monishouyilv5"/>&nbsp;三星&nbsp;
    </td>
    </tr>
    <tr>
    <td>自媒体影响：</td>
    <td><input type="radio" class="zimeiti1" name="zimeiti5"/>&nbsp;一星&nbsp;<input type="radio" class="zimeiti2" name="zimeiti5"/>&nbsp;二星&nbsp;<input type="radio"  class="zimeiti3" name="zimeiti5"/>&nbsp;三星&nbsp;
    </td>
    </tr>
    <tr>
    <td>专注度：</td>
    <td><input type="radio" class="zhuanzhudu1" name="zhuanzhudu5"/>&nbsp;一星&nbsp;<input type="radio" class="zhuanzhudu2" name="zhuanzhudu5"/>&nbsp;二星&nbsp;<input type="radio" class="zhuanzhudu3" name="zhuanzhudu5"/>&nbsp;三星&nbsp;                                </td>
    </tr>
    <tr>
    <td>是否收费：</td>
    <td><input type="radio" class="shifoushoufei1" name="shifoushoufei5"/>&nbsp;一星&nbsp;<input type="radio" class="shifoushoufei2" name="shifoushoufei5"/>&nbsp;二星&nbsp;<input type="radio"  class="shifoushoufei3" name="shifoushoufei5"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>回复积极度：</td>
    <td><input type="radio" class="huifujijidu1" name="huifujijidu5"/>&nbsp;一星&nbsp;<input type="radio" class="huifujijidu2" name="huifujijidu5"/>&nbsp;二星&nbsp;<input type="radio" class="huifujijidu3" name="huifujijidu5"/>&nbsp;三星&nbsp;</td>
    </tr>
    <tr>
    <td>综合指数：</td>
    <td><input type="radio" class="zonghezhishu1" name="zonghezhishu5"/>&nbsp;一星&nbsp;<input type="radio" class="zonghezhishu2" name="zonghezhishu5"/>&nbsp;二星&nbsp;<input type="radio" class="zonghezhishu3" name="zonghezhishu5"/>&nbsp;三星&nbsp;<input type="radio" class="zonghezhishu4" name="zonghezhishu5"/>&nbsp;四星&nbsp;<input type="radio" class="zonghezhishu5" name="zonghezhishu5"/>&nbsp;五星&nbsp;</td>
    </tr>
    </table>
                    </td>
                </tr>
            </table>
        </div>

    </div>
    <div class="row footer" style="text-align: center"><button class="btn btn-success save" onclick="btnClick()">保存</button><button onclick="print()" class="btn btn-default" >生成图片</button></div>
    <div id="long_picture">
        <div class="head">
            <img src="${ctx }/images/niurenbang_biaoti.png" alt="牛人榜标题" class="long_headimg" width="100%"/>
        </div>
        <div class="container-fluid">

            <div class="long_content">
                <div class="row content1">
                    <div class="tubiaos"><img src="${ctx }/images/niurenbang_zhihu.png" class="tubiao"/><img src="${ctx }/images/niurenbang_weibo.png" class="tubiao"/></div>
                    <div class="nav col-sm-12 col-md-12"><div class="long_head"></div></div>
                    <div class="name col-sm-12 col-md-12">揭幕者</div>
                    <div class="introduce col-sm-12 col-md-12">介绍</div>
                    <div class="intrContent col-sm-12 col-md-12" style="padding-top: 30px">揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格.全国首位点击量突破一亿的财经博客!获首届全景社区十大博主称号!第二届中国财经博客大赛最佳博客冠军</div>
                    <div class="col-sm-12 col-md-12 seeall" onclick="lookAll(this)">查看全文</div>

                    <div class="newnew col-sm-12 col-md-12">最新文章</div>
                    <table class="table table-hover">
                        <tr>
                            <td class="title title1"><a href="http://blog.eastmoney.com/NEIMUXIAOXI"><i>【独家】重要市场信息汇总及点评【东方财富网 博客】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/> </a></td>
                        </tr>
                        <tr>
                            <td class="title title2"><a href="http://blog.sina.com.cn/s/articlelist_1279916282_0_1.html"><i>私募必读：各大证券营业部【新浪博客】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/></a></td>
                        </tr>
                        <tr>
                            <td class="title title3"><a href="http://weibo.com/jiemuxiake?c=spr_qdhz_bd_baidusmt_weibo_s&nick=揭幕者"><i>【微博】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/></a></td>
                        </tr>
                    </table>
                    <canvas class="canvas canvas1 long_foot" width="938px" height="696px"></canvas>
                    <div class="col-sm-12 col-md-12 long_foot">
                        <table>
                            <tr>
                                <td>文章频率</td>
                                <td class="wenzhang"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>模拟收益率</td>
                                <td class="moni"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>自媒体影响</td>
                                <td class="zimeiti"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>专注度</td>
                                <td class="zhuanzhudu"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>是否收费</td>
                                <td class="shoufei"><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>回复积极度</td>
                                <td class="jijidu"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr class="last" >
                                <td  >综合指数</td>
                                <td class="zonghe"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="row content2">
                    <div class="tubiaos"><img src="${ctx }/images/niurenbang_zhihu.png" class="tubiao"/><img src="${ctx }/images/niurenbang_weibo.png" class="tubiao"/></div>
                    <div class="nav col-sm-12 col-md-12"><div class="long_head"></div></div>
                    <div class="name col-sm-12 col-md-12">揭幕者</div>
                    <div class="introduce col-sm-12 col-md-12">介绍</div>
                    <div class="intrContent col-sm-12 col-md-12" style="padding-top: 30px">揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格.全国首位点击量突破一亿的财经博客!获首届全景社区十大博主称号!第二届中国财经博客大赛最佳博客冠军</div>
                    <div class="col-sm-12 col-md-12 seeall" onclick="lookAll(this)">查看全文</div>

                    <div class="newnew col-sm-12 col-md-12">最新文章</div>
                    <table class="table table-hover">
                        <tr>
                            <td class="title title1"><a href="http://blog.eastmoney.com/NEIMUXIAOXI"><i>【独家】重要市场信息汇总及点评【东方财富网 博客】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/> </a></td>
                        </tr>
                        <tr>
                            <td class="title title2"><a href="http://blog.sina.com.cn/s/articlelist_1279916282_0_1.html"><i>私募必读：各大证券营业部【新浪博客】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/></a></td>
                        </tr>
                        <tr>
                            <td class="title title3"><a href="http://weibo.com/jiemuxiake?c=spr_qdhz_bd_baidusmt_weibo_s&nick=揭幕者"><i>【微博】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/></a></td>
                        </tr>
                    </table>
                    <canvas class="canvas canvas2 long_foot" width="938px" height="696px"></canvas>
                    <div class="col-sm-12 col-md-12 long_foot">
                        <table>
                            <tr>
                                <td>文章频率</td>
                                <td class="wenzhang"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>模拟收益率</td>
                                <td class="moni"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>自媒体影响</td>
                                <td class="zimeiti"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>专注度</td>
                                <td class="zhuanzhudu"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>是否收费</td>
                                <td class="shoufei"><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>回复积极度</td>
                                <td class="jijidu"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr class="last" >
                                <td  >综合指数</td>
                                <td class="zonghe"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="row content3">
                    <div class="tubiaos"><img src="${ctx }/images/niurenbang_zhihu.png" class="tubiao"/><img src="${ctx }/images/niurenbang_weibo.png" class="tubiao"/></div>
                    <div class="nav col-sm-12 col-md-12"><div class="long_head"></div></div>
                    <div class="name col-sm-12 col-md-12">揭幕者</div>
                    <div class="introduce col-sm-12 col-md-12">介绍</div>
                    <div class="intrContent col-sm-12 col-md-12" style="padding-top: 30px">揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格.全国首位点击量突破一亿的财经博客!获首届全景社区十大博主称号!第二届中国财经博客大赛最佳博客冠军</div>
                    <div class="col-sm-12 col-md-12 seeall" onclick="lookAll(this)">查看全文</div>

                    <div class="newnew col-sm-12 col-md-12">最新文章</div>
                    <table class="table table-hover">
                        <tr>
                            <td class="title title1"><a href="http://blog.eastmoney.com/NEIMUXIAOXI"><i>【独家】重要市场信息汇总及点评【东方财富网 博客】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/> </a></td>
                        </tr>
                        <tr>
                            <td class="title title2"><a href="http://blog.sina.com.cn/s/articlelist_1279916282_0_1.html"><i>私募必读：各大证券营业部【新浪博客】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/></a></td>
                        </tr>
                        <tr>
                            <td class="title title3"><a href="http://weibo.com/jiemuxiake?c=spr_qdhz_bd_baidusmt_weibo_s&nick=揭幕者"><i>【微博】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/></a></td>
                        </tr>
                    </table>
                    <canvas class="canvas canvas3 long_foot" width="938px" height="696px"></canvas>
                    <div class="col-sm-12 col-md-12 long_foot">
                        <table>
                            <tr>
                                <td>文章频率</td>
                                <td class="wenzhang"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>模拟收益率</td>
                                <td class="moni"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>自媒体影响</td>
                                <td class="zimeiti"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>专注度</td>
                                <td class="zhuanzhudu"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>是否收费</td>
                                <td class="shoufei"><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>回复积极度</td>
                                <td class="jijidu"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr class="last" >
                                <td  >综合指数</td>
                                <td class="zonghe"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="row content4">
                    <div class="tubiaos"><img src="${ctx }/images/niurenbang_zhihu.png" class="tubiao"/><img src="${ctx }/images/niurenbang_weibo.png" class="tubiao"/></div>
                    <div class="nav col-sm-12 col-md-12"><div class="long_head"></div></div>
                    <div class="name col-sm-12 col-md-12">揭幕者</div>
                    <div class="introduce col-sm-12 col-md-12">介绍</div>
                    <div class="intrContent col-sm-12 col-md-12" style="padding-top: 30px">揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格.全国首位点击量突破一亿的财经博客!获首届全景社区十大博主称号!第二届中国财经博客大赛最佳博客冠军</div>
                    <div class="col-sm-12 col-md-12 seeall" onclick="lookAll(this)">查看全文</div>

                    <div class="newnew col-sm-12 col-md-12">最新文章</div>
                    <table class="table table-hover">
                        <tr>
                            <td class="title title1"><a href="http://blog.eastmoney.com/NEIMUXIAOXI"><i>【独家】重要市场信息汇总及点评【东方财富网 博客】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/> </a></td>
                        </tr>
                        <tr>
                            <td class="title title2"><a href="http://blog.sina.com.cn/s/articlelist_1279916282_0_1.html"><i>私募必读：各大证券营业部【新浪博客】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/></a></td>
                        </tr>
                        <tr>
                            <td class="title title3"><a href="http://weibo.com/jiemuxiake?c=spr_qdhz_bd_baidusmt_weibo_s&nick=揭幕者"><i>【微博】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/></a></td>
                        </tr>
                    </table>
                    <canvas class="canvas canvas4 long_foot" width="938px" height="696px"></canvas>
                    <div class="col-sm-12 col-md-12 long_foot">
                        <table>
                            <tr>
                                <td>文章频率</td>
                                <td class="wenzhang"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>模拟收益率</td>
                                <td class="moni"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>自媒体影响</td>
                                <td class="zimeiti"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>专注度</td>
                                <td class="zhuanzhudu"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>是否收费</td>
                                <td class="shoufei"><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>回复积极度</td>
                                <td class="jijidu"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr class="last" >
                                <td  >综合指数</td>
                                <td class="zonghe"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="row content5">
                    <div class="tubiaos"><img src="${ctx }/images/niurenbang_zhihu.png" class="tubiao"/><img src="${ctx }/images/niurenbang_weibo.png" class="tubiao"/></div>
                    <div class="nav col-sm-12 col-md-12"><div class="long_head"></div></div>
                    <div class="name col-sm-12 col-md-12">揭幕者</div>
                    <div class="introduce col-sm-12 col-md-12">介绍</div>
                    <div class="intrContent col-sm-12 col-md-12" style="padding-top: 30px">揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格揭幕者具有证券投资分析资格,基金从业人员资格和期货从业人员资格.全国首位点击量突破一亿的财经博客!获首届全景社区十大博主称号!第二届中国财经博客大赛最佳博客冠军</div>
                    <div class="col-sm-12 col-md-12 seeall" onclick="lookAll(this)">查看全文</div>

                    <div class="newnew col-sm-12 col-md-12">最新文章</div>
                    <table class="table table-hover">
                        <tr>
                            <td class="title title1"><a href="http://blog.eastmoney.com/NEIMUXIAOXI"><i>【独家】重要市场信息汇总及点评【东方财富网 博客】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/> </a></td>
                        </tr>
                        <tr>
                            <td class="title title2"><a href="http://blog.sina.com.cn/s/articlelist_1279916282_0_1.html"><i>私募必读：各大证券营业部【新浪博客】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/></a></td>
                        </tr>
                        <tr>
                            <td class="title title3"><a href="http://weibo.com/jiemuxiake?c=spr_qdhz_bd_baidusmt_weibo_s&nick=揭幕者"><i>【微博】</i><img src="${ctx }/images/niurenbang_fangxiang.png"  class="pull-right"/></a></td>
                        </tr>
                    </table>
                    <canvas class="canvas canvas5 long_foot" width="938px" height="696px"></canvas>
                    <div class="col-sm-12 col-md-12 long_foot">
                        <table>
                            <tr>
                                <td>文章频率</td>
                                <td class="wenzhang"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>模拟收益率</td>
                                <td class="moni"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>自媒体影响</td>
                                <td class="zimeiti"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>专注度</td>
                                <td class="zhuanzhudu"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>是否收费</td>
                                <td class="shoufei"><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr>
                                <td>回复积极度</td>
                                <td class="jijidu"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                            <tr class="last" >
                                <td  >综合指数</td>
                                <td class="zonghe"><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/><img src="${ctx }/images/niurenbang_xingxing.png"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="row ">
                    <div class="nav col-sm-12 col-md-12"><img src="${ctx }/images/niurenbang_erweima.png" class="long_bottom"/></div>
                    <div class="col-sm-12 col-md-12  namebottom">每周更新一期牛人榜请关注我们的微信公众号</div>
                    <div class="col-sm-12 col-md-12  namebottom2 ">由众米应用开发团队倾情制作</div>
                </div>
            </div>
        </div>
    </div>
    <div id="picture"></div>
</div>

<script type="text/javascript" src="${ctx }/js/editniurenbang.js"></script>
<script type="text/javascript">
	function btnClick() {
		addUsers();
		var ht = $("#long_picture").html();
		$.ajax({
			url : "${ctx }/users/saveNiuRenbang",
			type : 'post',
			data : {data:ht},
			dataType : 'json',
			success : function(data) {
				//alert(data.msg);
			}
		});
	}
</script>
</body>
</html>