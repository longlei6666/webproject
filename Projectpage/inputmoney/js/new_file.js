
		function get(tag){
			if(tag.indexOf('#')>=0){
				return document.getElementById(tag.split('#')[1])
			}else if(tag.indexOf('$')>=0){
				return document.getElementsByClassName(tag.split('.')[1])
			}else{
				return document.getElementsByTagName(tag)
			}
				
		}