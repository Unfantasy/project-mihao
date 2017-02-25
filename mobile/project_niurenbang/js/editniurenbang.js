$(".save").click(
    function(){addUsers();});
//将人物加入下面的图片里面
function addUsers(){
var users = saveData();
for(var i=0;i<users.length;i++){//获取单个用户
    //添加人物常用平台
    $(".content"+(i+1)+" .tubiaos").empty();
    for(var j=0;j<users[i].platform.length;j++){
        switch(users[i].platform[j]){
            case "sina":
                $(".content"+(i+1)+" .tubiaos").append('<img src="images/niurenbang_weibo.png" class="tubiao"/>');
                break;
            case "zhihu":
                $(".content"+(i+1)+" .tubiaos").append('<img src="images/niurenbang_zhihu.png" class="tubiao"/>');
                break;
            case "moerjinrong":
                $(".content"+(i+1)+" .tubiaos").append('<img src="images/niurenbang_moer.png" class="tubiao"/>');
                break;
            case "weixin":
                $(".content"+(i+1)+" .tubiaos").append('<img src="images/niurenbang_weixin.png" class="tubiao"/>');
                break;
            case "xueqiu":
                $(".content"+(i+1)+" .tubiaos").append('<img src="images/niurenbang_xueqiu.png" class="tubiao"/>');
                break;
        }
    }
    //添加人物头像
    $(".content"+(i+1)+" .nav").empty().append('<div class="long_head"></div>');
    $(".content"+(i+1)+" .nav .long_head").css({"background-image":"url("+users[i].imgsrc+")","background-size":"100% 100%","background-repeat":"no-repeat"});
    //添加人物名称
    $(".content"+(i+1)+" .name").empty().text(users[i].username);
    //添加人物介绍
    $(".content"+(i+1)+" .intrContent").empty().append(users[i].intrContent);
    //添加文章内容
    $(".content"+(i+1)+" .title1 a i").empty().text(users[i].title1);
    $(".content"+(i+1)+" .title1 a").attr("href",users[i].titleurl1);
    $(".content"+(i+1)+" .title2 a i").empty().text(users[i].title2);
    $(".content"+(i+1)+" .title2 a").attr("href",users[i].titleurl2);
    $(".content"+(i+1)+" .title3 a i").empty().text(users[i].title3);
    $(".content"+(i+1)+" .title3 a").attr("href",users[i].titleurl3);
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
    addStar(".content"+(i+1)+" .wenzhang",users[i].wenzhangpinlv);
    addStar(".content"+(i+1)+" .moni",users[i].monishouyilv);
    addStar(".content"+(i+1)+" .zimeiti",users[i].zimeiti);
    addStar(".content"+(i+1)+" .zhuanzhudu",users[i].zhuanzhudu);
    addStar(".content"+(i+1)+" .shoufei",users[i].shifoushoufei);
    addStar(".content"+(i+1)+" .jijidu",users[i].huifujijidu);
    addStar(".content"+(i+1)+" .zonghe",users[i].zonghezhishu);
    //画比例图
    getScale(".canvas"+(i+1),users[i].wenzhangpinlv,users[i].monishouyilv,users[i].zimeiti,users[i].zhuanzhudu,users[i].shifoushoufei,users[i].huifujijidu);
}
}
//保存数据方法
function saveData(){
    var users = [{username:"",intrContent:"",imgsrc:"",title1:"",titleurl1:"",title2:"",titleurl2:"",title3:"",titleurl3:"",platform:[],wenzhangpinlv:1,monishouyilv:1,zimeiti:1,zhuanzhudu:1,shifoushoufei:1,huifujijidu:1,zonghezhishu:1},
        {username:"",intrContent:"",imgsrc:"",title1:"",titleurl1:"",title2:"",titleurl2:"",title3:"",titleurl3:"",platform:[],wenzhangpinlv:1,monishouyilv:1,zimeiti:1,zhuanzhudu:1,shifoushoufei:1,huifujijidu:1,zonghezhishu:1},
        {username:"",intrContent:"",imgsrc:"",title1:"",titleurl1:"",title2:"",titleurl2:"",title3:"",titleurl3:"",platform:[],wenzhangpinlv:1,monishouyilv:1,zimeiti:1,zhuanzhudu:1,shifoushoufei:1,huifujijidu:1,zonghezhishu:1},
        {username:"",intrContent:"",imgsrc:"",title1:"",titleurl1:"",title2:"",titleurl2:"",title3:"",titleurl3:"",platform:[],wenzhangpinlv:1,monishouyilv:1,zimeiti:1,zhuanzhudu:1,shifoushoufei:1,huifujijidu:1,zonghezhishu:1},
        {username:"",intrContent:"",imgsrc:"",title1:"",titleurl1:"",title2:"",titleurl2:"",title3:"",titleurl3:"",platform:[],wenzhangpinlv:1,monishouyilv:1,zimeiti:1,zhuanzhudu:1,shifoushoufei:1,huifujijidu:1,zonghezhishu:1}];
    for(var i=0;i<users.length;i++){
        users[i].username = $('.person'+(i+1)+" .username").val();
        users[i].imgsrc=$('.person'+(i+1)+" .headimg").attr("src");
        users[i].intrContent=$('.person'+(i+1)+" .eintrContent").val();
        users[i].title1=$('.person'+(i+1)+" .title1").val();
        users[i].titleurl1=$('.person'+(i+1)+" .titleurl1").val();
        users[i].title2=$('.person'+(i+1)+" .title2").val();
        users[i].titleurl2=$('.person'+(i+1)+" .titleurl2").val();
        users[i].title3=$('.person'+(i+1)+" .title3").val();
        users[i].titleurl3=$('.person'+(i+1)+" .titleurl3").val();
        //判断复选框选中多少
        if($('.person'+(i+1)+" .sina").prop("checked")) users[i].platform.push("sina");
        if($('.person'+(i+1)+" .zhihu").prop("checked")) users[i].platform.push("zhihu");
        if($('.person'+(i+1)+" .moerjinrong").prop("checked")) users[i].platform.push("moerjinrong");
        if($('.person'+(i+1)+" .weixin").prop("checked")) users[i].platform.push("weixin");
        if($('.person'+(i+1)+" .xueqiu").prop("checked")) users[i].platform.push("xueqiu");

        //判断单选框选中多少
        if($('.person'+(i+1)+" .wenzhangpinlv1").prop("checked")) users[i].wenzhangpinlv=1;
        if($('.person'+(i+1)+" .wenzhangpinlv2").prop("checked")) users[i].wenzhangpinlv=2;
        if($('.person'+(i+1)+" .wenzhangpinlv3").prop("checked")) users[i].wenzhangpinlv=3;
        if($('.person'+(i+1)+" .monishouyilv1").prop("checked")) users[i].monishouyilv=1;
        if($('.person'+(i+1)+" .monishouyilv2").prop("checked")) users[i].monishouyilv=2;
        if($('.person'+(i+1)+" .monishouyilv3").prop("checked")) users[i].monishouyilv=3;
        if($('.person'+(i+1)+" .zimeiti1").prop("checked")) users[i].zimeiti=1;
        if($('.person'+(i+1)+" .zimeiti2").prop("checked")) users[i].zimeiti=2;
        if($('.person'+(i+1)+" .zimeiti3").prop("checked")) users[i].zimeiti=3;
        if($('.person'+(i+1)+" .zhuanzhudu1").prop("checked")) users[i].zhuanzhudu=1;
        if($('.person'+(i+1)+" .zhuanzhudu2").prop("checked")) users[i].zhuanzhudu=2;
        if($('.person'+(i+1)+" .zhuanzhudu3").prop("checked")) users[i].zhuanzhudu=3;
        if($('.person'+(i+1)+" .shifoushoufei1").prop("checked")) users[i].shifoushoufei=1;
        if($('.person'+(i+1)+" .shifoushoufei2").prop("checked")) users[i].shifoushoufei=2;
        if($('.person'+(i+1)+" .shifoushoufei3").prop("checked")) users[i].shifoushoufei=3;
        if($('.person'+(i+1)+" .huifujijidu1").prop("checked")) users[i].huifujijidu=1;
        if($('.person'+(i+1)+" .huifujijidu2").prop("checked")) users[i].huifujijidu=2;
        if($('.person'+(i+1)+" .huifujijidu3").prop("checked")) users[i].huifujijidu=3;
        if($('.person'+(i+1)+" .zonghezhishu1").prop("checked")) users[i].zonghezhishu1=1;
        if($('.person'+(i+1)+" .zonghezhishu2").prop("checked")) users[i].zonghezhishu=2;
        if($('.person'+(i+1)+" .zonghezhishu3").prop("checked")) users[i].zonghezhishu=3;
        if($('.person'+(i+1)+" .zonghezhishu4").prop("checked")) users[i].zonghezhishu=4;
        if($('.person'+(i+1)+" .zonghezhishu5").prop("checked")) users[i].zonghezhishu=5;
    }
    return users;
}
function changeimg( obj ) {
    var _this = obj;
    var file = obj.files[0];
    //这里我们判断下类型如果不是图片就返回 去掉就可以上传任意文件
    if(!/image\/\w+/.test(file.type)){
        alert("请确保文件为图像类型");
        return false;
    }
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function(e){
        $(_this).prev().attr("src",this.result);
        console.log(this.result)
    }
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
//并在新窗口打开
function print(){
    showListstyleType();
    html2canvas( $("#long_picture") ,{
        onrendered: function(canvas){
            $("#picture").append(canvas);
            //$('#down_button').attr( 'href' , canvas.toDataURL() ) ;
            //$('#down_button').attr( 'download' , 'niurenbang.png' ) ;
            //$('#down_button').css('display','inline-block');
            //var html_canvas = canvas.toDataURL();
        }
    });
    var iWidth = 1000;
    var iHeight = 500;
    var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
    var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
    window.open("picture.html","生成图片","width="+iWidth+",height="+iHeight+",top="+iTop+",left="+iLeft+ ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
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