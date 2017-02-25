<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="imgBase" value="http://mimikj.com:8081/mimikj/images/" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <title>模拟炒股送现金大奖</title>
    <link href="${ctx }/images/zm_log.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="${ctx }/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx }/css/newmain.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx }/js/bootstrap.js"></script>
    <script src="${ctx }/js/newmain.js"></script>
    <script>
        function sendMessage(){
            var message = $("#message_edit").val();
            if(message==''){
                alert('发送内容不能为空！');
                return false;
            }
            $.ajax({
				url : "${ctx }/feedback/save" ,
				type : 'get',
				data :{issue_type:"5",feedback_des_content:message},
				dataType : 'json',
				success : function(data) {
					if(data.success){
						 $("#message_edit").val("");
			            var floorNum = $(".message_board li:first .message_floor span").text();
			            if(isNaN(floorNum)){
			                floorNum = 0;
			            }
			            floorNum++;
			            var messageHtml = '<li><div class="message_box"><span class="message_floor"><span>'+floorNum+'</span>楼</span><span class="message_content">'+message+'</span></div></li>'
			            $('.message_board ul').prepend(messageHtml);
					}
				}
			});
        }
    </script>
</head>
<body>
<%@include file="../../header.jsp" %>
<section class="simulated_stocks">

    <div class="page page_1 page_1_2">
        <div class="ani show1" data-slide-in="at 0 from slideInDown use swing during 500">
            <a href="javascript:void(0);"><div class="banner_open "></div></a>
        </div>
        <div class="ani" data-slide-in="at 0 from slideInUp use swing during 500">
            <p class="banner2_text">模拟炒股送现金红包</p>
        </div>
    </div>
    <div class="page page_simulated_stocks_mobile">
        <div class="nm_content nm_content_mobile">
            <div class="blackline"></div>
            <p class="activity_time">活动时间2016.7.18～8.18</p>
            <div class="text-center"><span class="vertical_line"></span><a href="${ctx }/jsp/dv_stock_deal/trade_rule_win.jsp" class="show_rule">查看活动规则》</a></div>
            <div><img src="${ctx }/images/simulatedStockImg.png" class="center-block simulatedStockImg"/></div>
            <div class="text-center share_erweima_box">
                <span class="share_erweima">分享好友一起赢取万元奖金包<img src="${ctx }/images/arrow_right.png" class="arrow_right" oncontextmenu="return false;" ondragstart="return false;"/></span>
                <img src="${ctx }/images/share_simulated_stocks.png" class="share_erweima_img"/>
            </div>
            <div class="ranking_box">
                <div class="ranking_title">周排名表</div>
                <table class="ranking_table">
                <c:if test="${fn:length(ranking_list) ==0 }">
                    <p style="padding: 15px 0;font-size: 20px;" align="center">暂无排名</p>
                 </c:if>
                <c:forEach var="ranking" items="${ranking_list }" >
                	<tr>
                        <td class="ranking_table_rank">${ranking.ranking }</td>
                        <td class="ranking_table_img"><img src="${imgBase }${ranking.avatar }"/></td>
                        <td class="ranking_table_name">${ranking.nickname }</td>
                        <td class="ranking_table_score"><span><c:choose>
                        	<c:when test="${ranking.score > 0 }">${ranking.score}</c:when>
                        	<c:otherwise>0</c:otherwise>
                        </c:choose></span>分</td>
                        <td class="ranking_table_reward"><span>${ranking.reward }</span>元</td>
                    </tr>
                </c:forEach>
                </table>
            </div>
            <div class="notice_board_border1">
                <div class="notice_board_border2">
                    <div class="notice_board_border3">
                        <div class="notice_board">
                            <ol>
                                <li>本期活动时间：6月1日后任何交易日即可参与，当周交易日结束（周六四点后做统计）公布本周排名。</li>
                                <li>活动规则或有增补，请第一时间参考手机应用内（交易规则提示）或添加模拟大赛微信交流群公告。加群请联系工作人员：莱伊 Rye （微信号：shayudeqishi）。</li>
                                <li>模拟大赛邀请好友建议发往朋友圈、微信好友、微信群、雪球、QQ交流群，让更多好友来一起分享好友。下期提供收费查看收益功能，越多好友查看您收益，获得更多奖励。</li>
                                <li>为了维护众米聊天群的氛围，不可将广告发布在内，包括但不限于在以文字、图片、二维码、站外链接等形式，一经发现，会被“禁言”哦</li>
                                <li> 本活动主页评论区也不可发放广告，管理员会对广告刷屏等不合规的内容进行删帖处理。</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="notice_board_bottom"></div>
            <div class="message_board">
                <div class="message_board_title">留言板</div>
                <div class="message_edit_box">
                    <textarea class="message_edit" id="message_edit" rows="7"></textarea>
                    <button class="message_send" onclick="sendMessage()">发表</button>
                </div>
                <ul>
                 <c:if test="${fn:length(feddlist) ==0 }">
                    <p style="padding: 15px 0; font-size: 20px;" align="center">暂无人留言</p>
                 </c:if>
                <c:forEach var="feed" items="${feddlist }">
	                <li>
	                    <div class="message_box">
	                        <span class="message_floor"><span>${feed.id }</span>楼</span>
	                        <span class="message_content">${feed.feedback_des_content }</span>
	                    </div>
	                </li>
                </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <!-- 回到顶部-->
    <div class="fixed-btn">
        <a class="go-top" href="javascript:void(0)" title="返回顶部" style="display: inline-block;"> <span
                class="go_top_img"></span></a>
    </div>
    <div class="stock_guide hide"></div>
</section>
</body>
</html>