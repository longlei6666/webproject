// pages/merchants/register/index.js
const shopData = require('../../../utils/shopData.js')
const uploadFileUrl = require('../../../config').uploadFileUrl

Page({

    /**
     * 页面的初始数据
     */
    data: {
        shopData: shopData.shopData,
        rateList: ['0.025%', '0.038%', '0.046%', '0.055%'],
        shopInput: {},
        showModal: false,
        date: shopData.shopData.shoplabel,
        imageSrc: [
            '../../img/pic1.png',
            '../../img/pic2.png',
            '../../img/pic3.png',
            '../../img/pic4.png',
            '../../img/pic5.png',
            '../../img/pic6.png',
            '../../img/pic7.png',
            '../../img/pic8.png',
            '../../img/pic9.png',
            '../../img/pic10.png',
        ]
    },
    /* 文本框获取焦点时更改状态*/
    focus: function(e) {
        var cur = e.target.dataset.current;
        this.setData({
            status: cur
        })
    },
    /* 文本框失去焦点时更改状态*/
    blur: function(e) {
        var data = e.detail.value
        var cur = e.target.dataset.current;
        if (!data) {
            this.setData({
                status: '',
            })
        } else {
            var shopInput = this.data.shopInput
            shopInput[cur] = data
            this.setData({
                status1: cur,
                shopInput: shopInput
            })
        }
    },
    bindDateChange(e) {
        var data = e.detail.value
        var cur = e.target.dataset.current;
        if (!data) {
            this.setData({
                status: '',
            })
        } else {
            var shopInput = this.data.shopInput
            shopInput[cur] = data
            this.setData({
                status1: cur,
                date: e.detail.value,
                shopInput: shopInput
            })
        }
    },
    bindPickerChange(e) {
        var data = e.detail.value
        var cur = e.target.dataset.current;
        if (!data) {
            this.setData({
                status: '',
            })
        } else {
            var shopInput = this.data.shopInput
            shopInput[cur] = this.data.rateList[data]
            this.setData({
                status1: cur,
                index: e.detail.value,
                shopInput: shopInput
            })
        }
    },
    bindBankchoose(e) {
        var cur = e.target.dataset.current;
        this.setData({
            showModal: true
        })
    },
    //弹出框蒙层截断touchmove事件
    preventTouchMove(e) {},
    //隐藏模态对话框
    hideModal: function(e) {
        this.setData({
            showModal: false
        });
    },
    //对话框取消按钮点击事件
    onCancel(e) {
        this.hideModal();
    },
    //对话框确认按钮点击事件
    onConfirm(e) {
        this.hideModal();
        wx.showToast({
            title: '修改成功',
        })
    },
    chooseImage(e) {
        console.log(e)
        const self = this

        wx.chooseImage({
            count: 1,
            sizeType: ['compressed'],
            sourceType: ['album'],
            success(res) {
                const imageSrc = res.tempFilePaths[0]
                wx.uploadFile({
                    url: uploadFileUrl,
                    filePath: imageSrc,
                    name: 'data',
                    success(res) {
                        wx.showToast({
                            title: '上传成功',
                            icon: 'success',
                            duration: 1000
                        })
                        self.setData({
                            imageSrc
                        })
                    },
                    fail() {
                        wx.showToast({
                            title: '上传失败',
                            icon: 'success',
                            duration: 1000
                        })
                    }
                })
            },

            fail({
                errMsg
            }) {
                console.log('chooseImage fail, err is', errMsg)
            }
        })
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(options) {

    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady: function() {

    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function() {

    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide: function() {

    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload: function() {

    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh: function() {

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function() {

    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage: function() {

    }
})