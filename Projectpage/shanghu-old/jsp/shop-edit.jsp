<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加门店</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/jquery-3.2.1.js"></script>
		<!-- bootstrap  -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/bootstrap/css/bootstrap.min.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/bootstrap/js/bootstrap.min.js"></script>
		<!-- 图片上传即使预览插件 -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/fileinput.min.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/fileinput.min.js"></script>
		<!-- 这个是汉化-->
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/zh.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/xadmin.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/lib/layui/css/layui.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/configuration/css/style.css">

		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/js/xadmin.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/configuration/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript">
			$(function() {
				$.ajax({
					type: 'POST',
					async: true,
					url: "${pageContext.request.contextPath }/hongsou/getProvince",
					success: function(data) {
						for(var i = 0; i < data.length; i++) {
							$("#province").append("<option value='" + data[i].ProvinceID + "'>" + data[i].ProvinceName + "</option>");
						}
					}
				});
			})
		</script>
	</head>
	<style type="text/css">
		#upload_img_list {
			margin: 10px 0 0 0
		}
		
		#upload_img_list dd {
			position: relative;
			margin: 0 10px 10px 0;
			float: left
		}
		
		#upload_img_list .operate {
			position: absolute;
			top: 0;
			right: 0;
			z-index: 1
		}
		
		#upload_img_list .operate i {
			cursor: pointer;
			background: #2F4056;
			padding: 2px;
			line-height: 15px;
			text-align: center;
			color: #fff;
			margin-left: 1px;
			float: left;
			filter: alpha(opacity=80);
			-moz-opacity: .8;
			-khtml-opacity: .8;
			opacity: .8
		}
		
		#upload_img_list dd .img {
			max-height: 150px;
			max-width: 500px
		}
	</style>

	<body>
		<div class="x-body">
			<form class="layui-form">
				<input type="hidden" id="picAddress" name="picAddress" required="" autocomplete="off" class="layui-input" value="${shop.picAddress}">
				<input value="${shop.shopNumber }" type="hidden" id="shopNumber" name="shopNumber" required="" lay-verify="required" autocomplete="off" class="layui-input">
				<div class="layui-form-item">
					<label for="username" class="layui-form-label">
                  		<span class="x-red">*</span> 门店名称
              		</label>
					<div class="layui-input-inline">
						<input value="${shop.shopName }" type="text" id="shopName" name="shopName" required="" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="username" class="layui-form-label">
                  		店铺照片
              		</label>
					<div class="layui-input-inline x-so">
						<div class="form-group">
							<div class="layui-upload-list">
								<c:if test="${empty picAddress}">暂无照片,请上传门头照!</c:if> 
								<c:forEach items="${picAddress }" var="pic">
									<img class="layui-upload-img"  src="${pic}" <c:if test="${'' eq pic}">style="display: none;"</c:if>>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<label for="username" class="layui-form-label">
                  		<span class="x-red">*</span> 上传照片
              		</label>
					<div class="layui-input-inline" style="width: 590px;">
						<div class="form-group">
							<input id="myfile" name="myfile" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="2">
						</div>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label"><span class="x-red">*</span> 请选择省市区</label>
					<div class="layui-input-inline">
						<select name="province" id="province" lay-ignore>
							<option value="${shop.provinceID}">${shop.province}</option>
						</select>
					</div>
					<div class="layui-input-inline">
						<select name="city" id="city" lay-ignore>
							<option value="${shop.cityID}">${shop.city}</option>
						</select>
					</div>
					<div class="layui-input-inline">
						<select name="area" id="area" lay-ignore>
							<option value="${shop.areaID}">${shop.area}</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label"><span class="x-red">*</span> 门店地址</label>
					<div class="layui-input-inline">
						<input value="${ shop.address}" type="text" id="address" name="address" required="" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="phone" class="layui-form-label">
				        <span class="x-red">*</span> 经纬度
				    </label>
					<div class="layui-input-inline">
						<input type="text" id="latitudeAndLongitude" name="latitudeAndLongitude" required="" class="layui-input" value="${ shop.latitudeAndLongitude}">
					</div>
					<div class="layui-form-mid layui-word-aux">
						<a href="http://lbs.qq.com/tool/getpoint/index.html" target="_blank" style="color:#0079f4;">拾取当前经纬度</a>
					</div>
				</div>
				<div class="layui-form-item">
					<label for="phone" class="layui-form-label">
                  	<span class="x-red">*</span> 门店电话
              	</label>
					<div class="layui-input-inline">
						<input value="${shop.tphone}" type="text" id="tphone" name="tphone" required="" lay-verify="tphone" autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">备注1</label>
					<div class="layui-input-inline" style="width: calc(100% - 150px);">
						<textarea id="remarkOne" name="remarkOne" placeholder="请输入内容" class="layui-textarea">${shop.remarkOne}</textarea>
					</div>
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">备注2</label>
					<div class="layui-input-inline" style="width: calc(100% - 150px);">
						<textarea id="remarkTwo" name="remarkTwo" placeholder="请输入内容" class="layui-textarea">${shop.remarkTwo}</textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label">
              	</label>
					<button class="layui-btn" lay-filter="add" lay-submit="">
                 	保存
              		</button>

				</div>
			</form>
		</div>

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
						url: "${pageContext.request.contextPath }/shop/editShop",
						async: true,
						data: data.field,
						success: function(data) {
							layer.alert("修改成功 ", {
								icon: 6
							}, function() {
								// 获得frame索引
								var index = parent.layer.getFrameIndex(window.name);
								//关闭当前frame
								parent.layer.close(index);
							});
						}
					});
					return false;
				});
			});

			//上传函数
			$("#myfile").fileinput({
				uploadUrl: '${pageContext.request.contextPath }/shop/addShopPic',
				allowedFileExtensions: ['jpg', 'png', 'gif'],
				overwriteInitial: false,
				maxFileSize: 1000,
				maxFilesNum: 10,
				language: 'zh',
				slugCallback: function(filename) {
					return filename.replace('(', '_').replace(']', '_');
				}
			});

			// 回调函数
			$('#myfile').on('fileuploaded', function(event, data, previewId, index) {

				var response = data.response;

				if(response.code == 1) {
					alert("上传失败 ! 请重新上传");
				} else if(response.code == 0) {
					// 获取地址栏中的信息
					var url = $("#picAddress").val();
					// 拼接地址
					url = url + response.desc + "--";
					// 将值返回到上方框中
					$("#picAddress").val(url);
				}

			});

			// 省市联动
			$("#province").change(function() {
				$("#city").empty();
				$("#area").empty();
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

			$("#city").change(function() {
				$("#area").empty();
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
		</script>
	</body>

</html>