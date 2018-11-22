/* 
  layuiAdmin 官网主页 
*/

layui.config({
  version: 20180323
}).use(['element', 'carousel','util'], function(){
  var $ = layui.$;
  
  //Tips
  $('*[lay-tips]').on('mouseenter', function(){
    var content = $(this).attr('lay-tips');
    
    this.index = layer.tips('<div style="padding: 10px; font-size: 14px; color: #eee;">'+ content + '</div>', this, {
      time: -1
      ,maxWidth: 280
      ,tips: [3, '#3A3D49']
    });
  }).on('mouseleave', function(){
    layer.close(this.index);
  });


});

