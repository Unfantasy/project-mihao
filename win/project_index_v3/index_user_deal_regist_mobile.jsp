﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="basepath" value="https://www.mihaokj.com" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>注册账号</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="${ctx }/css/register_wechat.css"/>
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx }/js/jquery.form.js"></script>
    <script src="${ctx }/js/register_wechat.js"></script>
    <script>
        $(function () {
        	if(isMobile() != true){
        		location.href="${basepath }/user_deal/index_regist";
        	}
            //输入完毕之后下一步显示
            if (isnum($(".phone")[0])) {
                $("#toSetPwd").addClass("btn_red").bind("click touch", function () {
                    showLoading();
                    var phone = $("#phone").val().NoSpace();
                    $.ajax({
                        url: database+'/user_deal/check_phone?phone='+phone,
                        type: 'get',
                        dataType: 'json',
                        success: function (data) {
                            hideLoading();
                            if(data.result==1){  //error
                                //已注册
                                $.fn.alert({'tip': '该手机号已注册'});
//                        alert(JSON.stringify(data));
                            }else{
                                //未注册
                                //获取图片验证码
                                $("#set_pwd_phone").removeClass("hide").siblings().addClass("hide");
                            }
                        }
                    });
                });
            } else {
                $("#toSetPwd").removeClass("btn_red").unbind("click touch");
            }
            $(".phone").on("focus keyup input", function (e) {
                //手机号以空格隔开
                if (($(this).val().length == 3 || $(this).val().length == 8) && e.keyCode != 8)
                    this.value += " ";
                //输入完毕之后下一步显示
                if (isnum($(".phone")[0])) {
                    $("#toSetPwd").addClass("btn_red").bind("click touch", function () {
                        showLoading();
                        var phone = $("#phone").val().NoSpace();
                        $.ajax({
                            url: database+'/user_deal/check_phone?phone='+phone,
                            type: 'get',
                            dataType: 'json',
                            success: function (data) {
                            	hideLoading();
                            	if(data.result==1){  //error
                                    //已注册
                                    $.fn.alert({'tip': '该手机号已注册'});
//                        alert(JSON.stringify(data));
                                }else{
                                    //未注册
                                    //获取图片验证码
                                    $("#set_pwd_phone").removeClass("hide").siblings().addClass("hide");
                                }
                            }
                        });
                    });
                } else {
                    $("#toSetPwd").removeClass("btn_red").unbind("click touch");
                }
            });
            $(".password").on("focus keyup", function () {
                if (ispwd($(".password")[0])) {
                    $("#imgCode").addClass("btn_red").removeAttr("disabled");

                } else {
                    $("#imgCode").removeClass("btn_red").attr("disabled", "disabled");
                }
            });
            $("#verification_code").on("focus keyup", function () {
                if (isSmsCode($("#verification_code")[0])) {
                    $("#to_verify_identity_phone").addClass("btn_red").removeAttr("disabled");
                } else {
                    $("#to_verify_identity_phone").removeClass("btn_red").attr("disabled", "disabled");
                }
            });
        });
      //判断是否是手机页面
        function isMobile() {
            if((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i)))
                return true;
            else
                return false;

        }
    </script>
</head>
<body>
<div id="register_phone" class="">
    <header>
        <h1>使用你的手机号码</h1>

        <p>注册Trubuzz美股服务，获得交易功能和高速行情推送。</p>
    </header>
    <section>
        <input type="text" placeholder="手机号码" class="phone" id="phone" name="phone" value="${phone }"/>
        <p class="lt"><span>注册即表示你同意 <a href="javascript:;" onclick="showAgreement();">《众米服务协议》</a></span></p>
        <div class="hide register-agreement" id="register-agreement1" >
            <div class="register-agreement-txt">
                <strong>一、 总则</strong> <br/>1、众米APP及http://www.mihaokj.com（以下简称“众米平台”）交易功能的所有权和运营权归杭州米号科技有限公司（以下简称“米号公司”）所有。<br/>2、用户在使用众米平台交易功能服务之前，应当仔细阅读本协议，并同意遵守本协议所有规则后方可正式使用众米平台交易功能。一旦用户使用众米平台交易功能，则用户与米号公司之间形成协议关系，用户应当受本协议所有规则的约束。<br/><strong>二、股市的风险</strong><br/>1、在您投资股市之前一定要谨记“股市有风险，入市须谨慎”。市场行情不可能只涨不跌，高投资收益的同时必然伴随着高投资风险，您应当对自己的风险承受能力做出客观判断，对自己的投资行为负责。<br/><strong>三、服务内容</strong><br/>1、众米平台交易功能由TRUBUZZ 聚财道公司（北京聚财道科技有限公司以及深圳掌中乐趣科技有限公司）提供，用户使用众米平台交易功能，即表示用户委托众米，授权并申请通过众米平台连接海外券商系统。<br/>2、众米平台交易功能的具体内容为美股市场的证券交易以及证券资产查询服务。<br/>3、众米平台仅提供证券交易功能服务，您的所有交易决策及行为，均属个人经过思考后的决策行为，最终交易过程发生在相应券商，米号公司不对任何用户的交易行为负责。<br/>4、使用众米平台提供的交易服务时，可能由于个股行情的快速变化，程序错误，网络拥堵、延迟，网络中断，传输异常等原因导致下单失败，如因此产生资产损失，米号公司不承担任何责任。<br/>5、米号公司不承诺交易服务的100%可靠性，保留在不告知用户的情况下，随时停止或中断服务的权利。<br/><strong>四、权利义务</strong><br/>1、用户应保证，已经年满18周岁，具有完全的民事权利能力及民事行为能力，且为符合本协议相关交易法律法规要求的合格投资者。若不具备前述条件，用户应立即停止使用本协议项下服务。<br/>2、用户可在众米平台并在指定授权认证页面输入登录账号以及要求的登录密码、交易密码等，由指定授权外接美股交易服务公司校验身份后进行登录。<br/>3、通过众米和指定授权美股交易服务公司提供的服务，用户可以查询其在指定开立的账户中的证券资产信息，或进行证券交易。<br/>4、用户通过本协议项下服务查询到的证券资产信息由指定授权美股交易服务公司提供，其实际证券资产信息仍以指定授权美股交易服务公司的记录为准。<br/>5、用户使用本服务，即表示同意将其在众米平台的账号的部分信息（包括但不限于账号绑定手机号码以及电子邮箱）提供给指定授权美股交易服务公司。<br/>6、用户承诺遵守各项国家法律规章制度，不在未获得他人完整授权情况下通过本协议项下服务查询他人在指定美股交易服务公司的证券资产信息；不得为任何非法目的使用本协议项下服务。如用户在使用众米平台交易功能时违反上述规定，米号公司有权要求用户改正或直接采取一切必要的措施(包括但不限于暂停或终止用户使用众米平台交易功能的权利)以减轻用户不当行为造成的影响。<br/>7、米号公司承诺将尽最大可能在技术上保证用户通过众米平台进行的证券交易和资产查询服务的安全、有效、正常运行，保证众米平台交易功能的正常使用。<br/><strong>五、免责条款</strong><br/>米号公司声明：用户在获取众米平台交易功能所提供的服务时，因下列情形导致用户损失的，米号公司将不承担任何责任：<br/>1、由于互联网数据传输等原因，交易指令可能出现的中断、停顿、延迟、数据错误等情况。<br/>2、因用户的疏忽导致其交易账号及密码信息泄露，或其身份被仿冒。<br/>3、由于互联网上存在黑客恶意攻击的可能性，网络服务器可能会出现故障及其他不可预测的因素，行情信息及其他证券信息可能会出现错误或延迟。<br/>4、用户网络终端设备及软件系统可能会受到非法攻击或病毒感染，导致无法下达委托或委托失败。<br/>5、用户网络终端设备及软件系统与本公司所提供的网上交易系统不兼容，无法下达委托或委托失败。<br/>6、因用户操作不当造成委托失败或委托失误。<br/>7、由于网络故障，用户通过众米平台交易功能进行证券交易时，用户网络终端设备已显示委托成功，而米号公司交易服务器未接到其委托指令，从而产生用户不能买入和卖出的风险；用户网络终端设备对其委托未显示成功，于是用户再次发出委托指令，而本公司交易服务器已收到用户的两次委托指令，并传递其指令到美股交易服务公司进行了交易，使用户由此产生重复买卖的风险。<br/>8、法律和政策重大变化或米号公司不可预测和不可控制因素导致的突发事件。<br/>9、因战争、通讯故障、自然灾害、罢工、政府部门的行为等不可抗力造成众米平台交易功能无法接受申请，从而造成的用户经济损失。<br/><strong>六、附则</strong><br/>1、本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。<br/>2、如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。<br/>3、米号公司有权根据有关法律、法规的变化以及公司经营状况和经营策略的调整等于任何时间暂时或永久修改或终止本协议(或其任何部分)，修改后的协议会随附于新版软件，而无论通知与否，米号公司对用户和任何第三人均无需承担任何责任。当发生有关争议时，以最新的协议文本为准。如果不同意改动的内容，用户可以自行删除本软件。如果用户继续使用本软件，则视为您接受本协议的变动。<br/>4、无论因任何原因导致米号公司需要支付违约金或赔偿金等情况发生时，米号公司承担的最高金额不超过米号公司提供本协议项下服务而自用户处获取对价的金额。<br/>5、本协议解释权及修订权归杭州米号科技有限公司所有。


            </div>
        </div>
    </section>
    <footer>
        <!--<a href="register_mailbox.html" class="footer_right_top">使用电子邮箱注册</a>-->
        <button class="btn_default footer_right" class="next" id="toSetPwd">下一步</button>
    </footer>
</div>
<div id="set_pwd_phone" class="hide">
    <header>
        <p>此密码用于登录美股账号和交易下单使用请妥善保管。</p>

        <h1>密码限定 <span class="mark">6-20</span>位数字或字母</h1>
    </header>
    <section>
        <div class="pwd">
            <div class="login_turn_pwd login_hide_pwd"></div>
            <input type="password" placeholder="密码" class="password" id="password" name="password"/>
        </div>
    </section>
    <footer>
        <button class="btn_default footer_right" class="next" id="imgCode" disabled="disabled" onclick="toImgCode()">
            下一步
        </button>
    </footer>
    <div class="all_page">
        <div class="img_code_all text_center">
            <div class="top">
                <span>验证码</span> <input type="text" class="verity_code" id="verity_code" name="captcha_value"
                                        placeholder="输入下图中的字符，区分大小写"/>
            </div>
            <div class="middle">
                <img src="${ctx }/images/loading.gif" class="img_code" id="img_code" onclick="getImgVerify()"/>

                <p>看不清？ <a onclick="getImgVerify()">换一张</a></p>
            </div>
            <div class="bottom">
                <button id="toVerifyPhone" onclick="toVerifyPhone()">确认</button>
            </div>
        </div>
    </div>
</div>
<div id="verify_phone" class="hide">
    <header>
        <h1>135&nbsp;1671&nbsp;8011</h1>

        <p>已发送验证码到你手机。</p>
    </header>
    <section>
        <div class="input_verification_code">
            <input type="text" placeholder="验证码" class="verification_code" name="" id="verification_code"/>

            <div class="seconds">60s</div>
        </div>
    </section>
    <footer>
        <button class="btn_default footer_right" class="next" disabled id="to_verify_identity_phone"
                onclick="registerForPhone()">下一步
        </button>
    </footer>
</div>
<div id="verify_identity_phone" class="hide">
    <header>
        <h1>使用你的身份证</h1>

        <p>输入姓名和身份证号码进行验证，完成交易注册</p>
    </header>
    <section class="verify_identity_section">
        <input type="text" placeholder="真实姓名" class="name" id="id_name" />
        <input type="text" placeholder="身份证号码" class="identity_num" id="id_num"/>
        <p class="lt">验证即表示你同意 <a href="javascript:;" onclick="showAgreement2();">《Trubuzz交易服务协议》</a></p>
        <div class="register-agreement regiter-agreement2 hide" id="regiter-agreement2">
            <div class="register-agreement-txt">
                您只有接受以下所有服务条款，才能继续申请：
                <br/>1、服务条款的确认和接纳<br/>&nbsp;&nbsp;聚财道服务（以下简称聚财道）的所有权和运作权归北京聚财道科技有限公司（以下简称聚财道公司）所有，包括但不限于行情系统、委托交易系统、网站、手机应用、手机短信服务等。所提供的服务必须按照聚财道公司章程，服务条款和操作规则严格执行。用户完成注册程序即表示用户与聚财道公司达成协议并接受所有的服务条款。<br/>2、服务简介<br/>聚财道公司运用自己的服务系统通过互联网为用户提供各项服务。主要服务内容包括：<br/>&nbsp;&nbsp;1、投资组合数据分享<br/>&nbsp;&nbsp;2、机器人股票推荐<br/>&nbsp;&nbsp;3、财经金融资讯和行情数据信息<br/>&nbsp;&nbsp;4、第三方证券公司（目前有美国盈透证券、香港国泰君安）开户<br/>&nbsp;&nbsp;5、证券交易、清算等功能<br/>&nbsp;&nbsp;用户必须：<br/>&nbsp;&nbsp;&nbsp;&nbsp;支付个人上网和与以上部分服务有关的费用。具体收费根据用户服务需求而定。<br/>&nbsp;&nbsp;考虑到聚财道产品服务的重要性，用户同意：<br/>&nbsp;&nbsp;&nbsp;&nbsp;（1）提供及时、详尽及准确的个人资料。<br/>&nbsp;&nbsp;&nbsp;&nbsp;（2）不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。<br/>&nbsp;&nbsp;用户主动填写的注册信息为北京聚财道科技有限公司所有，北京聚财道科技有限公司可据此为用户提供服务。聚财道公司不能公开用户的姓名、住址、电子邮箱、帐号。除非：<br/>&nbsp;&nbsp;&nbsp;&nbsp;（1）用户要求聚财道公司通过电子邮件服务透露这些信息。<br/>&nbsp;&nbsp;&nbsp;&nbsp;（2）相应的法律、法规要求及程序服务需要聚财道公司提供用户的个人资料。<br/>&nbsp;&nbsp;如果用户提供的资料不准确，不真实，不合法有效，聚财道公司保留结束用户使用聚财道各项服务的权利。<br/>3、服务修订<br/>&nbsp;&nbsp;聚财道公司保留随时修改或中断服务而不需通知用户的权利。用户接受聚财道公司行使修改或中断服务的权利，聚财道公司不需对用户或第三方负责。<br/>4、用户隐私制度<br/>&nbsp;&nbsp;尊重用户个人隐私是聚财道公司的一项基本政策。所以，作为对以上第二条个人注册资料分析的补充，聚财道公司一定不会公开、编辑或透露用户的注册资料及保存在聚财道各项服务中的非公开内容，除非聚财道公司在诚信的基础上认为透露这些信息在以下几种情况是必要的：<br/>&nbsp;&nbsp;&nbsp;&nbsp;（1）遵守有关法律规定，包括在国家有关机关查询时，提供用户在聚财道的网页上发布的信息内容及其发布时间、互联网地址或者域名。<br/>&nbsp;&nbsp;&nbsp;&nbsp;（2）遵从聚财道公司产品服务程序。
                <br/>&nbsp;&nbsp;&nbsp;&nbsp;（3）保持维护聚财道公司的商标所有权。<br/>&nbsp;&nbsp;&nbsp;&nbsp;（4）在紧急情况下竭力维护用户个人和社会大众的隐私安全。<br/>&nbsp;&nbsp;&nbsp;&nbsp;（5）根据第9条的规定或者聚财道公司认为必要的其他情况下。<br/>用户在此授权聚财道公司可以向其电子邮箱发送商业信息。用户在享用聚财道各项服务的同时，同意接收聚财道发出的各类信息。<br/>5、用户的帐号、密码和安全性<br/>&nbsp;&nbsp;您一旦注册成功成为用户，您将得到一个密码和帐号。如果您未保管好自己的帐号和密码而对您、聚财道公司或第三方造成的损害，您将负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通告聚财道公司。<br/>6、拒绝提供担保<br/>&nbsp;&nbsp;用户明确同意服务的使用由用户个人承担风险。聚财道公司明确表示不提供任何类型的担保，不论是明确的或隐含的，但是对商业性的隐含担保，特定目的和不违反规定的适当担保除外。聚财道公司不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性、安全性、出错发生都不作担保。聚财道公司拒绝提供任何担保，包括信息能否准确、及时、顺利地传送。用户理解并接受下载或通过聚财道公司产品服务取得的任何信息资料取决于用户自己，并由其承担系统受损或资料丢失的所有风险和责任。聚财道公司对在聚财道上得到的任何商品购物服务或交易进程，都不作担保。用户不会从聚财道公司收到口头或书面的意见或信息，聚财道公司也不会在这里作明确担保。<br/>7、产品风险提示<br/>&nbsp;&nbsp;（1） 用户应充分认识到证券投资的风险。公司所提供的所有数据与信息，仅供用户参考使用，不构成用户进行投资操作的直接依据，用户据此操作，风险自担，公司不承担任何经济和法律责任。<br/>&nbsp;&nbsp;（2）公司通过网页、手机应用等产品为用户提供财经金融资讯和行情数据信息，并通过相关数据分析系统、统计运算模型对上述资讯和数据进行整理、加工和集成，为用户提供高附加值的信息和数据服务，（该等信息及数据服务均是根据数据模型自动生成，不存在人为的操控或操纵），以利于用户在投资过程中理性决策、控制风险。用户在使用软件产品过程中，对于公司提供的信息数据内容，用户不应将其视作公司明示、默示地承诺证券、期货的投资收益，不应将其视为具体证券品种选择/买卖时机的建议，不应将其视为对证券市场/证券品种的走势、投资证券的可行性的分析、预测或建议，或任何其他形式的证券投资咨询/建议。公司对用户的投资决策可能带来的风险或损失不承担任何违约、赔偿或其他民事责任。<br/>8、聚财道信息的储存及限制<br/>&nbsp;&nbsp;聚财道公司不对用户所发布信息的删除或储存失败负责。聚财道公司保留判定用户的行为是否符合聚财道服务条款的要求和精神的权利，如果用户违背了服务条款的规定，则中断其聚财道服务的帐号。聚财道所有的文章版权归原文作者和聚财道公司共同所有，任何人需要转载聚财道的文章，必须征得原文作者和聚财道公司授权。<br/>9、用户管理<br/>用户单独承担发布内容的责任。用户对服务的使用是根据所有适用于服务的地方法律、国家法律和国际法律标准的。用户承诺：<br/>&nbsp;&nbsp;（1）在聚财道的网页及手机应用上发布信息或者利用聚财道的服务时必须符合中国有关法规(部分法规请见附录)，不得在聚财道的网页上或者利用聚财道的服务制作、复制、发布、传播以下信息：    <br/>&nbsp;&nbsp;(a)反对宪法所确定的基本原则的；<br/>&nbsp;&nbsp;(b) 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br/>&nbsp;&nbsp;(c) 损害国家荣誉和利益的；<br/>&nbsp;&nbsp;(d) 煽动民族仇恨、民族歧视，破坏民族团结的；<br/>&nbsp;&nbsp;(e) 破坏国家宗教政策，宣扬邪教和封建迷信的；<br/>&nbsp;&nbsp;(f) 散布谣言，扰乱社会秩序，破坏社会稳定的；<br/>&nbsp;&nbsp;(g) 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br/>&nbsp;&nbsp;(h) 侮辱或者诽谤他人，侵害他人合法权益的；<br/>&nbsp;&nbsp;(i) 含有法律、行政法规禁止的其他内容的。<br/>&nbsp;&nbsp;（2）在聚财道的网页及手机应用上发布信息或者利用聚财道的服务时还必须符合其他有关国家和地区的法律规定以及国际法的有关规定。<br/>&nbsp;&nbsp;（3）不利用聚财道的服务从事以下活动：<br/>&nbsp;&nbsp;(a) 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；<br/>&nbsp;&nbsp;(b) 未经允许，对计算机信息网络功能进行删除、修改或者增加的；<br/>&nbsp;&nbsp;(c) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；<br/>&nbsp;&nbsp;(d) 故意制作、传播计算机病毒等破坏性程序的；<br/>&nbsp;&nbsp;(e) 其他危害计算机信息网络安全的行为。<br/>&nbsp;&nbsp;（4）不以任何方式干扰聚财道的服务。<br/>&nbsp;&nbsp;（5）遵守聚财道的所有其他规定和程序。<br/>&nbsp;&nbsp;用户需对自己在使用聚财道服务过程中的行为承担法律责任。用户理解，如果聚财道发现其网站传输的信息明显属于上段第(1)条所列内容之一，依据中国法律，聚财道公司有义务立即停止传输，保存有关记录，向国家有关机关报告，并且删除含有该内容的地址、目录或关闭服务器。<br/>&nbsp;&nbsp;用户使用聚财道电子公告服务，包括电子布告牌、电子白板、电子论坛、网络聊天室和留言板等以交互形式为上网用户提供信息发布条件的行为，也须遵守本条的规定以及聚财道将专门发布的电子公告服务规则，上段中描述的法律后果和法律责任同样适用于电子公告服务的用户。<br/>&nbsp;&nbsp;若用户的行为不符合以上提到的服务条款，聚财道公司将作出独立判断立即取消用户服务帐号。<br/>10、保障<br/>&nbsp;&nbsp;用户同意保障和维护聚财道公司全体成员的利益，负责支付由用户使用超出服务范围引起的律师费用，违反服务条款的损害补偿费用，其它人使用用户的电脑、帐号和其它知识产权的追索费。<br/>11、通告<br/><br/>&nbsp;&nbsp;所有发给用户的通告都可通过电子邮件或常规的信件传送。聚财道公司会通过邮件服务发报消息给用户，告诉他们服务条款的修改、服务变更、或其它重要事情。<br/>12、内容的所有权<br/>&nbsp;&nbsp;内容的定义包括：文字、软件、声音、相片、录象、图表；在广告中的全部内容；聚财道服务为用户提供的商业信息。所有这些内容均受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在聚财道公司和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。<br/>13、法律<br/>&nbsp;&nbsp;用户和聚财道公司一致同意有关本协议以及使用聚财道的服务产生的争议交由仲裁解决，但是聚财道公司有权选择采取诉讼方式，并有权选择受理该诉讼的有管辖权的法院。若有任何服务条款与法律相抵触，那这些条款将按尽可能接近的方法重新解析，而其它条款则保持对用户产生法律效力和影响。<br/>14、聚财道所含服务的信息储存及安全<br/>&nbsp;&nbsp;聚财道公司对聚财道服务将尽力维护其安全性及方便性，但对服务中出现信息删除或储存失败不承担任何负责。另外我们保留判定用户的行为是否符合聚财道服务条款的要求的权利，如果用户违背了服务条款的规定，将会中断其服务的帐号。<br/>15、结束服务<br/>&nbsp;&nbsp;用户或聚财道公司可随时根据实际情况中断服务。聚财道公司不需对任何个人或第三方负责而随时中断服务。用户若反对任何服务条款的建议或对后来的条款修改有异议，或对聚财道的服务不满，用户只有以下的追索权：<br/>&nbsp;&nbsp;（1）不再使用聚财道服务。<br/>&nbsp;&nbsp;（2）结束用户使用聚财道服务的资格。<br/>&nbsp;&nbsp;（3）通告聚财道公司停止该用户的服务。<br/>&nbsp;&nbsp;结束用户服务后，用户使用聚财道服务的权利马上中止。从那时起，聚财道公司不再对用户承担任何义务。
            </div>
        </div>
        <div class="agree_all">
            <a href="javascript:;"><button class="btn_agree_all" id="btn_agree_all" onclick="verifyIdentityPhoneRegister()">我已阅读并同意上述协议</button></a>
        </div>
    </section>
</div>
<input type="hidden" id="captcha_key" name="captcha_key"/>
<input id="client_id" name="client_id" type="hidden" value="YyxOKQNKXWXiX4JUKhjs7aM0RDdbM5KTktqffUcB"/>
<input id="agency" name="agency" type="hidden" value="MI-US-STK"/>
<input type="hidden" name="auth_code" id="auth_code"/>
<input type="hidden" name="auth_token" id="auth_token" value="web_reg"/>
<div id='loading_area' class='loading_area'></div>
<div id='loading_messagehtml' class='loading_messagehtml'></div>
</body>
</html>