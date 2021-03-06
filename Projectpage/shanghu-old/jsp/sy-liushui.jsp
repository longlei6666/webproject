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
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/xadmin.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<script src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/style.css">
	</head>
	<style type="text/css">
		.layui-body {
			overflow-y: scroll;
		}
	</style>

	<body>
		<div class="x-nav">
			<span class="layui-breadcrumb"> <a href="">收银</a> <a> <cite>查流水</cite></a>
		</span>
			<a class="layui-btn layui-btn-small" style="line-height: 1.6em; margin-top: 3px; float: right" href="javascript:location.replace(location.href);" title="刷新"> <i class="layui-icon" style="line-height: 30px">ဂ</i></a>
		</div>
		<div class="x-body">
			<div class="demoTable">
				<div class="layui-inline">
					<form class="layui-form layui-col-md11 x-so">
						<style>
							.text {
								position: relative;
							}
							
							.layui-input-clear {
								position: absolute;
								right: 10px;
								top: 10px;
								cursor: pointer;
								display: none;
								padding: 1px;
							}
							
							.layui-input-clear:hover {
								background-color: #FF5722;
								color: #fff;
								border-radius: 50%;
							}
						</style>
						<div class="layui-input-inline text">
							<div class="layui-input-clear"><i class="layui-icon layui-unselect layui-tab-close">ဆ</i></div>
							<input name="Assistant" id="Assistant" placeholder="营业员" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-input-inline text">
							<div class="layui-input-clear"><i class="layui-icon layui-unselect layui-tab-close">ဆ</i></div>
							<input name="orderCode" id="orderCode" placeholder="订单号" autocomplete="off" class="layui-input">
						</div>
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
								<option value="">请选择支付方式</option>
								<option value="zhifubaopay">支付宝</option>
								<option value="weixinpay">微信</option>
							</select>
						</div>
						<!-- 
						<div class="layui-input-inline">
							<select name="product" id="product">
								<option value="">请选择支付产品</option>
								支付产品类种不多,到时候直接添加到页面即可 
								<option value="0">官方支付宝(一码付)</option>
								<option value="1">官方支付宝(扫码付)</option>
								<option value="2">官方微信(一码付)</option>
								<option value="3">官方微信(扫码付)</option>
							</select>
						</div>-->
						<div class="layui-input-inline">
							<input type="text" class="layui-input" placeholder="开始日" name="startTime" id="startTime">
						</div>
						<div class="layui-input-inline">
							<input type="text" class="layui-input" placeholder="截止日" name="endTime" id="endTime">
						</div>
						<div class="layui-input-inline">
							<select name="orderStatus" id="orderStatus">
								<option value="">请选择支付状态</option>
								<option value="1">收款成功</option>
								<option value="2">收款失败</option>
								<option value="3">已退款</option>
							</select>
						</div>
					</form>
					<div class=" layui-col-md1">
						<button class="layui-btn" data-type="reload">
							<i class="layui-icon">&#xe615;</i>
						</button>
					</div>
				</div>
			</div>
			<xblock>
				<button class="layui-btn" onclick="x_admin_show('报表','${pageContext.request.contextPath }/Bill/getStatementPage',950,500)">
					<i class="layui-icon"></i>报表
				</button>
				<button class="layui-btn" onclick="x_admin_show('金额汇总','${pageContext.request.contextPath }/Bill/getTotalMoney',480,320)">
					<i class="layui-icon"></i>金额汇总
				</button>
			</xblock>

			<table class="layui-hide" id="LAY_table_bill" lay-filter="bill"></table>
		</div>
		<script type="text/html" id="tool">
			<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="detail">查看</a>
		</script>
		<script type="text/javascript">
			$("input").focus(function() {
				$(this).parent().children(".layui-input-clear").show();
			});
			$("input").blur(function() {
				if($(this).val() == '') {
					$(this).parent().children(".layui-input-clear").hide();
				}
			});
			$(".layui-input-clear").click(function() {
				$(this).parent().find('input').val('');
				$(this).hide();
			});
		</script>

		<script>
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
					elem: '#startTime' //指定元素
						,
					type: 'datetime',
					value: beginDate
				});
				laydate.render({
					elem: '#endTime',
					type: 'datetime',
					value: endDate
				});
			});

			layui.use('table', function() {

				var table = layui.table;

				//方法级渲染
				table.render({
					elem: '#LAY_table_bill',
					url: '${pageContext.request.contextPath }/Bill/getBillList',
					method: "post",
					height: 'full-195',
					page: true,
					id: 'billlist',
					cols: [
						[{
							field: 'dingdanhao',
							title: '订单号',
							align: 'center'
						}, {
							field: 'shopname',
							title: '门店',
							sort: true,
							align: 'center'
						}, {
							field: 'Name',
							title: '营业员',
							align: 'center'
						}, {
							field: 'jiaoyijine',
							title: '应收款',
							align: 'center'
						}, {
							field: 'jiesuanjine',
							title: '实收款',
							align: 'center'
						}, {
							field: 'shopshouxufei',
							title: '手续费',
							align: 'center'
						}, {
							field: 'jiaoyileixing',
							title: '支付方式',
							sort: true,
							align: 'center'
						}, {
							field: 'jiaoyizhuangtai',
							title: '订单状态',
							align: 'center'
						}, {
							field: 'jiaoyishijian',
							title: '交易时间',
							align: 'center'
						}, {
							field: 'operation',
							title: '操作',
							toolbar: "#tool",
							align: 'center'
						}]
					]
				});

				//	{
				//	field: 'shopfeilv',
				//	title: '手续费费率'
				//	},

				// 根據條件重载表格
				var $ = layui.$,
					active = {
						reload: function() {
							// 获取上面查询框的值
							var Assistant = $('#Assistant');
							var shopName = $('#shopName');
							var payment = $('#payment');
							var product = $('#product');
							var startTime = $('#startTime');
							var endTime = $('#endTime');
							var orderStatus = $('#orderStatus');
							var orderCode = $('#orderCode');

							//执行重载
							table.reload('billlist', {
								page: {
									curr: 1 //重新从第 1 页开始
								},
								where: {
									Assistant: Assistant.val(),
									payment: payment.val(),
									product: product.val(),
									startTime: startTime.val(),
									endTime: endTime.val(),
									orderStatus: orderStatus.val(),
									shopName: shopName.val(),
									orderCode: orderCode.val()
								}
							});
						}
					};

				//监听工具条
				table.on('tool(bill)', function(obj) {
					var data = obj.data;

					if(obj.event === 'detail') {
						// 跳转流水详情页面
						layer.open({
							type: 2,
							title: '流水详情',
							area: ['400px', '400px'], //宽高
							content: '${pageContext.request.contextPath }/Bill/getBillDetailsPage?orderCode=' + data.dingdanhao
						});
					}
				});

				$('.demoTable .layui-btn').on('click', function() {
					var type = $(this).data('type');
					active[type] ? active[type].call(this) : '';
				});
			});
		</script>
	</body>

</html>