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
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
	</head>
	<body>
		<div class="x-nav">
			<span class="layui-breadcrumb">
        <a href="">收银</a>
        <a><cite>配参数</cite></a>
      </span>
			<a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
				<i class="layui-icon" style="line-height:30px">ဂ</i></a>
		</div>
		<div class="x-body">
			<table class="layui-table" lay-even="" lay-skin="row">
				<colgroup>
					<col width="27%">
					<col width="15%">
					<col width="35%">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>支付产品</th>
						<th>支付方式</th>
						<th>授权到期时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span class="icon-pay icon-pay-zfb"></span>官方支付宝</td>
						<td>支付宝</td>
						<td>
							<c:if test="${aliAuthorizedTime == ' ' }">未授权,请前去授权!</c:if>
							
							<c:if test="${aliAuthorizedTime != ' ' }"> ${aliAuthorizedTime }<span style="color:orangered;font-size: 12px;">（到期后请重新授权）</span></c:if>
						</td>
						<td>
							<a href="${ ali_authoriseUrl}" class="layui-btn layui-btn-xs" target="_blank">
								授权</a>
							<a class="layui-btn layui-btn-xs" id="qrCode">二维码</a>
						</td>
					</tr>
					<tr>
						<td><span class="icon-pay icon-pay-wx"></span>官方微信</td>
						<td>微信</td>
						<td>
							<c:if test="${wxAuthorizedTime == ' ' }">请在查看中配置您的微信信息!</c:if>
							<c:if test="${wxAuthorizedTime != ' ' }">永不过期</c:if>
						</td>
						<td class="td-manage">
							<a class="layui-btn layui-btn-xs" onclick="x_admin_show('微信支付','${pageContext.request.contextPath }/Merchant/getWeixinPage')">
								查看</a>
						</td>
					</tr>
					<tr>
						<td><span class="icon-pay icon-pay-rmb"></span>现金（预充值）</td>
						<td>现金</td>
						<td>永不过期</td>
						<td class="td-manage">

						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>

</html>