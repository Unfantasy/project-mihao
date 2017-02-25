/**
 * Created by zm on 2015/10/21.
 */
//    从服务器获取时间，新闻，买入股票，买入股票信息，卖出股票，卖出股票信息
var time,news,stockIn,stockMsgIn,stockOut,stockMsgOut;
time = getTime();
//news = ["央企债务违约第二例：中钢股份延期支付利息中央力挺网络文艺发展","阿里收购优酷土豆","二胎、新能源汽车、券商、体育等板块涨幅居前一"];
//stockIn = [["002276",'中国电信'],["002276",'中国电信'],["002276",'中国电信']];
//stockMsgIn = [["中信杭州四季路（上榜36次）","政策扶持 充电桩概念活跃","两板"],["中信杭州四季路（上榜36次）","政策扶持 充电桩概念活跃","两板"],["中信杭州四季路（上榜36次）","政策扶持 充电桩概念活跃","两板"]];
//stockOut = [["002276",'中国电信'],["002276",'中国电信'],["002276",'中国电信']];
//stockMsgOut = [["中信杭州四季路（上榜36次）","政策扶持 充电桩概念活跃","两板"],["中信杭州四季路（上榜36次）","政策扶持 充电桩概念活跃","两板"],["中信杭州四季路（上榜36次）","政策扶持 充电桩概念活跃","两板"]];

//向龙虎榜页面中添加数据
// 1,添加时间
$(".long_time").text(time+"公众号：众米订阅号");
// 2,添加新闻信息
//$(".nav ol").empty();
//for(var i=0;i<news.length;i++){
//    $(".nav ol").append(" <li>"+news[i]+"</li>");
//}
//添加新闻
//$("#addnews").on("blur",function(){
//    $(this).val("请添加一条新闻");
//    $(this).css("color","gray");
//});

// 3,添加买入股票信息
$("#long_addstock").on("click",function(){
    $(".long_in").append('<li class="long_inmsg"><table><tr ><td rowspan="3" class="long_lefttext">'+$("#addstock").val()+'</td><td class="long_righttext1">'+$("#addstock1").val()+'</td></tr><tr><td class="long_righttext2">'+$("#addstock2").val()+'</td></tr><tr><td class="long_righttext3">'+$("#addstock3").val()+'</td></tr></table></li>');
});
//  删除买入股票信息
$("#long_delstock").on("click",function(){
   $(".long_in li:last").remove();
});


//for(var i=0;i<stockIn.length;i++) {
//    $(".long_in").append('<li><table><tr ><td rowspan="3" class="long_lefttext">'+stockIn[i][0]+" "+stockIn[i][1]+'</td><td class="long_righttext1">'+stockMsgIn[i][0]+'</td></tr><tr><td class="long_righttext2">'+stockMsgIn[i][1]+'</td></tr><tr><td class="long_righttext3">'+stockMsgIn[i][2]+'</td></tr></table></li>');
//}
// 4,添加卖出股票信息
$("#long_addstock_out").on("click",function(){
    $(".long_out").append('<li class="long_outmsg"><table><tr ><td rowspan="3" class="long_lefttext">'+$("#addstock_out").val()+'</td><td class="long_righttext1">'+$("#addstock1_out").val()+'</td></tr><tr><td class="long_righttext2">'+$("#addstock2_out").val()+'</td></tr><tr><td class="long_righttext3">'+$("#addstock3_out").val()+'</td></tr></table></li>');
});
//  删除卖出股票信息
$("#long_delstock_out").on("click",function(){
    $(".long_out li:last").remove();
});
//for(var i=0;i<stockOut.length;i++){
//    $(".long_out").append('<li><table><tr ><td rowspan="3" class="long_lefttext">'+stockIn[i][0]+' '+stockIn[i][1]+'</td><td class="long_righttext1">'+stockMsgIn[i][0]+'</td></tr><tr><td class="long_righttext2">'+stockMsgIn[i][1]+'</td></tr><tr><td class="long_righttext3">'+stockMsgIn[i][2]+'</td></tr></table></li>');
//}

//鼠标聚焦文本框会内容消失
//$("input").on("focus",function(){
//    $(this).val("");
//});
//获取当前时间
function getTime(){
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    return year+"-"+month+"-"+day;
}
//网页打印

function print(){
    showListstyleType();
    html2canvas( $("#long_picture") ,{
        onrendered: function(canvas){
            $('#down_button').attr( 'href' , canvas.toDataURL() ) ;
            $('#down_button').attr( 'download' , 'longhubang.jpg' ) ;
            //$('#down_button').css('display','inline-block');
            //var html_canvas = canvas.toDataURL();
            //$.post('', {order_id:1,type_id:2,html_canvas:html_canvas}, function(json){
            //}, 'json');
        }
    });
}
//解决html2canvas无法打印liststyletype问题
//recycled code from old html2canvas version
function showListstyleType(){
window.listItemText = function(element) {
    var type = getCSS(element, "listStyleType");
    if (! /^(decimal|decimal-leading-zero|upper-alpha|upper-latin|upper-roman|lower-alpha|lower-greek|lower-latin|lower-roman)$/i.test(type)) {
        //just set a default value because that will look better than no prefix at all
        type = "lower-alpha";
    }

    var currentIndex = elementIndex(element), text;
    switch(type){
        case "decimal":
            text = currentIndex;
            break;
        case "decimal-leading-zero":
            text = (currentIndex.toString().length === 1) ? currentIndex = "0" + currentIndex.toString() : currentIndex.toString();
            break;
        case "upper-roman":
            text = listRoman( currentIndex );
            break;
        case "lower-roman":
            text = listRoman( currentIndex ).toLowerCase();
            break;
        case "lower-alpha":
            text = listAlpha( currentIndex ).toLowerCase();
            break;
        case "upper-alpha":
            text = listAlpha( currentIndex );
            break;
    }

    return text + ".&nbsp;&nbsp;";
};

window.getCSS = function (element, attribute, index) {
    var computedCSS = document.defaultView.getComputedStyle(element, null);
    var value = computedCSS[attribute];

    return value;
};

window.elementIndex = function(el) {
    var i = -1,
        count = 1,
        childs = el.parentNode.childNodes;

    if (el.parentNode) {
        while(childs[++i] !== el) {
            if (childs[i].nodeType === 1) {
                count++;
            }
        }
        return count;
    } else {
        return -1;
    }
};

window.listAlpha = function(number) {
    var tmp = "",
        modulus;

    do {
        modulus = number % 26;
        tmp = String.fromCharCode((modulus) + 64) + tmp;
        number = number / 26;
    }while((number*26) > 26);

    return tmp;
};

window.listRoman = function(number) {
    var romanArray = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"],
        decimal = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1],
        roman = "",
        v,
        len = romanArray.length;

    if (number <= 0 || number >= 4000) {
        return number;
    }

    for (v=0; v < len; v+=1) {
        while (number >= decimal[v]) {
            number -= decimal[v];
            roman += romanArray[v];
        }
    }

    return roman;
};
//end html2canvas code

////解决html2canvas ulliststyletype无法显示
//$("ul").each(function(){
//    var replica = $("<div class='itb-list itb-unordered-list'></div>");
//    replica.addClass($(this).attr("class"));
//
//    $(this).find(" li").each(function() {
//        var item = $("<div class='itb-list-item'></div>");
//        item.addClass($(this).attr("class"));
//        item.html("<div class='itb-list-item-prefix'>&bullet;&nbsp;&nbsp;</div>" +
//        "<div class='itb-list-item-content'>" + $(this).html() + "</div>");
//
//        replica.append(item);
//    });
//
//    $(this).replaceWith(replica);
//    //$(document.body).append(replica);
//});
//解决html2canvas olliststyletype无法显示
$("ol").each(function(){
    var replica = $("<div class='itb-list itb-ordered-list'></div>");
    replica.addClass($(this).attr("class"));

    $(this).find("li").each(function() {
        var item = $("<div class='itb-list-item'></div>");
        item.addClass($(this).attr("class"));
        item.html(listItemText(this) + $(this).html());

        item.html("<div class='itb-list-item-prefix'>" + listItemText(this) + "</div>" +
        "<div class='itb-list-item-content'>" + $(this).html() + "</div>");

        replica.append(item);
    });

    $(this).replaceWith(replica);
    //$(document.body).append(replica);
});
}
