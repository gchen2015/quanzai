//
//  WalletVC.swift
//  QuanZai
//
//  Created by i-chou on 6/30/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class WalletVC: BaseVC {
    
    var infoView : WalletView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("我的账户")
        let menuBtn = UIButton(imageName: "menu-icon", hlImageName: "menu-icon") { (menuBtn) in
            self.openLeft()
        }
        menuBtn.size = ccs(35, 35)
        self.showLeftBarItem(menuBtn)
        
        self.setupUI()
    }
    
    func setupUI() {
        
        self.infoView = NSBundle.mainBundle().loadNibNamed("WalletView", owner: nil, options: nil).first as! WalletView
        self.infoView.delegate = self
        self.infoView.frame = ccr(10, 20, k_SCREEN_W-20, 260)
        self.view.addSubview(infoView)
    }
}

// MARK: - WalletViewProtocol

extension WalletVC : WalletViewProtocol {
   
    func topup() {
        let topupVC = TopupVC()
        self.navigationController?.pushViewController(topupVC, animated: true)
    }
    
    func openPaymentList() {
        print("openPaymentList")
    }
}