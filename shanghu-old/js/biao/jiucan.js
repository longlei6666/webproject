// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('jiucan'));

// 指定图表的配置项和数据

var option = {
	title: {
		text: '今日交易金额'
	},
	tooltip: {
		trigger: 'item',
		formatter: "{b}: {c} 元"
	},
	legend: {
		orient: 'vertical',
		x: 'right',
		data: ['微信', '支付宝']
	},
	series: [{
		name: '交易金额',
		type: 'pie',
		radius: ['40%', '55%'],
		center: ['50%', '60%'],
		label: {
			normal: {
				formatter: "{b}: {c} 元",
				rich: {
					a: {
						color: '#999',
						lineHeight: 22,
						align: 'center'
					},
					hr: {
						borderColor: '#aaa',
						width: '100%',
						borderWidth: 0.5,
						height: 0
					},
					b: {
						fontSize: 16,
						lineHeight: 33
					},
					per: {
						color: '#eee',
						backgroundColor: '#334455',
						padding: [2, 4],
						borderRadius: 2
					}
				}
			}
		},
		data: [{
				value: 335,
				name: '微信'
			},
			{
				value: 310,
				name: '支付宝'
			},
		]
	}]
};

// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);