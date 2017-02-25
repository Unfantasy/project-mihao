<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="basepath" value="https://www.mihaokj.com" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <meta property="qc:admins" content="11441646476510173263757" />
    <title>杭州米号科技有限公司</title>
    <meta name="description" content="众米是由杭州米号科技有限公司于2014年末推出的一款轻量、简洁的自选股管家应用，在版本的开发中，我们深入挖掘用户的需求，着重打造了证券信息传递这一功能。">
    <meta name="keywords" content="众米,米号,米号科技,众米科技有限公司,米号科技有限公司">
    <link href="${ctx}/images/zm_log.ico" rel="shortcut icon" />
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx}/css/newmain.css"/>
    <link rel="stylesheet" href="${ctx}/css/owl.carousel.css"/>
    <link rel="stylesheet" href="${ctx}/css/owl.theme.css"/>
    <link rel="stylesheet" type="text/css" media="screen and (max-device-width: 500px)" href="${ctx}/css/newmain_mobile.css">
    <link rel="stylesheet" href="css/swiper.min.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <script src="${ctx }/js/swiper.min.js"></script>
    <script src="${ctx }/js/swiper.animate.min.js"></script>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/js/bootstrap.js"></script>
    <script src="${ctx}/js/newmain.js"></script>
    <script src="${ctx}/js/owl.carousel.min.js"></script>
    <script>
    function openDsd(){
        location.href = "${ctx }/dv_stock_deal/index";
    }
        $(function(){
            //移动端轮播
            $("#carousel_mobile").owlCarousel({
                navigation : true,
                slideSpeed : 1000,
                paginationSpeed : 400,
                singleItem : true
            });
            //首页banner
            var mySwiper = new Swiper('.swiper-container', {
                autoplay: 3000,//可选选项，自动滑动
                effect:'flip',
                loop:'true',
                preventLinksPropagation : false,
                preventClicksPropagation:false,
                preventClicks : true,
                pagination : '.swiper-pagination',//分页器
                prevButton:'.swiper-button-prev',//前进按钮
                nextButton:'.swiper-button-next',//后退按钮
                autoplayDisableOnInteraction : false,//点击前进后退按钮还可以自动播放
                onInit: function (swiper) {
                    swiperAnimateCache(swiper);
                    swiperAnimate(swiper);
                },
                onSlideChangeEnd: function (swiper) {
                    swiperAnimate(swiper);
                },
                onTransitionEnd: function (swiper) {
                    swiperAnimate(swiper);
                }
            });
        });
        
        function regClick(){
        	var phone = $("#reg_phone").val();
        	var v4_url = "${basepath }/user_deal/index_regist?phone="+phone;
        	if(isMobile() == true){
        		v4_url = "${basepath }/user_deal/index_regist?mt=mobile&phone="+phone;
        	}
            window.open(v4_url);
        }
        function toLogin()
        {
          //以下为按钮点击事件的逻辑。注意这里要重新打开窗口
          //否则后面跳转到QQ登录，授权页面时会直接缩小当前浏览器的窗口，而不是打开新窗口
          var A=window.open("oauth/index.php","TencentLogin", "width=450,height=320,menubar=0,scrollbars=1,resizable=1,status=1,titlebar=0,toolbar=0,location=1");
        } 
    </script>
</head>
<body>
<%@include file="header.jsp" %>
    <section>
        <!--download-->
        <div class="container-fluid nm-nav-download" >
            <div class="row text-center ">
                <div class="col-xs-1 col-md-1"></div>
                <div class="col-xs-5 col-md-5 nm-downloadbox1 ">
                    <img src="${ctx }/images/ios.png" alt="ios下载地址" class="nm-downloadimg"/>
                    <img src="${ctx }/images/shouye_ios.png"/></div>
                <div class="col-xs-5 col-md-5 nm-downloadbox2">
                    <img src="${ctx }/images/android.png" alt="android下载地址" class="nm-downloadimg"/>
                    <img src="${ctx }/images/shouye_androis.png"/>
                </div>
                <div class="col-xs-1 col-md-1"></div>
            </div>
            <div class="row text-center nm-pull">
                <a  id="nm-pull-on"><img src="${ctx }/images/shouye_shouqi.png"/>
                <p>收起</p></a>
            </div>
        </div>
        <!--download-->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="page page_1 table_box">
                    <div class="table_cell_box nm_content">
                        <h1 >众米</h1>
                        <h1>有态度的投资方式</h1>
                        <a class="nm_download">立即下载</a>
                    </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="page page_1 page_1_2" onclick="openDsd()">
                    <div class="ani show1" data-slide-in="at 0 from slideInDown use swing during 500">
                        <a class="banner_open" href="${ctx }/dv_stock_deal/index"></a>
                    </div>
                    <div class="ani" data-slide-in="at 0 from slideInUp use swing during 500">
                        <p class="banner2_text">模拟炒股送现金红包</p>
                    </div>
                </div>
                </div>

            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>

        <div class="page page_2 ">
            <div class="nm_content">
                <h2 class="text-center">实用功能提高投资效率</h2>
                <div class="center-block nm_content">
                    <div class="row text-center">
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="img_box">
                                <img src="${ctx }/images/mianfei.png" class="nm_img_3" alt="free" title="free"/>
                            </div>
                            <h4>免费实时行情服务</h4>

                            <p>提供A股、美股免费实时行情数据，快速及时，遍览全球股市行情</p>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="img_box">
                                <img src="${ctx }/images/fenxi.png" class="nm_img_3" alt="free" title="free"/>
                            </div>
                            <h4>自选个股分析</h4>

                            <p>个股收益率提醒，让你不会错过买卖点。今日收益分享，可以与好友投资互动。相关个股设置，方便关注行业其他个股联动</p>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="img_box">
                                <img src="${ctx }/images/goutong.png" class="nm_img_3" alt="free" title="free"/>
                            </div>
                            <h4>免费实时行情服务</h4>

                            <p>提供A股、美股免费实时行情数据，快速及时，遍览全球股市行情</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page page_3 ">
            <div class="nm_content">
                <h2 class="text-center">一个账户配置全球市场</h2>
                <div class="center-block nm_content">
                    <div class="row text-center">
                        <div class="col-md-2 col-sm-2  col-xs-4">
                            <div class="img_box img_3_1">
                            </div>
                            <h4>沪深300做多</h4>
                        </div>
                        <div class="col-md-2 col-sm-2  col-xs-4 ">
                            <div class="img_box img_3_2">
                            </div>
                            <h4>沪深300做空</h4>
                        </div>
                        <div class="col-md-2 col-sm-2  col-xs-4">
                            <div class="img_box img_3_3">
                            </div>
                            <h4>石油指数做多</h4>
                        </div>
                        <div class="col-md-2 col-sm-2  col-xs-4">
                            <div class="img_box img_3_4">
                            </div>
                            <h4>原油指数2倍做空</h4>
                        </div>
                        <div class="col-md-2 col-sm-2  col-xs-4">
                            <div class="img_box img_3_5">
                            </div>
                            <h4>黄金做多</h4>
                        </div>
                        <div class="col-md-2 col-sm-2  col-xs-4">
                            <div class="img_box img_3_6">
                            </div>
                            <h4>白银做多</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page page_4 ">
            <div class="center-block nm_content">
                <div class="row text-left">
                    <div class="col-md-2 col-sm-2 col-xs-4 ">
                        <div class="img_box img_4_1">
                        </div>
                        <h4>美国</h4>
                        <p>U.S.A</p>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4  ">
                        <div class="img_box img_4_2">
                        </div>
                        <h4>英国</h4>
                        <p>UK</p>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_box img_4_3">
                        </div>
                        <h4>德国</h4>
                        <p>Germany</p>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_box img_4_4">
                        </div>
                        <h4>法国</h4>
                        <p>France</p>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_box img_4_5">
                        </div>
                        <h4>日本</h4>
                        <p>Japan</p>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_box img_4_6">
                        </div>
                        <h4>香港</h4>
                        <p>Hong Kong</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="page page_5">
            <div class="nm_content">
                <h2>拥有世界领先公司</h2>
                <div class="row">
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_11 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_12 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_13 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_14 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_15 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_16 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_21 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_22 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_23 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_24 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_25 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_26 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_31 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_32 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_33 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_34 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_35 img_box"></div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-4">
                        <div class="img_5_36 img_box"></div>
                    </div>
                </div>
            </div>

        </div>
        <div class="page page_5_mobile">
            <div id="carousel_mobile">
                <div class="item item1">
                    <h2>拥有世界领先公司</h2>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                </div>
                <div class="item item2">
                    <h2>拥有世界领先公司</h2>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                </div>
                <div class="item item3">
                    <h2>拥有世界领先公司</h2>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                    <div>
                        <div class="img"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page page_6 ">

            <div class="nm_content table_box">
                <div class="table_cell_box">
                    <h2 class="text-center">交易帐号注册</h2>

                    <div class="input">
                        <input type="text" id="reg_phone"  placeholder="输入你的手机号码" class="register_2"/>
                        <a href="javascript:void(0)" class="button" onclick="regClick()">注册</a>
                    </div>

                </div>
            </div>

        </div>
        <div class="page page_7 ">
            <div class="nm_content">
                <h2 class="text-center">从注册到交易只需3步</h2>

                <div class="center-block nm_content">
                    <div class="row text-left">
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="content_box rt_1">
                                <h5>立即注册</h5>
                                <p>只需本人手机和身份证，10分钟可完成注册申请到审核完成。转入资金后即可开启全球投资之旅。</p>
                            </div>

                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="content_box rt_2">
                                <h5>转入资金</h5>
                                <p>绑定银行账户、人民币入金、最快两小时到达交易账户。转入转出资金使用固定汇率计算，避免汇率波动损失。SIPC最高50万美元资金保。</p>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="content_box rt_3">
                                <h5>下单交易</h5>
                                <p>无最低资金要求、最少可以买卖1股、无限制T+0交易、盈透底层交易通道保证交易订单安全快速成交。</p>
                            </div>
                        </div>
                    </div>
                    <div class="know_more_box">
                        <a href="${ctx}/intrduce_USstocktrade.jsp" class="m-button know_more">了解更多</a>
                    </div>
                </div>
            </div>
        </div>
        <!--about us-->
        <div class="container-fluid ">
        <div class="row nm-last">
            <div class="col-xs-12 col-md-3 col-sm-3 col-sm-push-8 col-md-push-8 text-center full_v_box"><img src="${ctx }/images/erweima.png" alt="数据" class="nm-content-type middle_box"/>
            </div>
            <div class="col-xs-12 col-md-6 col-sm-6 col-sm-pull-3 col-md-pull-3 full_v_box">
                <div class="middle_box">
                    <h4>关于我们</h4>
                    <p>众米是由杭州米号科技有限公司于2014年末推出的一款轻量、简洁的自选股管家应用，在版本的开发中，我们深入挖掘用户的需求，着重打造了证券信息传递这一功能。</p><br/>
                    <p>产品反馈及讨论QQ群： 419619824</p>
                    <p>微信服务号：微信搜索“众米订阅号”</p>
                </div>

            </div>
        </div>
    </div>
        <!--end about us-->
    </section>
    <footer>
        <div class="container-fluid">
            <div class="row nm-footer">杭州米号科技有限公司版权所有 浙ICP备14016681号 <a href="${ctx }/index_pravicy.jsp">隐私条款</a><br>
                <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010602003615" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;width: auto"><img src="images/beiantubiao.png" style="float:left;"/><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#fff;">浙公网安备 33010602003615号</p></a>
            </div>
        </div>
    </footer>

<script type="text/javascript">
    $(function () {
    	$("#index").addClass("active");
    	if(isMobile() == true){
    		$("#nm-register").attr("href","${basepath }/user_deal/index_regist?mt=mobile");
    	}
	});
    </script>
</body>
</html>