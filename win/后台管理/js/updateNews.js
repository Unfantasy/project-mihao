//服务端获取信息
$(document).ready(function() {
    var news = [{
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "2日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "3日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "4日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "5日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "6日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "7日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "8日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    },  {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "8日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "8日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "8日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "8日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "8日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "8日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "8日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    },{
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "9日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "10日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {
        src: "images/icon.png",
        title: "游资和机构龙虎榜",
        content: "11日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."
    }, {src: "images/icon.png", title: "游资和机构龙虎榜", content: "24日简评:红尘滚滚,人气鼎沸,牛头继续高高昂起.昨两市再度跳空上行,个股普My english job..."}];
    for(var i=0;i<news.length;i++){
        news[i].content = news[i].content.replace(/<[^>]+>/g,"");
    }
    //分页显示
    if (news.length <= 7) {
        for (var i = 0; i < news.length; i++) {
            var content;
            if (news[i].content.length <= 40) {
                content = news[i].content;
            } else {
                content = news[i].content.substr(0, 37) + "...";
            }
            $(".row-fluid .table tbody").append('<tr class=""><td><div class="img"><img src="' + news[i].src + '" /></div><a href="#" class="name">' + news[i].title + '</a></td><td class="description">' + content + '</td><td><span class="label label-success"></span><ul class="actions"><li class="last"><a href="#" onclick="setHiddenState()">删 除</a></li></ul></td></tr>')
        }
        $(".pagination").append('<ul><li><a href="#">&#8249;</a></li><li class="pages"><a class="active">1</a></li ><li><a href="#">&#8250;</a></li></ul>');
    } else {
        for (var i = 0; i < 7; i++) {
            var content;
            if (news[i].content.length <= 40) {
                content = news[i].content;
            } else {
                content = news[i].content.substr(0, 37) + "...";
            }
            $(".row-fluid .table tbody").append('<tr class=""><td><div class="img"><img src="' + news[i].src + '" /></div><a href="#" class="name">' + news[i].title + '</a></td><td class="description">' + content + '</td><td><span class="label label-success"></span><ul class="actions"><li class="last"><a href="#" onclick="setHiddenState()">删 除</a></li></ul></td></tr>')
        }
        $(".pagination").append('<ul><li ><a href="#">&#8249;</a></li><li class="pages"><a class="active " >1</a></li></ul>');
        for(var j=2;j<news.length/7+1;j++){
            $(".pagination ul").append('<li  class="pages"><a href="#">'+j+'</a></li>');
        }
        $(".pagination ul").append('<li><a href="#">&#8250;</a></li>');

    }
    //对页码添加点击事件
    $(".pagination .pages a").click(function(){
        var page = $(this).text();
        //$(this).attr("class","active");
        //$(this).parent().siblings().child().attr("class","");
        $(".row-fluid .table tbody").empty();
        var start = news[(page-1)*7];
        if(news.length-7*(page-1)>=7){
            for (var i = 0; i < 7; i++) {
                var content;
                var theNew = news[(page-1)*7+i];
                if (theNew.content.length <= 40) {
                    content = theNew.content;
                } else {
                    content = theNew.content.substr(0, 37) + "...";
                }
                $(".row-fluid .table tbody").append('<tr class=""><td><div class="img"><img src="' + theNew.src + '" /></div><a href="#" class="name">' + theNew.title + '</a></td><td class="description">' + content + '</td><td><span class="label label-success"></span><ul class="actions"><li class="last"><a href="#" onclick="setHiddenState()">删 除</a></li></ul></td></tr>')
            }
        }else{
            for(i=0;i<news.length-7*(page-1);i++){
                var content;
                var theNew = news[(page-1)*7+i];
                if (theNew.content.length <= 40) {
                    content = theNew.content;
                } else {
                    content = theNew.content.substr(0, 37) + "...";
                }
                $(".row-fluid .table tbody").append('<tr class=""><td><div class="img"><img src="' + theNew.src + '" /></div><a href="#" class="name">' + theNew.title + '</a></td><td class="description">' + content + '</td><td><span class="label label-success"></span><ul class="actions"><li class="last"><a href="#" onclick="setHiddenState()">删 除</a></li></ul></td></tr>')
            }
        }

    });
})
