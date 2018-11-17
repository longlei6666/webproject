<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>编辑</title>
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
			<form class="layui-form">
				<input type="hidden" id="userNumber" name="userNumber" value="${userNumber}" />
				<div class="layui-form-item">
					<label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>旧密码
              </label>
					<div class="layui-input-inline">
						<input type="password" id="oldPwd" name="oldPwd" required="" lay-verify="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="password" class="layui-form-label">
                  <span class="x-red">*</span>新密码
              </label>
					<div class="layui-input-inline">
						<input type="password" id="password" name="password" required="" lay-verify="pass" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						6到16个字符
					</div>
				</div>
				<div class="layui-form-item">
					<label for="newPwd" class="layui-form-label">
                  <span class="x-red">*</span>确认新密码
              </label>
					<div class="layui-input-inline">
						<input type="password" id="newPwd" name="newPwd" required="" lay-verify="repass" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="add" class="layui-form-label">
              	</label>
					<button class="layui-btn" lay-filter="add" lay-submit="">
                  	提交
              	</button>
				</div>
			</form>
		</div>
		<script>
			layui.use(['form', 'layer'], function() {

				$ = layui.jquery;
				var form = layui.form,
					layer = layui.layer;

				//监听提交
				form.on('submit(add)', function(data) {
					//发异步，把数据提交给后台
					$.ajax({
						type: "post",
						url: "${pageContext.request.contextPath }/user/editUser",
						async: true,
						data: data.field,
						success: function(data) {
							if(data.code == 0000) {
								layer.alert("修改成功", {
									icon: 6
								}, function() {
									// 获得frame索引
									var index = parent.layer.getFrameIndex(window.name);
									//关闭当前frame
									parent.layer.close(index);
								});
							} else if(data.code == 0001) {
								layer.alert(data.msg, function() {
									// 获得frame索引
									var index = parent.layer.getFrameIndex(window.name);
									//关闭当前frame
									parent.layer.close(index);
								});
							}
						}
					});
					return false;
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
						if($('#password').val() != $('#newPwd').val()) {
							return '两次密码不一致';
						}
					}
				});
			});
		</script>
	</body>

</html>