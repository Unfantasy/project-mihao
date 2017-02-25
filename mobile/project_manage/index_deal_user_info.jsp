<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>交易管理</title>
    <link rel="stylesheet" href="${ctx }/css/bootstrap.css"/>
    <style>
        body,html{
            margin:0;
            padding:0;
        }
        body{
            background-color: #f5f7fa;
        }
        .red{
            color:#f45531;
        }
        .green{
            color:#21ce99;
        }
        .blue td.username,.blue .all_value{
            background-color: #6b9ae6;
            color:#fff;
        }
        .red td.username,.red .all_value{
            background-color: #eb6265;
            color:#fff;
        }
        .yellow td.username,.yellow .all_value{
            background-color: #fac319;
            color:#fff;
        }
        table{
            width:100%;
        }
        .user{
            margin-bottom:8px;
            color:#000;
            background-color:#fff;
            border-bottom:1px solid rgba(0,0,0,.1);
            border-right:1px solid rgba(0,0,0,.1);
            font-size:16px;
            line-height:2.5;
            padding:0;
        }
        .basic_information{
            border-collapse: separate;
            border-spacing: 15px 0;
        }
        .basic_information td{
            border-bottom:1px solid rgba(0,0,0,.1);
            width:50%;
        }
        .basic_information td>span{
            float:right;
        }
        td.username{
			height:40px;
            position:absolute;
            margin-left:-15px;
            padding-left:15px;
            width:calc(50% - 7.5px);
        }
        .basic_information td>span.name{
            width: 3em;
            max-width: 35%;
            float: none;
            display: inline-block;
            word-break:keep-all;
            white-space:nowrap;
            overflow:hidden;
        }
        .update_time{
            font-size:14px;
            padding-top:2px;
            padding-right:12px;
            max-width: 65%;
   			text-align: right;
   			word-break:keep-all;
            white-space:nowrap;
            overflow:hidden;
        }
        .position{
            text-align: center;
            padding-left:15px;
            padding-right:15px;
        }
        .position_title{
            line-height: 1.2;
            margin-bottom:12px;
            margin-top: 16px;
            border-bottom:2px solid #000;
            display:inline-block;
            width:auto;
        }
        .position_title>div{
            margin-bottom:1px;
            border-bottom:1px solid #000;
        }
        .all_value_hidden{
            visibility:hidden;
        }

        .all_value{
            display: inline-block;
            width:35%;
            line-height: 1.7;
            text-align:center;
            margin:0 10px;
        }
        /*股票table*/
        .stocks thead{
            font-size: 14px;
        }
        .stocks thead td{
            border-top:1px solid rgba(0,0,0,.1);
        }
        .stocks td{
            border-bottom:1px solid rgba(0,0,0,.1);
        }
        .stocks td:nth-child(1){
            text-align: left;
            max-width:5em;
            word-break:keep-all;
            white-space:nowrap;
            overflow:hidden;
            text-overflow:ellipsis;
        }
        .stocks td:nth-child(2),.stocks td:nth-child(3){
            text-align: center;
        }
        .stocks td:nth-child(4){
            text-align: right;
        }
        .stock_name{
            padding-top:7px;
            padding-bottom:7px;
            line-height: 1.2;
        }
        .stock_name>div{
            color:#bebebe;
            font-size:14px;
        }
        .dangerous_tip,.transaction_detail{
            color:#000;
            text-align: left;
            display: block;
            border-bottom:1px solid rgba(0,0,0,.1);
        }
        .transaction_detail{
            border-bottom:0;
        }
        .dangerous_tip span,.transaction_detail span{
            color:#ccc;
            float:right;
            line-height: 2.5;
        }
        .dangerous_tip:hover,.transaction_detail:hover{
            color:#000;
            text-decoration: none;
        }
        .less_size{
            font-size:13px;
            line-height: 40px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
    <c:forEach var="sub_account" items="${sub_accounts }">
    <div class="col-md-4 col-sm-6 col-xs-12 user">
            <table class="basic_information">
                <tr>
                    <td class="username"><span class="name">${sub_account.account_name }</span> <span class="update_time less_size"><span>${sub_account.account_time } </span>更新</span></td>
                    <td>账号 <span class="less_size">${sub_account.account_id }</span></td>
                </tr>
                <tr>
                    <td>总资产 <span>${sub_account.balance }</span></td>
                    <td>初始资产 <span>${sub_account.initial_price }</span></td>
                </tr>
                <tr>
                    <td>盈亏 <span class="number">${sub_account.profit_loss }</span></td>
                    <td>盈亏百分比 <span class="number">${sub_account.profit_loss_ratio }%</span></td>
                </tr>
            </table>
            <div class="position">
                <div class="all_value all_value_hidden">市值：<span> </span></div>
                <div class="position_title"><div>持仓</div></div>
                <div class="all_value"></div>
                <table class="stocks">
                    <thead>
                    <tr>
                        <td>名称代码</td>
                        <td>数量</td>
                        <td>最新价/成本</td>
                        <td>浮动收益</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${fn:length(sub_account.positions) ==0 }">
	                    <p style="padding: 15px 0;" align="center">暂无数据</p>
	                 </c:if>
                    <c:forEach var="position" items="${sub_account.positions }">
	                    <tr >
	                        <td class="stock_name" style="border-bottom: 0px;">
	                            ${position.stock_name }
	                            <div>${position.symbol }</div>
	                        </td>
	                        <td class="stock_num" style="border-bottom: 0px;">${position.remainingQty }</td>
	                        <td class="stock_price" style="border-bottom: 0px;">${position.price }/${position.avgCost }</td>
	                        <td class="stock_earn number" style="border-bottom: 0px;">${position.floating_income }</td>
	                    </tr>
	                    <tr >
	                    	<td style="border-top: 0px;">市值</td>
	                    	<td colspan="3" style="border-top: 0px; text-align: left;">${position.market_value }</td>
	                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <a class="dangerous_tip" href="${ctx }/us_subaccount_summary/detail_remind?type=remind&sub_account=${sub_account.account_id}">预警提醒 <span class="glyphicon glyphicon-menu-right"></span></a>
                <a class="transaction_detail" href="${ctx }/us_subaccount_summary/detail_remind?type=detail&sub_account=${sub_account.account_id}">成交明细 <span class="glyphicon glyphicon-menu-right"></span></a>
            </div>
        </div>
    </c:forEach>
    </div>
</div>
<script src="${ctx }/js/jquery-2.1.4.min.js"></script>
<script>
    $(function(){
        //数字正红负蓝
        for(var i=0;i<$(".number").length;i++){
            if($(".number").eq(i).text().indexOf("-")!=-1){$(".number").eq(i).addClass("green");}else{$(".number").eq(i).addClass("red");}
        }
        $(".stock_earn").each(function(){
            if($(this).hasClass("green"))$(this).prev().addClass("green");else if($(this).hasClass("red"))$(this).prev().addClass("red");
        });
        for(var i= 0;i<$(".user").length;i++){
            if(i%3==0){
                $(".user").eq(i).addClass("blue");
            }else if(i%3==1){
                $(".user").eq(i).addClass("red");
            }else{
                $(".user").eq(i).addClass("yellow");
            }
        }
    });
</script>

</body>
</html>
