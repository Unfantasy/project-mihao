$(function(){
  //$(".head-select").sSelect();

  $(".share-tools .scan-mobile em").on("click",function(){
    $(".scan-dialog").show();
  });
  $(".code-close").on("click",function(){
    $(".scan-dialog").hide();
  });
  $(".share-tools .share").mouseenter(function(){
    $(this).addClass("drop-down");
    $(this).find("dl").show();
  }); 
  $(".share-tools .share").mouseleave(function(){
    $(this).removeClass("drop-down");
    $(this).find("dl").hide();
  }); 


  $(".high-chart").mouseleave(function(){
    $(this).hide();
  }).mouseenter(function(){
    $(this).show();
  }); 

  var $num1=$(".week-tabs li");
  $num1.mouseenter(function(){
  $(this).addClass("active").siblings("li").removeClass("active");
  var index=$num1.index(this);
  $(this).parents(".week-news").children("div").eq(index).show().siblings("div").hide();
  });
  //滚动后导航固定
   productRank();
    //  var bar_p = 0, bar_t=0,ass_top,pro_top,fot,sTimerh=0,sTimers=0;
    //$(window).scroll(function(){
    //        bar_p = $(window).scrollTop();
    //
    //    if(bar_t<=bar_p){//下滚
    //      $('#main_nav_wrapper_bar').css({'position':'static','visibility':'hidden'});
    //    }else{//上滚
    //      $('#main_nav_wrapper_bar').css({'position':'fixed','visibility':'visible'});
    //    }
    //    setTimeout(function(){bar_t = bar_p;},0);
    //     if(bar_p<=1){
    //        $('#main_nav_wrapper_bar').css({'position':'static'});
    //    }
    //    ass_top = $('.collect').position().top +30;
    //    if(bar_p >=ass_top){
    //       $('.share_box').slideUp();
    //    }else{
    //       $('.share_box').slideDown();
    //    }
    //  });
   

   //share
   share_box();
   $(window).resize(function(){
      share_box();
       productRank();
   });

})
 function lessThenIE8() {
        var UA = navigator.userAgent,
            isIE = UA.indexOf('MSIE') > -1,
            v = isIE ? /\d+/.exec(UA.split(';')[1]) : 'no ie';
        return v < 8;
    }

function productRank(){
var _left = ($('body').width() - 1000)/2 + 660+18
 $('#productRank-moudle').css({left: _left+'px'});
}

function share_box(){
  $('.share_box').css({'left':($(window).width() - 1000)/2 -50 +'px'});
}
//   tab切换
  function setTab(name,cursel,_obj,time){
      window['jjcsTimer']=setTimeout(function(){
         var $tabList=$('#'+name).find('li'),_index=$(_obj).index();
        $tabList.each(function(i,obj){
            if(_index==i){
                $(_obj).parent().find('li').removeClass('on');
                $('.'+name).hide().eq(_index).show();
                $(obj).addClass('on');
                return;
            }
        });
      },time)
      //当鼠标在规定时间内移开时，停止切换
      _obj.onmouseout=function(){clearTimeout(window['jjcsTimer']);}
  }

  function shareTSina(title, rLink, summary, site, pic) {
		window.open("http://service.weibo.com/share/share.php?title=" +
			encodeURIComponent(title.replace(/&nbsp;/g, " ").replace(/<br \/>/g, " ")) + "&url=" + encodeURIComponent(rLink) + '&summary=' +
			encodeURIComponent(summary) + '&site=' + encodeURIComponent(site));
	}

	function shareQzone(title, rLink, summary, site, pic) {
		window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?title=' +
			encodeURIComponent(title) + '&url=' + encodeURIComponent(rLink) + '&summary=' +
			encodeURIComponent(summary) + '&site=' + encodeURIComponent(site));
	};

	function shareRR(title, rLink, summary) {
		window.open('http://share.renren.com/share/buttonshare/post/1004?title=' + encodeURIComponent(title) + '&url=' +
			encodeURIComponent(rLink) + '&content=' + encodeURIComponent(summary));
	};

	function shareKX(title, rLink, summary) {
		window.open('http://www.kaixin001.com/repaste/bshare.php?rtitle=' + encodeURIComponent(title) + '&rurl=' + encodeURIComponent(rLink) + '&rcontent=' + encodeURIComponent(summary));
	};

	function shareQQweibo(title, rLink, site, pic) {
		window.open('http://v.t.qq.com/share/share.php?url=' + encodeURIComponent(rLink) + '&title=' + encodeURI(title) + '&appkey=' + encodeURI(site));
	};

	function shareQQWeiXin(e) {
		var $img_weixin = $(e).prevAll();
		if ($img_weixin.length === 0) {
			$img_weixin = $("<div id=\"div_weixin\" style=\"background: #fff;position: absolute;top: -35px;left: -182px;border: solid 1px #d8d8d8;padding: 20px;\">" +
				"	<div style=\"*width: 150px;_width: 150px;\">" +
				"		<span>分享到微信朋友圈</span>" +
				"		<a href=\"#\" onclick=\"javascript:this.parentNode.parentNode.style.display=\'none\';return false;\">×</a>" +
				"	</div>" +
				"	<img src=\"../../images/stock_dog_news.png\" style=\"margin: 15px 0;width: 140px;\"/>" +
				"	<div style=\"*width: 150px;_width: 150px;\">" +
				"		<p>打开微信</p>" +
				"		<p>使用“扫一扫”即可分享</p>" +
				"	</div>" +
				"</div>");
			$(e).after($img_weixin);
		} else {
			$(e).find("#div_weixin").show();
		}
	};












