//根据星级画出不同的比例图 selector为jq选择器
//注意，，canvas的width:938 height:696
function getScale(selector,a,b,c,d,e,f){
    //canvas绘图1
    var canvas = $(selector)[0];
    var context = canvas.getContext("2d");
    //绘制外六边形
    context.beginPath();
    context.fillStyle = "#FBA9A0";
    context.moveTo(291,158);
    context.lineTo(533,93);
    context.lineTo(716,274);
    context.lineTo(649,517);
    context.lineTo(404,583);
    context.lineTo(224,405);
    context.lineTo(291,158);
    context.fill();
    context.closePath();
//绘制6个小圆
    context.beginPath();
    context.fillStyle = "#FF0624";
    context.arc(275,150,4,0,Math.PI*2,false);
    context.fill();
    context.closePath();
    context.beginPath();
    context.fillStyle = "#FF0624";
    context.arc(540,79,4,0,Math.PI*2,false);
    context.fill();
    context.closePath();
    context.beginPath();
    context.fillStyle = "#FF0624";
    context.arc(731,270,4,0,Math.PI*2,false);
    context.fill();
    context.closePath();
    context.beginPath();
    context.fillStyle = "#FF0624";
    context.arc(661,527,4,0,Math.PI*2,false);
    context.fill();
    context.closePath();
    context.beginPath();
    context.fillStyle = "#FF0624";
    context.arc(398,602,4,0,Math.PI*2,false);
    context.fill();
    context.closePath();
    context.beginPath();
    context.fillStyle = "#FF0624";
    context.arc(207,411,4,0,Math.PI*2,false);
    context.fill();
    context.closePath();
//绘制6条线
    context.beginPath();
    context.strokeStyle = "#F08071";
    context.moveTo(291,158);
    context.lineTo(469,339);
    context.moveTo(533,93);
    context.lineTo(469,339);
    context.moveTo(716,274);
    context.lineTo(469,339);
    context.moveTo(649,517);
    context.lineTo(469,339);
    context.moveTo(404,583);
    context.lineTo(469,339);
    context.moveTo(224,405);
    context.lineTo(469,339);
    context.stroke();
    context.closePath();
    context.fillStyle = "#B8B3AD";
    context.font = "37px Arial";
    context.fillText("文章频率",107,163);
    context.fillText("模拟收益率",559,94);
    context.fillText("自媒体影响",755,286);
    context.fillText("专注度",679,543);
    context.fillText("是否收费",416,618);
    context.fillText("回复积极度",10,423);
    //根据级数绘制内部粉色区域
    switch(a){
        case 1:
            a=[407,275];
            break;
        case 2:
            a=[366,235];
            break;
        case 3:
            a=[321,188];
            break;

        default :
            a=[407,275];
    }
    switch(b){
        case 1:
            b=[491,257];
            break;
        case 2:
            b=[507,197]
            break;
        case 3:
            b=[523,143]
            break;
        default :
            b=[491,257];
    }
    switch(c){
        case 1:
            c=[537,322];
            break;
        case 2:
            c=[612,300]
            break;
        case 3:
            c=[675,283]
            break;
        default :
            c=[537,322]
    }
    switch(d){
        case 1:
            d=[526,394]
            break;
        case 2:
            d=[579,449]
            break;
        case 3:
            d=[610,480]
            break;
        default :
            d=[526,394]
    }
    switch(e){
        case 1:
            e=[451,407]
            break;
        case 2:
            e=[435,472]
            break;
        case 3:
            e=[419,537]
            break;
        default :
            e=[451,407]
    }
    switch(f){
        case 1:
            f=[410,355]
            break;
        case 2:
            f=[349,370]
            break;
        case 3:
            f=[289,388]
            break;
        default :
            f=[410,355]
    }
//绘制内部粉色区域
    context.beginPath();
    context.fillStyle = "rgba(255,0,0,0.3)";
    context.moveTo(a[0],a[1]);
    context.lineTo(b[0],b[1]);
    context.lineTo(c[0],c[1]);
    context.lineTo(d[0],d[1]);
    context.lineTo(e[0],e[1]);
    context.lineTo(f[0],f[1]);
    context.lineTo(a[0],a[1]);
    context.fill();
    context.closePath();
}

//根据不同的宽高，星级画比例图selector为jq对象
function getScale1(selector,a,b,c,d,e,f){
    //canvas绘图1
    var width = selector.width();
    var height = parseInt(width/1.3477);
    selector.attr("height",height);
    selector.attr("width",width);
    var canvas = selector[0];
    var context = canvas.getContext("2d");
    //绘制外六边形
    context.beginPath();
    context.fillStyle = "#FBA9A0";
    context.moveTo(.31*width,.227*height);
    context.lineTo(.568*width,.1336*height);
    context.lineTo(.763*width,.3936*height);
    context.lineTo(.692*width,.7428*height);
    context.lineTo(.431*width,.8376*height);
    context.lineTo(.239*width,.5819*height);
    context.lineTo(.31*width,.227*height);
    context.fill();
    context.closePath();
//绘制6个小圆
    context.beginPath();
    context.fillStyle = "#FF0624";
    context.arc(.293*width,.2155*height,3,0,Math.PI*2,false);
    context.fill();
    context.closePath();
    context.beginPath();
    context.fillStyle = "#FF0624";
    context.arc(.5757*width,.1135*height,3,0,Math.PI*2,false);
    context.fill();
    context.closePath();
    context.beginPath();
    context.fillStyle = "#FF0624";
    context.arc(.779*width,.3879*height,3,0,Math.PI*2,false);
    context.fill();
    context.closePath();
    context.beginPath();
    context.fillStyle = "#FF0624";
    context.arc(.7047*width,.7572*height,3,0,Math.PI*2,false);
    context.fill();
    context.closePath();
    context.beginPath();
    context.fillStyle = "#FF0624";
    context.arc(.4243*width,.8649*height,3,0,Math.PI*2,false);
    context.fill();
    context.closePath();
    context.beginPath();
    context.fillStyle = "#FF0624";
    context.arc(.2207*width,.5905*height,3,0,Math.PI*2,false);
    context.fill();
    context.closePath();
//绘制6条线
    context.beginPath();
    context.strokeStyle = "#F08071";
    context.moveTo(.3102*width,.227*height);
    context.lineTo(.5*width,.487*height);
    context.moveTo(.568*width,.1336*height);
    context.lineTo(.5*width,.487*height);
    context.moveTo(.7633*width,.3936*height);
    context.lineTo(.5*width,.487*height);
    context.moveTo(.6919*width,.7428*height);
    context.lineTo(.5*width,.487*height);
    context.moveTo(.4307*width,.8376*height);
    context.lineTo(.5*width,.487*height);
    context.moveTo(.2388*width,.5819*height);
    context.lineTo(.5*width,.487*height);
    context.stroke();
    context.closePath();
    context.fillStyle = "#B8B3AD";
    context.font = .0395*width+ "px Arial";
    context.fillText("文章频率",.114*width,.234*height);
    context.fillText("模拟收益率",.5959*width,.135*height);
    context.fillText("自媒体影响",.805*width,.411*height);
    context.fillText("专注度",.724*width,.78*height);
    context.fillText("是否收费",.4435*width,.8879*height);
    context.fillText("回复积极度",.01066*width,.6077*height);
    //根据级数绘制内部粉色区域
    switch(a){
        case 1:
            a=[.434*width,.395*height];
            break;
        case 2:
            a=[.39*width,.3376*height];
            break;
        case 3:
            a=[.3422*width,.27*height];
            break;

        default :
            a=[.434*width,.395*height];
    }
    switch(b){
        case 1:
            b=[.5234*width,.3692*height];
            break;
        case 2:
            b=[.5405*width,.283*height];
            break;
        case 3:
            b=[.5576*width,.2054*height];
            break;
        default :
            b=[.5234*width,.3692*height];
    }
    switch(c){
        case 1:
            c=[.5725*width,.4626*height];
            break;
        case 2:
            c=[.6524*width,.431*height];
            break;
        case 3:
            c=[.7196*width,.4066*height];
            break;
        default :
            c=[.5725*width,.4626*height];
    }
    switch(d){
        case 1:
            d=[.5607*width,.566*height];
            break;
        case 2:
            d=[.617*width,.645*height];
            break;
        case 3:
            d=[.6503*width,.6896*height];
            break;
        default :
            d=[.5607*width,.566*height];
    }
    switch(e){
        case 1:
            e=[.4808*width,.5847*height];
            break;
        case 2:
            e=[.4637*width,.678*height];
            break;
        case 3:
            e=[.4467*width,.7715*height];
            break;
        default :
            e=[.4808*width,.5847*height];
    }
    switch(f){
        case 1:
            f=[.4371*width,.51*height];
            break;
        case 2:
            f=[.3720*width,.5316*height];
            break;
        case 3:
            f=[.3081*width,.5575*height];
            break;
        default :
            f=[.4371*width,.51*height];
    }
//绘制内部粉色区域
    context.beginPath();
    context.fillStyle = "rgba(255,0,0,.3)";
    context.moveTo(a[0],a[1]);
    context.lineTo(b[0],b[1]);
    context.lineTo(c[0],c[1]);
    context.lineTo(d[0],d[1]);
    context.lineTo(e[0],e[1]);
    context.lineTo(f[0],f[1]);
    context.lineTo(a[0],a[1]);
    context.fill();
    context.closePath();
}
