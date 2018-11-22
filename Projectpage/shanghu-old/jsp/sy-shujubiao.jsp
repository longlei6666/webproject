<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>鸿小搜管理中心</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/xadmin.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<script src="//cdn.bootcss.com/echarts/3.3.2/echarts.min.js" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
	</head>

	<body>
		<div class="x-nav">
			<span class="layui-breadcrumb">
	        <a href="">首页</a>
	        <a>
	          <cite>查渠道</cite></a>
	      	</span>
			<a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
				<i class="layui-icon" style="line-height:30px">ဂ</i></a>
		</div>

		<style>
			.x-so input.layui-input {
				width: 100%;
			}
			
			.layui-col-md4 .layui-input-inline {
				width: 32%;
			}
			
			.homelist {
				text-align: center;
			}
			
			.homelistitle {
				font-size: 1.2rem;
				margin-bottom: 20px;
				color: #999;
			}
			
			.homelistct {
				font-size: 1.6rem;
				font-weight: 600;
			}
			
			.homelistc .layui-btn {
				margin-left: 20px;
			}
			
			.layui-col-md5 {
				width: 20%;
			}
			
			.Trad {
				padding: 20px;
				background-color: #f2f2f2;
			}
		</style>

		<div class="x-body">
			<div class="layui-row">
				<form class="layui-form layui-col-md12">
					<div class="layui-col-md12 x-so">
						<div class="layui-row">
							<div class="layui-col-md8">
								<div class="layui-input-inline">
									<!-- 需要数据对接(完成) -->
									<select name="shopName" id="shopName" lay-search>
										<option value="">--请选择门店--</option>
										<c:forEach items="${shops }" var="shop">
											<option value="${shop.ShopName }">${shop.ShopName }</option>
										</c:forEach>
									</select>
								</div>
								<div class="layui-input-inline">
									<select name="payment" id="payment">
										<option value="">全部通道</option>
										<option value="zhifubaopay">支付宝</option>
										<option value="weixinpay">微信</option>
									</select>
								</div>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" placeholder="开始日" name="startTime" id="startTime">
								</div>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" placeholder="截止日" name="endTime" id="endTime">
								</div>
							</div>
							<div class="layui-col-md1">
								<button class="layui-btn" lay-submit="" lay-filter="sreach" title="搜索"><i class="layui-icon">&#xe615;</i></button>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="layui-row Trad">
				<div class="layui-col-md5">
					<div class="homelist">
						<p class="homelistitle">实收额</p>
						<div class="homelistc">
							<span class="x-left homelistct" style="line-height:40px;" id="paidinAmount"></span>
						</div>
					</div>
				</div>
				<div class="layui-col-md5">
					<div class="homelist">
						<p class="homelistitle">手续费</p>
						<div class="homelistc">
							<span class="x-left homelistct" style="line-height:40px;" id="poundage"></span>
						</div>
					</div>
				</div>
				<div class="layui-col-md5">
					<div class="homelist">
						<p class="homelistitle">退款额</p>
						<div class="homelistc">
							<span class="x-left homelistct" style="line-height:40px;" id="refundAmounts"></span>
						</div>
					</div>
				</div>
				<div class="layui-col-md5">
					<div class="homelist">
						<p class="homelistitle">交易量</p>
						<div class="homelistc">
							<span class="x-left homelistct" style="line-height:40px;" id="tradingVolume"></span>
						</div>
					</div>
				</div>
				<div class="layui-col-md5">
					<div class="homelist">
						<p class="homelistitle">退款量</p>
						<div class="homelistc">
							<span class="x-left homelistct" style="line-height:40px;" id="theRefundAmount"></span>
						</div>
					</div>
				</div>
			</div>

			<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
			<div id="main" style="width: 100%;height:400px;margin-top: 50px;"></div>

		</div>
		<script type="text/javascript">
			var beginDate = new Date();
			if(beginDate.getMonth() == 1) {
				beginDate.setYear(beginDate.getYear() - 1);
				beginDate.setMonth(12);
			} else {
				beginDate.setMonth(beginDate.getMonth() - 1);
			}

			var endDate = new Date();
			// 选择日期插件  
			layui.use('laydate', function() {
				var laydate = layui.laydate;
				laydate.render({
					elem: '#startTime', //指定元素
					type: 'date',
					value: beginDate
				});
				laydate.render({
					elem: '#endTime',
					type: 'date',
					value: endDate
				});
			});

			layui.use(['form', 'layer'], function() {

				$ = layui.jquery;
				var form = layui.form,
					layer = layui.layer;

				//监听提交 ,
				form.on('submit(sreach)', function(data) {
					//发异步，把数据提交给后台
					doSearch(data.field);
					return false;
				});
			});
		</script>

		<script type="text/javascript">
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));

			var myChart = echarts.init(document.getElementById('main'));

			myChart.setOption({
				title: {
					text: '历史交易记录'
				},
				tooltip: {
					trigger: 'axis'
				},
				legend: {
					data: ['交易金额', '退款额', '交易量']
				},
				grid: {
					left: '3%',
					right: '4%',
					bottom: '3%',
					containLabel: true
				},
				toolbox: {
					feature: {
						saveAsImage: {}
					}
				},
				xAxis: {
					type: 'category',
					boundaryGap: false,
					data: []
				},
				yAxis: {
					type: 'value'
				},
				series: [{
					name: '交易金额',
					type: 'line',
					stack: '总量',
					data: []
				}, {
					name: '退款额',
					type: 'line',
					stack: '总量',
					data: []
				}, {
					name: '交易量',
					type: 'line',
					stack: '总量',
					data: []
				}]
			});

			$(function() {
				doSearch();
			})

			function doSearch(serchData) {
				// 异步加载数据
				$.ajax({
					type: 'post', //传输类型
					async: true,
					url: '${pageContext.request.contextPath}/Data/getFigureData',
					data: serchData,
					dataType: 'json', //返回数据形式为json
					success: function(data) {
						// 填入数据
						myChart.setOption({
							xAxis: {
								type: 'category',
								boundaryGap: false,
								data: data.category
							},
							series: [{
								// 根据名字对应到相应的系列
								name: '交易金额',
								type:'line',
								data: data.transactionAmountData
							}, {
								// 根据名字对应到相应的系列
								name: '退款额',
								type:'line',
								data: data.refundAmountsData
							}, {
								// 根据名字对应到相应的系列
								name: '交易量',
								type:'line',
								data: data.tradingVolumeData
							}]
						});

						$("#paidinAmount").html(data.totalData[0].totalshishoujine);
						$("#poundage").html(data.totalData[0].totalshouxufei);
						$("#refundAmounts").html(data.totalData[0].totaltuikuanjine);
						$("#tradingVolume").html(data.totalData[0].totalshishoubishu);
						$("#theRefundAmount").html(data.totalData[0].totaltuikuanbishu);
					},
					error: function(errorMsg) {
						alert("加载数据失败");
					}
				});
			}
		</script>

	</body>

</html>