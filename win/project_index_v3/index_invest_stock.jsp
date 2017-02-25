<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="basepath" value="https://www.mihaokj.com" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>众米首届美股大赛</title>
    <meta name="viewport" content="width=device-width">
    <link href="images/zm_log.ico" rel="shortcut icon" />
    <meta name="description" content="">
    <meta name="keywords" content="众米,米号">
    <link href="${ctx}/images/zm_log.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx}/css/newmain.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/bootstrap.js"></script>
    <script src="${ctx}/js/newmain.js"></script>
</head>
<body>
    <%@include file="header.jsp" %>

<section class="invest-stock" id="invest-stock">
    <!--banner-->
    <div class="banner" id="sign-up">
        <img src="${ctx}/images/banner2.png" alt="炒股大赛" class="nm-banner"/>
        <div class=" nm-banner-title2 ">
            <a href="${ctx}/index_sign_up.jsp"><button class="nm-to-get-msg">立即报名</button></a>
        </div>

    </div>   <!-- end banner-->
    <!--right nav-->
    <div class="nm-right-nav">
        <ul class="nm-vertical-middle">
            <li class="active"><a href="#sign-up">报名</a><div class="dot"></div></li>
            <li><a href="#important-tip">重要提示</a><div class="dot"></div></li>
            <li><a href="#race-time">参赛时间</a><div class="dot"></div></li>
            <li ><a href="#race-intro">比赛介绍</a><div class="dot"></div></li>
            <li><a href="#race-cond">参赛条件</a><div class="dot"></div></li>
            <li><a href="#price-set">奖品设置</a><div class="dot"></div></li>
            <li><a href="#price-style">评选方式</a><div class="dot"></div></li>
            <li><a href="#trade-rule">交易规则</a><div class="dot"></div></li>
        </ul>
    </div>
    <script>
        $(".nm-right-nav li").click(function(){
            $(this).addClass("active").siblings().removeClass("active");

        });

    </script>
    <!--end right nav-->
    <div class="container-lg nm-help-content">
        <div class="nm-tip" id="important-tip">
            <div class="nm-tip-title">重要提示</div>
            <div class="nm-tip-content">
                <ol type="1">
                    <li>参赛的同学一定一定一定要加入参赛选手交流QQ群:499906059，奥~有赛事相关问题都可以在群里进行询问，会有专门人员对此进行解答哦；也欢迎大家对比赛操作进行讨论交流~</li>
                    <li>参赛的同学们务必务必务必要关注爱众米美股微信号（zhongmi941），最新比赛资讯都会在这里哦~</li>
                </ol>
            </div>
        </div>
        <div class="nm-tip" id="race-time">
            <div class="nm-tip-title">参赛时间</div>
            <div class="nm-tip-content">
                <p>报名起始：2016.03.14（报名采用众米网页端和QQ群均可报名）</p>
                <p>比赛时间：2016.03.21—2016.04.11</p>
                <p>奖项发布：2016.04.15</p>
            </div>
        </div>
        <div class="nm-tip" id="race-intro">
            <div class="nm-tip-title">比赛介绍</div>
            <div class="nm-tip-content">
                <ol type="1">
                    <li>每位参赛选手只能拥有一个账号，且账号必须通过手机注册验证。选手需根据真实情况填写报名信息，手机号码将作为发奖唯一联系方式。大赛期间如发现作弊行为，相关账号将被取消比赛资格。</li>
                    <li>比赛将在众米美股手机app端开展，实盘操作，每人只有一次入金机会。（PS：期间重复入金或者出金者，经核对后，按入金总额算为初始金额，核算最终收益率，注：最终解释权在米号科技）。</li>
                </ol>
            </div>
        </div>
        <div class="nm-tip" id="race-cond">
            <div class="nm-tip-title">参赛条件</div>
            <div class="nm-tip-content">
                <ol type="1">
                    <li>活动参与方为在校学生（含研究生、博士生及成人教育、职业教育）。</li>
                    <li>不符合条件者，不鼓励报名，不计比赛成绩；不颁奖。</li>
                </ol>
            </div>
        </div>
        <div class="nm-tip" id="price-set">
            <div class="nm-tip-title">奖品设置</div>
            <div class="nm-tip-content">
                <ol type="1">
                    <li>美股大咖 1位（2000元）</li>
                    <li>投资能手 2位（500元一位）</li>
                    <li>火眼晶晶 7位（实物礼品 小米电源、手环、VR眼镜......）</li>
                </ol>
                <p class="lt">并从获奖同学中选择1名同学暑期来米号科技实习机会，担任美股研究员职位。</p>
            </div>
        </div>
        <div class="nm-tip" id="price-style">
            <div class="nm-tip-title">评选方式</div>
            <div class="nm-tip-content">
                <ol type="1">
                    <li>账户收益率为主要评选指标；收益率相同情况，按达成收益率用时最短者获胜。</li>
                    <li>比赛过程中，需至少完成一次买卖闭环交易。</li>
                </ol>
            </div>
        </div>
        <div class="nm-tip" id="trade-rule">
            <div class="nm-tip-title">交易规则</div>
            <div class="nm-tip-content">
                <ol type="1">
                    <li>交易品种限于美国证券市场的股票。不限制股票、基金和ETF的委托和交易。</li>
                    <li>美股账户交易佣金为0.01美元/股，单笔最低2.88美元（大赛活动期内，参赛同学享受前3笔交易免佣金费用）。</li>
                    <li>实盘交易时间每晚10点半至凌晨5点，请大家注意睡眠休息。</li>
                    <li>T+0规则：当天买入的股票能当天卖出，建议大家不要过于频繁操作。Ps：最低可以买入1股。</li>
                    <li>存入人民币均按按6.6汇率折算成美金，出金、入金均统一此汇率。出入金，最快2个小时到账。</li>
                </ol>
                <br/><br/>

            </div>
        </div>
    </div>
</section>
    <footer>
    <div class="container-fluid">
    <div class="row nm-footer">杭州米号科技有限公司版权所有 浙ICP备14016681号 <a href="${ctx }/index_pravicy.jsp">隐私条款</a></div>
    </div>
    </footer>

<script>
    //鼠标滑动距顶部距离；
    $(window).scroll(function(){
        var scrollTop = $(this).scrollTop();
        var firsteleTop = $(".nm-tip").eq(0).offset().top;
        $(".nm-tip").each(function(){
             var eleTop = $(this).offset().top;
            if(eleTop-50<=scrollTop){
                $(".nm-right-nav li").eq($(this).index()+1).addClass("active").siblings().removeClass("active");
            }
        });
        if(firsteleTop>scrollTop){
            $(".nm-right-nav li").eq(0).addClass("active").siblings().removeClass("active");
        }
    });
    $(function(){
    $("#activity").parent().addClass("active");
    });
</script>
</body>
</html>