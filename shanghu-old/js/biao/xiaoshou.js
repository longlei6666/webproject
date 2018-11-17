// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('xiaoshou'));
			// 指定图表的配置项和数据
			var option = {
				tooltip: {
					trigger: 'axis',
					axisPointer: { // 坐标轴指示器，坐标轴触发有效
						type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend: {
					data: ['成功交易金额', '成功交易笔数']
				},
				calculable: true,
				xAxis: [{
					type: 'category',
					data: ['0时','1时','2时','3时','4时','5时','6时','7时','8时','9时','10时','11时','12时','13时','14时','15时','16时','17时','18时','19时','20时','21时','22时','23时',]
				}],
				yAxis: [{
					type: 'value'
				}],
				series: [{
						name: '成功交易金额',
						type: 'bar',
						itemStyle:{
                  			normal:{color:'rgb(46,143,217)'}
                  		},
						data: [76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3,76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3,76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3,162.2, 32.6, 20.0,]
					},
					{
						name: '成功交易笔数',
						type: 'bar',
						itemStyle:{
                  			normal:{color:'rgb(91,208,237)'}
                  		},
						data: [28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0,76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 162.2, 32.6, 20.0, 162.2, 32.6, 20.0, 6.4, 3.3,18.8,76.7, 135.6,]
					}
				]
			};
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);