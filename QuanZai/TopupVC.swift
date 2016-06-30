//
//  TopupVC.swift
//  QuanZai
//
//  Created by i-chou on 6/30/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class TopupVC: BaseVC {
    
    var infoView : TopupView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("充值")
        self.setupUI()
    }
    
    func setupUI() {
        
        let scrollView = UIScrollView(frame: ccr(0, 0, k_SCREEN_W, k_SCREEN_H-k_NAV_BAR_H))
        scrollView.contentSize = ccs(k_SCREEN_W, scrollView.height+100)
        self.view.addSubview(scrollView)
        
        self.infoView = NSBundle.mainBundle().loadNibNamed("TopupView", owner: nil, options: nil).first as! TopupView
        self.infoView.delegate = self
        self.infoView.frame = ccr(10, 20, k_SCREEN_W-20, 380)
        scrollView.addSubview(infoView)
    }
}

extension TopupVC : TopupViewProtocol {
    
    func openAlipay() {
        
    }
    
    func openWechatPay() {
        
    }
}
