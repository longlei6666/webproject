<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>鸿小搜管理平台</title>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/xadmin.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<script src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/lib/layui/css/layui.css" media="all">
	</head>

	<body class="login-bg">

		<div class="login">
			<div class="message">x-admin2.0-管理登录</div>
			<div id="darkbannerwrap"></div>

			<!--
        	作者：offline
        	时间：2017-11-22
        	描述：用户登录
        -->
			<form method="post" class="layui-form" action="${pageContext.request.contextPath }/login">
				<input name="username" placeholder="用户名" type="text" lay-verify="required" class="layui-input" value="${username}">
				<hr class="hr15">
				<input name="password" lay-verify="required" placeholder="密码" type="password" class="layui-input" value="${password}">
				<hr class="hr15">
				<div class="layui-form-item">
					<div class="layui-row">
						<div class="layui-col-md7 layui-col-lg7 layui-col-xs5">
							<input id="verificationCode" name="verificationCode" placeholder="验证码" type="text" lay-verify="required" class="layui-input">
						</div>
						<div class="layui-col-md5 layui-col-lg5 layui-col-xs7">
							<div class="yanzhengimg">
								<img id="codeImg" src="${pageContext.request.contextPath }/login/getVerificationCode" style="height: 50px;float:right;" />
							</div>
						</div>
					</div>
					<hr class="hr15">
				</div>
				<input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
				<hr class="hr20">
			</form>
		</div>
		<script type="text/javascript">
			var msg = '${ msg } ';
			var code = '${status }';

			$(function() {
				layui.use('form', function() {
					var form = layui.form;

					if(code == 1) {
						layer.msg(msg, {
							icon: 5
						});
					}
				});
			})
			
			$(function() {
				$("#codeImg").click(function() {
					$(this).prop("src", "${ pageContext.request.contextPath }/login/getVerificationCode?time=" + new Date().getTime());
				});
			});
		</script>
	</body>

</html>