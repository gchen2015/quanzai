//
//  OrderDetailVC.swift
//  QuanZai
//
//  Created by i-chou on 6/30/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class OrderDetailVC : BaseVC {
    
    var infoView : OrderDetailView!
    var paymentStatus : PaymentStatus!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("订单详情")
        self.setupUI()
    }
    
    func setupUI() {
        
        let scrollView = UIScrollView(frame: ccr(0, 0, k_SCREEN_W, k_SCREEN_H-k_NAV_BAR_H))
        self.view.addSubview(scrollView)
        
        self.infoView = NSBundle.mainBundle().loadNibNamed("OrderDetailView", owner: nil, options: nil).first as! OrderDetailView
        self.infoView.frame = ccr(10, 20, k_SCREEN_W-20, 390)
        scrollView.addSubview(infoView)
        
        let okBtn = UIButton(imageName: "btn-blue",
                             hlImageName: "",
                             title: "支付",
                             titleColor: UIColorFromRGB(0x0aa29c),
                             font: HS_FONT(15)) { (nextBtn) in
                                
        }
        
        if paymentStatus == .UnPaid {
          okBtn.frame = ccr(30, CGRectGetMaxY(self.infoView.frame)+20, k_SCREEN_W-30*2, 40)
            scrollView.addSubview(okBtn)
        } else {
            okBtn.frame = ccr(30, CGRectGetMaxY(self.infoView.frame)+20, k_SCREEN_W-30*2, 0)
        }
        
        scrollView.contentSize = ccs(k_SCREEN_W, CGRectGetMaxY(okBtn.frame)+20)
    }

    
}
