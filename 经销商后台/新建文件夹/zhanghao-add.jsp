<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		        <a href="">账号管理</a>
		        <a>添加</a>
		    </span>
		</div>
		<div class="x-body">
			<div class="layui-row">
				<form class="layui-form layui-col-md6">
					<div class="grid-demo">
						<!--基本资料-->
						<blockquote class="layui-elem-quote"><i class="iconfont icon-wode"></i>账号添加</blockquote>

						<div class="layui-form-item">
							<label for="name" class="layui-form-label">
			                  	姓名
			                </label>
							<div class="layui-input-inline">
								<input type="text" id="name" name="name" required="" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label for="phone" class="layui-form-label">
			                  	手机号
			                </label>
							<div class="layui-input-inline">
								<input type="text" id="mphone" name="mphone" required="" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label for="password" class="layui-form-label">
			                  	密码
			                </label>
							<div class="layui-input-inline">
								<input type="password" id="password" name="password" required="" lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>

						<div class="layui-form-item">
							<label for="username" class="layui-form-label">
			                  	权限
			                </label>
							<div class="layui-input-inline">
								<select name="permissions" id="permissions">
									<option value=" ">-请选择-</option>
									<c:forEach items="${group }" var="permission">
										<option value="${permission.LogGid }">${permission.juese }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<!--基本资料-->
						<div class="layui-row formbtnb">
							<div class="grid-demo">
								<div class="layui-form-item">
									<label for="L_repass" class="layui-form-label">
				      </label>
									<button class="layui-btn formbtn" lay-filter="add" lay-submit="">增加</button>
									<button class="layui-btn layui-btn-warm formbtn1" lay-filter="a" lay-submit="">取消</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>

		</div>

		<script>
		
			layui.use('laydate', function() {
				var laydate = layui.laydate;

				//日期时间范围1
				laydate.render({
					elem: '#test10',
					type: 'datetime',
					range: true
				});
				//日期时间范围2
				laydate.render({
					elem: '#test10-2',
					type: 'datetime',
					range: true
				});

			});

			layui.use(['form', 'layer'], function() {
				$ = layui.jquery;
				var form = layui.form,
				layer = layui.layer;

				//监听提交
				form.on('submit(add)', function(data) {

					//发异步，把数据提交给后台
					$.ajax({
						type: "post",
						url: "${pageContext.request.contextPath }/user/addUser",
						async: true,
						data: data.field,
						success: function(data) {
							layer.alert("增加成功", {
								icon: 6
							}, function() {
								
								// 刷新父页面
								window.parent.location.reload();
																
								// 获得frame索引
								var index = parent.layer.getFrameIndex(window.name);
								//关闭当前frame
								parent.layer.close(index);
							});
						}
					});
					return false;
				});
			});
		</script>

	</body>

</html>