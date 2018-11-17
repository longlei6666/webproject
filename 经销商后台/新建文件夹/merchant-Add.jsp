<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加商户</title>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/xadmin.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/style.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
		<script type="text/javascript">
			$(function() {
				$.ajax({
					type: 'POST',
					async: true,
					url: "${pageContext.request.contextPath }/hongsou/getProvince",
					success: function(data) {
						for(var i = 0; i < data.length; i++) {
							$("#province").append("<option value='" + data[i].ProvinceID + "'>" + data[i].ProvinceName + "</option>");
							$("#businessLicenseProvince").append("<option value='" + data[i].ProvinceID + "'>" + data[i].ProvinceName + "</option>");
						}
					}
				});
			})
		</script>
	</head>

	<body>
		<style>
			.layui-upload-mdimg {
				width: 92px;
				height: 92px;
				margin: 0 10px 10px 0;
			}
			
			.layui-upload-mdlist {
				overflow: hidden;
			}
			
			.layui-upload-mdlist li {
				width: 100px;
				float: left;
				text-align: center;
				position: relative;
			}
			
			.mdimg-delete {
				position: absolute;
				right: 8px;
				top: 0;
				width: 25px;
				height: 25px;
				line-height: 25px;
				border-radius: 5px;
				opacity: 0.58;
				cursor: pointer;
			}
		</style>

		<div class="x-nav">
			<span class="layui-breadcrumb">
		        <a href="">首页</a>
		        <a href="${pageContext.request.contextPath }/page/getMerchantsPage">商户管理</a>
		        <a>添加</a>
		    </span>
		</div>
		<div class="x-body">
			<div class="layui-row">
				<form class="layui-form" id="myFrom">
					<input type="hidden" name="shopLogo" id="shopLogo" />
					<input type="hidden" name="shopPicAddress" id="shopPicAddress" />
					<input type="hidden" name="bankCardPhoto" id="bankCardPhoto" />
					<input type="hidden" name="openingBankPhoto" id="openingBankPhoto" />
					<input type="hidden" name="businessLicensePhoto" id="businessLicensePhoto" />
					<input type="hidden" name="specialPhoto" id="specialPhoto" />
					<input type="hidden" name="organizationStructurePhoto" id="organizationStructurePhoto" />
					<input type="hidden" name="businessLicenseAuthorizePhoto" id="businessLicenseAuthorizePhoto" />
					<input type="hidden" name="idCardPic_FrontFace" id="idCardPic_FrontFace" />
					<input type="hidden" name="idCardPic_ReverseSide" id="idCardPic_ReverseSide" />

					<div class="layui-col-md12">
						<div class="grid-demo">
							<!--基本资料-->
							<blockquote class="layui-elem-quote"><i class="iconfont icon-wode"></i>基本资料</blockquote>
							<fieldset class="layui-elem-field layui-field-title site-demo-button" style="margin-top: 30px;">
								<legend>支付通道</legend>
							</fieldset>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label">支付宝</label>
								<div class="layui-input-inline">
									<select name="alipayPassageway" id="alipayPassageway">
										<option value="">关闭</option>
										<option value="hongsou">官方</option>
									</select>
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label">微信</label>
								<div class="layui-input-inline">
									<select name="wxpayPassageway" id="wxpayPassageway">
										<option value="">关闭</option>
										<option value="hongsou">官方</option>
									</select>
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label">银联卡</label>
								<div class="layui-input-inline">
									<select name="bankpayPassageway" id="bankpayPassageway">
										<option value="">关闭</option>
										<option value="hongsou">官方</option>
									</select>
								</div>
							</div>

							<fieldset class="layui-elem-field layui-field-title site-demo-button" style="margin-top: 30px;">
								<legend>商户类型</legend>
							</fieldset>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label"></label>
								<div class="layui-input-inline">
									<input type="radio" name="merchantType" value="个体" title="个体" checked="">
									<input type="radio" name="merchantType" value="企业" title="企业">
								</div>
							</div>

							<fieldset class="layui-elem-field layui-field-title site-demo-button" style="margin-top: 30px;">
								<legend>商户详细信息</legend>
							</fieldset>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label">
				                                支付宝账号
				            </label>
								<div class="layui-input-inline">
									<input type="text" id="alipayUsername" name="alipayUsername" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label">
				                                微信商户号
				            </label>
								<div class="layui-input-inline">
									<input type="text" id="wxpayUsername" name="wxpayUsername" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>

							<div class="layui-form-item">

								<label for="username" class="layui-form-label uploadtitle"><span class="x-red">* </span>企业Logo</label>
								<div class="layui-upload">
									<div class="layui-upload-list">
										<img class="layui-upload-img" id="imgLogo">
										<p id="logoText"></p>
									</div>
									<button type="button" class="layui-btn uploadbtn" name="file" id="file">选择图片</button>
									<button type="button" class="layui-btn uploadbtn" id="uploadLogo">上传</button>
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label"><span class="x-red">* </span>联系人</label>
								<div class="layui-input-inline">
									<input type="text" id="merchantName" name="merchantName" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label"><span class="x-red">* </span>联系手机号</label>
								<div class="layui-input-inline">
									<input type="text" id="merchantPhone" name="merchantPhone" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux">
									<span class="x-red">（默认作为主账号，请勿重复）</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label"><span class="x-red">* </span>联系邮箱</label>
								<div class="layui-input-inline">
									<input type="text" id="merchantEmail" name="merchantEmail" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label"><span class="x-red">* </span>企业名称</label>
								<div class="layui-input-inline">
									<input type="text" id="enterpriseName" name="enterpriseName" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label"><span class="x-red">* </span>企业简称</label>
								<div class="layui-input-inline">
									<input type="text" id="enterpriseAbbreviation" name="enterpriseAbbreviation" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label">售卖类商品描述</label>
								<div class="layui-input-inline">
									<textarea placeholder="请输入内容" name="sellingType" id="sellingType" class="layui-textarea"></textarea>
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label">客服电话</label>
								<div class="layui-input-inline">
									<input type="text" id="tphone" name="tphone" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label"><span class="x-red">* </span>联系地址</label>
								<div class="layui-input-inline shengshiqu">
									<select id="province" name="province" lay-ignore>
										<option value="">请选择省</option>
									</select>
									<select id="city" name="city" lay-ignore>
										<option value="">请选择市</option>
									</select>
									<select id="area" name="area" lay-ignore>
										<option value="">请选择区/县</option>
									</select>
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label"><span class="x-red">* </span>详细地址</label>
								<div class="layui-input-inline">
									<input type="text" id="address" name="address" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="phone" class="layui-form-label">
				                  <span class="x-red">*</span>经纬度
				              </label>
								<div class="layui-input-inline">
									<input type="text" id="longitude" name="longitude" required="" class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux">
									<a href="http://lbs.qq.com/tool/getpoint/index.html" target="_blank" style="color:#0079f4;">拾取当前经纬度</a>
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label">门店名称</label>
								<div class="layui-input-inline">
									<input type="text" id="shopName" name="shopName" required="" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label uploadtitle">
					                <span class="x-red">* </span>门店图片
					            </label>
								<div class="layui-input-inline">
									<div class="layui-upload">
										<blockquote class="layui-elem-quote layui-elem-md layui-quote-nm" style="margin-top: 10px;">
											预览图：
											<ul class="layui-upload-list layui-upload-mdlist" id="shopImgList"></ul>
											<p id="shopText"></p>
										</blockquote>
										<button type="button" class="layui-btn" id="selectShopImg">选择图片</button>
										<button type="button" class="layui-btn" id="uploadShop">上传</button>
									</div>
								</div>

							</div>
							<div class="layui-form-item layui-form-text">
								<label class="layui-form-label">备注1</label>
								<div class="layui-input-inline">
									<textarea placeholder="请输入内容" name="remarkOne" id="remarkOne" class="layui-textarea"></textarea>
								</div>
							</div>
							<div class="layui-form-item layui-form-text">
								<label class="layui-form-label">备注2</label>
								<div class="layui-input-inline">
									<textarea placeholder="请输入内容" name="remarkTwo" id="remarkTwo" class="layui-textarea"></textarea>
								</div>
							</div>

							<!--基本资料-->

							<!--支付扣费标准-->
							<blockquote class="layui-elem-quote"><i class="iconfont icon-group3"></i>支付扣费标准</blockquote>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label"><span class="x-red">* </span>支付宝</label>
								<div class="layui-input-inline">
									<input type="number" id="alipayDeductionStandard" name="alipayDeductionStandard" required="" lay-verify="" autocomplete="off" class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux">
									<span class="x-red">（单位为%，%不需要填写）</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label"><span class="x-red">* </span>微信</label>
								<div class="layui-input-inline">
									<input type="number" id="wxpayDeductionStandard" name="wxpayDeductionStandard" required="" lay-verify="" autocomplete="off" class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux">
									<span class="x-red">（单位为%，%不需要填写）</span>
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label"><span class="x-red">* </span>银联卡</label>
								<div class="layui-input-inline">
									<input type="number" id="bankCardDeductionStandard" name="bankCardDeductionStandard" required="" lay-verify="" autocomplete="off" class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux">
									<span class="x-red">（单位为%，%不需要填写）</span>
								</div>
							</div>
							<!--支付扣费标准-->

							<!--银行卡信息-->
							<blockquote class="layui-elem-quote"><i class="iconfont icon-yinxingqia"></i>银行卡信息</blockquote>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label">账户类型</label>
								<div class="layui-input-inline">
									<select name="accountType" id="accountType">
										<option value="">-请选择-</option>
										<option value="0">个人账户</option>
										<option value="1">对公账户</option>
									</select>
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label uploadtitle">入账银行卡正面照</label>
								<div class="layui-upload">
									<div class="layui-upload-list">
										<img class="layui-upload-img" id="imgBankCard">
										<p id="bankCardText"></p>
									</div>
									<button type="button" class="layui-btn uploadbtn" id="selectBankCard">选择图片</button>
									<button type="button" class="layui-btn uploadbtn" id="uploadBankCard">上传</button>
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label uploadtitle">开户许可证照</label>
								<div class="layui-upload">
									<div class="layui-upload-list">
										<img class="layui-upload-img" id="imgOpenAccount">
										<p id="openAccountText"></p>
									</div>
									<button type="button" class="layui-btn uploadbtn" id="selectOpenAccount">选择图片</button>
									<button type="button" class="layui-btn uploadbtn" id="uploadOpenAccount">上传</button>
								</div>
							</div>

							<div class="layui-form-item">
								<label for="openingBankName" class="layui-form-label"><span class="x-red">* </span>开户银行</label>
								<div class="layui-input-inline">
									<input type="text" id="openingBankName" name="openingBankName" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="openingBranchName" class="layui-form-label"><span class="x-red">* </span>开户支行</label>
								<div class="layui-input-inline">
									<input type="text" id="openingBranchName" name="openingBranchName" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label"><span class="x-red">* </span>银行卡号</label>
								<div class="layui-input-inline">
									<input type="text" id="bankCard" name="bankCard" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label"><span class="x-red">* </span>持卡人姓名</label>
								<div class="layui-input-inline">
									<input type="text" id="cardHoldingName" name="cardHoldingName" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label"><span class="x-red">* </span>身份证号码</label>
								<div class="layui-input-inline">
									<input type="text" id="idNumber" name="idNumber" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label">	银行预留号码</label>
								<div class="layui-input-inline">
									<input type="text" id="mphone" name="mphone" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<!--银行卡信息-->
						</div>

					</div>
					<div class="layui-col-md12">

						<div class="grid-demo">
							<!--执照信息-->
							<blockquote class="layui-elem-quote"><i class="iconfont icon-zhizhao"></i>执照信息</blockquote>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label">
			                  	<span class="x-red">* </span>注册地址
			              	</label>
								<div class="layui-input-inline">
									<input type="text" id="registeredAddress" name="registeredAddress" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label">
			                  	<span class="x-red">* </span>商家经营类目
			              	</label>
								<div class="layui-input-inline shengshiqu">
									<select id="industryType" name="industryType">
										<option value="">请选择类目</option>
										<option value="餐饮/食品">餐饮/食品</option>
										<option value="生活/家居">生活/家居</option>
										<option value="票务/旅游">票务/旅游</option>
										<option value="生活缴费">生活缴费</option>
										<option value="金融">金融</option>
										<select>
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label">
			                  	<span class="x-red">* </span>执照号码
			              	</label>
								<div class="layui-input-inline">
									<input type="text" id="businessLicense" name="businessLicense" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label">执照有效期</label>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" name="businessLicenseTime" id="businessLicenseTime" placeholder="">
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label uploadtitle">
			                  	<span class="x-red">* </span>营业执照
			              	</label>
								<div class="layui-upload">
									<div class="layui-upload-list">
										<img class="layui-upload-img" id="imgBusinessLicense">
										<p id="businessLicenseText"></p>
									</div>
									<button type="button" class="layui-btn uploadbtn" id="selectBusinessLicense">选择图片</button>
									<button type="button" class="layui-btn uploadbtn" id="uploadBusinessLicense">上传</button>
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label uploadtitle">
			                  	特殊资质图片
			              	</label>
								<div class="layui-upload">
									<div class="layui-upload-list">
										<img class="layui-upload-img" id="imgSpecialPhoto">
										<p id="specialPhotoText"></p>
									</div>
									<button type="button" class="layui-btn uploadbtn" id="selectSpecialPhoto">选择图片</button>
									<button type="button" class="layui-btn uploadbtn" id="uploadSpecialPhoto">上传</button>
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label">
			                  	<span class="x-red">* </span>企业经营范围
			              	</label>
								<div class="layui-input-inline">
									<input type="text" id="scope" name="scope" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label">
			                  	<span class="x-red">* </span>所在省代码
			              	</label>
								<div class="layui-input-inline sheng">
									<select id="businessLicenseProvince" name="businessLicenseProvince" lay-ignore>
										<option value="">请选择省</option>
									</select>
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label">
			                  	<span class="x-red">* </span>所在市代码
			              	</label>
								<div class="layui-input-inline shi">
									<select id="businessLicenseCity" name="businessLicenseCity" lay-ignore>
										<option value="">请选择市</option>
									</select>
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label">是否三证合一</label>
								<div class="layui-input-inline">
									<input type="radio" name="three" id="three" value="0" title="是" checked="">
									<input type="radio" name="three" id="three" value="1" title="否">
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label typetitlel">
			                  	组织机构代码证号
			              	</label>
								<div class="layui-input-inline">
									<input type="text" id="organizationStructure" name="organizationStructure" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label uploadtitle">
			                  	<span class="x-red">* </span>组织机构代码证图
			              	</label>
								<div class="layui-upload">
									<div class="layui-upload-list">
										<img class="layui-upload-img" id="imgOrganizationStructure">
										<p id="organizationStructureText"></p>
									</div>
									<button type="button" class="layui-btn uploadbtn" id="selectOrganizationStructure">选择图片</button>
									<button type="button" class="layui-btn uploadbtn" id="uploadOrganizationStructure">上传</button>
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label uploadtitle">
			                  	营业执照授权函图
			              	</label>
								<div class="layui-upload">
									<div class="layui-upload-list">
										<img class="layui-upload-img" id="imgBusinessLicenseAuthorizePhoto">
										<p id="businessLicenseAuthorizePhotoText"></p>
									</div>
									<button type="button" class="layui-btn uploadbtn" id="selectBusinessLicenseAuthorizePhoto">选择图片</button>
									<button type="button" class="layui-btn uploadbtn" id="uploadBusinessLicenseAuthorizePhoto">上传</button>
								</div>
							</div>

							<!--执照信息-->

							<!--法人信息-->
							<blockquote class="layui-elem-quote"><i class="iconfont icon-faren"></i>法人信息</blockquote>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label">
			                  	<span class="x-red">* </span>法人姓名
			              	</label>
								<div class="layui-input-inline">
									<input type="text" id="name" name="name" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label">
				                <span class="x-red">* </span>证件类型
			              	</label>
								<div class="layui-input-inline">
									<select id="documentsType" name="documentsType">
										<option value="">-请选择-</option>
										<option value="1">身份证</option>
										<select>
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label">
			                  	<span class="x-red">* </span>法人证件号码
			              	</label>
								<div class="layui-input-inline">
									<input type="text" id="legalPersonIdNumber" name="legalPersonIdNumber" required="" lay-verify="required" autocomplete="off" class="layui-input">
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label">
	                  			法人证件有效期
	              			</label>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" id="idValidityPeriod" name="idValidityPeriod" placeholder="">
								</div>
							</div>

							<div class="layui-form-item">
								<label for="username" class="layui-form-label uploadtitle">
			                  		<span class="x-red">* </span>法人证件正面照
			              		</label>
								<div class="layui-upload">
									<div class="layui-upload-list">
										<img class="layui-upload-img" id="imgIdCardPic_FrontFace">
										<p id="idCardPic_FrontFaceText"></p>
									</div>
									<button type="button" class="layui-btn uploadbtn" id="selectIdCardPic_FrontFace">选择图片</button>
									<button type="button" class="layui-btn uploadbtn" id="uploadIdCardPic_FrontFace">上传</button>
								</div>
							</div>
							<div class="layui-form-item">
								<label for="username" class="layui-form-label uploadtitle">
				              	<span class="x-red">* </span>法人证件背面照
				            </label>
								<div class="layui-upload">
									<div class="layui-upload-list">
										<img class="layui-upload-img" id="imgIdCardPic_ReverseSide">
										<p id="idCardPic_ReverseSideText"></p>
									</div>
									<button type="button" class="layui-btn uploadbtn" id="selectIdCardPic_ReverseSide">选择图片</button>
									<button type="button" class="layui-btn uploadbtn" id="uploadIdCardPic_ReverseSide">上传</button>
								</div>
							</div>
							<!--法人信息-->
						</div>
					</div>
					<div class="layui-row formbtnb">
						<div class="grid-demo">
							<div class="layui-form-item">
								<label for="L_repass" class="layui-form-label">
				      </label>
								<button class="layui-btn formbtn" lay-filter="add" lay-submit="">提交</button>
								<input type="button" value="返回" onclick="javascript:history.back();" class="layui-btn layui-btn-warm formbtn">
							</div>
						</div>
					</div>
				</form>
				<!--<button class="layui-btn x-so"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i>搜索</button>-->
			</div>
		</div>
		<script>
			layui.use('laydate', function() {
				var laydate = layui.laydate;
				
				//日期时间范围1
				laydate.render({
					elem: '#idValidityPeriod',
					range: true
				});
				
				laydate.render({
					elem: '#businessLicenseTime',
					range: true
				});

			});
		</script>
		<script>
			// 省市联动
			$("#province").change(function() {
				$("#city").empty();
				$("#area").empty();
				$("#city").append("<option value=''>请选择市</option>");
				$("#area").append("<option value=''>请选择区/县</option>");
				var pid = $("#province").val()
				$.ajax({
					type: 'POST',
					async: true,
					url: "${pageContext.request.contextPath }/hongsou/getCity",
					data: {
						"provinceId": pid
					},
					success: function(data) {
						for(var i = 0; i < data.length; i++) {
							$("#city").append("<option value='" + data[i].CityID + "'>" + data[i].CityName + "</option>");
						}
						$.ajax({
							type: 'POST',
							url: "${pageContext.request.contextPath }/hongsou/getArea",
							data: {
								"cityId": data[0].CityID
							},
							success: function(data) {
								for(var i = 0; i < data.length; i++) {
									$("#area").append("<option value='" + data[i].AreaID + "'>" + data[i].AreaName + "</option>");
								}
							}
						});

					}
				});
			});

			// 市区联动
			$("#city").change(function() {
				$("#area").empty();
				$("#area").append("<option value=''>请选择区/县</option>");
				var cid = $("#city").val()
				$.ajax({
					type: 'POST',
					async: true,
					url: "${pageContext.request.contextPath }/hongsou/getArea",
					data: {
						"cityId": cid
					},
					success: function(data) {
						for(var i = 0; i < data.length; i++) {
							$("#area").append("<option value='" + data[i].AreaID + "'>" + data[i].AreaName + "</option>");
						}
					}
				});
			});

			// 省市联动
			$("#businessLicenseProvince").change(function() {
				$("#businessLicenseCity").empty();
				$("#businessLicenseCity").append("<option value=''>请选择市</option>");
				var pid = $("#businessLicenseProvince").val()
				$.ajax({
					type: 'POST',
					async: true,
					url: "${pageContext.request.contextPath }/hongsou/getCity",
					data: {
						"provinceId": pid
					},
					success: function(data) {
						for(var i = 0; i < data.length; i++) {
							$("#businessLicenseCity").append("<option value='" + data[i].CityID + "'>" + data[i].CityName + "</option>");
						}
					}
				});
			});
		</script>
		<script>
			layui.use('upload', function() {
				var $ = layui.jquery,
					upload = layui.upload;

				//Logo上传
				upload.render({
					elem: '#file',
					url: '${pageContext.request.contextPath }/merchant/addMerchantPic',
					method: 'post',
					auto: false,
					bindAction: '#uploadLogo',
					choose: function(obj) {
						obj.preview(function(index, file, result) {
							$('#imgLogo').attr('src', result);
						});
					},
					done: function(res) {

						if(res.code == 0) {
							layer.msg('上传成功');
							// 获取后台返回的地址,并存储到上方隐藏域
							url = res.desc;
							$("#shopLogo").val(url);
						} else {
							layer.alert('上传失败,请重新上传!');
						}
					},
					error: function() {
						//演示失败状态，并实现重传
						var demoText = $('#logoText');
						demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
						demoText.find('.demo-reload').on('click', function() {
							uploadInst.upload();
						});
					}
				});

				//门店图片上传
				var demoListView = $('#shopImgList'),
					uploadListIns = upload.render({
						elem: '#selectShopImg',
						url: '${pageContext.request.contextPath }/merchant/addMerchantPic',
						auto: false,
						multiple: true,
						bindAction: '#uploadShop',
						choose: function(obj) {
							var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
							//读取本地文件
							obj.preview(function(index, file, result) {
								var tr = $(['<li id="upload-' + index + '">', '<td><img src="' + result + '" alt="' + file.name + '" class="layui-upload-img layui-upload-mdimg"></td>', '<td>', '<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>', '<i class="layui-icon layui-btn-danger demo-delete img-delete mdimg-delete">&#xe640;</i>', '</td>', '</li>'].join(''));

								//删除
								tr.find('.demo-delete').on('click', function() {
									delete files[index]; //删除对应的文件
									tr.remove();
									uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
								});

								demoListView.append(tr);
							});
						},
						done: function(res) {

							if(res.code == 0) {
								// 上传成功
								layer.msg('上传成功');

								// 获取上方的值,将后台传输过来的值进行拼接
								var url = $("#shopPicAddress").val();
								url = url + res.desc + "--";
								$("#shopPicAddress").val(url);
							} else {
								layer.alert('上传失败,请重新上传!');
							}

						},
						error: function() {
							//演示失败状态，并实现重传
							layer.msg('上传失败,请重新上传');
						}
					});

				//银行卡照片上传
				upload.render({
					elem: '#selectBankCard',
					url: '${pageContext.request.contextPath }/merchant/addMerchantPic',
					auto: false,
					bindAction: '#uploadBankCard',
					choose: function(obj) {
						obj.preview(function(index, file, result) {
							$('#imgBankCard').attr('src', result);
						});
					},
					done: function(res) {
						if(res.code == 0) {
							layer.msg('上传成功');
							// 获取后台返回的地址,并存储到上方隐藏域
							url = res.desc;
							$("#bankCardPhoto").val(url);

						} else {
							layer.alert('上传失败,请重新上传!');
						}
					},
					error: function() {
						//演示失败状态，并实现重传
						var demoText = $('#bankCardText');
						demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
						demoText.find('.demo-reload').on('click', function() {
							uploadInst.upload();
						});
					}
				});

				//开户许可证上传
				upload.render({
					elem: '#selectOpenAccount',
					url: '${pageContext.request.contextPath }/merchant/addMerchantPic',
					auto: false,
					bindAction: '#uploadOpenAccount',
					choose: function(obj) {
						obj.preview(function(index, file, result) {
							$('#imgOpenAccount').attr('src', result);
						});
					},
					done: function(res) {
						if(res.code == 0) {
							layer.msg('上传成功');
							// 获取后台返回的地址,并存储到上方隐藏域
							url = res.desc;
							$("#openingBankPhoto").val(url);
						} else {
							layer.alert('上传失败,请重新上传!');
						}
					},
					error: function() {
						//演示失败状态，并实现重传
						var demoText = $('#openAccountText');
						demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
						demoText.find('.demo-reload').on('click', function() {
							uploadInst.upload();
						});
					}
				});

				//营业执照照片上传
				upload.render({
					elem: '#selectBusinessLicense',
					url: '${pageContext.request.contextPath }/merchant/addMerchantPic',
					auto: false,
					bindAction: '#uploadBusinessLicense',
					choose: function(obj) {
						obj.preview(function(index, file, result) {
							$('#imgBusinessLicense').attr('src', result);
						});
					},
					done: function(res) {
						//如果上传失败
						if(res.code == 0) {
							layer.msg('上传成功');
							// 获取后台返回的地址,并存储到上方隐藏域
							url = res.desc;
							$("#businessLicensePhoto").val(url);
						} else {
							layer.alert('上传失败,请重新上传!');
						}
					},
					error: function() {
						//演示失败状态，并实现重传
						var demoText = $('#businessLicenseText');
						demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
						demoText.find('.demo-reload').on('click', function() {
							uploadInst.upload();
						});
					}
				});

				//特殊资质照片上传
				upload.render({
					elem: '#selectSpecialPhoto',
					url: '${pageContext.request.contextPath }/merchant/addMerchantPic',
					auto: false,
					bindAction: '#uploadSpecialPhoto',
					choose: function(obj) {
						obj.preview(function(index, file, result) {
							$('#imgSpecialPhoto').attr('src', result);
						});
					},
					done: function(res) {
						if(res.code == 0) {
							layer.msg('上传成功');
							// 获取后台返回的地址,并存储到上方隐藏域
							url = res.desc;
							$("#specialPhoto").val(url);
						} else {
							layer.alert('上传失败,请重新上传!');
						}
					},
					error: function() {
						//演示失败状态，并实现重传
						var demoText = $('#specialPhotoText');
						demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
						demoText.find('.demo-reload').on('click', function() {
							uploadInst.upload();
						});
					}
				});

				//组织机构代码证照片上传
				upload.render({
					elem: '#selectOrganizationStructure',
					url: '${pageContext.request.contextPath }/merchant/addMerchantPic',
					auto: false,
					bindAction: '#uploadOrganizationStructure',
					choose: function(obj) {
						obj.preview(function(index, file, result) {
							$('#imgOrganizationStructure').attr('src', result);
						});
					},
					done: function(res) {
						//如果上传失败
						if(res.code == 0) {
							layer.msg('上传成功');
							// 获取后台返回的地址,并存储到上方隐藏域
							url = res.desc;
							$("#organizationStructurePhoto").val(url);
						} else {
							layer.alert('上传失败,请重新上传!');
						}
					},
					error: function() {
						//演示失败状态，并实现重传
						var demoText = $('#organizationStructureText');
						demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
						demoText.find('.demo-reload').on('click', function() {
							uploadInst.upload();
						});
					}
				});

				//营业执照授权照片上传
				upload.render({
					elem: '#selectBusinessLicenseAuthorizePhoto',
					url: '${pageContext.request.contextPath }/merchant/addMerchantPic',
					auto: false,
					bindAction: '#uploadBusinessLicenseAuthorizePhoto',
					choose: function(obj) {
						obj.preview(function(index, file, result) {
							$('#imgBusinessLicenseAuthorizePhoto').attr('src', result);
						});
					},
					done: function(res) {
						//如果上传失败
						if(res.code == 0) {
							layer.msg('上传成功');
							// 获取后台返回的地址,并存储到上方隐藏域
							url = res.desc;
							$("#businessLicenseAuthorizePhoto").val(url);
						} else {
							layer.alert('上传失败,请重新上传!');
						}
					},
					error: function() {
						//演示失败状态，并实现重传
						var demoText = $('#businessLicenseAuthorizePhotoText');
						demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
						demoText.find('.demo-reload').on('click', function() {
							uploadInst.upload();
						});
					}
				});

				//法人证件正面照片上传
				upload.render({
					elem: '#selectIdCardPic_FrontFace',
					url: '${pageContext.request.contextPath }/merchant/addMerchantPic',
					auto: false,
					bindAction: '#uploadIdCardPic_FrontFace',
					choose: function(obj) {
						obj.preview(function(index, file, result) {
							$('#imgIdCardPic_FrontFace').attr('src', result);
						});
					},
					done: function(res) {
						if(res.code == 0) {
							layer.msg('上传成功');

							// 获取后台返回的地址,并存储到上方隐藏域
							url = res.desc;
							$("#idCardPic_FrontFace").val(url);
						} else {
							layer.alert('上传失败,请重新上传!');
						}
					},
					error: function() {
						//演示失败状态，并实现重传
						var demoText = $('#idCardPic_FrontFaceText');
						demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
						demoText.find('.demo-reload').on('click', function() {
							uploadInst.upload();
						});
					}
				});

				//法人证件反面照片上传
				upload.render({
					elem: '#selectIdCardPic_ReverseSide',
					url: '${pageContext.request.contextPath }/merchant/addMerchantPic',
					auto: false,
					bindAction: '#uploadIdCardPic_ReverseSide',
					choose: function(obj) {
						obj.preview(function(index, file, result) {
							$('#imgIdCardPic_ReverseSide').attr('src', result);
						});
					},
					done: function(res) {
						if(res.code == 0) {
							layer.msg('上传成功');

							// 获取后台返回的地址,并存储到上方隐藏域
							url = res.desc;
							$("#idCardPic_ReverseSide").val(url);
						} else {
							layer.alert('上传失败,请重新上传!');
						}
					},
					error: function() {
						//演示失败状态，并实现重传
						var demoText = $('#idCardPic_ReverseSideText');
						demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
						demoText.find('.demo-reload').on('click', function() {
							uploadInst.upload();
						});
					}
				});

			});

			// 表单提交
			layui.use(['form', 'layer'], function() {
				$ = layui.jquery;
				var form = layui.form,
				layer = layui.layer;

				//监听提交
				form.on('submit(add)', function(data) {

					//发异步，把数据提交给后台
					$.ajax({
						type: "post",
						url: "${pageContext.request.contextPath }/merchant/addMerchant",
						async: true,
						data: data.field,
						success: function(data) {
							if(data.code == 0000) {
								layer.alert("增加成功", {
									icon: 6
								}, function() {
									// 关闭并清空表单
									layer.closeAll();

									$('#myFrom')[0].reset();
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