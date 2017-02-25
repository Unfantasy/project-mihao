/**
 * Created by zm on 2016/1/19.
 */
function getAddr() {
    var map = document.getElementById("map");
    var val = document.getElementById("search_val").value;
    var a = 1;
    if (a == 1) {
        a = 2;
        initMap(val);
    }
    else {
        if (map.style.display == "none") {
            map.style.display = "block";
            initMap(val);
        } else {
            map.style.display = "none";
        }
    }
}

//创建和初始化地图函数：
function initMap(val) {
    if(val){
        createMaps(val);
    }else{
        creatcurrentMap();
    }
    //创建地图
    setMapEvent(); //设置地图事件
    var gc = new BMap.Geocoder();

    var opts = {
        width: 300,     // 信息窗口宽度    如果指定的宽度为0，则信息窗口的宽度将按照其内容自动调整
        height: 0,     // 信息窗口高度  如果指定的高度为0，则信息窗口的高度将按照其内容自动调整
        title: "", // 信息窗口标题
        enableMessage: false  //设置允许信息窗发送短息
        //message:"亲耐滴，晚上一起吃个饭吧？戳看下地址喔~"  //这个是指短信内容
    }
    map.addEventListener("click", function (e) {
        var pt = e.point;
        gc.getLocation(pt, function (rs) {
            var addComp = rs.addressComponents;
            var addr;
            addr = addComp.city + addComp.district + addComp.street + addComp.streetNumber;
            var infoWindow = new BMap.InfoWindow(addr, opts);
            map.clearOverlays(); //删除之前标注
            var marker = new BMap.Marker(pt);
            map.addOverlay(marker);
            marker.openInfoWindow(infoWindow);
            document.getElementById("lng").value = pt.lng;
            document.getElementById("lat").value = pt.lat;
        });
    });
}
//创建当前位置地图
function creatcurrentMap(){
    var map = new BMap.Map("map"); //在百度地图容器中创建一个地图
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
    window.map = map;//将map变量存储在全局
}
function createMaps(val) {
    var map = new BMap.Map("map"); //在百度地图容器中创建一个地图
    // 创建地址解析器实例
    var myGeo = new BMap.Geocoder();
    // 将地址解析结果显示在地图上,并调整地图视野
    myGeo.getPoint(val, function (point) {
        if (point) {
            map.centerAndZoom(point, 14);
        }
    }, val);
    window.map = map; //将map变量存储在全局
}
//地图事件设置函数：
function setMapEvent() {
    map.enableDragging(); //启用地图拖拽事件，默认启用(可不写)
    map.enableScrollWheelZoom(); //启用地图滚轮放大缩小
    map.enableDoubleClickZoom(); //启用鼠标双击放大，默认启用(可不写)
    map.enableKeyboard(); //启用键盘上下左右键移动地图
    map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
    map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
    map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
    map.addControl(new BMap.MapTypeControl());          //添加地图类型控件
}