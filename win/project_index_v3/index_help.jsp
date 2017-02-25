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
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/bootstrap.js"></script>
    <script src="${ctx}/js/newmain.js"></script>
</head>

<body>
<%@include file="header.jsp" %>
    <section>
        <div class="container nm-help-content" >
    <div class="help clear ">
    <div class="tip">帮助</div>
    <div class="row text-center lead">
    <div class="col-md-4 col-xs-4"><a href="${ctx}/index_help_register.jsp"><span class="register"></span></a>注册
    </div>
    <div class="col-md-4 col-xs-4"><a href="${ctx}/index_help_goldin.jsp"><span class="gold-in"></span></a>资金转入
    </div>
    <div class="col-md-4 col-xs-4"><a href="${ctx}/index_help_trade.jsp"><span class="trade"></span></a>交易</div>
    <div class="col-md-4 col-xs-4"><a href="${ctx}/index_help_goldout.jsp"><span class="gold-out"></span></a>资金转出
    </div>
    <div class="col-md-4 col-xs-4"><a href="${ctx}/index_help_cost.jsp"><span class="cost"></span></a>费用</div>
    <div class="col-md-4 col-xs-4"><a href="${ctx}/introduce_jucaidao.jsp"><span  class="about-trubuzz"></span></a>关于Trubuzz
    </div>
   
    </div>
        </div>
        <div class="request-answers">
            <div class="tip">问答</div>
            <div class="qa-container">
                <h3>众米美股交易使用常见问题</h3>
                <h5><span></span>1.众米美股交易优势</h5>

                <div class="answer">
                    （1）&nbsp;&nbsp;&nbsp;&nbsp;Trubuzz全牌照美股交易合作支持，可以提供全球17个国家60多个交易所的6万多个投资品种 <br/> <br/>
                    （2）&nbsp;&nbsp;&nbsp;&nbsp;交易注册最快10分钟即可完成审核，入金后马上就可以交易下单<br/> <br/>
                    （3）&nbsp;&nbsp;&nbsp;&nbsp;支持人民币转入和传出，无需兑换成美元，资金在提交申请后最快2个小时到账，无需多日等待<br/> <br/>
                    （4）&nbsp;&nbsp;&nbsp;&nbsp;免费提供价值3800元的美股实时行情<br/> <br/>
                    （5）&nbsp;&nbsp;&nbsp;&nbsp;无最低入金门槛，100元也可以交易下单<br/> <br/>
                    （6）&nbsp;&nbsp;&nbsp;&nbsp;应用内即时消息，添加好友，随时随地分享交易信息
                </div>
                <br/>
                <h5><span></span>2.关于美股</h5>

                <div class="answer">
                    <table>
                        <tr>
                            <td>Q：</td>
                            <td>美股的交易时间</td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>
                                美国东部时间（EDT）：周一至周五 9:30～16:00
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>美夏令时（4月-11月）：北京时间 21:30～4:00</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>补充说明：</td>
                        </tr>

                        <tr>
                            <td></td>
                            <td>美国从每年4月到11月初采用夏令时，这段时间其交易时间为北京时间21：30－次日凌晨4：00</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>而在11月初到4月初，采用冬令时，则交易时间为北京时间22：30－次日凌晨5：00<br/><br/></td>
                        </tr>

                        <tr>
                            <td>Q：</td>
                            <td>美股的最小交易单位</td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>与A股不同，美股最小交易单位是1股，并没有“手”的概念，所以在交易过程中交易的数量计数单位都为“股”<br/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>Q：</td>
                            <td>美股有涨跌幅限制吗？</td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>与A股不同，美股没有单日涨跌幅限制，所以流动性会好于A股，但是流动性多集中于比较活跃的少数个股，投资者需要了解交易制度的差异，控制好交易风险<br/><br/></td>
                        </tr>
                        <tr>
                            <td>Q：</td>
                            <td>美股有哪些交易特点？</td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>9:30-9:45，这十五分钟被称为是“业余者时间”，大型的机构通常会在9:45之后再进场。这段时间内经纪人、做市商会执行客户的成交命令，是一天当中最具挥发性的时刻之一。
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>10：00被称作“关键的反转时刻”，很多经济数据会在10点公布，市场经常在这个时刻出现反转。</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>11:30-13:30这两个小时被称为“午饭时刻”，这个时间段里那些比较厉害的做市商都会出去吃午饭，并命令助手除了提供流动性之外不做任何事情，因此这一时段的成交量会比较小。这个时间段不太会出现顺畅的趋势，横盘的情况比较多见。</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>13:30-16:00是“专业时间”，很多机构投资者也会选择在“专业时间”段内进场，这个时间段里，最厉害的做市商、券商会继续执行客户的成交命令，同时还会交易自己公司的账户。另外要特别注意的是，2:30是另外一个关键的交易时刻，很多强劲的趋势往往会在这个时间点开始。</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>16:00，美股股市收盘</td>
                        </tr>
                    </table>
                </div>
                <br/>
                <h5><span></span>3.交易注册</h5>

                <div class="answer">
                    <table>
                        <tr>
                            <td>Q：</td>
                            <td>如何注册？</td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>
                                通过下载众米app登录后，点击任意美股的买卖按钮或者进入美股账户，即可进入美股交易注册和登录页面，也可以通过众米官网主页注册，或者通过关注微信“众米订阅号”进入美股交易注册页面进行注册。<br/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>Q：</td>
                            <td>需要哪些资料？</td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>本人的手机号、身份证、银行卡<br/><br/></td>
                        </tr>

                        <tr>
                            <td>Q：</td>
                            <td>注册后需要多久可以开始交易？</td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>提交资料后，最快10分钟即可完成注册审核，无需等待多个工作日<br/><br/></td>
                        </tr>

                        <tr>
                            <td>Q：</td>
                            <td>如果我的注册手机丢失或者号码丢失，怎么解决？</td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>可以凭借原有的账号和密码登录，进行密码修改，仍旧可以正常交易，如需要更换注册时的手机号码，请致电Trubuzz（聚财道）美股交易服务热线：400-0566-869 （8:00
                                am～22:00 pm）
                            </td>
                        </tr>
                    </table>
                </div>
                <br/>
                <h5><span></span>4.入金出金</h5>

                <div class="answer">
                    <table>
                        <tr>
                            <td>Q：</td>
                            <td>如何转入资金？</td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>
                                现阶段只支持线下汇款的方式，使用人民币进行汇款，汇款后通过通知的方式进行核对，核对无误后即刻将资金转入交易账户，目前支持的银行包括：工商银行、农业银行、中国银行、建设银行、交通银行、邮储银行、光大银行、招商银行、上海银行、北京银行、中信银行、兴业银行、平安银行、广发银行、浦发银行、华夏银行、民生银行、兰州银行<br/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>Q：</td>
                            <td>入金和出金的金额标准？</td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>
                                每人入金限额为等值的50000美元，最低的入金金额为100元人民币，入金与出金使用相同的固定汇率标准，汇率标准为1美元=6.7人民币，所以不用担心汇率波动带来的资金损失风险。<br/><br/>
                            </td>
                        </tr>

                        <tr>
                            <td>Q：</td>
                            <td>入金和出金需要费用吗？</td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>不需要任何的手续费，只是在汇款时银行会收取相应的汇款费用<br/><br/></td>
                        </tr>

                        <tr>
                            <td>Q：</td>
                            <td>入金和出金多久能到账？</td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>
                                入金时，当完成线下汇款，提交通知后，最快2个小时（工作日）资金到达交易账户，即可以下单交易。出金时，提交通知后，最快2个小时（工作日）资金到达银行账户，既可以在银行账户中查询。
                            </td>
                        </tr>
                    </table>
                </div>
                <br/>
                <h5><span></span>5.账户登录</h5>

                <div class="answer">
                    <table>
                        <tr>
                            <td>Q：</td>
                            <td>忘记了众米登录账户，不能进入聚财道交易注册账户怎么办？</td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>使用交易登录的手机号码，解除众米账户与交易账户的绑定。再注册新的众米登录账户重新绑定。 <a href="${basepath}/index_help_relievebind.jsp"class="mark">忘记众米登录，立即解除绑定</a><br/><br/></td>
                        </tr>
                        <tr>
                            <td>Q：</td>
                            <td>忘记交易注册账户怎么办？ </td>
                        </tr>
                        <tr>
                            <td>A：</td>
                            <td>请致电400-0566-869 （8:00 am～22:00 pm），使用注册时的身份信息进行交易账户找回。</td>
                        </tr>
                    </table>
                </div>
                <br/>
            </div>
        </div>
    </div>
</section>
<footer>
    <div class="container-fluid">
        <div class="row nm-footer">杭州米号科技有限公司版权所有 浙ICP备14016681号 <a href="${ctx }/index_pravicy.jsp">隐私条款</a><br>
            <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010602003615" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;width: auto"><img src="images/beiantubiao.png" style="float:left;"/><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#fff;">浙公网安备 33010602003615号</p></a>
        </div>
    </div>
</footer>
<script>
    $(function(){
        $("#help").parent().addClass("active");
    })
</script>
</body>
</html>