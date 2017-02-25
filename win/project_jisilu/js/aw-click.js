var pUsers =[{pUsername:"低姿态",pUsernameSrc:"indexuser-people.html",pUserHeadImgSrc:"images/avatar-mid-img.jpg",pTitle:"回测收益10%+，A130混合轮动模型发售",pTitleSrc:"indexuser-question.html"},{pUsername:"低姿态",pUsernameSrc:"",pUserHeadImgSrc:"images/avatar-mid-img.jpg",pTitle:"回测收益10%+，A130混合轮动模型发售",pTitleSrc:"aaa"},{pUsername:"低姿态",pUsernameSrc:"",pUserHeadImgSrc:"images/avatar-mid-img.jpg",pTitle:"回测收益10%+，A130混合轮动模型发售",pTitleSrc:"aaa"}];
//添加热门用户
$(".aw-no-border-bottom .aw-mod-body").empty()
for(var i=0;i<pUsers.length;i++){
    $(".aw-no-border-bottom .aw-mod-body").append('<dl><dt class="pull-left aw-border-radius-5"><a href="'+pUsers[i].pUsernameSrc+'"><img src="'+pUsers[i].pUserHeadImgSrc+'"/></a> </dt> <dd class="pull-left"><a href="'+pUsers[i].pUsernameSrc+'"class="aw-user-name"><strong>'+pUsers[i].pUsername+'</strong></a><br/><a href="'+pUsers[i].pTitleSrc+'"class="aw-user-name">'+pUsers[i].pTitle+'</a></dd></dl>');
}
//模拟服务端数据
var cards = [{title:"回测收益10%+，A130混合轮动模型发售",liulancishu:"523",category:"成功案例",fabushijian:"2015-11-13 14:00",headimgsrc1:"images/avatar-mid-img.jpg",headimgsrc1src:"indexuser-people.html",headimgsrc2:"images/avatar-mid-img.jpg",headimgsrc2src:"indexuser-people.html",headimgsrc3:"images/avatar-mid-img.jpg",headimgsrc3src:"indexuser-people.html"},{title:"回测收益10%+，A130混合轮动模型发售",liulancishu:"523",category:"成功案例",fabushijian:"2015-11-13 14:00",headimgsrc1:"images/avatar-mid-img.jpg",headimgsrc1src:"indexuser-people.html",headimgsrc2:"images/avatar-mid-img.jpg",headimgsrc2src:"indexuser-people.html",headimgsrc3:"images/avatar-mid-img.jpg",headimgsrc3src:"indexuser-people.html"},{title:"回测收益10%+，A130混合轮动模型发售",liulancishu:"523",category:"成功案例",fabushijian:"2015-11-13 14:00",headimgsrc1:"images/avatar-mid-img.jpg",headimgsrc1src:"indexuser-people.html",headimgsrc2:"images/avatar-mid-img.jpg",headimgsrc2src:"indexuser-people.html",headimgsrc3:"images/avatar-mid-img.jpg",headimgsrc3src:"indexuser-people.html"}];
//点击各个分类进入相应帖子数据
$(".quanbu").parent().click(function(){
    $(this).siblings().removeClass("active");
    $(this).addClass("active");
    //是干货数据，取相应数据
    // var cards = getCard(1);
    addCard(cards);
})
$(".ganhuoshuju").parent().click(function(){
    $(this).siblings().removeClass("active");
    $(this).addClass("active");
    //是干货数据，取相应数据
    // var cards = getCard(1);
    addCard(cards);
})
$(".chenggonganli").parent().click(function(){
    $(this).siblings().removeClass("active");
    $(this).addClass("active");
    //是干货数据，取相应数据
    // var cards = getCard(1);
    addCard(cards);
})

$(".caopanrizhi").parent().click(function(){
    $(this).siblings().removeClass("active");
    $(this).addClass("active");
    //是干货数据，取相应数据
    // var cards = getCard(1);
    addCard(cards);
})
$(".remen").parent().click(function(){
    $(this).siblings().removeClass("active");
    $(this).addClass("active");
    //是干货数据，取相应数据
    // var cards = getCard(1);
    addCard(cards);
})
$(".zuixin").parent().click(function(){
    $(this).siblings().removeClass("active");
    $(this).addClass("active");
    //是干货数据，取相应数据
    // var cards = getCard(1);
    addCard(cards);
})
//添加帖子方法
function addCard(cards){
    $(".aw-question-list").empty();
    for(var i=0;i<cards.length;i++){
        if(!cards[i].headimgsrc3){
            $(".aw-question-list").append('<div class="aw-item"><span class="aw-question-replay-count aw-border-radius-5 active"><em>'+cards[i].liulancishu+'</em>浏览</span> <div class="aw-questoin-content"><h4><a href="indexuser-question.html" target="_blank">'+cards[i].title+'</a></h4><span class="aw-text-color-999"><span class="aw-question-tags"><a >'+cards[i].category+'</a></span> • '+cards[i].fabushijian+' 发布</span><p class="pull-right"><span>浏览 : </span><a class="aw-user-name" href="'+cards[i].headimgsrc1src+'"><img src="'+cards[i].headimgsrc1+'"></a><a class="aw-user-name" href="'+cards[i].headimgsrc2src+'"><img src="'+cards[i].headimgsrc2+'"></a></p></div></div>');
        }else if(!cards[i].headimgsrc2){
            $(".aw-question-list").append('<div class="aw-item"><span class="aw-question-replay-count aw-border-radius-5 active"><em>'+cards[i].liulancishu+'</em>浏览</span> <div class="aw-questoin-content"><h4><a href="indexuser-question.html" target="_blank">'+cards[i].title+'</a></h4><span class="aw-text-color-999"><span class="aw-question-tags"><a >'+cards[i].category+'</a></span> • '+cards[i].fabushijian+' 发布</span><p class="pull-right"><span>浏览 : </span><a class="aw-user-name" href="'+cards[i].headimgsrc1src+'"><img src="'+cards[i].headimgsrc1+'"></a></p></div></div>');
        }else if(!cards[i].headimgsrc1){
            $(".aw-question-list").append('<div class="aw-item"><span class="aw-question-replay-count aw-border-radius-5 active"><em>'+cards[i].liulancishu+'</em>浏览</span> <div class="aw-questoin-content"><h4><a href="indexuser-question.html" target="_blank">'+cards[i].title+'</a></h4><span class="aw-text-color-999"><span class="aw-question-tags"><a >'+cards[i].category+'</a></span> • '+cards[i].fabushijian+' 发布</span></div></div>');
        }else{
            $(".aw-question-list").append('<div class="aw-item"><span class="aw-question-replay-count aw-border-radius-5 active"><em>'+cards[i].liulancishu+'</em>浏览</span> <div class="aw-questoin-content"><h4><a href="indexuser-question.html" target="_blank">'+cards[i].title+'</a></h4><span class="aw-text-color-999"><span class="aw-question-tags"><a >'+cards[i].category+'</a></span> • '+cards[i].fabushijian+' 发布</span><p class="pull-right"><span>浏览 : </span><a class="aw-user-name" href="'+cards[i].headimgsrc1src+'"><img src="'+cards[i].headimgsrc1+'"></a><a class="aw-user-name" href="'+cards[i].headimgsrc2src+'"><img src="'+cards[i].headimgsrc2+'"></a><a class="aw-user-name" href="'+cards[i].headimgsrc3src+'"><img src="'+cards[i].headimgsrc3+'"></a></p></div></div>');
        }

    }
}
//服务端获取帖子方法 0 全部 1 干货数据 2 成功案例 3 牛人榜单4 操盘日志
function getCard(n){
    switch (n){
        case 0:
            return null;
        break;
        case 1:
            return null;
        break;
        case 2:
            return null;
        break;
        case 3:
            return null;
        break;
        case 4:
            return null;
        break;
        default:
            alert("数据错误");
    }
}
//搜索事件
$("#aw-search-query").on("focus",function(){
    $(".aw-search-dropdown-box").css("display","block");
})
$("#aw-search-query").on("blur",function(){
    $(".aw-search-dropdown-box").css("display","none");
})
