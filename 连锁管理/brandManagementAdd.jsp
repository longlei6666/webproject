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
<title>品牌添加</title>
	<link rel="shortcut icon" href="./favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="./css/font.css">
	<link rel="stylesheet" href="//at.alicdn.com/t/font_457932_cqbv0v0vg5yx2yb9.css" />
	<link rel="stylesheet" href="./css/xadmin.css">
	<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/xadmin.js"></script>
	 <style>
    	.layui-form-select dl{max-height:155px;}
    </style>
  
</head>
<body>
	<div class="x-body">
			<div class="layui-row">
				<form class="layui-form layui-col-md12">
					<div class="grid-demo">
						<!--基本资料-->
						<blockquote class="layui-elem-quote"><i class="iconfont icon-wode"></i>新增品牌</blockquote>

						<div class="layui-form-item">
							<label for="username" class="layui-form-label">
                  	<span class="x-red">* </span>品牌名称：
              </label>
							<div class="layui-input-inline">
								<input type="text" id="username" name="username" required="" lay-verify="required" placeholder="品牌名称"
                  autocomplete="off" class="layui-input">
							</div>
						</div>

						<div class="layui-form-item">
							<label for="username" class="layui-form-label">
	                  	<span class="x-red">* </span>所属分类：
	              </label>
							<div class="layui-input-inline">
								<select id="p1" name="province" lay-ignore>
									<option value="">请选择所属分类</option>
								</select>
							</div>
						</div>
						<!--基本资料-->

					</div>
				</form>

			</div>
			<div class="layui-row formbtnb">
				<div class="grid-demo">
					<div class="layui-form-item">
						<label for="L_repass" class="layui-form-label">
				      </label>
						<button class="layui-btn formbtn" lay-filter="add" lay-submit="">增加</button>
						<button class="layui-btn layui-btn-warm formbtn" onclick="x_admin_close()" lay-filter="" lay-submit="">取消</button>
					</div>
				</div>
			</div>
		</div>
		
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;

          /* //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
          }); */
          
          form.on('submit(add)', function(data){
        	  var index = parent.layer.getFrameIndex(window.name);
        	  
	            var username = $("#username").val();
				var province = $("#p1").val();
				$.ajax({
					type : "POST",
					url : 'brandManagementAdd2',
					data : {
						username : username,
						 sonNumber : province
					},
					dataType : 'json',
					cache : false,
					success : function(data) {					
						if ("success" == data.result) {	
							layer.alert("增加成功", {icon: 6},function () {
								var index = parent.layer.getFrameIndex(window.name);
								window.parent.location.reload();
								 parent.layer.close(index);
								window.location.href = 'brandManagementList';
				            });
							 return false;
						} 
						else {
							layer.alert(data.msg, {icon: 6},function () {
								var index = parent.layer.getFrameIndex(window.name);
								 parent.layer.close(index);
				            });
							
							return;
						}
					}
				})
            
	          });
          
          $(function() {
				$.ajax({
					type: 'POST',
					async:true,
					cache : false,
					dataType : 'json',
					url: "brandManList2",
					success: function(data) {
						for(var i = 0; i < data.length; i++) {
							 $("#p1").append("<option value='" + data[i].SonIndustryNumber + "'>" + data[i].SonIndustryName + "</option>"); 
						}
					
					}
				});
			});
          
          
        });
    </script>
    
    
</body>
</html>