/**
 * Created by zm on 2016/1/12.
 */
$(function(){
    /*var banner = Swipe(document.getElementById('mySwipe'), {
        auto: 2000,
        continuous: true,
        disableScroll: false
    });//轮播*/
    $('#mySwipe img').fsgallery();//全屏显示

    //地图
    // 创建Map对象
    var map = new BMap.Map("rent_map");
    // 地图初始化
    map.centerAndZoom("上海市",15);
    // 添加地图类型切换控件
    map.addControl(new BMap.MapTypeControl());
    // 添加比例尺控件
    map.addControl(new BMap.ScaleControl());
    // 添加平移缩放控件
    map.addControl(new BMap.NavigationControl());

    // 中鼎大厦定位
    // 1 创建百度地图的定位对象
    var geolocation = new BMap.Geolocation();
    // 2 调用getCurrentPosition()方法返回用户当前位置
    geolocation.getCurrentPosition(function(result){
        //console.log("中鼎大厦的经度: "+result.point.lng+", 维度: "+result.point.lat);
        // 1 创建标注对象
        var marker = new BMap.Marker(result.point);
        // 2 地图对象调用addOverlay()方法添加标注
        map.addOverlay(marker);
        var _initPoint = new BMap.Point(result.point.lng,result.point.lat);
        map.centerAndZoom(_initPoint,16);
    });

    /*//日期
    $("#checkin").jcDate({
        IcoClass : "jcDateIco",
        Event : "click",
        Speed : 100,
        Left : 0,
        Top : 28,
        format : "-",
        Timeout : 100
    });*/

});
