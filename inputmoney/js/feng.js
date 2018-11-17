/**
 * js-selector.js
 * 基于原生js封装的简单选择器
 *
 * build by rwson @2015-05-30
 * rw_Song@sina.com
 */
(function(w,u){

    /**
     * 选择器类构造器
     * @param args  选择器,匿名函数
     * @constructor
     */
    function Selector(args){
        this.elements = [];
        //  保存获取的节点或节点数组

        if(typeof args === "string"){
            //  当参数是一个字符串,id/class/tagName

            if(args.indexOf(" ") !== -1){
                //后代选择器$("div p ...")

                var elements = args.split(" "),         //  选择器集合
                    node = [],                          //  父节点
                    childElements = [];                 //  临时节点

                for(var i = 0,l = elements.length; i < l; i++){
                    //如果默认没有父节点，就指定document
                    if(node.length == 0) node.push(document);

                    switch(elements[i].charAt(0)) {
                        //id
                        case "#" :
                            //清空临时节点数组
                            childElements = [];
                            childElements.push(this.getId(elements[i].substring(1)));
                            node = childElements;
                            //保存到父节点
                            break;

                        case "." :
                            //类
                            childElements = [];

                            for(var j = 0; j < node.length; j++){
                                //遍历父节点数组，匹配符合className的所有节点
                                var temps = this.getClass(elements[i].substring(1), node[j]);
                                for(var k = 0; k < temps.length; k++){
                                    childElements.push(temps[k]);
                                }
                            }
                            node = childElements;
                            break;
                        //标签
                        default :
                            childElements = [];
                            for(var j = 0; j < node.length; j++){
                                //  遍历父节点，匹配符合className的所有节点

                                var temps = this.getTagName(elements[i], node[j]);
                                for(var k = 0; k < temps.length; k++){
                                    childElements.push(temps[k]);
                                }
                            }
                            node = childElements;
                    }
                }
                this.elements = childElements;
            } else if(args.indexOf(">") !== -1){
                //  $("#id>.class>...") 第一代子类选择器

                var elements = args.split(">"),      //  存放选择器
                    node = [],                      //  父节点
                    childElements = [];             //  临时节点

                for(var i = 0,l = elements.length; i < l; i++){
                    //如果默认没有父节点，就指定document
                    if(node.length == 0) node.push(document);
                    switch(elements[i].charAt(0)) {
                        //id
                        case "#" :
                            //清空临时节点数组
                            childElements = [];
                            var child = this.getId(elements[i].substring(1));
                            if(_inArray(child.parentNode,node)){
                                childElements.push(child);
                                node = childElements;
                                //保存到父节点
                            }
                            break;

                        case "." :
                            //类
                            childElements = [];
                            for(var j = 0; j < node.length; j++){
                                //遍历父节点数组，匹配符合className的所有节点
                                var temps = this.getClass(elements[i].substring(1), node[j]);
                                for(var k = 0; k < temps.length; k++){
                                    if(_inArray(temps[k].parentNode,node)){
                                        childElements.push(temps[k]);
                                    }
                                }
                            }
                            node = childElements;
                            break;
                        //标签
                        default :
                            childElements = [];
                            for(var j = 0; j < node.length; j++){
                                //  遍历父节点，匹配符合className的所有节点
                                var temps = this.getTagName(elements[i], node[j]);
                                for(var k = 0; k < temps.length; k++){
                                    if(_inArray(temps[k].parentNode,node)){
                                        childElements.push(temps[k]);
                                    }
                                }
                            }
                            node = childElements;
                    }
                }
                this.elements = childElements;

            } else {
                //find模拟,就是说只是单一的选择器
                switch(args.charAt(0)) {
                    case "#":
                        this.elements.push(this.getId(args.substring(1)));
                        break;
                    case ".":
                        this.elements = this.getClass(args.substring(1));
                        break;
                    default :
                        this.elements = this.getTagName(args);
                }
            }
        } else if(typeof args === "object"){
            if(args instanceof Selector){
                for(var i = 0,l = args["elements"].length;i < l;i ++){
                    this.elements.push(args["elements"][i]);
                }
            }else{
                this.elements[0] = args;
            }
            //  传入的已经是个对象
        } else if(typeof args === "function"){
            this.ready(args);
            //  window.onload = function(){}
        }
    }

    Selector.prototype = {
        "constructor":Selector,
        //  还原构造器
        "ready":function(fn){
            fn && typeof fn === "function" && function(){
                window.onload = function(){
                    return fn.call(true);
                };
            }();
        },
        //  类似于加Query中的$(functuon(){});
        "getId":function(id){
            return document.getElementById(id);
        },
        //  id选择器
        "getClass":function(className,parentNode){
            var node,           //  存放父节点
                ele = [];       //  存放元素集合
            if(typeof parentNode !== typeof u){ //存在父节点时
                node = parentNode;
            } else { //不存在则默认document
                node = document;
            }
            var all = node.getElementsByTagName("*");
            for(var i = 0,l = all.length; i < l; i++){
                //遍历所有节点，判断是否有包含className
                if((new RegExp("(\\s|^)" + className + "(\\s|$)")).test(all[i].className)){
                    ele.push(all[i]);
                }
            }
            return ele;
        },
        //  class选择器
        "getTagName":function(tagName,parentNode){
            var node,       //  存放父节点
                ele = [];   //  存放元素集合
            if(typeof parentNode !== typeof u){
                node = parentNode;
            }else{
                node = document;
            }
            var all = node.getElementsByTagName(tagName);
            for(var i = 0,l = all.length;i < l;i ++){
                ele.push(all[i]);
            }
            return ele;
        }
        //  标签名选择器
    };
    //  Selector类原型绑定方法

    function $s(arg){
        return new Selector(arg);
    }
    //  Select类的简写

    /**
     * 判断数组中是否存在某个具体项
     * @param item      项
     * @param array     数组
     * @returns {boolean}
     * @private
     */
    function _inArray(item,array){
        if(array[0] === document){
            //  父节点为document,返回真
            return true;
        }
        if("some" in Array.prototype){
            //  判断当前浏览器支持ECMAScript5中数组的some方法IE8+,firefox4+
            return array.some(function(i,j,k){
                return i === item;
            });
        }else{
            //  IE8-,firefox4-
            var boolean = false;
            for(var i = 0,l = array.length;i < l;i ++){
                if(array[i] === item){
                    boolean === true;
                }
            }
            return boolean;
        }
    }

    w.$s = $s;
    //  挂载到window对象下

})(window,undefined);