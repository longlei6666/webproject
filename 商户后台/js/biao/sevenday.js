// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('sevenday'));
// 指定图表的配置项和数据
var option = {
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            crossStyle: {
                color: '#999'
            }
        }
    },
    toolbox: {
        feature: {
            magicType: {show: true, type: ['line', 'bar']},
            restore: {show: true},
            saveAsImage: {show: true}
        }
    },
    legend: {
        data:['微信交易金额', '支付宝交易金额', '微信交易笔数', '支付宝交易笔数']
    },
    xAxis: [
        {
            type: 'category',
            data: ['1月','2月','3月','4月','5月','6月','7月'],
            axisPointer: {
                type: 'shadow'
            }
        }
    ],
    yAxis: [
        {
            type: 'value',
            name: '微信交易金额',
            interval: 500,
            axisLabel: {
                formatter: '¥{value}'
            }
        },
        {
            type: 'value',
            name: '支付宝交易金额',
            interval: 50,
            axisLabel: {
                formatter: '{value}笔'
            }
        }
    ],
    series: [
        {
            name:'微信交易金额',
            type:'bar',
            data:[767, 1356, 1622, 326, 2010, 640, 330]
        },
        {
            name:'支付宝交易金额',
            type:'bar',
            data:[707, 1756, 1822, 487, 1808, 600, 230]
        },
        {
            name:'微信交易笔数',
            type:'line',
            yAxisIndex: 1,
            data:[102, 203, 234, 230, 165, 120, 62]
        },
        {
            name:'支付宝交易笔数',
            type:'line',
            yAxisIndex: 1,
            data:[  230,102, 203, 120, 62,165, 234,]
        }
    ]
};
// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);