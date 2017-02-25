/**
 * Created by zm on 2015/12/28.
 */
//鼠标悬浮在元素上面显示隐藏卡片框
function showDialog(selecter,button,dialog){
    var dialogHeight = dialog.outerHeight();
    var dialogWidth = dialog.outerWidth();
    var cardBoxTimeout,card_box_show;
    $(document).on('mouseover', selecter, function (){
        clearTimeout(cardBoxTimeout);
        var eleHeight = button.outerHeight();
        var eleWidth = button.outerWidth();
        var eleTop = button.offset().top;
        var eleLeft = button.offset().left;
        var scrollTop = $(window).scrollTop();
        var eleAbsTop = eleTop-scrollTop;
        card_box_show = setTimeout(function (){
            if(eleAbsTop>dialogHeight){
                var top = eleTop - dialogHeight;
                dialog.css({top:top,left:eleLeft}).fadeIn();
            }else{
                var top = eleTop + eleHeight;
                dialog.css({top:top,left:eleLeft}).fadeIn();
            }
        },300);
    });
    $(document).on('mouseout', selecter, function (){
        clearTimeout(card_box_show);
        cardBoxTimeout = setTimeout(function ()
        {
            dialog.fadeOut();
        }, 600);
    });
}
/*
function mouseover(selector,dialog){
    var selector = $(selector);
    var dialog = $("#"+dialog);
    var dialogHeight = dialog.outerHeight();
    var dialogWidth = dialog.outerWidth();
    var eleHeight = selector.outerHeight();
    var eleWidth = selector.outerWidth();
    var eleTop = selector.offset().top;
    var eleLeft = selector.offset().left;
    var scrollTop = $("body").scrollTop();
    var eleAbsTop = eleTop-scrollTop;
    if(eleAbsTop>dialogHeight){
        var top = eleTop - dialogHeight;
        dialog.css({top:top,left:eleLeft}).fadeIn();
    }else{
        var top = eleTop + eleHeight;
        dialog.css({top:top,left:eleLeft}).fadeIn();
    }
}
function mouseout(selector,dialog){
    var selector = $(selector);
    var dialog = $("#"+dialog);
    var dialogHeight = dialog.outerHeight();
    var dialogWidth = dialog.outerWidth();
    var eleHeight = selector.outerHeight();
    var eleWidth = selector.outerWidth();
    $(document).mousemove(function(e){
        var eleTop = selector.offset().top;
        var eleLeft = selector.offset().left;
        var scrollTop = $("body").scrollTop();
        var eleAbsTop = eleTop-scrollTop;
        var xx=e.pageX;
        var yy=e.pageY;
        if(eleAbsTop>dialogHeight){
            var top = eleTop - dialogHeight;
            if((xx>=0&&xx<=dialogWidth&&yy>=top&&yy<=eleTop)||(xx>=0&&xx<=eleWidth&&yy>=eleTop&&yy<=(eleTop+eleHeight))){}else{
                dialog.fadeOut();
            }
        }else{
            var top = eleTop + eleHeight;
            if((xx>=0&&xx<=dialogWidth&&yy>=top&&yy<=eleTop+dialogHeight)||(xx>=0&&xx<=eleWidth&&yy>=eleTop&&yy<=(eleTop+eleHeight))){}else{
                dialog.fadeOut();
            }
        }
    });
}*/



