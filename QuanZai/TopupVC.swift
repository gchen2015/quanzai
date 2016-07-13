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

enum PaymentType: String {
    case WxPay = "微信"
    case Alipay = "支付宝"
}

extension TopupVC : TopupViewProtocol {
    
    func openAlipay() {
        guard Keychain(service: service)[k_UserID] != nil else {
            self.showLoginVC(true)
            return
        }
        let progressHUD = ProgressHUD()
        progressHUD.showInWindow("正在充值...")
        self.money = "0.01"
        let request = Router.WxGetPayInfo(totalFee: self.money!)
        APIClient.sharedAPIClient().wxPayRequest(request) { (objc, error, badNetWork) in
            progressHUD.dismiss({
                if error != nil {
                    guard error?.userInfo["retmsg"] == nil else {
                        let errorMsg = error?.userInfo["retmsg"] as! String
                        self.alertPresenter(errorMsg, body: "", cancelTitle: nil, okTitle: "确定", cancelActionHandler: nil, okActionHandler: nil)
                        return
                    }
                    self.alertPresenter(error.debugDescription, body: "", cancelTitle: nil, okTitle: "确定", cancelActionHandler: nil, okActionHandler: nil)
                } else {
                    self.alertPresenter("充值成功", body: "", cancelTitle: nil, okTitle: "确定", cancelActionHandler: nil, okActionHandler: nil)
                }
            })
        }
    }
    
    func openWechatPay() {
//        self.rechargeUserAccount(self.money!, type: .WxPay)
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

}

