/**
 * Created by zm on 2016/11/18.
 */
var DOMAIN = 'http://mimikj.com:6060/mimikj/';
var stockIndex = null;
var zmToken = null;
$(function () {
    //解析数据
    stockIndex = theRequest['stock_index'];
    zmToken = theRequest['auth_token'];
    switch(stockIndex){
        case 'ppi':
            var ppiHeadHtml = null;
            ppiHeadHtml = '<tr><td>月份</td> <td>同比增长</td></tr>';
            $("body").addClass('ppi');
            $(".indexTable thead").html(ppiHeadHtml);
            $("title").text('PPI');
            $.get(DOMAIN+'/cjsj_index/'+stockIndex+'/list',{auth_token:zmToken},function(data){
                if(data.state=='success'){
                    var result = data.result;
                    var charts = [];
                    $('.titleData').html(result[0].value2);
                    $('.titleDescription').html(result[0].month);
                    $(".indexTable tbody").empty();
                    for(var i=0;i<result.length;i++){
                        var month = null;
                        var ppiBodyHtml = null;
                        var xValue = null;
                        var yValue = null;
                        month = result[i].month.indexOf('份')?result[i].month.replace('份',''):result[i].month;
                        ppiBodyHtml = '<tr class="borderBottom"><td class="stockTime">'+month+'</td><td class="num zmUp">'+result[i].value2+'</td></tr>';
                        $(".indexTable tbody").append(ppiBodyHtml);
                        xValue = month;
                        yValue = Number(result[i].value2.replace('%',''))||0;
                        charts.unshift({xValue:xValue,yValue:yValue});
                    }
                    //画图表
                    drawStockChart(charts,'月份','同比增长');
                }else if(data.msg=='no_user'){
                    showTip('此用户不存在');
                }else if(data.msg=='open_id_is_null'){
                    showTip('出错了[code:001]');
                }else{
                    showTip('出错了，请返回重试');
                }
            }).error(function(){showTip('获取失败，请返回重试');$('body').html('');});
            break;
        case 'bdi':
            var bdiHeadHtml = null;
            bdiHeadHtml = '<tr><td>关联个股</td><td>最新价</td>  <td>涨跌百分比</td></tr>';
            $(".indexTable thead").html(bdiHeadHtml);
            $("title").text('BDI');
            $.get(DOMAIN+'/bdi_data/list',{auth_token:zmToken},function(data){
                if(data.state=='success'){
                    var aboutStock = null;
                    var bdiData = null;
                    var charts = [];
                    var a = null;
                    var percentA = null;
                    var titleDescription = null;
                    aboutStock = data.result.about_stocks;
                    bdiData = data.result.bdi_data;
                    $('.titleData').html(bdiData[bdiData.length-1].bdi_index);
                    a = Number(bdiData[bdiData.length-1].bdi_index - bdiData[bdiData.length-2].bdi_index).toFixed(2);
                    if(a>0)a='+'+a;
                    percentA = parseInt((a/bdiData[bdiData.length-2].bdi_index)*10000)/100;
                    if(percentA>0)percentA = '+'+percentA;
                    titleDescription = a+" （"+percentA+"%）";
                    $('.titleDescription').html(titleDescription).addClass('zmUp');
                    $(".indexTable tbody").empty();
                    for(var i=0;i<aboutStock.length;i++){
                        var month = null;
                        var cpiBodyHtml = null;
                        var xValue = null;
                        var yValue = null;
                        cpiBodyHtml = '<tr class="borderBottom"><td class="stockTime"><p class="stockName">'+aboutStock[i].name+'</p><p class="stockNum zmGray">'+aboutStock[i].symbol+'</p></td><td class="num zmUp">'+aboutStock[i].price+'</td><td class="num zmUp">'+aboutStock[i].change_percent+'%</td></tr>';
                        $(".indexTable tbody").append(cpiBodyHtml);

                    }
                    for(var j=0;j<bdiData.length;j++){
                        xValue = new Date(Number(bdiData[j].time)||null).format('MM月dd日');
                        yValue = Number(bdiData[j].bdi_index);
                        charts.push({xValue:xValue,yValue:yValue});
                    }
                    //画图表
                    drawStockChart(charts,'时间','指数','bdi');
                    $("tbody tr").click(function(){
                        var stockName = $(this).find('.stockName').text();
                        var stockNum = $(this).find('.stockNum').text();
                        var stock = {stockName:stockName,stockNum:stockNum};
                        //console.log('click');
                        if(isIOS){
                            //ios
                            setupWebViewJavascriptBridge(function(bridge) {
                                bridge.callHandler('sendStock', stock, function() {});
                            });
                        } else{
                            //android
                            //alert('stockName:'+stock.stockName+'stockNum:'+stock.stockNum);
                            appTool.jumpToDetail(stock.stockName,stock.stockNum);
                        }
                    });


                }else if(data.msg=='no_user'){
                    showTip('此用户不存在');
                }else if(data.msg=='open_id_is_null'){
                    showTip('出错了[code:001]');
                }else{
                    showTip('出错了，请返回重试');
                }
            }).error(function(){showTip('获取失败，请返回重试');$('body').html('');});
            break;
        case 'pmi':
            var pmiHeadHtml = null;
            pmiHeadHtml = '<tr><td>月份</td><td>数值</td>  <td>同比增长</td></tr>';
            $("body").addClass('pmi');
            $(".indexTable thead").html(pmiHeadHtml);
            $("title").text('PMI');
            $.get(DOMAIN+'/cjsj_index/'+stockIndex+'/list',{auth_token:zmToken},function(data){
                if(data.state=='success'){
                    var result = data.result;
                    var charts = [];
                    $('.titleData').html(result[0].value1);
                    $('.titleDescription').html(result[0].month);
                    $(".indexTable tbody").empty();
                    for(var i=0;i<result.length;i++){
                        var month = null;
                        var pmiBodyHtml = null;
                        var xValue = null;
                        var yValue = null;
                        month = result[i].month.indexOf('份')?result[i].month.replace('份',''):result[i].month;
                        pmiBodyHtml = '<tr class="borderBottom"><td class="stockTime">'+month+'</td><td class="num zmUp">'+result[i].value1+'</td><td class="num zmUp">'+result[i].value2+'</td></tr>';
                        $(".indexTable tbody").append(pmiBodyHtml);
                        xValue = month;
                        yValue = Number(result[i].value1.replace('%',''))||0;
                        charts.unshift({xValue:xValue,yValue:yValue});
                    }
                    //画图表
                    drawStockChart(charts,'月份','数值',true);
                }else if(data.msg=='no_user'){
                    showTip('此用户不存在');
                }else if(data.msg=='open_id_is_null'){
                    showTip('出错了[code:001]');
                }else{
                    showTip('出错了，请返回重试');
                }
            }).error(function(){showTip('获取失败，请返回重试');$('body').html('');});
            break;
        case 'cpi':
            var cpiHeadHtml = null;
            cpiHeadHtml = '<tr><td>月份</td><td>同比增长</td>  <td>环比增长</td></tr>';
            $("body").addClass('cpi');
            $(".indexTable thead").html(cpiHeadHtml);
            $("title").text('CPI');
            $.get(DOMAIN+'/cjsj_index/'+stockIndex+'/list',{auth_token:zmToken},function(data){
                if(data.state=='success'){
                    var result = data.result;
                    var charts = [];
                    $('.titleData').html(result[0].value1);
                    $('.titleDescription').html(result[0].month);
                    $(".indexTable tbody").empty();
                    for(var i=0;i<result.length;i++){
                        var month = null;
                        var cpiBodyHtml = null;
                        var xValue = null;
                        var yValue = null;
                        month = result[i].month.indexOf('份')?result[i].month.replace('份',''):result[i].month;
                        cpiBodyHtml = '<tr class="borderBottom"><td class="stockTime">'+month+'</td><td class="num zmUp">'+result[i].value1+'</td><td class="num zmUp">'+result[i].value2+'</td></tr>';
                        $(".indexTable tbody").append(cpiBodyHtml);
                        xValue = month;
                        yValue = Number(result[i].value1.replace('%',''))||0;
                        charts.unshift({xValue:xValue,yValue:yValue});
                    }
                    //画图表
                    drawStockChart(charts,'月份','同比增长');
                }else if(data.msg=='no_user'){
                    showTip('此用户不存在');
                }else if(data.msg=='open_id_is_null'){
                    showTip('出错了[code:001]');
                }else{
                    showTip('出错了，请返回重试');
                }
            }).error(function(){showTip('获取失败，请返回重试');$('body').html('');});
            break;
        case 'gdp':
            var gdpHeadHtml = null;
            gdpHeadHtml = '<tr><td>季度</td><td>绝对值(亿元)</td>  <td>同比增长</td></tr>';
            $("body").addClass('gdp');
            $(".indexTable thead").html(gdpHeadHtml);
            $("title").text('GDP');
            $.get(DOMAIN+'/cjsj_index/'+stockIndex+'/list',{auth_token:zmToken},function(data){
                if(data.state=='success'){
                    var result = data.result;
                    var charts = [];
                    $('.titleData').html(result[0].value2);
                    $('.titleDescription').html(result[0].month);
                    $(".indexTable tbody").empty();
                    for(var i=0;i<result.length;i++){
                        var month = null;
                        var gdpBodyHtml = null;
                        var xValue = null;
                        var yValue = null;
                        month = result[i].month.indexOf('份')?result[i].month.replace('份',''):result[i].month;
                        gdpBodyHtml = '<tr class="borderBottom"><td class="stockTime">'+month+'</td><td class="num zmUp">'+result[i].value1+'</td><td class="num zmUp">'+result[i].value2+'</td></tr>';
                        $(".indexTable tbody").append(gdpBodyHtml);
                        xValue = month;
                        yValue = Number(result[i].value2.replace('%',''))||0;
                        charts.unshift({xValue:xValue,yValue:yValue});
                    }
                    //画图表
                    drawStockChart(charts,'季度','同比增长');
                }else if(data.msg=='no_user'){
                    showTip('此用户不存在');
                }else if(data.msg=='open_id_is_null'){
                    showTip('出错了[code:001]');
                }else{
                    showTip('出错了，请返回重试');
                }
            }).error(function(){showTip('获取失败，请返回重试');$('body').html('');});
            break;
    }
});
