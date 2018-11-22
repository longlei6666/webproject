<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>金额汇总</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/xadmin.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<script src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/lib/layui/css/layui.css" media="all">
	</head>

	<body>
		<div class="x-body">
			<table class="layui-table">
				<tbody>
					<tr>
						<td colspan="2">截止至 ${endTime} :</td>
					</tr>
					<tr>
						<td>交易总笔数</td>
						<td>${transactionNumber } 笔</td>
					</tr>
					<tr>
						<td>交易总金额</td>
						<td>${transactionAmount} 元</td>
					</tr>
					<tr>
						<td>交易总手续费</td>
						<td>${transactionPoundage} 元</td>
					</tr>
				</tbody>
			</table>
		</div>

	</body>

</html>