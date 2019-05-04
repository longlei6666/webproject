// pages/shop-manage/index.js   
Component({
    /**
     * 组件的属性列表
     */
    properties: {

    },

    /**
     * 组件的初始数据
     */
    data: {

    },

    /**
     * 组件的方法列表
     */
    methods: {
        //解绑事件
        unbind() {
            wx.showModal({
                title: '弹窗标题',
                content: '弹窗内容，告知当前状态、信息和解决方法，描述文字尽量控制在三行内',
                confirmText: '确定',
                cancelText: '取消',
                success: function (res) {
                    if (res.confirm) {
                        wx.showToast({
                            title: '解绑成功'
                        })
                    } else if (res.cancel) {
                        
                    }
                }
            })
        }
    }
})