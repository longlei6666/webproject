// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('dingdan'));
// 指定图表的配置项和数据
var option = {
	title: {
		text: '今日交易笔数'
	},
	tooltip: {
		trigger: 'item',
		formatter: '{b}: {c} 单'
	},
	legend: {
		orient: 'vertical',
		x: 'right',
		data: ['微信', '支付宝']
	},
	series: [{
		type: 'pie',
		radius: '55%',
		center: ['50%', '60%'],
		label: {
			normal: {
				show: true,
				formatter: '{b}: {c} 单'
			}
		},
		data: [{
				value: 234,
				itemStyle:{
          			normal:{color:'rgb(46,143,217)'}
          		},
				name: '微信'
			},
			{
				value: 335,
				itemStyle:{
          			normal:{color:'rgb(49,188,173)'}
          		},
				name: '支付宝'
			}
		],
		itemStyle: {
			emphasis: {
				shadowBlur: 10,
				shadowOffsetX: 0,
				shadowColor: 'rgba(0, 0, 0, 0.5)'
			}
		}
	}]
};
// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);