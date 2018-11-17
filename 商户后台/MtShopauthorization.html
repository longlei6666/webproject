<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>绑定店铺</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/xadmin.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
	</head>

	<body>
		<div class="x-body">
			<table class="layui-hide" id="LAY_table_shopRelationship" lay-filter="shop"></table>
		</div>

		<script type="text/html" id="tool">
			<a class="layui-btn layui-btn-xs" lay-event="authorization">授权</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="closeAuthorization">解除授权</a>
		</script>

		<script>
			layui.use('table', function() {

				var table = layui.table;

				//方法级渲染
				table.render({
					elem: '#LAY_table_shopRelationship',
					url: '${pageContext.request.contextPath }/Configuration/getMtShopAuthorizationData',
					method: "post",
					cols: [
						[{
							field: 'shopName',
							title: '鸿搜店铺',
							sort: true,
							align: 'center'
						}, {
							field: 'authorizationTime',
							title: '授权时间',
							sort: true,
							align: 'center'
						}, {
							field: 'operation',
							title: '操作',
							toolbar: "#tool",
							align: 'center'
						}]
					]
				});

				//监听工具条
				table.on('tool(shop)', function(obj) {
					var data = obj.data;

					if(obj.event === 'authorization') {
						var url = data.shopAuthorizationAddress;
						// 弹出授权页面
						window.open(url);
					} else if(obj.event === 'closeAuthorization') {
						var url = data.shopNotAuthorizationAddress;
						// 弹出解除授权页面
						if(url == "0"){
							// 没有授权,提示门店未授权
							layer.alert("门店未授权,请先授权!")
						} else if (url != "0"){
							// 弹出授权页面
							window.open(url);
						}
					}
				});
			});

			layui.use(['form', 'layer'], function() {
				$ = layui.jquery;
				var form = layui.form,
					layer = layui.layer;

				//监听提交
				form.on('submit(add)', function(data) {

					alert(data.field);
					$.ajax({
						type: "post",
						url: "${pageContext.request.contextPath }/Configuration/BindingShop",
						async: true,
						data: data.field,
						success: function(data) {
							if(data.code == 0000) {
								layer.alert("绑定成功", {
									icon: 6
								}, function() {
									// 刷新当前页面
									location.reload();
								});
							} else {
								layer.alert("绑定失败,请重新绑定!!", {
									icon: 6
								}, function() {

								});
							}
						}
					});

					return false;
				});

			});
		</script>

	</body>

</html>