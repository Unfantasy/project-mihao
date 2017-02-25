/**
 * Created by zm on 2016/7/15.
 */
//是否为空
function isnull(obj) {
    return obj.value == "";
}

//电话号码验证
function isPhone(phone) {
    var reg = /^1[0-9]{10}$/;
    if (!reg.test(phone.NoSpace())) {
        return false;
    }
    return true;
}
//去空格
String.prototype.NoSpace = function () {
    return this.replace(/\s+/g, "");
};
//手机格式空格
String.prototype.addPhoneSpace = function () {
    var str = this;
    return str.substr(0, 3) + " " + str.substr(3, 4) + " " + str.substr(7, 4);
};
//显示登录成功
function showSuccess(msg){
    $("#success_messagehtml").html(msg).fadeIn();
    setTimeout(function () {
        $("#success_messagehtml").fadeOut();
    }, 1000);
}
function showPhone(){
    $('.loadingBg').show();
    $('.phone').focus();
}
var countNum = 61;
function countTime(){
    countNum--;
    if(countNum<0){
        countNum = 60;
        $(".countDown").text('重新获取').on('click',reloadCode);
        clearInterval(myInterval);
        return false;
    }
    countDownText = countNum +'s';
    $(".countDown").text(countDownText).unbind('click');

}
function reloadCode(){
    countTime();
    myInterval = setInterval('countTime()',1000);
}
function signOut(){
    $('.loadingBg').hide();
}
function toLast(){
    $(".submitPhone").animate({left:'50%'});
    $(".submitVerificationCode").animate({left:'150%'});
    $(".phone").focus();
}
window.onload = function(){
    $('.swiper-wrapper').height($('.productIndro').outerHeight());
};
$(function(){
    $(".phone").on('keyup',function(e){
        //手机号以空格隔开
        if (($(this).val().length == 3 || $(this).val().length == 8) && e.keyCode != 8)
            this.value += " ";
    });
}); 