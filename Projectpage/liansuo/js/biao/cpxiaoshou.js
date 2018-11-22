// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('cpxiaoshou'));
// 指定图表的配置项和数据
var option = {
	title: {
		text: '餐品分类占比'
	},
	tooltip: {
		trigger: 'item'
	},
	legend: {
		orient: 'vertical',
		x: 'right',
		data: ['暂无数据']
	},
	series: [{
		type: 'pie',
		radius: ['50%', '70%'],
		avoidLabelOverlap: false,
		label: {
			normal: {
				show: true,
				formatter: '{b}: {c}({d}%)'
			},
			emphasis: {
			}
		},
		labelLine: {
			normal: {
				show: false
			}
		},
		data: [{
				name: '暂无数据'
			}
		]
	}]
};
// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);