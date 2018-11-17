<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() + path;
    application.setAttribute("basePath",basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>门店修改</title>
	<link rel="shortcut icon" href="${basePath}/configuration/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${basePath}/configuration/css/font.css">
    <link rel="stylesheet" href="${basePath}/configuration/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/configuration/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${basePath}/configuration/js/xadmin.js"></script>
	 <style>
    	.layui-form-item .layui-input-inline {width: 65%;}
    	.layui-form-item .layui-input-inline select{width: 30%;height: 38px;float: left;margin-left: 5%;}
    	.layui-form-item .layui-input-inline select:first-child{margin-left: 0;}
    </style>
    <script type="text/javascript">
		 //获取品牌列表   
		$(function() {
			$.ajax({
				type: 'POST',
				async: true,
				url: "getBrand",
				success: function(data) {
					var BrandName='${list[0].BrandName }';
					for(var i = 0; i < data.length; i++) {
						//$("#payment").append("<option value='" + data[i].BrandNumber + "'>" + data[i].BrandName + "</option>");	
						 if(BrandName==data[i].BrandName){
							$("#payment").append("<option value='" + data[i].BrandNumber + "' selected='selected'>" + data[i].BrandName + "</option>");	
						}else{
							$("#payment").append("<option value='" + data[i].BrandNumber + "'>" + data[i].BrandName + "</option>");	
						} 
						
					}
				}
			});
		})
		 
	
		 
		//获取品牌所属分类列表
		$(function() {	
			$.ajax({
				type: 'POST',
				async:true,
				cache : false,
				dataType : 'json',
				url: "brandManList2",
				success: function(data) {
					var SonIndustryName='${list[0].SonIndustryName }';
					for(var i = 0; i < data.length; i++) {
						if(SonIndustryName==data[i].SonIndustryName){
							$("#p1").append("<option value='" + data[i].SonIndustryNumber + "' selected='selected'>" + data[i].SonIndustryName + "</option>"); 
						}else{
							$("#p1").append("<option value='" + data[i].SonIndustryNumber + "'>" + data[i].SonIndustryName + "</option>"); 	
						}
						
					}
				
				}
			});
		})
		 
		//获取省份
		$(function() {
				$.ajax({
					type: 'POST',
					async: true,
					url: "getProvince",
					success: function(data) {
						var province='${list[0].Province }';
						for(var i = 0; i < data.length; i++) {
							if(province==data[i].ProvinceName){
								$("#province1").append("<option value='" + data[i].ProvinceCode + "' selected='selected'>" + data[i].ProvinceName + "</option>");
							}else{
								$("#province1").append("<option value='" + data[i].ProvinceCode + "'>" + data[i].ProvinceName + "</option>");	
							}
							
						}
					}
				});
				// 省市联动
				$("#province1").change(function() {
					$("#city1").empty();
					$("#area1").empty();
					$("#city1").append("<option value=''>请选择市</option>");
					$("#area1").append("<option value=''>请选择区/县</option>");
					var pid = $("#province1").val()
					//alert(pid);
					$.ajax({
						type: 'POST',
						async: true,
						url: "getCity",
						data: {
							"provinceId": pid
						},
						success: function(data) {
							for(var i = 0; i < data.length; i++) {
								$("#city1").append("<option value='" + data[i].CityCode + "'>" + data[i].CityName + "</option>");
							}
							$.ajax({
								type: 'POST',
								url: "getArea",
								data: {
									"cityId": data[0].CityCode
								},
								success: function(data) {
									for(var i = 0; i < data.length; i++) {
										$("#area1").append("<option value='" + data[i].AreaCode + "'>" + data[i].AreaName + "</option>");
									}
								}
							});

						}
					});
				});
				
				$("#city1").change(function() {
					$("#area1").empty();
					$("#area1").append("<option value=''>请选择区/县</option>");
					var cid = $("#city1").val()
					$.ajax({
						type: 'POST',
						async: true,
						url: "getArea",
						data: {
							"cityId": cid
						},
						success: function(data) {
							for(var i = 0; i < data.length; i++) {
								$("#area1").append("<option value='" + data[i].AreaCode + "'>" + data[i].AreaName + "</option>");
							}
						}
					});
				});
				
			});
    </script>
</head>
<body>
	 <div class="x-body">
        <form class="layui-form">
          
          <div class="layui-form-item">
          		<input type="hidden" name="ShopNumber" id="ShopNumber" value="${list[0].ShopNumber }">
              <label for="username" class="layui-form-label">
                  <span class="x-red">* </span>门店名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required" placeholder="请输入门店名称"
                  autocomplete="off" class="layui-input" value="${list[0].ShopName }">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">* </span>关联品牌
              </label>
							<div class="layui-input-inline">
									<select name="payment" id="payment" lay-ignore>
									</select>
							</div>
              <div class="layui-form-mid layui-word-aux">
                 	
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">* </span>所属分类
              </label>
							<div class="layui-input-inline">
								<select id="p1" name="p1" lay-ignore>
								</select>
							</div>
         </div>
          
					<div class="layui-form-item">
						<label class="layui-form-label">
							<span class="x-red">* </span>地址
						</label>
						<div class="layui-input-inline">
							<select name="province1" id="province1" lay-ignore>
							</select>
							<select name="city1" id="city1" lay-ignore>
								<option value="">${list[0].City }</option>
							</select>
							<select name="area1" id="area1" lay-ignore>
								<option value="">${list[0].Area }</option>
							</select>
						</div>
					</div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">* </span>门店地址
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="address" name="address" required="" lay-verify="required" placeholder="请输入门店地址"
                  autocomplete="off" class="layui-input" value="${list[0].Address }">
              </div>
          </div>
          
	        <div class="layui-form-item">
						<label for="username" class="layui-form-label">
							<span class="x-red">* </span>门店属性
						</label>
						<div class="layui-input-inline">
							<input type="radio" name="sex" value="0" title="直营" checked="">
							<input type="radio" name="sex" value="1" title="加盟">
						</div>
					</div>
					
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">* </span>门店联系人
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="clerkname" name="clerkname" required="" lay-verify="required" placeholder="请输入门店联系人"
                  autocomplete="off" class="layui-input" value="${list[0].ClerkName }">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">
                  更改
              </button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          /* //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("修改成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
          }); */
          
          form.on('submit(add)', function(data){
      	 	console.log(data);
	            var index = parent.layer.getFrameIndex(window.name);
	             var shopNumber = $("#ShopNumber").val();
	             var payment = $("#payment").val();//品牌编号
	             var username = $("#username").val();//店铺名称
	        	 var province1 = $("#province1 option:selected").text();
				 var city1 = $("#city1 option:selected").text();
				 var area1 = $("#area1 option:selected").val();
				 var address = $("#address").val();//地址
				 var p1 = $("#p1").val();//子行业编号
				 var clerkname = $("#clerkname").val();//联系人
				 var attr = $("input[name='sex']:checked").val();
				$.ajax({
					type : "POST",
					url : 'storeManagementUpdate1',
					data : {
						shopNumber:shopNumber,
						payment : payment,
						username : username,
						province1 : province1,
						city1 : city1,
						area1 : area1,
						address : address,
						p1 : p1,
						clerkname : clerkname,
						attr : attr
					},
					dataType : 'json',
					cache : false,
					success : function(data) {
						if ("success" == data.result) {	
							layer.alert("修改成功", {icon: 6},function () {
								var index = parent.layer.getFrameIndex(window.name);
								window.parent.location.reload();
								 parent.layer.close(index);
				                window.location.href = 'storeManagementList';
				            });
				            return false;
							
						} else {
							layer.alert(data.msg, {icon: 6},function () {
				                // 获得frame索引
				                var index = parent.layer.getFrameIndex(window.name);
				                //关闭当前frame
				                parent.layer.close(index);
				            });
							return;
						}
						
					}
					
				})
	          });   
          
          
        });
    </script>
</body>
</html>