// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('jiucan'));
// 指定图表的配置项和数据
var option = {
	title: {
		text: '就餐类型占比'
	},
	tooltip: {
		trigger: 'item',
		formatter: '{b}: {c} 元'
	},
	legend: {
		orient: 'vertical',
		left: 'right',
		data: ['食堂', '外带', '外卖']
	},
	series: [{
		type: 'pie',
		radius: '55%',
		center: ['50%', '60%'],
		label: {
			normal: {
				show: true,
				formatter: '{b}: {c} 元'
			}
		},
		data: [{
				value: 234,
				itemStyle:{
          			normal:{color:'rgb(255,144,35)'}
          		},
				name: '食堂'
			},
			{
				value: 335,
				itemStyle:{
          			normal:{color:'rgb(252,192,31)'}
          		},
				name: '外带'
			}, {
				value: 310,
				itemStyle:{
          			normal:{color:'rgb(46,143,217)'}
          		},
				name: '外卖'
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