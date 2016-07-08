//
//  OrderDetailVC.swift
//  QuanZai
//
//  Created by i-chou on 6/30/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import Alamofire
import SwiftyJSON
import ObjectMapper
import SwiftyDrop
import KeychainAccess

class OrderDetailVC : BaseVC {
    
    var infoView : OrderDetailView!
    var paymentStatus : PaymentStatus!
    var orderInfo : OrderModel!
    var okBtn : UIButton!
    var scrollView : UIScrollView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("订单详情")
        self.setupUI()
        self.setData(self.orderInfo)
    }
    
    func setupUI() {
        
        scrollView = UIScrollView(frame: ccr(0, 0, k_SCREEN_W, k_SCREEN_H-k_NAV_BAR_H))
        self.view.addSubview(scrollView)
        
        self.infoView = NSBundle.mainBundle().loadNibNamed("OrderDetailView", owner: nil, options: nil).first as! OrderDetailView
        self.infoView.frame = ccr(10, 20, k_SCREEN_W-20, 425)
        scrollView.addSubview(infoView)
        
        okBtn = UIButton(imageName: "btn-blue",
                         hlImageName: "",
                         title: "支付",
                         titleColor: UIColorFromRGB(0x0aa29c),
                         font: HS_FONT(15)) { (nextBtn) in
                            self.submitOrder()
        }
        okBtn.alpha = 0
        scrollView.addSubview(okBtn)
    }

    //画面数据初始化
    func setData(orderInfo : OrderModel) {
        self.infoView.numberLabel.text = orderInfo.car_licence_plates
        self.infoView.brandLabel.text = orderInfo.car_name! + orderInfo.car_type_name!
        self.infoView.rentTypeLabel.text = orderInfo.date_time_name
        self.infoView.startTimeLabel.text = orderInfo.real_start_time
        self.infoView.endTimeLabel.text = orderInfo.real_end_time
        self.infoView.sumTimeLabel.text = orderInfo.total_time
        self.infoView.sumMileageLabel.text = orderInfo.mileage_total
        self.infoView.priceLabel.text = orderInfo.order_amount
        self.infoView.addrLabel.text = orderInfo.address
        
        let paymentStatus = PaymentStatus(rawValue: Int(self.orderInfo.payment_status!)!)!
        let orderStatus = OrderStatus(rawValue: Int(self.orderInfo.order_status!)!)!
        //完成已还车 && 未支付 情况显示支付按钮
        if paymentStatus == .UnPaid && orderStatus == .Returned {
            okBtn.frame = ccr(30, CGRectGetMaxY(self.infoView.frame)+20, k_SCREEN_W-30*2, 40)
            okBtn.alpha = 1
        } else {
            okBtn.frame = ccr(30, CGRectGetMaxY(self.infoView.frame)+20, k_SCREEN_W-30*2, 0)
            okBtn.alpha = 0
        }
        
        scrollView.contentSize = ccs(k_SCREEN_W, CGRectGetMaxY(okBtn.frame)+20)
    }
}

extension OrderDetailVC {
    
    //取得订单详情信息
    func getOrderDetail() {
        
        let request = Router.GetOrderDetail(order_id: self.orderInfo.id!)
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            if let orderInfo = Mapper<OrderModel>().map(objc) {
                self.setData(orderInfo)
            }
        }
    
    }
    
    //支付
    func submitOrder() {
        
        let keychain = Keychain(service: service)
        if keychain[k_UserID] == nil {
            Drop.down("未取得登录信息，请重新登录再试")
            return
        }
        
        let request = Router.OrderPayment(user_id: keychain[k_UserID]!)
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            if objc != nil {
                Drop.down("支付成功", state: .Success)
                self.getOrderDetail()
            }
        }
    }
    
    
}