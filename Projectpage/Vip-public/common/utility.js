var CmsUtility = (function() {

    /**
     * postAjaxCall封装
     * subApiUrl 发送请求业务逻辑API的子地址
     * postData 发送到服务器的数据，数组存储，如：{"username": "张三", "password": 123456}
     * succCallback 成功回调函数
     * errorCallback 失败回调函数
     * type 请求方式("POST" 或 "GET")， 默认已经设置为 "POST"
     * isAsync 是否异步 
     * dataType 预期服务器返回的数据类型，常用的如：xml、html、json、text
     */

    function postAjaxCall(subApiUrl, postData, succCallback, errorCallback, type, isAsync, dataType) {
        var type = type || "post";
        var dataType = dataType || "json";
        var isAsync = isAsync || true;
        var fullUrl = CmsConfig.ServiceUrl.ApiRootUrl + subApiUrl;
       //var fullUrl =  'http://192.168.1.111:5003/hs-app-server/table/getScanTableInf'
        console.log(CmsConfig.ServiceUrl.ApiRootUrl)
        $.ajax({
            type: type,
            url: fullUrl, 
            data: postData,
            async: isAsync,
            dataType: dataType,
            // headers:{
            //     contentType:"application/json"
            // },
            beforeSend: function() {
                
            },
            success: function(data) {
                
                if (!data.requestCode || data.requestCode == 0) {
                    if (succCallback) {
                        succCallback(data);
                    }
                } else {
                    if (errorCallback) {
                        errorCallback(data);
                    }
                }
            },
            complete: function() {
                
            },
            error:function(data){

            }
        });
    }

    //数据数组处理根据server 端返回的json
    function getArrFromJson(data, arr) {
        for (var i = 0; i < data.length; i++) {
            arr.push(data[i]);
        }
        return arr;
    }
    // 清空listArr数组方法
    function clearListArr(listArr) {
        for (var i = 0; i < listArr.length; i < 0) {
            listArr.splice(i);
        }
        return listArr;
    }

    // 转化时间戳
    function convertToDateTime(data, h, m) {
        return new Date(data + " " + h + ":" + m + ":" + "00").getTime();
    }

    // 日期转换开始时间戳
    function convertToStartDateTime(dateStr) {
        if (dateStr == '') {
            return ""
        } else {
            return new Date(dateStr + " " + '00:00:00').getTime();
        }
    }

    // 日期转换开始时间戳
    function convertToEndDateTime(dateStr) {
        if (dateStr == '') {
            return ""
        } else {
            return new Date(dateStr + " " + '23:59:59').getTime();
        }
    }
    //获取浏览器传参
    function getQueryString(name) {
        var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
        var r = decodeURIComponent(window.location.search).substr(1).match(reg);
        if (r != null) {
            return unescape(r[2]);
        }
        return null;
    }
    //本地存储
    function setSessionStorageItem(key, val) {
        sessionStorage.removeItem(key);
        sessionStorage.setItem(key, JSON.stringify(val));
    }
    //清除本地存储
    function removeSessionStorageItem(key) {
        sessionStorage.removeItem(key);
    }
    //获取本地存储
    function getSessionStorageItem(key) {
        var value = sessionStorage.getItem(key);
        if (value == "undefined")
            return null;
        return JSON.parse(value);
    }
    //清空所有本地存储
    function clearSessionStorageItem() {
        sessionStorage.clear();
    }

    //处理图片地址
    function setImg(src) {
        if (src == '' || src == "img/defImg.jpg") {
            return 'img/defImg.jpg';
        } else if (src.indexOf('http') == -1) {
            return CmsConfig.ServiceUrl.imgUrl + src
        } else {
            return src
        }
    }

    function getImageSrc(image) {
        if (!image)
            return "";
        if (!image.attr("src"))
            return "";
        if (image.attr("src") == CmsConstant.Image.EmptyImage)
            return "";
        return image.attr("src");
    }

    function getOSSFullUrl(path, emptypage) {
        if (path == '' || path == CmsConstant.Image.EmptyImage) {
            if (emptypage)
                return CmsConstant.Image.EmptyImage;
            else
                return "";
        } else if (path.indexOf('http') == -1) {
            return CmsConfig.ServiceUrl.imgUrl + path
        } else {
            return path
        }
    }

    function getOSSShortUrl(path) {
        if (!path) {
            return "";
        } else if (path.indexOf(CmsConfig.ServiceUrl.imgUrl) != -1) {
            return path.split(CmsConfig.ServiceUrl.imgUrl)[1];
        } else {
            return path;
        }
    }
    //上传图片
    function uploadImage(img, del, next) {

        // 创建一个 form ，如果存在，则先删除
        var form1 = document.getElementById("tempform1");
        if (form1)
            document.body.removeChild(form1);

        form1 = document.createElement("form");
        form1.id = "tempform1";
        form1.name = "tempform1";
        document.body.appendChild(form1);

        var fileType = document.createElement("input");
        fileType.type = "text";
        fileType.name = "fileType";
        fileType.id = "fileType";

        var file = document.createElement("input");
        file.type = "file";
        file.name = "file";
        file.id = "file";
        file.accept = "image/jpeg,image/jpg,image/png"

        file.onchange = function() {
            $('#mask').show()
            var strExtension = this.value.substr(this.value.lastIndexOf('.') + 1);
            fileType.value = strExtension;

            var formData = new FormData(form1);
            $.ajax({
                url: CmsConfig.ServiceUrl.ApiRootUrl + 'images/upImg',
                type: 'POST',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(result) {
                    $('#mask').hide()
                    img.attr('src', getOSSFullUrl(result));
                    if (del) {
                        del.show();
                    }
                    document.body.removeChild(form1);
                    if (next)
                        next();
                }
            });
        }
        form1.appendChild(fileType);
        form1.appendChild(file);
        file.click();
        $('#tempform1').hide()
    }
    //上传视频
    function uploadVideo(next) {
        // 创建一个 form ，如果存在，则先删除
        var form1 = document.getElementById("tempform1");
        if (form1)
            document.body.removeChild(form1);

        form1 = document.createElement("form");
        form1.id = "tempform1";
        form1.name = "tempform1";
        document.body.appendChild(form1);

        var fileType = document.createElement("input");
        fileType.type = "text";
        fileType.name = "fileType";
        fileType.id = "fileType";

        var file = document.createElement("input");
        file.type = "file";
        file.name = "file";
        file.id = "file";

        file.onchange = function() {
            var strExtension = this.value.substr(this.value.lastIndexOf('.') + 1);
            fileType.value = strExtension;
            $('#mask').show()
            var formData = new FormData(form1);
            $.ajax({
                url: CmsConfig.ServiceUrl.ApiRootUrl + 'factory/upFacVideo',
                type: 'POST',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(result) {
                    document.body.removeChild(form1);
                    $('#mask').hide()
                    if (next)
                        next(getOSSFullUrl(result));
                }
            });
        }
        form1.appendChild(fileType);
        form1.appendChild(file);
        file.click();
    }

    //页面List 排序的样式
    function getTableCommonSortStyle(btnSortId) {
        if (btnSortId.children().attr('class') == 'sort_ico') {
            $('.sort_btn').children().attr('class', 'sort_ico');
            btnSortId.children().removeClass().addClass('sortup');
        } else if (btnSortId.children().attr('class') == 'sortup') {
            btnSortId.children().removeClass().addClass('sortdown');
        } else if (btnSortId.children().attr('class') == 'sortdown') {
            btnSortId.children().removeClass().addClass('sortup');
        }
    }

    //datepick 的初始化
    function datepickControlInit() {
        $('.datepick-control').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true,
            defaultDate: new Date(),
        });
    }
    //替换中文逗号的方法
    function replace(attr) {
        attr=attr.replace(/，/ig,','); 
        return attr; 
    }

   
    //选择省
    function choosePro(p) {
        console.log(p)
        var  p = p || ''
        var pro = provice
        var str = '<option value="">请选择省</option>'
        $.ajax({
            type: 'post',
            url:CmsConfig.ServiceUrl.ApiRootUrl +  CmsConfig.addressUrl.Public.getAddress, 
            data: {
                "provinceCode":'',
                "cityCode":'',
                "areaCode":''
            },
            async: 'false',
            dataType: 'json',
            // headers:{
            //     contentType:"application/json"
            // },
           
            success: function(data) {
                for(var i = 0 ; i < data.data.length;i++){
                    if(p == data.data[i].provinceCode){
                        str += '<option value="'+data.data[i].provinceCode +'" selected="">'+ data.data[i].provinceName+'</option>'
                    }else{
                        str += '<option value="'+data.data[i].provinceCode +'">'+ data.data[i].provinceName+'</option>'
                    }
                }
                $('#provice').html(str)
            }
        })
        
    }
    function chooseCity(data,data1){
         if(!data){
            $('#city').html('<option value="">请选择市</option>')
            $('#area').html('<option value="">请选择县/区</option>')
            return
        }
        var str = '<option value="">请选择市</option>'
        var data2 = data
        var data1 = data1 || ''
        $.ajax({
            type: 'post',
            url:CmsConfig.ServiceUrl.ApiRootUrl +  CmsConfig.addressUrl.Public.getAddress, 
            data: {
                "provinceCode":data2,
                "cityCode":'',
                "areaCode":''
            },
            async: 'false',
            dataType: 'json',
            // headers:{
            //     contentType:"application/json"
            // },
           
            success: function(data) {
                 for(var i = 0 ; i < data.data.length;i++){
                    if(data1 == data.data[i].cityCode){
                        str += '<option value="'+data.data[i].cityCode +'" selected="">'+ data.data[i].cityName+'</option>'
                    }else{
                        str += '<option value="'+data.data[i].cityCode +'">'+ data.data[i].cityName+'</option>'
                    }
                    
                }
                 $('#city').html(str)
                 $('#area').html('<option value="">请选择县/区</option>')
            }
        })
       
        
        
    }
    function chooseArea(data,data1){
        console.log(data)
        if(!data){
            $('#area').html('<option value="">请选择县/区</option>')
            return
        }
        
        var str = '<option value="">请选择县/区</option>'
        var data2 = data
        var data1 = data1 || ''
        $.ajax({
            type: 'post',
            url:CmsConfig.ServiceUrl.ApiRootUrl +  CmsConfig.addressUrl.Public.getAddress, 
            data: {
                "provinceCode":'',
                "cityCode":data2,
                "areaCode":''
            },
            async: 'false',
            dataType: 'json',
            // headers:{
            //     contentType:"application/json"
            // },
           
            success: function(data) {
                console.log(data)
                for(var k = 0 ; k < data.data.length;k++){
                    if(data1 == data.data[k].areaCode){
                        str += '<option value="'+data.data[k].areaCode +'" selected="">'+ data.data[k].areaName+'</option>'
                    }else{
                        str += '<option value="'+data.data[k].areaCode +'">'+ data.data[k].areaName+'</option>'
                    }
                    
                }
                $('#area').html(str)
            }
        })
        
    }
    function chooseOne(){
        console.log(hangyeData3)
        var str = '<option value="">一级类目</option>'
        for(var i = 0 ; i < hangyeData3.length;i++){
            str += '<option value="'+hangyeData3[i].value+'">'+hangyeData3[i].text+'</option>'
        }
        $('#chOne').html(str)
    }
    function chooseTwo(data){
        // console.log(hangyeData3)
        var str = '<option value="">二级类目</option>'
        for(var i = 0 ; i < hangyeData3.length;i++){
            if(data == hangyeData3[i].value){
                for(var j = 0 ; j < hangyeData3[i].children.length;j++){
                    str += '<option value="'+hangyeData3[i].children[j].value+'">'+hangyeData3[i].children[j].text+'</option>'
                }
            }
        }
        $('#chTwo').html(str)
    }
    function chooseThr(data,data1){
        // console.log(hangyeData3)
        var str = '<option value="">三级类目</option>'
        for(var i = 0 ; i < hangyeData3.length;i++){
            if(data == hangyeData3[i].value){
                for(var j = 0 ; j < hangyeData3[i].children.length;j++){
                    if(data1 == hangyeData3[i].children[j].value){
                        for(var m = 0; m < hangyeData3[i].children[j].children.length;m++){
                    str += '<option value="'+hangyeData3[i].children[j].children[m].value+'">'+hangyeData3[i].children[j].children[m].text+'</option>'

                        }

                    }
                }
            }
        }
        $('#chThr').html(str)
    }
    return {
        postAjaxCall: postAjaxCall,
        getArrFromJson: getArrFromJson,
        clearListArr: clearListArr,
        convertToDateTime: convertToDateTime,
        convertToStartDateTime: convertToStartDateTime,
        convertToEndDateTime: convertToEndDateTime,
        setImg: setImg,
        getQueryString: getQueryString,
        setSessionStorageItem: setSessionStorageItem,
        getSessionStorageItem: getSessionStorageItem,
        removeSessionStorageItem: removeSessionStorageItem,
        clearSessionStorageItem: clearSessionStorageItem,
        getTableCommonSortStyle: getTableCommonSortStyle,
        datepickControlInit: datepickControlInit,
        getImageSrc: getImageSrc,
        getOSSFullUrl: getOSSFullUrl,
        getOSSShortUrl: getOSSShortUrl,
        uploadImage: uploadImage,
        uploadVideo: uploadVideo,
        replace:replace,
        choosePro:choosePro,
        chooseCity:chooseCity,
        chooseArea:chooseArea,
        chooseOne:chooseOne,
        chooseTwo:chooseTwo,
        chooseThr:chooseThr
    }
})();