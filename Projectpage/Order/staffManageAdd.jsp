<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>鸿小搜管理中心</title>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="./css/font.css">
		<link rel="stylesheet" href="./css/xadmin.css">
		<link rel="stylesheet" href="./css/style.css">
		<script type="text/javascript" src="./js/jquery-3.2.1.js"></script>
		<script src="./lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="./js/xadmin.js"></script>
		<script type="text/javascript" src="./bus/index.js?v=21"></script>
		<script type="text/javascript">
			$(function() {
				$.ajax({
					type: 'POST',
					async: true,
					url: "${basePath}/staff/getBrandList",
					success: function(data) {
						var staffbrand = '${staffInfo[0].BrandNumber}';
						for(var i = 0; i < data.length; i++) {
							if(staffbrand == data[i].BrandNumber) {
								$("#contrller").append("<option value='" + data[i].BrandNumber + "' selected='selected'>" + data[i].BrandName + "</option>");
							} else {
								$("#contrller").append("<option value='" + data[i].BrandNumber + "'>" + data[i].BrandName + "</option>");
							}
						}
					}
				});

				$.ajax({
					type: 'POST',
					async: true,
					url: "${basePath}/staff/getRoleList",
					success: function(data) {
						var staffrole = '${staffInfo[0].LogGid}';
						for(var i = 0; i < data.length; i++) {
							if(staffrole == data[i].LogGid) {
								$("#payment").append("<option value='" + data[i].LogGid + "' selected='selected'>" + data[i].RoleName + "</option>");
							} else {
								$("#payment").append("<option value='" + data[i].LogGid + "'>" + data[i].RoleName + "</option>");
							}
						}
					}
				});
			})
		</script>
	</head>

	<body>
		<div class="x-body" id="getstaffRoleAdd">
			<form class="layui-form">
				<div class="layui-form-item">
					<label for="username" class="layui-form-label"> <span
					class="x-red">* </span>员工角色
				</label>
					<div class="layui-input-inline">
						<select name="payment" id="payment" lay-ignore style="height: 39px;">
						</select>
					</div>
					<div class="layui-form-mid layui-word-aux">
						<a href="${basePath}/staffRole/getstaffRoleAdd">新增角色</a>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label"><span class="x-red">*</span>品牌权限</label>
					<div class="layui-input-inline">
						<select name="contrller" id="contrller" lay-ignore style="height: 39px;">
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label for="username" class="layui-form-label"> <span
						class="x-red">* </span>门店权限
					</label>
					<div class="layui-input-inline shoplist">
						<div class="layui-input-inline">
							<input type="text" name="shopName" id="shopName" placeholder="店铺名称" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-input-inline">
							<a class="layui-btn" data-type="reload"> <i class="layui-icon">&#xe615;</i>
							</a>
						</div>
						<table class="layui-table" id="LAY_table_shop" lay-filter="shop"></table>
					</div>
				</div>

				<div class="layui-form-item">
					<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>员工姓名
				</label>
					<div class="layui-input-inline">
						<input type="hidden" id="staffNumber" name="staffNumber" value="${staffInfo[0].StaffNumber}">
						<input type="text" id="staffName" name="staffName" required="" lay-verify="required" autocomplete="off" class="layui-input" value="${staffInfo[0].StaffName}">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="username" class="layui-form-label"> <span
					class="x-red">*</span>用户名
				</label>
					<div class="layui-input-inline">
						<c:when test="${not empty staffInfo}">${staffInfo[0].UserName}</c:when>
						<c:otherwise>
							<input type="text" id="username" name="username" required="" lay-verify="required" autocomplete="off" class="layui-input">
						</c:otherwise>
					</div>
				</div>

				<div class="layui-form-item">
					<label for="L_pass" class="layui-form-label"> <span
					class="x-red">*</span>密码
				</label>
					<div class="layui-input-inline">
						<input type="password" id="L_pass" name="pass" required="" lay-verify="pass" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">6到16个字符</div>
				</div>

				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"> <span
					class="x-red">*</span>确认密码
				</label>
					<div class="layui-input-inline">
						<input type="password" id="L_repass" name="repass" required="" lay-verify="repass" autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="username" class="layui-form-label"> <span
					class="x-red">* </span>性别
				</label>
					<div class="layui-input-inline">
						<c:when test="${staffInfo[0].Sex eq '男' }">
							<input type="radio" name="sex" value="男" title="男" checked="checked">
						</c:when>
						<c:otherwise>
							<input type="radio" name="sex" value="女" title="女">
						</c:otherwise>
					</div>
				</div>

				<div class="layui-form-item">
					<label for="phone" class="layui-form-label"> <span
					class="x-red">*</span>身份证号
				</label>
					<div class="layui-input-inline">
						<input type="text" id="phone" name="phone" required="" lay-verify="phone" autocomplete="off" class="layui-input" value="${staffInfo[0].IDNumber }">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="phone" class="layui-form-label"> <span
					class="x-red">*</span>手机号
				</label>
					<div class="layui-input-inline">
						<input type="text" id="phone" name="phone" required="" lay-verify="phone" autocomplete="off" class="layui-input" value="${staffInfo[0].Cell }">
					</div>
				</div>
			</form>
			<div class="layui-row formbtnb">
				<div class="grid-demo">
					<div class="layui-form-item">
						<label for="L_repass" class="layui-form-label"> </label>
						<button class="layui-btn formbtn" lay-filter="add" lay-submit="">保存</button>
						<button class="layui-btn layui-btn-warm formbtn" onclick="x_admin_close()">取消</button>
					</div>
				</div>
			</div>
		</div>

		<script>
			$("#layui-btn").click(function() {
				/* var brandNumber = $("#contrller").val();
				x_admin_show('选择门店','${basePath}/staff/getshop?BrandNumber='+brandNumber); */
				$("#getshoplist").show();
			});
			layui.use(['form', 'layer', 'table'], function() {
				$ = layui.jquery;
				var form = layui.form,
					layer = layui.layer,
					table = layui.table;
				table.render({
					elem: '#LAY_table_shop',
					height: 450,
					url: '${basePath}/staff/getshoplist',
					page: true,
					id: 'shoplist',
					cols: [
						[{
							type: 'checkbox',
							width: 50,
							fixed: 'left'
						}, {
							field: 'ShopName',
							title: '门店名称'
						}]
					]
				});
				// 根據條件重载表格
				var $ = layui.$,
					active = {
						reload: function() {

							// 获取上面查询框的值
							var shopName = $('#shopName'); //店铺名称
							//执行重载
							table.reload('shoplist', {
								page: {
									curr: 1
									//重新从第 1 页开始
								},
								where: {
									ShopName: shopName.val(),
								}
							});
						},
						getCheckData: function() { //获取选中数据
							var checkStatus = table
								.checkStatus('shoplist'),
								data = checkStatus.data;

						}
					};

				//监听表格复选框选择
				table.on('checkbox(shoplist)', function(obj) {
					console.log(obj)
					alert(1);
				});

				//自定义验证规则
				form.verify({
					nikename: function(value) {
						if(value.length < 5) {
							return '昵称至少得5个字符啊';
						}
					},
					pass: [/(.+){6,12}$/, '密码必须6到12位'],
					repass: function(value) {
						if($('#L_pass').val() != $('#L_repass').val()) {
							return '两次密码不一致';
						}
					}
				});

				$('.layui-row .layui-btn-search').on('click', function() {
					var type = $(this).data('type');
					active[type] ? active[type].call(this) : '';
					return;
				});
				//监听提交
				form.on('submit(add)', function(data) {
					console.log(data);
					//发异步，把数据提交给php
					layer.alert("增加成功", {
						icon: 6
					}, function() {
						// 获得frame索引
						var index = parent.layer.getFrameIndex(window.name);
						//关闭当前frame
						parent.layer.close(index);
					});
					return false;
				});
			});
		</script>
	</body>

</html>