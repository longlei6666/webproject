<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/xadmin.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<script src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/lib/layui/css/layui.css" media="all">
	</head>

	<body>
		<div class="x-body">
			<form class="layui-form layui-col-md12 x-so">
				<label class="layui-form-label">
	          	所属门店:
      		</label>
				<div class="layui-input-inline">
					<!-- 需要数据对接(完成) -->
					<select name="shopName" id="shopName">
						<option value="">--请选择门店--</option>
						<c:forEach items="${shops }" var="shop">
							<option value="${shop.ShopName }">${shop.ShopName }</option>
						</c:forEach>
					</select>
				</div>
				<div class="layui-input-inline">
					开始时间 : <input type="text" class="layui-input" name="startTime" id="startTime">
				</div>
				<div class="layui-input-inline">
					截止时间 :<input type="text" class="layui-input" name="endTime" id="endTime">
				</div>
				<div class="layui-input-inline">
					<button class="layui-btn" lay-filter="get" lay-submit="">
	             	导出
	          	</button>
				</div>
			</form>

		</div>
		<script type="text/javascript">
			// 选择日期插件  
			layui.use('laydate', function() {
				var laydate = layui.laydate;
				laydate.render({
					elem: '#startTime' //指定元素
						,
					type: 'date'
				});
				laydate.render({
					elem: '#endTime',
					type: 'date'
				});
			});

			layui.use('form', function() {
				var form = layui.form

				form.on('submit(get)', function(data) {

					var shopName = $("#shopName").val();
					var startTime = $("#startTime").val();
					var endTime = $("#endTime").val();

					window.location.href = "${pageContext.request.contextPath }/Bill/getBillReport?shopName=" + shopName + "&startTime=" + startTime + "&endTime=" + endTime;

					return false;
				});
			});

			// 监听导出按钮
			$('.demoTable .layui-btn').on('click', function() {
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			});
		</script>
	</body>

</html>