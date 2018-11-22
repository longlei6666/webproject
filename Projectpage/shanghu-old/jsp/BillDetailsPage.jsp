<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>流水详情</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/xadmin.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/style.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<script src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/lib/layui/css/layui.css" media="all">
	</head>

	<body>
		<table cellspacing="0" cellpadding="0" border="0" class="layui-table layui-table-xq" lay-even="">
			<tbody>
				<tr>
					<td data-field="id">
						<div class="layui-table-cell laytable-cell-1-id">商户订单号:</div>
					</td>
					<td data-field="username">
						<div class="layui-table-cell laytable-cell-1-username">
							<c:forEach items="${data }" var="bill">
								${bill.dingdanhao }
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td data-field="id">
						<div class="layui-table-cell laytable-cell-1-id">订单金额:</div>
					</td>
					<td data-field="username">
						<div class="layui-table-cell laytable-cell-1-username">
							<c:forEach items="${data }" var="bill">
								${bill.jiaoyijine } 元
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td data-field="id">
						<div class="layui-table-cell laytable-cell-1-id">订单状态:</div>
					</td>
					<td data-field="username">
						<div class="layui-table-cell laytable-cell-1-username">
							<c:forEach items="${data }" var="bill">
								${bill.jiaoyizhuangtai }
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td data-field="id">
						<div class="layui-table-cell laytable-cell-1-id">交易时间:</div>
					</td>
					<td data-field="username">
						<div class="layui-table-cell laytable-cell-1-username">
							<c:forEach items="${data }" var="bill">
								${bill.jiaoyishijian }
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td data-field="id">
						<div class="layui-table-cell laytable-cell-1-id">所属门店:</div>
					</td>
					<td data-field="username">
						<div class="layui-table-cell laytable-cell-1-username">
							<c:forEach items="${data }" var="bill">
								${bill.shopname }
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td data-field="id">
						<div class="layui-table-cell laytable-cell-1-id">营业员:</div>
					</td>
					<td data-field="username">
						<div class="layui-table-cell laytable-cell-1-username">
							<c:forEach items="${data }" var="bill">
								${bill.Name }
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td data-field="id">
						<div class="layui-table-cell laytable-cell-1-id">支付方式:</div>
					</td>
					<td data-field="username">
						<div class="layui-table-cell laytable-cell-1-username">
							<c:forEach items="${data }" var="bill">
								${bill.jiaoyileixing }
							</c:forEach>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</body>

</html>