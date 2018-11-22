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
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/lib/layui/css/layui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
	</head>

	<body>
		<div class="x-body">
			<form class="layui-form">
				<div class="layui-form-item">
					<label for="username" class="layui-form-label layui-form-label2">
                  	微信支付商户号：
              </label>
					<div class="layui-input-inline layui-input-inline2">
						<input type="text" id="wxMerchants" name="wxMerchants" value="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="phone" class="layui-form-label layui-form-label2"></label>
					<div class="layui-input-inline layui-input-inline2">
						<a href="https://pay.weixin.qq.com/" target="_blank" style="color:#0079f4;">微信支付商户平台</a> = > 账户中心 = > 商户信息 = > 基本帐户信息
					</div>
				</div>
				<div class="layui-form-item">
					<label for="phone" class="layui-form-label layui-form-label2">
                  	微信公众号appID：
              </label>
					<div class="layui-input-inline layui-input-inline2">
						<input type="text" value="" id="phone" name="phone" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="phone" class="layui-form-label layui-form-label2"></label>
					<div class="layui-input-inline layui-input-inline2">
						<a href="https://mp.weixin.qq.com" target="_blank" style="color:#0079f4;">微信公众平台</a> = > 开发 = > 基本配置
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label layui-form-label2">
                  	微信公众号appSecret：
              </label>
					<div class="layui-input-inline layui-input-inline2">
						<input type="text" value="" id="L_email" name="email" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="phone" class="layui-form-label layui-form-label2"></label>
					<div class="layui-input-inline layui-input-inline2">
						<a href="https://mp.weixin.qq.com" target="_blank" style="color:#0079f4;">微信公众平台</a> = > 开发 = > 基本配置
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label layui-form-label2"></label>
					<button id="ss" class="layui-btn layui-btn-danger" lay-submit="" lay-filter="add">
                 		提交
              		</button>
				</div>
			</form>
		</div>
		<script>
			var state = '${reportUserNumber}';

			$(function() {
				if(state != " ") {
					$("#ss").hide();
				}
				$("#wxMerchants").val(state);
			})
		</script>
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
							url: "${pageContext.request.contextPath }/Configuration/putWxConfiguration",
							async: true,
							data: data.field,
							success: function(data) {
								if(data.code == 0000) {
									layer.alert("配置成功,请刷新页面!", {
										icon: 6
									}, function() {
										// 获得frame索引
										var index = parent.layer.getFrameIndex(window.name);
										//关闭当前frame
										parent.layer.close(index);
									});
									
								} else if(data.code != 0000) {
									layer.alert("配置失败,请重新配置!");
								}
							}
						});
					return false;
				});
			});
		</script>
	</body>

</html>