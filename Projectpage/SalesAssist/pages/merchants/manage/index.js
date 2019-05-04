// pages/merchants/manage/index.js
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
        currentTab: 0,
        index: 0,
        showModal: false,
        array: ['0.025%', '0.036%', '0.038%', '0.05%','0.056%','0.062%'],
        shopList: [{
                "id": "01",
                "shopname": "鸿搜豆果店"
            },
            {
                "id": "02",
                "shopname": "豆果小二店"
            },
            {
                "id": "03",
                "shopname": "瀚科体验店"
            }
        ]
    },

    /**
     * 组件的方法列表
     */
    methods: {
        swichNav: function(e) {
            var cur = e.target.dataset.current;
            if (this.data.currentTaB == cur) {
                return false;
            } else {
                this.setData({
                    currentTab: cur
                })
            }
        },
        shopOperation: function(e) {
            var that = this
            var id = e.currentTarget.dataset.id;
            if (id == that.data.active) {
                that.setData({
                    'active': 0
                })
            } else {
                that.setData({
                    'active': id
                })
            }
        },
        editData: function(e) {
            wx.showToast({})
        },
        editShop: function(e) {
            wx.navigateTo({
                url: '../../shop/shop-list/index',
            })
        },
        bindPickerChange(e) {
            console.log('picker发送选择改变，携带值为', e.detail.value)
            this.setData({
                index: e.detail.value
            })
        },
        //弹窗
        editRate: function(e) {
            this.setData({
                showModal: true
            })
        },
        //弹出框蒙层截断touchmove事件
        preventTouchMove: function(e) {},
        //隐藏模态对话框
        hideModal: function(e) {
            this.setData({
                showModal: false
            });
        },
        //对话框取消按钮点击事件
        onCancel: function(e) {
            this.hideModal();
        },
        //对话框确认按钮点击事件
        onConfirm: function(e) {
            this.hideModal();
            wx.showToast({
                title: '修改成功',
            })
        }
    }
})