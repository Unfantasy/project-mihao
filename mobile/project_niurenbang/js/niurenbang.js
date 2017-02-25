//服务端获取用户
var users = [{username:"尼玛",imgsrc:"",intrContent:"",title1:"题目一",titleurl1:"",title2:"题目二",titleurl2:"",title3:"题目三",titleurl3:"",platform:[],wenzhangpinlv:1,monishouyilv:1,zimeiti:1,zhuanzhudu:1,shifoushoufei:1,huifujijidu:1,zonghezhishu:1}];

for(var i=0;i<users.length;i++) {//获取单个用户
    //添加人物常用平台
    $(".content" + (i + 1) + " .tubiaos").empty();
    for (var j = 0; j < users[i].platform.length; j++) {
        switch (users[i].platform[j]) {
            case "sina":
                $(".content" + (i + 1) + " .tubiaos").append('<img src="images/niurenbang_weibo.png" class="tubiao"/>');
            case "zhihu":
                $(".content" + (i + 1) + " .tubiaos").append('<img src="images/niurenbang_zhihu.png" class="tubiao"/>');
            case "moerjinrong":
                $(".content" + (i + 1) + " .tubiaos").append('<img src="images/niurenbang_zhihu.png" class="tubiao"/>');
            case "weixin":
                $(".content" + (i + 1) + " .tubiaos").append('<img src="images/niurenbang_zhihu.png" class="tubiao"/>');
            case "xueqiu":
                $(".content" + (i + 1) + " .tubiaos").append('<img src="images/niurenbang_zhihu.png" class="tubiao"/>');
        }
    }
        //添加人物头像
        $(".content" + (i + 1) + " .nav").empty().append('<img src="' + users[i].imgsrc + '" class="long_head"/>');
    $(".content"+(i+1)+" .nav .long_head").css({"background-image":"url("+users[i].imgsrc+")","background-size":"100% 100%","background-repeat":"no-repeat"});
        //添加人物名称
        $(".content" + (i + 1) + " .name").empty().text(users[i].username);
        //添加人物介绍
        $(".content" + (i + 1) + " .intrContent").empty().append(users[i].intrContent);
        //添加文章内容

        $(".content" + (i + 1) + " .title1 a i").empty().text(users[i].title1);
        $(".content" + (i + 1) + " .title1 a").attr("href", users[i].titleurl1);
        $(".content" + (i + 1) + " .title2 a i").empty().text(users[i].title2);
        $(".content" + (i + 1) + " .title2 a").attr("href", users[i].titleurl2);
        $(".content" + (i + 1) + " .title3 a i").empty().text(users[i].title3);
        $(".content" + (i + 1) + " .title3 a").attr("href", users[i].titleurl3);
    //如果标题为空则删除该标题
        if(users[i].title1.replace(/(^\s*)|(\s*$)/g,'')==""){
            $(".content" + (i + 1) + " .title1").parent().empty();
        }
        if(users[i].title2.replace(/(^\s*)|(\s*$)/g,'')==""){
            $(".content" + (i + 1) + " .title2").parent().empty();
        }
        if(users[i].title3.replace(/(^\s*)|(\s*$)/g,'')==""){
            $(".content" + (i + 1) + " .title3").parent().empty();
        }
        //添加评定星级
        addStar(".content" + (i + 1) + " .wenzhang", users[i].wenzhangpinlv);
        addStar(".content" + (i + 1) + " .moni", users[i].monishouyilv);
        addStar(".content" + (i + 1) + " .zimeiti", users[i].zimeiti);
        addStar(".content" + (i + 1) + " .zhuanzhudu", users[i].zhuanzhudu);
        addStar(".content" + (i + 1) + " .shoufei", users[i].shifoushoufei);
        addStar(".content" + (i + 1) + " .jijidu", users[i].huifujijidu);
        addStar(".content" + (i + 1) + " .zonghe", users[i].zonghezhishu);
        //画比例图
        getScale(".canvas" + (i + 1), users[i].wenzhangpinlv, users[i].monishouyilv, users[i].zimeiti, users[i].zhuanzhudu, users[i].shifoushoufei, users[i].huifujijidu);
}

//添加星星方法
function addStar(selector,n){
    $(selector).empty();
    for(var i=0;i<n;i++){
        $(selector).append('<img src="images/niurenbang_xingxing.png"/>');
    }
}
//查看全文方法
function lookAll(elem){
    var _this = elem
    //显示由5行改为50行
    $(_this).prev().css("max-height","3632px")
    $(_this).css("display","none");
    $(_this).after('<div class="col-sm-12 col-md-12 seeall shouqi" onclick="lookAfew(this)">收起</div>');

}
//收起全文方法
function lookAfew(elem){
    var _this = elem;
    $(_this).prev().prev().css("max-height","392px");
    $(_this).prev().css("display","block");
    $(_this).css("display","none");
}
//网页打印

function print(){
    showListstyleType();
    html2canvas( $("#long_picture") ,{
        onrendered: function(canvas){
            $('#down_button').attr( 'href' , canvas.toDataURL() ) ;
            $('#down_button').attr( 'download' , 'niurenbang.png' ) ;
            //$('#down_button').css('display','inline-block');
            //var html_canvas = canvas.toDataURL();
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
    }}
/*
 //根据星级添加比例图
 function addAll(selector,a,b,c,d,e,f,all){
 add(selector+" .wenzhang",a)
 add(selector+" .moni",b)
 add(selector+" .zimeiti",c)
 add(selector+" .zhuanzhudu",d)
 add(selector+" .shoufei",e)
 add(selector+" .jijidu",f)
 add(selector+" .zonghe",all)
 }
 //根据级别添加星星个数
 function add(selector,n){
 $(selector).empty();
 for(var i=0;i<n;i++){
 $(selector).append('<img src="images/niurenbang_xingxing.png"/>');

 }
 }*/
