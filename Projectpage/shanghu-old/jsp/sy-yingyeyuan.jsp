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
        	<a href="">收银</a>
        	<a>
            <cite>营业员</cite></a>
        </span>
			<a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
				<i class="layui-icon" style="line-height:30px">ဂ</i></a>
		</div>
		<div class="x-body">
			<div class="layui-row">
				<form class="layui-form layui-col-md6 x-so">
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
					<div class="layui-input-inline xx-so text">
						<div class="layui-input-clear"><i class="layui-icon layui-unselect layui-tab-close">ဆ</i></div>
						<input type="text" name="userName" id="userName" placeholder="账号" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-input-inline xx-so text">
						<div class="layui-input-clear"><i class="layui-icon layui-unselect layui-tab-close">ဆ</i></div>
						<input type="text" name="name" id="name" placeholder="姓名" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-input-inline xx-so">
						<select name="shopName" id="shopName" lay-search>
							<option value="">门店</option>
							<c:forEach items="${shops }" var="shop">
								<option value="${shop.ShopName }">${shop.ShopName }</option>
							</c:forEach>
						</select>
					</div>
				</form>
				<div class=" layui-col-md1">
					<button class="layui-btn" data-type="reload">
					<i class="layui-icon">&#xe615;</i>
				</button>
				</div>
			</div>
			<xblock>
				<button class="layui-btn" onclick="x_admin_show('添加营业员','${pageContext.request.contextPath }/Assistant/getAssistantPage',600,400)">
	        		<i class="layui-icon"></i>添加
	       		</button>
			</xblock>
			<table class="layui-hide" id="LAY_table_Assistant" lay-filter="Assistant"></table>

		</div>
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
		<script type="text/html" id="tool">
			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="resetting">重置密码</a>
			<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="pay">一码付</a>
			{{# if(d.biaoshi == 0){ }}
			<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="disable">禁用</a>
			{{# } }} {{# if(d.biaoshi == 1){ }}
			<a class="layui-btn layui-btn-xs " lay-event="open">启用</a>
			{{# } }} {{# if(d.tuikuanshifou == 0){ }}
			<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="disableRefund">禁用退款</a>
			{{# } }} {{# if(d.tuikuanshifou == 1){ }}
			<a class="layui-btn layui-btn-xs " lay-event="openRefund">启用退款</a>
			{{# } }}
		</script>
		<script>
			layui.use('table', function() {

				var table = layui.table;

				//方法级渲染
				table.render({
					elem: '#LAY_table_Assistant',
					url: '${pageContext.request.contextPath }/Assistant/getAssistantList',
					method: "post",
					height: 'full-195',
					page: true,
					id: 'assistantlist',
					cols: [
						[{
							field: 'Name',
							title: '姓名',
							width: '10%',
							sort: true,
							fixed: true
						}, {
							field: 'shoujihao',
							width: '10%',
							title: '手机号'
						}, {
							field: 'ShopName',
							width: '15%',
							title: '所属门店',
							sort: true
						}, {
							field: 'leixing',
							width: '10%',
							title: '类型 '
						}, {
							field: 'zhuangtai',
							width: '10%',
							title: '状态'
						}, {
							field: 'tuikuanquanxian',
							width: '10%',
							title: '退款权限'
						}, {
							field: 'operation',
							width: '35%',
							title: '操作',
							toolbar: "#tool"
						}]
					]
				});

				// 根據條件重载表格
				var $ = layui.$,
					active = {
						reload: function() {

							// 获取上面查询框的值
							var userName = $('#userName');
							var name = $('#name');
							var shop = $('#shopName');

							//执行重载
							table.reload('assistantlist', {
								page: {
									curr: 1 //重新从第 1 页开始
								},
								where: {
									userName: userName.val(),
									name: name.val(),
									shopName: shop.val()
								}
							});
						}
					};

				//监听工具条
				table.on('tool(Assistant)', function(obj) {
					var data = obj.data;
					var logGid = data.LogGid;

					if(obj.event == 'edit') {

						layer.open({
							type: 2,
							title: '编辑',
							area: ['420px', '360px'], //宽高
							content: '${pageContext.request.contextPath }/Assistant/getAssistantEditPage?mphone=' + data.shoujihao + '&name=' + data.Name + '&logGid=' + logGid,
							end: function() {
								$('.layui-row .layui-btn').click();
							}
						});
					} else if(obj.event == 'resetting') {

						var data = {
							"logGid": logGid,
							"mphone": data.shoujihao,
						}
						layer.confirm('确定要重置密码吗?(默认密码手机号后六位)', function(index) {

							$.ajax({
								type: "post",
								url: "${pageContext.request.contextPath }/Assistant/putAssistantPwd",
								async: true,
								data: data,
								success: function(data) {
									if(data.code == 0000) {
										layer.alert('重置成功 ', {
											icon: 6
										});
									} else if(data.code == 0001) {
										layer.msg(data.desc);
									}
								}
							});
						});
					} else if(obj.event == 'pay') {

						// 跳转流水详情页面
						layer.open({
							type: 2,
							title: '桌牌二维码',
							area: ['600px', '400px'], //宽高
							content: '${pageContext.request.contextPath }/Assistant/getQrCode?clerkNumber=' + data.ClerkNumber
						});

					} else if(obj.event == 'disable') {
						var data = {
							"logGid": logGid,
							"state": 1,
							"disableType": 0
						}

						layer.confirm('确定要禁用么?', function(index) {

							// 发送请求,将本店员或店长的功能进行禁用
							$.ajax({
								type: "get",
								url: "${pageContext.request.contextPath }/Assistant/putAssistantStatus",
								async: true,
								data: data,
								success: function(data) {
									if(data.code == 0000) {
										layer.alert('禁用成功 ', {
											icon: 6
										});
									} else if(data.code == 0001) {
										layer.msg(data.desc);
									}

									$('.layui-row .layui-btn').click();
								}
							});
							layer.close(index);
						});

					} else if(obj.event == 'open') {
						var data = {
							"logGid": logGid,
							"state": 0,
							"disableType": 0
						}

						layer.confirm('确定要启用么?', function(index) {

							// 发送请求,将本店员或店长的功能进行启用
							$.ajax({
								type: "get",
								url: "${pageContext.request.contextPath }/Assistant/putAssistantStatus",
								async: true,
								data: data,
								success: function(data) {
									if(data.code == 0000) {
										layer.alert('启用成功 ', {
											icon: 6
										});
									} else if(data.code == 0001) {
										layer.msg(data.desc);
									}

									$('.layui-row .layui-btn').click();
								}
							});

							layer.close(index);
						});
					} else if(obj.event == 'disableRefund') {

						var data = {
							"logGid": logGid,
							"state": 1,
							"disableType": 1
						}

						layer.confirm('确定要禁用退款么', function(index) {

							// 发送请求,将本店员或店长的功能进行禁用
							$.ajax({
								type: "get",
								url: "${pageContext.request.contextPath }/Assistant/putAssistantStatus",
								async: true,
								data: data,
								success: function(data) {
									if(data.code == 0000) {
										layer.alert('禁用成功 ', {
											icon: 6
										});
										$('.layui-row .layui-btn').click();
									} else if(data.code == 0001) {
										layer.msg(data.desc);
									}
								}
							});
						});
					} else if(obj.event == 'openRefund') {

						var data = {
							"logGid": logGid,
							"state": 0,
							"disableType": 1
						}

						layer.confirm('确定要启用么?', function(index) {

							// 发送请求,将本店员或店长的功能进行启用
							$.ajax({
								type: "get",
								url: "${pageContext.request.contextPath }/Assistant/putAssistantStatus",
								async: true,
								data: data,
								success: function(data) {
									if(data.code == 0000) {
										layer.alert('启用成功 ', {
											icon: 6
										});
									} else if(data.code == 0001) {
										layer.msg(data.desc);
									}
									$('.layui-row .layui-btn').click();
								}
							});
						});

					}
				});

				$('.layui-row .layui-btn').on('click', function() {
					var type = $(this).data('type');
					active[type] ? active[type].call(this) : '';
				});
			});
		</script>
	</body>

</html>