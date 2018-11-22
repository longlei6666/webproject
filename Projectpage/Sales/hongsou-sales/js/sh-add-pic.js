/*document.querySelector('#uploaderInputidup10').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian10');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {

    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian10';
        div.appendChild(img);
        img.onload = function () {

            document.querySelector('#upload-container10').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();

         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=10');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	        	 // 上传成功

	        	 var imgurl = JSON.parse(xhr.response);

	        	 img.id="ShopDoorheadPhoto1";

	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#ShopDoorheadPhoto").setAttribute("value",imgurl.desc);
	        	 document.querySelector("#urlSite").setAttribute("value",imgurl.url);
	        	 //关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");

	         } else {
	         // 处理其他情况
	         }
         };

         xhr.onerror = function () {
         // 处理错误
        	 var node  = document.querySelector('.weui-uploader__huixian10');
        	 node.parentNode.removeChild(node);
        	 mui.alert("上传失败，请重新上传");check = false;return false;
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});*/
document.querySelector('#uploaderInputidup11').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian11');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian11';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container11').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=1');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="BusinessPhotograph1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#BusinessPhotograph").setAttribute("value",imgurl.desc);
	        	 document.querySelector("#urlSite").setAttribute("value",imgurl.url);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian8');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});
document.querySelector('#uploaderInputidup12').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian12');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian12';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container12').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=2');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="LegalPersonIdCardFace1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#LegalPersonIdCardFace").setAttribute("value",imgurl.desc);
	        	 document.querySelector("#urlSite").setAttribute("value",imgurl.url);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian12');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});
document.querySelector('#uploaderInputidup13').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian13');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian13';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container13').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=3');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="LegalPersonIdCardReversePhotograph1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#LegalPersonIdCardReversePhotograph").setAttribute("value",imgurl.desc);
	        	 document.querySelector("#urlSite").setAttribute("value",imgurl.url);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian13');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});
document.querySelector('#uploaderInputidup14').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian14');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian14';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container14').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=4');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="FrontPhotos1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#FrontPhotos").setAttribute("value",imgurl.desc);
	        	 document.querySelector("#urlSite").setAttribute("value",imgurl.url);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian14');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});
document.querySelector('#uploaderInputidup15').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian15');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian15';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container15').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=5');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="DoorHeadPhoto1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#DoorHeadPhoto").setAttribute("value",imgurl.desc);
	        	 document.querySelector("#urlSite").setAttribute("value",imgurl.url);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian15');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});
document.querySelector('#uploaderInputidup16').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian16');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian16';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container16').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=6');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="BankCardPositivePhoto1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#BankCardPositivePhoto").setAttribute("value",imgurl.desc);
	        	 document.querySelector("#urlSite").setAttribute("value",imgurl.url);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian16');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});
document.querySelector('#uploaderInputidup17').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian17');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian17';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container17').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=7');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="IdCardFront1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#IdCardFront").setAttribute("value",imgurl.desc);
	        	 document.querySelector("#urlSite").setAttribute("value",imgurl.url);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian17');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});
document.querySelector('#uploaderInputidup18').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian18');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian18';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container18').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=8');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="IdCardBack1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#IdCardBack").setAttribute("value",imgurl.desc);
	        	 document.querySelector("#urlSite").setAttribute("value",imgurl.url);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian18');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});
document.querySelector('#uploaderInputidup19').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian19');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian19';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container19').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=9');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="ThatPhoto1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#ThatPhoto").setAttribute("value",imgurl.desc);
	        	 document.querySelector("#urlSite").setAttribute("value",imgurl.url);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian19');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});
document.querySelector('#uploaderInputidup20').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian20');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian20';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container20').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=11');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="HandPhoto1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#HandPhoto").setAttribute("value",imgurl.desc);
	        	 document.querySelector("#urlSite").setAttribute("value",imgurl.url);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian20');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});
/*document.querySelector('#uploaderInputidup21').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian21');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian21';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container21').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=12');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="LicencePhoto1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#LicencePhoto").setAttribute("value",imgurl.desc);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian21');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});
document.querySelector('#uploaderInputidup22').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian22');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian22';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container22').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=13');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="BlueDescPhoto1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#BlueDescPhoto").setAttribute("value",imgurl.desc);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian22');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});
document.querySelector('#uploaderInputidup23').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian23');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian23';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container23').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=14');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="BlueShopPhoto1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#BlueShopPhoto").setAttribute("value",imgurl.desc);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian23');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});
document.querySelector('#uploaderInputidup24').addEventListener('change', function () {
	var node  = document.querySelector('.weui-uploader__huixian24');
	if(node  == ''||node  == null){
	}else{
		node.parentNode.removeChild(node);
	}
    var that = this;

    lrz(that.files[0], {
        width: 800
    })
    .then(function (rst) {
    	//document.querySelector('#uploaderInputidup').remove(".weui-uploader__huixian");
        var img = new Image(),
        div = document.createElement('div');
        div.className = 'weui-uploader__huixian24';
        div.appendChild(img);
        img.onload = function () {
            document.querySelector('#upload-container24').appendChild(div);
        };
        mui.toast("上传中,请稍等");
        mask.show(); //显示遮罩
        img.src = rst.base64;

         // 原生ajax上传代码，所以看起来特别多 ╮(╯_╰)╭，但绝对能用
         // 其他框架，例如ajax处理formData略有不同，请自行google，baidu。
         var xhr = new XMLHttpRequest();
         xhr.open('POST', ''+basepath+'/salesingup/addPic?type=15');

         xhr.onload = function () {
	         if (xhr.status === 200) {
	         // 上传成功
	        	 var imgurl = JSON.parse(xhr.response);
	        	 img.id="BluePlatformPhoto1";
	        	 img.className=imgurl.desc;
	        	 img.value=imgurl.desc;
	        	 img.name = imgurl.desc;
	        	 document.querySelector("#BluePlatformPhoto").setAttribute("value",imgurl.desc);
	        	//关闭遮罩蒙板
	        	 flag = true;
	             mask.close();
	             mui.toast("上传成功");
	         } else {
	         // 处理其他情况
	        	 var node  = document.querySelector('.weui-uploader__huixian24');
	        	 node.parentNode.removeChild(node);
	        	 mui.alert("上传失败，请重新上传");check = false;return false;
	         }
         };

         xhr.onerror = function () {
         // 处理错误
         };

         // issues #45 提到似乎有兼容性问题,关于progress
         xhr.upload.onprogress = function (e) {
         // 上传进度
         var percentComplete = ((e.loaded / e.total) || 0) * 100;
         };

         // 添加参数和触发上传
         rst.formData.append('a', '我是参数');
         xhr.send(rst.formData);
        return rst;
    });
});*/