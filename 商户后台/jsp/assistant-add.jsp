<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加营业员</title>
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
						<input type="text" id="mphone" name="mphone" required="" lay-verify="mphone" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label">
                  	所属门店
              </label>
					<div class="layui-input-inline">
						<select name="shop" id="shop">
							<option value="">所属门店</option>
							<c:forEach items="${shops }" var="shop">
								<option value="${shop.ShopName }">${shop.ShopName }</option>
							</c:forEach>
						</select>
					</div>
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red">*</span>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">角色</label>
					<div class="layui-input-block">
						<input type="radio" name="role" value="1" title="营业员">
						<input type="radio" name="role" value="0" title="店长">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_pass" class="layui-form-label">
                  	密码
              </label>
					<div class="layui-input-inline">
						<input type="password" id="L_pass" name="pass" required="" lay-verify="pass" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						6到16个字符
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label">
                  	确认密码
              </label>
					<div class="layui-input-inline">
						<input type="password" id="L_repass" name="password" required="" lay-verify="repass" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label">
              </label>
					<button class="layui-btn" lay-filter="add" lay-submit="">
                  	增加
              </button>
				</div>
			</form>
		</div>
		<script>
			layui.use(['form', 'layer'], function() {
				$ = layui.jquery;
				var form = layui.form,
					layer = layui.layer;

				//自定义验证规则
				form.verify({
					pass: [/(.+){6,12}$/, '密码必须6到12位'],
					repass: function(value) {
						if($('#L_pass').val() != $('#L_repass').val()) {
							return '两次密码不一致';
						}
					}
				});

				//监听提交
				form.on('submit(add)', function(data) {

					console.log(data.field);
					//发异步，把数据提交
					$.ajax({
						type: "post",
						url: "${pageContext.request.contextPath }/Assistant/addAssistant",
						async: true,
						data: data.field,
						success: function(data) {
							if(data.code == 0000) {
								layer.alert("添加成功", {
									icon: 6
								}, function() {
									
									// 刷新父页面
									window.parent.location.reload();
									
									// 获得frame索引
									var index = parent.layer.getFrameIndex(window.name);
									//关闭当前frame
									parent.layer.close(index);
								});
							} else {
								layer.alert("添加失败,请重新添加!!", {
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