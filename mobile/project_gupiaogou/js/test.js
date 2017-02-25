function showResult(e) {
    var t, n = voteId.length;
    return console.log("已完成第" + (vote.voteIndex + 1) + "次投票"), vote.voteIndex++, vote.voteIndex > n - 1 ? void console.log(n + "次全部投票完成") : (t = voteId[vote.voteIndex], void vote.clickEvent(t.optid, t.prjid, t.subjid, "showResult"))
}
function jsonp(e) {
    if (e = e || {}, e.url) {
        e.data = e.data || {}, e.cbName = e.cbName || "callback";
        var t = "jsonp" + Math.random();
        t = t.replace(".", ""), window[t] = function (t) {
            e.success && e.success(t), a.removeChild(n)
        }, e.data[e.cbName] = t;
        var n = document.createElement("script");
        n.src = e.url + "?" + json2url(e.data);
        var a = document.getElementsByTagName("head")[0];
        a.appendChild(n)
    }
}
function onBridgeReady() {
    WeixinJSBridge.on("menu:share:timeline", function (e) {
        var t = {
            img_width: "120",
            img_height: "120",
            img_url: shareData.img,
            link: shareData.link,
            desc: "",
            title: shareData.title
        };
        WeixinJSBridge.invoke("shareTimeline", t, function (e) {
            WeixinJSBridge.log(e.err_msg)
        })
    }), WeixinJSBridge.on("menu:share:weibo", function () {
        WeixinJSBridge.invoke("shareWeibo", {content: shareData.desc, url: shareData.link}, function (e) {
            WeixinJSBridge.log(e.err_msg)
        })
    }), WeixinJSBridge.on("menu:share:appmessage", function (e) {
        WeixinJSBridge.invoke("sendAppMessage", {
            img_width: "120",
            img_height: "120",
            img_url: shareData.img,
            link: shareData.link,
            desc: shareData.desc,
            title: shareData.title
        }, function (e) {
            WeixinJSBridge.log(e.err_msg)
        })
    })
}
try {
    document.domain = "qq.com"
} catch (e) {
}
var page = null, myScroll, isTrue = !0, userAgent = navigator.userAgent.toLowerCase(), isIos = userAgent.match(/iphone/), isqqnews = userAgent.match(/qqnews/), isAndroid = userAgent.match(/android/);
window.onload = function () {
    page = new Page, page.init()
};
var Page = function () {
    this.loadPage = $(".load-page"), this.wraper = $(".wraper"), this.layout = $(".layout"), this.coverPage = $(".cover"), this.contPage = $(".content")
};
Page.prototype = {
    init: function () {
        return this.start(), this
    }, lazyLoad: function (e, t) {
        var n = 0, a = e.length, o = new Image, i = function (e) {
            $(".progress").animate({height: e}, "slow"), "0%" == e && t()
        }, s = function () {
            return o.src = e[n], o.onload = function () {
                i(100 - Math.floor((n + 1) / a * 100) + "%"), n++, n < a ? s() : t()
            }, o
        };
        return a > 0 ? s() : i("100%"), {pics: e, load: s, progress: i}
    }, start: function () {
        var e = this;
        this.lazyLoad(loadPics, function () {
            setTimeout(function () {
                e.showCover(), Layout.init()
            }, 750)
        })
    }, showCover: function () {
        var e = this;
        e.loadPage.removeClass("fadeOut").addClass("fadeOut"), e.coverPage.show(), setTimeout(function () {
            e.loadPage.hide(), setTimeout(function () {
                e.coverPage.find(".swipe-tip").show().removeClass("fadeOutUp").addClass("fadeOutUp")
            }, 250)
        }, 250)
    }
};
var vote = {
    arrData: [], voteIndex: 0, getCookie: function (e) {
        var t = document.cookie.match(new RegExp("(^| )" + e + "=([^;]*)(;|$)"));
        return null !== t ? window.unescape(t[2]) : null
    }, generateToken: function (e) {
        var t = 2013;
        if (e)for (var n = 0, a = e.length; n < a; n++)t += (t << 5) + e.charCodeAt(n);
        return 2147483647 & t
    }, getKey: function () {
        return this.getCookie("skey") || this.getCookie("lskey")
    }, submit: function (e, t) {
        var n = "post_iframe";
        $("#post_iframe").length || $("body").append('<iframe id="post_iframe" name="post_iframe" style="display:none"><script>document.domain = "qq.com";</script></iframe>');
        var a = $("#_messageform").length ? $("#_messageform").attr("action", e).empty() : $('<form action="' + e + '" method="post" target="' + n + '" id="_messageform" style="display:none;"></form>').appendTo($("body"));
        for (var o in t)a.append($('<input name="' + o + '" type="hidden" value="" />').val(t[o]));
        a.submit()
    }, getData: function (e, t) {
        var n = this;
        $.ajax({
            url: "http://panshi.qq.com/v2/vote/" + e + "?source=1&callback=?",
            dataType: "jsonp",
            success: function (e) {
                n.showContent(e.data.subject[0].option, t)
            }
        })
    }, showContent: function (e, t) {
        var n = this;
        $.each(e, function (e, t) {
            n.arrData[e] = {name: t.title, num: t.selected, percent: t.percent, theme: t.theme}
        }), n.arrData = n.arrData.sort(function (e, t) {
            return e.num < t.num ? 1 : -1
        }), $(".awardList dl").eq(t).find("dd").each(function (e, t) {
            $(t).find(".hd").css({background: "url(" + n.arrData[e].theme + ") 0 0/cover no-repeat"}), $(t).find(".bd h3").html(n.arrData[e].name), $(t).find(".bd p").html(n.arrData[e].percent + "%")
        })
    }, showResult: function () {
        console.log("111");
        var e, t = voteId.length;
        return console.log("已完成" + (vote.voteIndex + 1) + "次投票"), vote.voteIndex++, vote.voteIndex > t - 1 ? void console.log(t + "次全部投票完成") : (e = voteId[vote.voteIndex], void vote.clickEvent(e.optid, e.prjid, e.subjid, "showResult"))
    }, clickEvent: function (e, t, n, a) {
        var o = this, i = {};
        i[n] = {selected: [e]}, data = {
            answer: JSON.stringify(i),
            login: 1,
            source: 1,
            g_tk: o.generateToken(o.getKey()),
            format: "script",
            callback: "parent." + a
        }, o.submit("http://panshi.qq.com/v2/vote/" + t + "/submit", data)
    }, init: function () {
        $.each(voteId, function (e, t) {
            vote.getData(t.prjid, e)
        })
    }
}, Layout = {
    timer: null,
    awardIndex: 0,
    awardBox: $(".award-box"),
    resultBox: $(".result-box"),
    resultNameArr: [],
    resultImgArr: [],
    page: function (e, t) {
        page.layout.removeClass("prev curr next"), 0 == e ? page.layout.eq(e).addClass("curr").next().addClass("next") : e == t ? page.layout.eq(e).addClass("curr").prev().addClass("prev") : page.layout.eq(e).addClass("curr").prev().addClass("prev").next().next().addClass("next")
    },
    swipe: function (e) {
        var t, n = this;
        page.layout.each(function (a, o) {
            $(o).off().on("swipeUp", function () {
                t = a < e - 1 ? a + 1 : a, n.page(t, e), page.layout.eq(t).find(".inner").show().removeClass("fadeInUp").addClass("fadeInUp"), t == e - 1 ? n.showLastPage(t) : setTimeout(function () {
                    page.layout.eq(t).find(".swipe-tip").show().addClass("fadeOutUp")
                }, 250)
            }).on("swipeDown", function () {
                t = a > 0 ? a - 1 : 0, n.page(t, e)
            })
        })
    },
    showLastPage: function (e) {
        var t = this;
        page.layout.eq(e).off("swipeDown swipeUp"), t.showAward(), t.selectAward()
    },
    showAward: function () {
        var e = this, t = this.awardBox.length;
        e.awardBox.removeClass("on").eq(e.awardIndex).addClass("on"), e.awardIndex++, setTimeout(function () {
            e.showTip(e.awardIndex)
        }, 1500), e.awardIndex > t && (e.resultBox.find("li").each(function (t, n) {
            $(n).find("img").attr("src", e.resultImgArr[t]), $(n).find("p").html(e.resultNameArr[t])
        }), setTimeout(function () {
            e.awardBox.removeClass("on"), e.resultBox.addClass("on"), setTimeout(vote.init, 100)
        }, 30))
    },
    selectAward: function () {
        var e, t, n, a, o, i = this;
        $(".award-box li").find("img").off().on("click", function () {
            e = $(this).parent().parent(), t = e.parent().parent().data("index"), o = e.data("optid"), n = e.find("h3").html(), a = e.find("img").attr("src"), i.resultNameArr.push(n), i.resultImgArr.push(a), voteId[t].optid = o.toString(), setTimeout(function () {
                i.showAward(), clearTimeout(i.timer)
            }, 50)
        })
    },
    showTip: function (e) {
        function t(e) {
            return e.sort(function () {
                return .5 - Math.random()
            })
        }

        function n() {
            s >= d && (s = 0, i = t(i)), r.removeClass("on").eq(i[s]).addClass("on"), s++, o.timer = setTimeout(n, 2e3)
        }

        var a, o = this, i = [], s = 0, r = this.awardBox.eq(e - 1).find(".hd"), d = r.length;
        for (a = 0; a < d; a++)i.push(a);
        i = t(i), n()
    },
    addEvent: function () {
        var e = this, t = voteId[vote.voteIndex];
        $(".enstart-btn").off().on("click", function () {
            vote.clickEvent(t.optid, t.prjid, t.subjid, "showResult"), setTimeout(function () {
                myScroll = new IScroll("#wrapper", {probeType: 3, scrollbars: !1, useTransform: !1, click: !0})
            }, 50), $(".popup").show()
        }), $(".restart-btn").off().on("click", function () {
            e.awardIndex = 0, e.resultImgArr = [], e.resultNameArr = [], e.resultBox.removeClass("on"), e.showAward(), e.selectAward()
        }), $(".btn.share-btn").off().on("click", function () {
            window.TencentNews ? window.TencentNews && window.TencentNews.showShareMenu ? window.TencentNews.showShareMenu(shareData.link, shareData.title, shareData.desc, shareData.img, "news_news_wc") : window.TencentNews.shareFromWebView(shareData.title, shareData.desc, shareData.img) : ($(".share-mask").show(), $(".share-mask").off().on("click", function () {
                $(this).hide()
            }))
        })
    },
    init: function () {
        var e = this, t = page.layout.length;
        e.page(0, t), e.swipe(t), e.addEvent()
    }
};
$.getScript = function (e, t) {
    var n = document.createElement("script");
    n.async = "asunc", n.src = e, t && (n.onload = t), document.getElementsByTagName("body")[0].appendChild(n)
}, function (e) {
    $.getScript("http://mat1.gtimg.com/www/js/newsapp/jsapi/news.js?_tsid=1", function () {
        var e = !1, t = null;
        !function () {
            var n = window.navigator.userAgent.toLowerCase();
            !!/iphone/i.test(n), !!/android/i.test(n);
            t = setInterval(function () {
                window.TencentNews && window.TencentNews.setGestureQuit ? (window.TencentNews.setGestureQuit(!0), e && clearInterval(t)) : clearInterval(t)
            }, 20)
        }()
    })
}(Zepto), window.addEventListener("load", function () {
    var e = null;
    e = setTimeout(function () {
        window.TencentNews && (window.TencentNews && window.TencentNews.setShareArticleInfo ? window.TencentNews.setShareArticleInfo(shareData.title, shareData.title, shareData.desc, shareData.link, shareData.img) : window.TencentNews.shareFromWebView(shareData.title, shareData.title, shareData.desc, shareData.link, shareData.img), window.TencentNews.setGestureQuit && (window.TencentNews.setGestureQuit(!0) || window.TencentNews.setGestureQuit(1)))
    }, 300)
}, !1), document.addEventListener("WeixinJSBridgeReady", function () {
    onBridgeReady()
}), document.addEventListener("touchmove", function (e) {
    e.preventDefault()
});
/*  |xGv00|705a51b84686a22e7828ccc9277168ee */