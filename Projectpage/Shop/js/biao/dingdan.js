// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('dingdan'));
// 指定图表的配置项和数据
var option = {
	title: {
		text: '订单来源占比'
	},
	tooltip: {
		trigger: 'item',
		formatter: '{b}: {c} 单'
	},
	legend: {
		orient: 'vertical',
		x: 'right',
		data: ['收银', '服务员APP', '顾客自助点餐', '美团外卖', '其他']
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
				name: '收银'
			},
			{
				value: 335,
				itemStyle:{
          			normal:{color:'rgb(49,188,173)'}
          		},
				name: '服务员APP'
			}, {
				value: 310,
				itemStyle:{
          			normal:{color:'rgb(254,190,0)'}
          		},
				name: '顾客自助点餐'
			}, {
				value: 310,
				itemStyle:{
          			normal:{color:'rgb(255,144,0)'}
          		},
				name: '美团外卖'
			}, {
				value: 310,
				itemStyle:{
          			normal:{color:'rgb(255,89,58)'}
          		},
				name: '其他'
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