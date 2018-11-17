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
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/style.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
		<style>
			.layui-form-item {
				margin-bottom: 0;
			}
			
			.layui-form-label {
				padding-left: 0;
				width: 75px;
				padding-top: 4px;
				padding-bottom: 4px;
			}
			
			.layui-form-mid {
				padding-top: 4px !important;
				padding-bottom: 4px !important;
			}
			
			.layui-form-item .layui-form-mid.layui-word-aux:nth-child(3) {
				margin: 0;
				float: right;
			}
			
			.layui-elem-quote span {
				line-height: 1;
			}
			
			.dingdan .layui-col>* {
				padding: 0 15px;
			}
		</style>
	</head>

	<body>
		<div class="x-body">
			<div class="layui-row">
				<div class="layui-form">
					<div class=" layui-col-md12 layui-col-sm12 layui-col-xs12" style="margin-bottom: 20px;">
						<div class="grid-demo layui-row dingdan">
							<!--订单信息-->
							<blockquote class="layui-elem-quote">
								<i class="iconfont icon-group3"></i> 订单信息
								<span style="margin-left: 30px;">商户名称：<span style="color: red"> ${merchantsName }</span></span>
								<span style="margin-left: 30px;">门店名称：<span style="color: red"> ${detailBean.shopName }</span></span>
							</blockquote>
							<div class=" layui-col-md4 layui-col-sm4 layui-col-xs4" style="padding: 0 12.5px;">
								<!--外卖信息-->
								<fieldset class="layui-elem-field layui-field-title site-demo-button">
									<legend>外卖信息</legend>
								</fieldset>
								<div class="layui-form-item">
									<label for="username" class="layui-form-label">
						                  	外卖渠道
						              </label>
									<div class="layui-form-mid layui-word-aux">
										<span class="x-black">${detailBean.takeoutType }</span>
									</div>
								</div>
								<div class="layui-form-item">
									<label for="username" class="layui-form-label">
						                  	订单流水号
						              </label>
									<div class="layui-form-mid layui-word-aux">
										<span class="x-black">${detailBean.orderNumber }</span>
									</div>
								</div>
								<div class="layui-form-item">
									<label for="username" class="layui-form-label">
					                 	 门店流水号
					              </label>
									<div class="layui-form-mid layui-word-aux">
										<span class="x-black">${detailBean.shopBillNumber }</span>
									</div>
								</div>
								<div class="layui-form-item">
									<label for="username" class="layui-form-label">
						                  	订单生效时间
						              </label>
									<div class="layui-form-mid layui-word-aux">
										<span class="x-black">${detailBean.orderEntryTime }</span>
									</div>
								</div>
								<div class="layui-form-item">
									<label for="username" class="layui-form-label">
					                 	 订单状态
					              </label>
									<div class="layui-form-mid layui-word-aux">
										<span class="x-black">${detailBean.orderState }</span>
									</div>
								</div>
							</div>
							<div class=" layui-col-md3 layui-col-sm3 layui-col-xs3" style="padding: 0 12.5px;">
								<!--交易金额-->
								<fieldset class="layui-elem-field layui-field-title site-demo-button">
									<legend>交易信息</legend>
								</fieldset>
								<div class="layui-form-item">
									<label for="username" class="layui-form-label">
						                  	交易金额
						              </label>
									<div class="layui-form-mid layui-word-aux">
										<span class="x-black">${detailBean.transactionAmount } 元</span>
									</div>
								</div>
								<div class="layui-form-item">
									<label for="username" class="layui-form-label">
						                  	实收金额
						              </label>
									<div class="layui-form-mid layui-word-aux">
										<span class="x-black">${detailBean.paidInAmount } 元</span>
									</div>
								</div>
								<div class="layui-form-item">
									<label for="username" class="layui-form-label">
						                  	服务费
						              </label>
									<div class="layui-form-mid layui-word-aux">
										<span class="x-black">${detailBean.serviceFee } 元</span>
									</div>
								</div>
								<div class="layui-form-item">
									<label for="username" class="layui-form-label">
						                  	餐盒费
						              </label>
									<div class="layui-form-mid layui-word-aux">
										<span class="x-black">${detailBean.mealsFee } 元</span>
									</div>
								</div>
								<div class="layui-form-item">
									<label for="username" class="layui-form-label">
						                  	配送费
						              </label>
									<div class="layui-form-mid layui-word-aux">
										<span class="x-black">${detailBean.shippingFee } 元</span>
									</div>
								</div>
							</div>
							<div class=" layui-col-md5 layui-col-sm5 layui-col-xs5" style="padding: 0 12.5px;">
								<fieldset class="layui-elem-field layui-field-title site-demo-button">
									<legend>用户信息</legend>
								</fieldset>
								<div class="layui-form-item">
									<label for="username" class="layui-form-label">
						                  	姓名
						              </label>
									<div class="layui-form-mid layui-word-aux">
										<span class="x-black">${detailBean.name }</span>
									</div>
								</div>
								<div class="layui-form-item">
									<label for="username" class="layui-form-label">
						                  	电话
						              </label>
									<div class="layui-form-mid layui-word-aux">
										<span class="x-black">${detailBean.phone }</span>
									</div>
								</div>
								<div class="layui-form-item">
									<label for="username" class="layui-form-label">
					                  	地址
					              </label>
									<div class="layui-form-mid layui-word-aux" style="width:calc(100% - 120px);">
										<span class="x-black">${detailBean.address }</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class=" layui-col-md12 layui-col-sm12 layui-col-xs12">
						<div class="grid-demo">
							<!--商品信息-->
							<blockquote class="layui-elem-quote"><i class="iconfont icon-feiyong"></i>商品信息</blockquote>
							<div class="layui-form-item">
								<table class="layui-hide" id="goodsDetail"></table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script>
			layui.use('table', function() {
				var table = layui.table;

				table.render({
					elem: '#goodsDetail',
					url: '${pageContext.request.contextPath }/takeout/getGoodsDetail',
					cellMinWidth: 80,
					cols: [
						[{
							field: 'goodsName',
							title: '商品名称',
							align: 'center'
						}, {
							field: 'goodsNumber',
							title: '商品数量',
							align: 'center'
						}, {
							field: 'goodsPrice',
							align: 'center',
							title: '商品单价'
						}]
					]
				});
			});
		</script>

	</body>

</html>