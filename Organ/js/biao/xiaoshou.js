// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('xiaoshou'));
			// 指定图表的配置项和数据
			var option = {
				title: {
					text: '时段销售趋势'
				},
				tooltip: {
					trigger: 'axis',
					axisPointer: { // 坐标轴指示器，坐标轴触发有效
						type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend: {
					data: ['店内', '外卖']
				},
				calculable: true,
				xAxis: [{
					type: 'category',
					data: ['0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23',]
				}],
				yAxis: [{
					type: 'value'
				}],
				series: [{
						name: '店内',
						type: 'bar',
						itemStyle:{
                  			normal:{color:'rgb(46,143,217)'}
                  		},
						data: [76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3,76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3,76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3,162.2, 32.6, 20.0,]
					},
					{
						name: '外卖',
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