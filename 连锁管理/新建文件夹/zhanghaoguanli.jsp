<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/xadmin.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
	</head>

	<body>
		<div class="x-nav">
			<span class="layui-breadcrumb">
		        <a href="">首页</a>
		        <a href="">系统管理</a>
		        <a>
		          <cite>账号管理</cite>
		        </a>
		    </span>
			<a id="refresh" class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
				<i class="layui-icon" style="line-height:30px">ဂ</i>
			</a>
		</div>
		<div class="x-body">
			<xblock>
				<button class="layui-btn" onclick="x_admin_show('添加账号','${pageContext.request.contextPath }/User/getAddUserPage',700,600)"><i class="layui-icon"></i>添加</button>
			</xblock>

			<table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>

		</div>

		<script type="text/html" id="tool">
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="modification">修改</a>
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="delete">删除</a>
		</script>

		<script>
			layui.use('table', function() {
				var table = layui.table;
				$ = layui.jquery;

				//方法级渲染
				table.render({
					elem: '#LAY_table_user',
					url: '${pageContext.request.contextPath }/User/getUserList',
					cellMinWidth: 80,
					height: 'full-200',
					method: "post",
					page: true,
					id: 'user',
					cols: [
						[{
							field: 'UserName',
							title: '姓名',
							fixed: true
						}, {
							field: 'juese',
							title: '用户组'
						}, {
							field: 'CreateTime',
							title: '创建时间'
						}, {
							field: 'LoginTime',
							title: '登陆时间'
						}, {
							field: 'operation',
							title: '操作',
							toolbar: "#tool"
						}]
					]
				});

				//监听工具条
				table.on('tool(user)', function(obj) {
					var data = obj.data;

					if(obj.event === 'modification') {
						// 跳转到修改页面
						layer.open({
							type: 2,
							title: '编辑',
							area: ['420px', '360px'], //宽高
							content: '${pageContext.request.contextPath }/user/getUserEditPage?userNumber=' + data.UserNumber,
							end: function() {
								$('.layui-row .layui-btn').click();
							}
						});

					} else if(obj.event == 'delete') {

						// 弹出是否要删除门店
						layer.confirm('真的要删除此账号么?', function(index) {

							var mydata = {
								"userNumber": data.UserNumber,
							}

							// 发送请求,将账号进行逻辑删除
							$.ajax({
								type: "post",
								url: "${pageContext.request.contextPath }/user/deleteUser",
								async: true,
								data: mydata,
								success: function(data) {

									if(data.code == 0000) {
										layer.alert('删除成功 ', {
											icon: 6
										}, function() {
											// 刷新当前页面
											location.reload();
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
			})
		</script>

	</body>

</html>