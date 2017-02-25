<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>成交明细</title>
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
        .blue td.username,.blue .all_value{
            background-color: #6b9ae6;
            color:#fff;
        }
        table{
            width:100%;
        }
        .detail{
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
        .basic_information tr:nth-child(1) td{
            border-bottom:1px solid rgba(0,0,0,.1);
            width:50%;
        }
        .basic_information td>span{
            float:right;
        }

        .username{
            line-height: 1.1;
            font-size: 12px;
            padding-top:6px;
            padding-bottom:5px;
        }
        td.username{

            position:absolute;
            margin-left:-15px;
            padding-left:15px;
            width:calc(50% - 7.5px);
        }
        .update_time{
            padding-right:7px;
        }
        .stockname{
            display: inline-block;
            float: none !important;
            width:43%;
            word-break:keep-all;
            white-space:nowrap;
            overflow:hidden;
            text-overflow:ellipsis;
        }
        @media screen and (max-width: 350px){
            .stockname{
                width:36%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
    <c:if test="${fn:length(orders) ==0 }">
               <p style="padding: 15px 0;" align="center">暂无数据</p>
            </c:if>
    <c:forEach var="order" items="${orders }">
	     <div class="col-md-4 col-sm-3"></div>
	        <div class="col-md-4 col-sm-6 col-xs-12 detail">
	            <table class="basic_information blue">
	                <tr>
	                    <td class="username"><span  class="stockname">${order.stock_name }<div>${order.symbol }</div> </span>
	                    <span class="update_time">
							<c:choose>
								<c:when test="${order.action=='BUY' }">买入</c:when>
								<c:otherwise>卖出</c:otherwise>
							</c:choose>
						<div>${order.date }</div></span></td>
	                    <td>佣金 <span>$<span>${order.commission }</span></span></td>
	                </tr>
	                <tr>
	                    <td>成交价 <span class="red">$<span>${order.avgFillPrice }</span></span></td>
	                    <td>成交数量 <span><span>${order.filledQty }</span>股</span></td>
	                </tr>
	
	            </table>
	        </div>
        <div class="col-md-4 col-sm-3"></div>
    </c:forEach>
    </div>
</div>
<script src="${ctx }/js/jquery-2.1.4.min.js"></script>
<script src="${ctx }/js/bg_manage.js"></script>
</body>
</html>
