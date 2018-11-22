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
		<div class="x-body">
			<blockquote class="layui-elem-quote">管理首页</blockquote>
			<div class="layui-row">
				<div class="layui-col-md12">
					<fieldset class="layui-elem-field layui-field-title">
						<legend>结算记录</legend>
					</fieldset>
					<table class="layui-table">
						<thead>
							<tr>
								<th>统计</th>
								<th>实收额(¥)</th>
								<th>手续费(¥)</th>
								<th>退款额(¥)</th>
								<th>交易量</th>
								<th>退款量</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>总量</td>
								<td>${tradingData[0].totalshishoujine}</td>
								<td>${tradingData[0].totalshouxufei}</td>
								<td>${tradingData[0].totaltuikuanjine}</td>
								<td>${tradingData[0].totalshishoubishu}</td>
								<td>${tradingData[0].totaltuikuanbishu}</td>
							</tr>
							<tr>
								<td>今日</td>
								<td>${tradingData[1].todayshishoujine}</td>
								<td>${tradingData[1].todayshouxufei}</td>
								<td>${tradingData[1].todaytuikuanjine}</td>
								<td>${tradingData[1].todayshishoubishu}</td>
								<td>${tradingData[1].todaytuikuanbishu}</td>
							</tr>
							<tr>
								<td>昨日</td>
								<td>${tradingData[2].yesterdayshishoujine}</td>
								<td>${tradingData[2].yesterdayshouxufei}</td>
								<td>${tradingData[2].yesterdaytuikuanjine}</td>
								<td>${tradingData[2].yesterdayshishoubishu}</td>
								<td>${tradingData[2].yesterdaytuikuanbishu}</td>
							</tr>
							<tr>
								<td>本周</td>
								<td>${tradingData[3].weekshishoujine}</td>
								<td>${tradingData[3].weekshouxufei}</td>
								<td>${tradingData[3].weektuikuanjine}</td>
								<td>${tradingData[3].weekshishoubishu}</td>
								<td>${tradingData[3].weektuikuanbishu}</td>
							</tr>
							<tr>
								<td>本月</td>
								<td>${tradingData[4].monthshishoujine}</td>
								<td>${tradingData[4].monthshouxufei}</td>
								<td>${tradingData[4].monthtuikuanjine}</td>
								<td>${tradingData[4].monthshishoubishu}</td>
								<td>${tradingData[4].monthtuikuanbishu}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</body>

</html>