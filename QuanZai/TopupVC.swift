//
//  TopupVC.swift
//  QuanZai
//
//  Created by i-chou on 6/30/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import KeychainAccess
import ObjectMapper
import SwiftyDrop

class TopupVC: BaseVC {
    
    var infoView : TopupView!
    var money : String? = "100" //默认选中100元充值
    
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
        self.rechargeUserAccount(self.money!, type: "0")
    }
    
    func openWechatPay() {
        self.rechargeUserAccount(self.money!, type: "1")
    }
    
    func selectedButton(radioButton: DLRadioButton) {
        if self.infoView.otherMoneyTxt.text != nil {
            if let money = Int(self.infoView.otherMoneyTxt.text!) {
                self.money = String(money)
            }
        } else {
            self.money = radioButton.titleLabel!.text
        }
    }
    
    func rechargeUserAccount(capital: String, type: String) {
        let keychain = Keychain(service: service)
        if keychain[k_UserID] == nil {
            self.showLoginVC(true)
            return
        }
        let request = Router.RechargeUserAccount(user_id: keychain[k_UserID]!, capital: capital, type: type)
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            Drop.down("充值成功", state: .Success)
        }
    }
}
