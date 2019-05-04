// pages/merchants/register/index.js
Component({
    /**
     * 组件的属性列表
     */
    properties: {

    },

    /**
     * 组件的初始数据
     */
    data: {},

    /**
     * 组件的方法列表
     */
    methods: {
        swichNav: function(e) {
            console.log(e)
            var cur = e.target.dataset.current;
            this.setData({
                currentTab: cur
            })
        },
        focus: function (e) {
            console.log(e)
            this.setData({
                status: 1
            })
        },
        /* 文本框失焦时更改状态*/
        blur: function (e) {
            console.log(e)
            this.setData({
                status: 0
            })
        },
    },
})