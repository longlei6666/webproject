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
		<script type="text/javascript">
			$(function() {
				$.ajax({
					type: 'POST',
					async: true,
					url: "${pageContext.request.contextPath }/hongsou/getProvince",
					success: function(data) {
						for(var i = 0; i < data.length; i++) {
							$("#province").append("<option value='" + data[i].ProvinceID + "'>" + data[i].ProvinceName + "</option>");
						}
					}
				});
			})
		</script>
	</head>

	<body>
		<div class="x-nav">
			<span class="layui-breadcrumb">
        <a href="">收银</a>
        <a><cite>多门店</cite></a>
      </span>
			<a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
				<i class="layui-icon" style="line-height:30px">ဂ</i></a>
		</div>
		<div class="x-body">
			<div class="searchTable layui-row">
				<div class="layui-col-md7">
					<div class="layui-inline x-so">
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
							<input class="layui-input" type="text" name="shopName" id="shopName" placeholder="门店名称" autocomplete="off">
						</div>
						<div class="layui-input-inline">
							<select id="province" name="province">
								<option value="" class="layui-anim layui-anim-upbit">请选择</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select id="city" name="city">
								<option value="">请选择</option>
							</select>
						</div>
						<div class="layui-input-inline">
							<select name="shopStatus" id="shopStatus">
								<option value="">状态</option>
								<option value="1">正常</option>
								<option value="2">禁用</option>
							</select>
						</div>
					</div>
				</div>
				<div class="layui-col-md1">
					<button class="layui-btn" data-type="reload">
	        		<i class="layui-icon">&#xe615;</i>搜索
	        		</button>
				</div>
			</div>
			<xblock>
				<button class="layui-btn" onclick="x_admin_show('添加店铺','${pageContext.request.contextPath }/shop/shop-add',800,600)"><i class="layui-icon"></i>添加店铺</button>
			</xblock>
			<table class="layui-hide" id="LAY_table_shop" lay-filter="shop"></table>
		</div>
		<script>
			$("#province").change(function() {
				$("#city").empty();
				var pid = $("#province").val()
				$.ajax({
					type: 'POST',
					async: true,
					url: "${pageContext.request.contextPath }/hongsou/getCity",
					data: {
						"provinceId": pid
					},
					success: function(data) {
						for(var i = 0; i < data.length; i++) {
							$("#city").append("<option value='" + data[i].CityID + "'>" + data[i].CityName + "</option>");
						}
					}
				});
			});
		</script>
		<script type="text/html" id="tool">
			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
			{{# if(d.zhuangtai == 0){ }}
			<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="disable">禁用</a>
			{{# } }} {{# if(d.zhuangtai == 1){ }}
			<a class="layui-btn layui-btn-xs" lay-event="open">开启</a>
			{{# } }}
		</script>
		<script type="text/html" id="takeout">
			<input type="checkbox" <c:if test="${1 eq merchantsPermissions}">disabled="disabled"</c:if> name="{{d.takeoutPermissions}}" value="{{d.switchE}}" title="{{d.bianhao}}" lay-skin="switch" lay-text="开|关" lay-filter="takeoutSwitch" {{ d.switchE==0 ? 'checked' : '' }}>
		</script>
		<script>
			layui.use('table', function() {

				var table = layui.table,
					form = layui.form;

				//方法级渲染
				table.render({
					elem: '#LAY_table_shop',
					url: '${pageContext.request.contextPath }/shop/getShopList',
					method: "post",
					height: 'full-195',
					page: true,
					id: 'shoplist',
					cols: [
						[{
							field: 'ShopName',
							title: '门店名称',
							sort: true,
							fixed: true
						}, {
							field: 'sheng',
							title: '省份',
							sort: true
						}, {
							field: 'inserttime',
							title: '创建时间',
							sort: true
						}, {
							field: 'zhuangtaizhong',
							title: '状态'
						}, {
							field: 'Denglushijian',
							title: '最后登出时间 '
						}, {
							field: 'takeout',
							title: '外卖',
							templet: '#takeout'
						}, {
							field: 'operation',
							title: '操作',
							toolbar: "#tool"
						}]
					]
				});

				//监听开关操作
				form.on('switch(takeoutSwitch)', function(obj) {

					var shopNumber = this.title;

					// 判断现在状态是开还是关,关则开之,开则关之
					if(this.value == 0) {

						var mydata = {
								"shopNumber": shopNumber,
								"takeoutStatus": 1
							}
							// 发送异步进行开启店铺外卖权限
						$.ajax({
							type: "post",
							url: "${pageContext.request.contextPath }/shop/putTakeoutStatus",
							async: true,
							data: mydata,
							success: function(data) {
								if(data.code == 0000) {
									layer.alert('关闭成功 ', {
										icon: 6
									}, function(index) {
										// 刷新页面
										$('.searchTable .layui-btn').click();
										layer.close(index);
									});
								} else if(data.code == 0001) {
									layer.msg(data.desc);
								}

							}
						});

					} else if(this.value == 1) {

						var mydata = {
							"shopNumber": shopNumber,
							"takeoutStatus": 0
						}

						// 发送异步进行关闭店铺外卖权限
						$.ajax({
							type: "post",
							url: "${pageContext.request.contextPath }/shop/putTakeoutStatus",
							async: true,
							data: mydata,
							success: function(data) {
								if(data.code == 0000) {
									layer.alert('关闭成功 ', {
										icon: 6
									}, function(index) {
										// 刷新页面
										$('.searchTable .layui-btn').click();
										layer.close(index);
									});
								} else if(data.code == 0001) {
									layer.msg(data.desc);
								} else if(data.code == 1000) {
									layer.alert('开启成功,请前往授权! ', {
										icon: 6
									});
								}
							}
						});

					}

				});

				// 根據條件重载表格
				var $ = layui.$,
					active = {
						reload: function() {
							// 获取上面查询框的值
							var shopName = $('#shopName');
							var Province = $('#province');
							var City = $('#city');
							var shopStatus = $('#shopStatus');

							//执行重载
							table.reload('shoplist', {
								page: {
									curr: 1 //重新从第 1 页开始
								},
								where: {
									shopName: shopName.val(),
									Province: Province.val(),
									City: City.val(),
									shopStatus: shopStatus.val()
								}
							});
						}
					};

				//监听工具条
				table.on('tool(shop)', function(obj) {
					var data = obj.data;
					if(obj.event === 'edit') {
						// 跳转编辑详情页面
						layer.open({
							type: 2,
							title: '编辑店铺',
							area: ['800px', '600px'],
							content: '${pageContext.request.contextPath }/getShopEditPage?shopNumber=' + data.bianhao + '&shopName=' + data.ShopName,
							end: function() {
								$('.layui-row .layui-btn').click();
							}
						});
					} else if(obj.event === 'delete') {

						// 弹出是否要删除门店
						layer.confirm('确定要删除门店么?', function(index) {

							var mydata = {
								"shopNumber": data.bianhao,
							}

							// 发送请求,将门店进行逻辑删除
							$.ajax({
								type: "post",
								url: "${pageContext.request.contextPath }/shop/deleteShop",
								async: true,
								data: mydata,
								success: function(data) {
									if(data.code == 0000) {
										layer.alert('删除成功 ', {
											icon: 6
										});
									} else if(data.code == 0001) {
										layer.msg(data.desc);
									}
									// 刷新页面
									$('.searchTable .layui-btn').click();
								}
							});
							layer.close(index);
						});

					} else if(obj.event === 'disable') {

						var mydata = {
							"shopNumber": data.bianhao,
							"shopStatus": 1
						}

						// 禁用门店
						layer.confirm('确定要禁用么?', function(index) {

							// 发送请求,将门店进行禁用
							$.ajax({
								type: "post",
								url: "${pageContext.request.contextPath }/shop/disableShop",
								async: true,
								data: mydata,
								success: function(data) {
									if(data.code == 0000) {
										layer.alert('禁用成功 ', {
											icon: 6
										});
									} else if(data.code == 0001) {
										layer.msg(data.desc);
									}

									// 刷新页面
									$('.searchTable .layui-btn').click();
								}
							});
							layer.close(index);
						});

					} else if(obj.event === 'open') {

						var mydata = {
							"shopNumber": data.bianhao,
							"shopStatus": 0
						}

						// 禁用门店
						layer.confirm('确定要启用么?', function(index) {

							// 发送请求,将门店进行禁用
							$.ajax({
								type: "post",
								url: "${pageContext.request.contextPath }/shop/disableShop",
								async: true,
								data: mydata,
								success: function(data) {
									if(data.code == 0000) {
										layer.alert('启用成功 ', {
											icon: 6
										}, function(index) {
											// 刷新页面
											$('.searchTable .layui-btn').click();

											layer.close(index);
										});
									} else if(data.code == 0001) {
										layer.msg(data.desc);
									}
								}
							});
							layer.close(index);
						});
					}
				});

				$('.searchTable .layui-btn').on('click', function() {
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