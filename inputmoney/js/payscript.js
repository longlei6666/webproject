function GetRequest() {
	var url = location.search;
	var theRequest = new Object();
	if(url.indexOf('?') != -1) {
		var str = url.substr(1);
		strs = str.split('&');
		for(var i = 0; i < strs.length; i++) {
			theRequest[strs[i].split('=')[0]] = decodeURI(strs[i].split('=')[1]);
		}
	}
	return theRequest;
};

function getCookie(name) {
	var arr, reg = new RegExp('(^| )' + name + '=([^;]*)(;|$)');
	if(arr = document.cookie.match(reg)) {
		return unescape(arr[2]);
	} else {
		return null;
	}
};

function setCookie(name, value, cookieDomain, days) {
	var d = new Date();
	d.setTime(d.getTime() + (days * 24 * 60 * 60 * 1000));
	document.cookie = name + '=' + escape(value) + ';domain=' + cookieDomain + ';path=/;expires=' + d.toUTCString();
};

function send(url) {
	var js = document.createElement('script');
	js.setAttribute('type', 'text/javascript');
	js.setAttribute('src', url);
	document.getElementById('sendrequest').appendChild(js);
};

function del() {
	document.getElementById('sendrequest').innerHTML = '';
};

function formatParams(data) {
	var arr = [];
	for(var name in data) {
		arr.push(encodeURIComponent(name) + "=" + encodeURIComponent(data[name]));
	}
	arr.push(("v=" + Math.random()).replace("."));
	return arr.join("&");
};

function payajax(options) {
	options = options || {};
	options.type = (options.type || "GET").toUpperCase();
	options.dataType = options.dataType || "json";
	var params = formatParams(options.data);
	var xhr;

	if(window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
	} else if(window.ActiveObject) {
		xhr = new ActiveXObject('Microsoft.XMLHTTP');
	}

	if(options.type == "GET") {
		xhr.open("GET", options.url + "?" + params, true);
		xhr.send(null);
	} else if(options.type == "POST") {
		xhr.open("POST", options.url, true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(params);
	}

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4) {
			var status = xhr.status;
			if(status >= 200 && status < 300 || status == 304) {
				options.success && options.success(xhr.responseText);
			} else {
				options.error && options.error(status);
			}
		}
	}
};