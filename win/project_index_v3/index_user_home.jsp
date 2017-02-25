﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="basepath" value="https://www.mihaokj.com" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width,user-scalable=no">
    <link rel="shortcut icon" href="${ctx }/images/zm_log.ico "/>
    <link rel="stylesheet" href="${ctx }/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx }/css/newmain.css"/>
    <link rel="stylesheet" type="text/css" media="screen and (max-device-width: 600px)" href="${ctx }/css/newmain_mobile.css">
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx }/js/bootstrap.js "></script>
    <script src="${ctx}/js/register.js"></script>
</head>
<script>
    var huilv = 6.6;
    var TIMENUM = 0;

    $(function(){
        $(".home_nav li").click(function(){
            var $this = $(this);
            var index = $this.index();
            index = index==0?1:index;
            $(".home_nav li").eq(index).addClass("active").siblings().removeClass("active");
            $(".home_content").eq(index-1).removeClass("hide").siblings().addClass("hide");
            $(".home_content").eq(index-1).find(".home_input").focus();
        });
        $(".home_input_in").keyup(function(){
            var dollar = $(this).text();
            var renminbi = (dollar*huilv).toFixed(2);
            $(".home_in_renminbi").text(renminbi);
        });
        $(".home_input_out").keyup(function(){
            var dollar = $(this).text();
            var renminbi = (dollar*huilv).toFixed(2);
            $(".home_out_renminbi").text(renminbi);
        });
        $(".home_exit").click(function(e){
            e.stopPropagation();
        });
        $(".home_button").on('mousedown touchstart',function(){
            $(this).css({top:'2px',left:'2px'});
        });
        $(".home_button").on('mouseup touchend',function(){
            $(this).css({top:'0',left:'0'});
        });

    });
    function fundInNotice(flag){
    	var  bank_card_num = "${deal_info.bank_card_num}";
    	var  totalcashvalue = "${deal_info.totalcashvalue}";
        //8s只能发送一次
        var time1;
        if(TIMENUM==0) {
            TIMENUM++;
            time1 = setInterval(function () {
                TIMENUM++;
                if (TIMENUM>=8) {
                    clearInterval(time1);
                    TIMENUM = 0;
                }
            }, 1000);
        }else{
            alert('请不要频繁提交通知。');
            return false;
        }
    	if(bank_card_num==""){
    		alert("请到手机端绑定银行卡后在进行操作！");
    		return false;
    	}
    	var amount = 0;
    	if(flag=="deposit"){
    		amount = $("#deposit").text();

    	}else{

    		amount = $("#withdraw").text();
    		if(totalcashvalue<amount){
    			alert("余额不足！");
        		return false;
    		}
    	}
		if(amount==0||amount==""){
    		alert("请输入有效金额！");
    		return false;
    	}

        $.ajax({
            url:"${ctx}/user_deal/bank_withdraw_deposit",
            type:'post',
            datatype:"json",
            crossDomain: true,
            data:{flag:flag,amount:amount},
            success:function(data){
               if(data.state=="success"){
            	   alert("通知发送成功");
               }else{
            	   if(data.msg=="no_login"){
            		   alert("请重新登录");
            		   location.href="${ctx}/jsp/user_deal/index_user_deal_login.jsp";
            	   }else if(data.msg=="no_bind_zm_account"){
            		   alert("没有绑定交易账号，请安装众米手机版APP进行绑定交易账号");
            		   location.href="http://www.mimikj.com";
            	   }else {
            		   alert("通知发送失败");
            	   }
               }
            }
        });
    }
</script>
<body>
<nav class="home_nav">
    <div>
        <ul>
            <li><span>${deal_info.user_name }</span><a href="${ctx }/user_deal/log_out" class="home_exit"><img src="${ctx }/images/gerenzhongxin_guangbi.png" alt="退出登录" title="退出登录"/></a></li>
            <li class="active">我的账户</li>
            <li>美股资产</li>
            <li>资金转入</li>
            <li>资金转出</li>
        </ul>
    </div>
</nav>
<div class="navbar-fixed-top home_nav_top">
    <div class="navbar-header">
        <a class="navbar-brand" href="http://www.mihaokj.com/"><img src="${ctx }/images/zhongmilogo.png" alt="钟米图标" id="nm-icon"/></a>
        <button class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse"
                type="button">
            <span class="nm-list"></span>
        </button>
    </div>
    <div class="collapse navbar-collapse navbar-right" id="navbar-collapse">
        <ul class="nav navbar-nav">
            <li><a href="http://www.mihaokj.com" id="index" class="active">首页</a></li>
			<li><a href="${ctx }/index_company.jsp" id="company">公司</a></li>
			<li><a href="${ctx }/index_help.jsp" id="help">帮助</a></li>
			<!--<li><a id="forum" href="${ctx }/forum_post/list"  target="_blank">官方论坛</a>-->
			<!--<li><a href="${ctx }/cybertron/cybertron_list" hidden target="_blank">Cybertron工作室</a></li>-->
        </ul>
    </div>
</div>
<script>
    $(".navbar-toggle").click(function () {
        if (!$("#navbar-collapse").hasClass("in")) {
            if ($(this).children().hasClass("nm-list")) {
                $(this).children().removeClass("nm-list").addClass("to-remove");
            } else {
                $(this).children().removeClass("to-list").addClass("to-remove");
            }
            $(".to-remove").css({
                "background-image": "url('${ctx }/images/toremove.gif')",
                "background-repeat": "no-repeat",
                "background-size": "100% 100%"
            });
        } else {
            $(this).children().removeClass("to-remove").addClass("to-list");
            $(".to-list").css({
                "background-image": "url('${ctx }/images/tolist.gif')",
                "background-repeat": "no-repeat",
                "background-size": "100% 100%"
            });
        }
    });
</script>
<section>
    <div class="home_content home_content1">
        <div class="home_mycount">
            <div class="home_mycount_title">交易账户</div>
            <table>
                <tr>
                    <td>账户名</td>
                    <td>${deal_info.phone }</td>
                </tr>
                <tr>
                    <td>名字</td>
                    <td>${deal_info.user_name }</td>
                </tr>
                <tr>
                    <td>交易帐号</td>
                    <td>${deal_info.account }</td>
                </tr>
                <tr>
                    <td>账户状态</td>
                    <td>${deal_info.account_state }</td>
                </tr>
            </table>
        </div>
        <div class="home_mycount">
            <div class="home_mycount_title">众米账户</div>
            <table>
                <tr>
                    <td>用户名</td>
                    <td>${deal_info.user_name }</td>
                    <td><a href="${ctx }/index_help_relievebind.jsp" class="home_relievebind">解除绑定</a></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="home_content home_content2 hide">
        <div class="home_mycount">
            <div class="home_mycount_title">账户概览</div>
            <table>
                <tr>
                    <td>总资产</td>
                    <td>$${deal_info.equitywithloanvalue }</td>
                </tr>
                <tr>
                    <td>持仓</td>
                    <td>$${deal_info.grosspositionvalue }</td>
                </tr>
                <tr>
                    <td>浮动盈利</td>
                    <td>$${deal_info.floatinterest }</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="home_content home_content3 hide">
        <div class="home_moneyflow home_moneyflow1">
            <div class="home_mycount_title">提交汇款通知</div>
            <table class="home_moneyflow_table">
                <tr>
                    <td><img src="${ctx }/images/gerenzhongxin_meiguo.png" alt=""/></td>
                    <td><span>$</span><span id="deposit" class="home_input home_input_in" contenteditable="true"></span></td>
                </tr>
                <tr>
                    <td><img src="${ctx }/images/gerenzhongxin_zhuanhuan.png" alt=""/></td>
                    <td>$1.00=￥6.70</td>
                </tr>
                <tr>
                    <td><img src="${ctx }/images/gerenzhongxin_zhongguo.png" alt=""/></td>
                    <td>￥<span class="home_in_renminbi">0.00</span></td>
                </tr>
            </table>
            <div class="block-center home_button_box"><button class="home_button" onclick="fundInNotice('deposit')">提交资金转入通知</button></div>
        </div>
        <div class="home_moneyflow home_moneyflow2">
            <div class="home_mycount_title">入金指引</div>
            <table>
                <tr>
                    <td colspan="2" class="bold">汇款人信息</td>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td>${deal_info.user_name }</td>
                </tr>
                <tr>
                    <td>银行账户</td>
                    <td><c:choose>
                    	<c:when test="${deal_info.bank_card_num==null||deal_info.bank_card_num=='' }">未绑定</c:when>
                    	<c:otherwise>${deal_info.bank_card_num }</c:otherwise>
                    </c:choose></td>
                </tr>
                <tr>
                    <td colspan="2" class="bold">收款人信息</td>
                </tr>
                <tr>
                    <td>账户名</td>
                    <td>${deal_info.jcd_account_name }</td>
                </tr>
                <tr>
                    <td>开户行</td>
                    <td>${deal_info.jcd_bank_of_deposit }</td>
                </tr>
                <tr>
                    <td>银行账号</td>
                    <td>${deal_info.jcd_bank_account }</td>
                </tr>
                <tr>
                    <td>备注信息</td>
                    <td>备注中请填入你的入金识别码 <span class="mark">${deal_info.memo }</span>方便核对</td>
                </tr>
            </table>
            <p class="home_prompt"><span class="mark">*</span> 提交汇款通知后，请使用网银或银行柜台完成人民币入金汇款
                完成汇款后最快2个小时资金即可到账。</p>
        </div>
    </div>
    <div class="home_content home_content4 hide">
        <div class="home_moneyflow home_moneyflow1">
            <div class="home_mycount_title">提交转出通知</div>
            <table class="home_moneyflow_table">
                <tr>
                    <td><img src="${ctx }/images/gerenzhongxin_meiguo.png" alt=""/></td>
                    <td><span>$</span><span id="withdraw" class="home_input home_input_out" contenteditable="true"></span> </td>
                </tr>
                <tr>
                    <td><img src="${ctx }/images/gerenzhongxin_zhuanhuan.png" alt=""/></td>
                    <td>$1.00=￥6.70</td>
                </tr>
                <tr>
                    <td><img src="${ctx }/images/gerenzhongxin_zhongguo.png" alt=""/></td>
                    <td>￥<span class="home_out_renminbi">0.00</span></td>
                </tr>
            </table>
            <div class="block-center home_button_box"><button class="home_button" onclick="fundInNotice('withdraw')">提交资金转出通知</button></div>
        </div>
        <div class="home_moneyflow home_moneyflow2">
            <div class="home_mycount_title">收款账户</div>
            <table>
                <tr>
                    <td>账户名</td>
                    <td>${deal_info.user_name }</td>
                </tr>
                <tr>
                    <td>银行账户</td>
                    <td><c:choose>
                    	<c:when test="${deal_info.bank_card_num==null||deal_info.bank_card_num=='' }">未绑定</c:when>
                    	<c:otherwise>${deal_info.bank_card_num }</c:otherwise>
                    </c:choose></td>
                </tr>
            </table>
            <p class="home_prompt"><span class="mark">*</span>提交转出资金通知后，最快2个小时将对应的人民币金额赚到
                你的绑定银行账户。</p>
        </div>
        <div class="home_moneyflow home_moneyflow3">
            <div class="home_mycount_title"></div>
            <div class="home_moneyflow_content">
                <p class="mark">可取金额</p>
                <p>$ <span>${deal_info.totalcashvalue }</span></p>
            </div>
        </div>
    </div>
</section>
</body>
</html>