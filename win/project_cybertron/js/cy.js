/**
 * Created by zm on 2015/12/11.
 */
//获取当前时间
function getTime(){
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    return year+" 年 "+month+" 月 "+day+" 日 ";
}

$(function(){
    var time = getTime();
    $("time").text(time);
})

