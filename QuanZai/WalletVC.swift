//
//  WalletVC.swift
//  QuanZai
//
//  Created by i-chou on 6/30/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import KeychainAccess
import ObjectMapper
import SwiftyDrop
import SwiftyJSON

class WalletVC: BaseVC {
    
    var infoView : WalletView!
    var user_id : String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("我的账户")
//        let menuBtn = UIButton(imageName: "menu-icon", hlImageName: "menu-icon") { (menuBtn) in
//            self.openLeft()
//        }
//        menuBtn.size = ccs(35, 35)
//        self.showLeftBarItem(menuBtn)
        
        self.setupUI()
        self.getUserAccountBalance()
    }
    
    func setupUI() {
        
        self.infoView = NSBundle.mainBundle().loadNibNamed("WalletView", owner: nil, options: nil).first as! WalletView
        self.infoView.delegate = self
        self.infoView.frame = ccr(10, 20, k_SCREEN_W-20, 260)
        self.view.addSubview(infoView)
    }
}

extension WalletVC {
    
    func getUserAccountBalance() {
        
        let request = Router.GetUserAccountBalance(user_id: self.user_id)
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            let json = JSON(objc!)
            if let account_balance = json["account_balance"].string {
                self.infoView.moneyLabel.text = account_balance + "元"
            }
        }
    }
    
}

// MARK: - WalletViewProtocol

extension WalletVC : WalletViewProtocol {
   
    func topup() {
        let topupVC = TopupVC()
        self.navigationController?.pushViewController(topupVC, animated: true)
    }
    
    func openPaymentList() {
        let paymentListVC = PaymentListVC()
        self.navigationController?.pushViewController(paymentListVC, animated: true)
    }
}