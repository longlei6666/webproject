// pages/merchants/manage/index.js
const config = require('../../../utils/config.js')
Page({
	data: {
		currentTab: 0,
		index: 0,
		showModal: false,
		array: ['0.025%', '0.036%', '0.038%', '0.05%', '0.056%', '0.062%'],
		shopList: [],
		server: config.server,
		pageNum:1,
		limit:10,
		currentTab:2,
		empty:true,
		searchText:"",
		institutionNumber: '',
		saleNumber: ''
	},
	onLoad:function(){
		var saleInfo = wx.getStorageSync('saleInfo')
		console.log(saleInfo)
		this.setData({
			institutionNumber: saleInfo.institutionNumber,
			saleNumber: saleInfo.number
		})
		this.getData()
	},
	wxSearchinput: function (e) {
		var sousuozhi = this.removeAllSpace(e.detail.value);
		this.setData({
			searchText: sousuozhi
		})
		this.getData()
	},
	removeAllSpace(str) {
		return str.replace(/\s+/g, "");
	},
	getData: function () {
		var that = this
		wx.request({
			url: this.data.server + 'merchantManage/getMerchantList', //仅为示例，并非真实的接口地址
			data: {
				saleNumber: this.data.saleNumber,
				merchantName: this.data.searchText,
				auditStatus: this.data.currentTab,
				page: this.data.pageNum,
				limit: this.data.limit
			},
			header: {
				'content-type': 'application/json' // 默认值
			},
			success: function (res) {
				console.log(res.data)

				if (res.data.code != 1000) {

				} else {
					console.log(res)
					if(res.data.data == null){
						that.setData({
							shopList:[],
							empty:false
						})
					}else{
						that.setData({
							shopList: res.data.data.merchantList,
							empty: true
						})
					}
					
				}
			}
		})
	},
	swichNav: function (e) {
		var cur = e.target.dataset.current;
		if (this.data.currentTaB == cur) {
			return false;
		} else {
			this.setData({
				currentTab: cur
			})
			this.getData()
		}
	},
	shopOperation: function (e) {
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
	editData: function (e) {
		console.log(e)
		var id = e.currentTarget.dataset.id
		wx.navigateTo({
			url: '../../merchants/register/index?id=' + id + '&type=true',
		})
	},
	editShop: function (e) {
		console.log(e)
		var id = e.currentTarget.dataset.id
		wx.navigateTo({
			url: '../../shop/shop-list/index?id=' + id,
		})
	},
	bindPickerChange(e) {
		console.log('picker发送选择改变，携带值为', e.detail.value)
		this.setData({
			index: e.detail.value
		})
	},
	//弹窗
	editRate: function (e) {
		console.log(e.currentTarget.dataset.type)
		var D0 = wx.getStorageSync('saleInfo').productSwitch.split('&')
		var D1  = wx.getStorageSync('saleInfo').productSwitchD1.split('&')
		console.log(D0,D1)
		var d1list = []
		var d0list = []
		for(let i = 0 ; i < D0.length;i++){
			console.log(D0[i])
			var ob = new Object()
			ob.name = D0[i].split('|')[0]
			ob.key = D0[i].split('|')[1]
			d0list.push(ob)
		}
		for (let i = 0; i < D1.length; i++) {
			console.log(D1[i])
			var ob = new Object()
			ob.name = D1[i].split('|')[0]
			ob.key = D1[i].split('|')[1]
			d1list.push(ob)
		}
		console.log(d0list)
		if(e.currentTarget.dataset.type == 'D1'){
			this.setData({
				array:d0list
			})
		}else{
			this.setData({
				array: d1list
			})
		}
		this.setData({
			showModal: true
		})
	},
	//弹出框蒙层截断touchmove事件
	preventTouchMove: function (e) { },
	//隐藏模态对话框
	hideModal: function (e) {
		this.setData({
			showModal: false
		});
	},
	//对话框取消按钮点击事件
	onCancel: function (e) {
		this.hideModal();
	},
	//对话框确认按钮点击事件
	onConfirm: function (e) {
		this.hideModal();
		wx.showToast({
			title: '修改成功',
		})
	}
})
// Component({
//     /**
//      * 组件的属性列表
//      */
//     properties: {

//     },

//     /**
//      * 组件的初始数据
//      */
    
	

//     /**
//      * 组件的方法列表
//      */
//     methods: {
		
//     },
	
// })