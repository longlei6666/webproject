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
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/style.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
	</head>

	<body>
		<div class="x-nav">
			<span class="layui-breadcrumb">
		        <a href="">首页</a>
		        <a href="">业务运营</a>
		        <a>
          			<cite>流水记录</cite>
		        </a>
      		</span>
			<a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
				<i class="layui-icon" style="line-height:30px">ဂ</i></a>
		</div>
		<div class="x-body">
			<div class="layui-row">
				<form class="layui-form layui-col-md5 x-so">
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
						
						.layui-input-inline {
							width: 32%;
						}
					</style>
					<div class="layui-input-inline text">
						<div class="layui-input-clear"><i class="layui-icon layui-unselect layui-tab-close">ဆ</i></div>
						<input type="text" id="orderNumber" name="orderNumber" placeholder="订单号" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-input-inline">
						<input type="text" class="layui-input" placeholder="开始日" name="startTime" id="startTime">
					</div>
					<div class="layui-input-inline">
						<input type="text" class="layui-input" placeholder="截止日" name="endTime" id="endTime">
					</div>
				</form>

				<div class=" layui-col-md1">
					<button class="layui-btn" data-type="reload">
					<i class="layui-icon">&#xe615;</i>
				</button>
				</div>
			</div>

			<table class="layui-hide" id="LAY_table_Takeout" lay-filter="Takeout"></table>
		</div>
		<script type="text/html" id="tool">
			<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
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
					elem: '#startTime', //指定元素
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
					elem: '#LAY_table_Takeout',
					url: '${pageContext.request.contextPath }/takeout/getTakeoutDetailList',
					method: "post",
					height: 'full-195',
					page: true,
					id: 'takeoutlist',
					cols: [
						[{
							field: 'TransactionType',
							title: '外卖渠道',
							align: 'center'
						}, {
							field: 'OrderId',
							title: '订单流水号',
							align: 'center'
						}, {
							field: 'activeAt',
							title: '订单生效时间',
							align: 'center'
						}, {
							field: 'ShopName',
							title: '门店名称',
							align: 'center'
						}, {
							field: 'totalPrice',
							title: '交易金额',
							align: 'center'
						}, {
							field: 'income',
							title: '实收金额',
							align: 'center'
						}, {
							field: 'serviceFee',
							title: '服务费',
							align: 'center'
						}, {
							field: 'packageFee',
							title: '餐盒费',
							align: 'center'
						}, {
							field: 'deliverFee',
							title: '配送费',
							align: 'center'
						}, {
							field: 'OrderIdTypeC',
							title: '订单状态',
							align: 'center'
						}, {
							field: 'operation',
							title: '操作',
							toolbar: "#tool",
							align: 'center'
						}]
					]
				});

				// 根據條件重载表格
				var $ = layui.$,
					active = {
						reload: function() {

							// 获取上面查询框的值
							var orderNumber = $('#orderNumber');
							var startTime = $('#startTime');
							var endTime = $('#endTime');

							//执行重载
							table.reload('takeoutlist', {
								page: {
									curr: 1 //重新从第 1 页开始
								},
								where: {
									orderNumber: orderNumber.val(),
									startTime: startTime.val(),
									endTime: endTime.val()
								}
							});
						}
					};

				//监听工具条
				table.on('tool(Takeout)', function(obj) {
					var data = obj.data;
					var orderNumber = data.OrderId;

					if(obj.event == 'detail') {
						layer.open({
							type: 2,
							title: '流水详情',
							area: ['900px', '600px'],
							content: '${pageContext.request.contextPath }/takeout/getTakeoutDetail?orderNumber=' + orderNumber,
						});
					}
				});

				$('.layui-row .layui-btn').on('click', function() {
					var type = $(this).data('type');
					active[type] ? active[type].call(this) : '';
				});
			});
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
	</body>

</html>