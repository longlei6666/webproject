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
        Tocheck() {
            wx.navigateTo({
                url: '../shop-check/index',
            });
        },
        Toadd() {
            const that = this
            wx.scanCode({
                success(res) {
                    wx.showToast({
                        title: '扫码成功'
                    })
                },
                fail() {}
            })
        }
    }
})