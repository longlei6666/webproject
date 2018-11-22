<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title></title>
		<!--<link rel="shortcut icon" href="${pageContext.request.contextPath}/configuration/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/configuration/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/configuration/css/xadmin.css">
		<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/configuration/js/xadmin.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/configuration/css/third.css">-->

		<link rel="stylesheet" href="./css/font.css">
		<link rel="stylesheet" href="./css/xadmin.css">
		<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="./js/xadmin.js"></script>
		<link rel="stylesheet" href="./css/third.css">

		<style>
			.shbd {
				width: 100%;
				margin: 0 auto;
				position: relative;
			}
			
			.shbd a {
				width: auto;
				position: absolute;
				right: 8%;
				top: 0;
				cursor: pointer;
			}
		</style>

	</head>

	<body>
		<div class="layui-container">
			<div class="layui-row col-body zhifubao">
				<div class="layui-col-md12 grid-demo">
					<div class="layui-row layui-form" lay-filter="bind">
						<div class="layui-col-md12">
							<div class="col-con">
								<img src="${pageContext.request.contextPath}/configuration/images/logo.png" class="zhifuimg" />
								<img src="./images/logo.png" class="zhifuimg" id="zhifuimgDg" style="display: none;" />
								<img src="./images/zhifubao.png" class="zhifuimg" id="zhifuimgSh" style="display: none;" />
								<div class="layui-input-block">
									<select name="countType" id="tongdaoType" lay-filter="tongdaoType" lay-verify="title">
										<option value="">请选择支付通道</option>
										<option value="0">豆果收银</option>
										<option value="1">闪盒收银</option>
									</select>
								</div>
								<div class="layui-input-block" id="wxapp" style="margin-bottom: 0;display: none;">
									<input type="checkbox" name="wxappbox" lay-skin="primary" title="微信小程序">
								</div>
								<div class="layui-input-block shbd">
									<input type="text" name="username" id="number" placeholder="手机号" autocomplete="off" <c:if test="${not empty paymentuser }">class="layui-input layui-disabled"</c:if>
									<c:if test="${empty paymentuser }">class="layui-input"</c:if> value="${paymentuser}">
									<c:if test="${not empty paymentuser }">
										<a class="layui-btn-xs formbtn btn shenqing" id="btnbing" style="height:auto;font-size:12px;">更改</a>
									</c:if>
								</div>
								<button class="layui-btn formbtn btn shenqing" lay-filter="add" lay-submit="">立即绑定</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
		<script type="text/javascript">
			layui.use(['form', 'layer', 'upload'], function() {
				var $ = layui.jquery;
				var form = layui.form,
					upload = layui.upload,
					layer = layui.layer;

				/*---------- 优惠设置 ----------*/
				form.on('select(tongdaoType)', function(data) {
					if(data.value == "") {
						$('#zhifuimgDg').hide()
						$('#zhifuimgSh').hide()
						$('#wxapp').hide()
					} else if(data.value == "0") {
						$('#zhifuimgDg').show()
						$('#zhifuimgSh').hide()
						$('#wxapp').show()
					} else if(data.value == "1") {
						$('#zhifuimgDg').hide()
						$('#zhifuimgSh').show()
						$('#wxapp').hide()
					}
				});

				//表单初始赋值
				form.val('bind', {
					"countType": 0,
					"wxappbox": true
				});

				//自定义验证规则
				form.verify({
					title: function(value) {
						if(!value.length) {
							return '不能为空';
						}
					}
				});

				form.on('submit(add)', function(data) {
					var number = $("#number").val();
					$.ajax({
						type: "POST",
						url: 'alipay',
						data: {
							number: number
						},
						dataType: 'json',
						cache: false,
						success: function(data) {
							if("success" == data.result) {
								layer.msg("绑定成功", {
									icon: 1,
									time: 1000
								}, function() {
									// 刷新页面
									window.location.href = window.location.href
								});
							} else {
								layer.msg(data.msg);
							}
						}
					})
				});
			});
			$("#btnbing").click(function() {
				$("#number").attr("class", "layui-input");
			})
		</script>
	<!--<script type="text/javascript">
		layui.use(['form', 'layer', 'upload'], function() {
			var $ = layui.jquery;
			var form = layui.form,
				upload = layui.upload,
				layer = layui.layer;

			/*---------- 优惠设置 ----------*/
			form.on('select(tongdaoType)', function(data) {
				if(data.value == "") {
					$('#zhifuimgDg').hide()
					$('#zhifuimgSh').hide()
					$('#wxapp').hide()
				} else if(data.value == "0") {
					$('#zhifuimgDg').show()
					$('#zhifuimgSh').hide()
					$('#wxapp').show()
				} else if(data.value == "1") {
					$('#zhifuimgDg').hide()
					$('#zhifuimgSh').show()
					$('#wxapp').hide()
				}
			});

			//自定义验证规则
			form.verify({
				title: function(value) {
					if(!value.length) {
						return '不能为空';
					}
				}
			});

			form.on('submit(add)', function(data) {
				var number = $("#number").val();
				$.ajax({
					type: "POST",
					url: 'alipay',
					data: {
						number: number
					},
					dataType: 'json',
					cache: false,
					success: function(data) {
						if("success" == data.result) {
							layer.msg("绑定成功", {
								icon: 1,
								time: 1000
							}, function() {
								// 刷新页面
								window.location.href = window.location.href
							});
						} else {
							layer.msg(data.msg);
						}
					}
				})
			});
		});
		$("#btnbing").click(function() {
			$("#number").attr("class", "layui-input");
		})
	</script>-->

</html>