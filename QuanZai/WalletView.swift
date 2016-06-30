//
//  WalletView.swift
//  QuanZai
//
//  Created by i-chou on 6/30/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

protocol WalletViewProtocol : class {
    func topup()
    func openPaymentList()
}

@IBDesignable class WalletView: UIView {
    
    var delegate : WalletViewProtocol?
    
    @IBOutlet weak var headerTitle: Label!
    @IBOutlet weak var moneyLabel: Label!
    @IBOutlet weak var topupBtn: Button!
    @IBOutlet weak var paymentListBtn: Button!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layout()
    }
    
    func layout() {
        
        headerTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(self.snp_right)
            make.height.equalTo(40)
        }
        moneyLabel.snp_makeConstraints { (make) in
            make.top.equalTo(headerTitle.snp_bottom)
            make.left.equalTo(0)
            make.right.equalTo(self.snp_right)
            make.height.equalTo(100)
        }
        topupBtn.snp_makeConstraints { (make) in
            make.top.equalTo(moneyLabel.snp_bottom)
            make.left.equalTo(20)
            make.width.equalTo((self.width-45)/2)
            make.height.equalTo(30)
        }
        paymentListBtn.snp_makeConstraints { (make) in
            make.top.equalTo(moneyLabel.snp_bottom)
            make.width.equalTo(topupBtn.snp_width)
            make.right.equalTo(self.snp_right).offset(-20)
            make.height.equalTo(30)
        }
    }
    
    @IBAction func topupBtnTapped(sender: AnyObject) {
        self.delegate?.topup()
    }
    
    @IBAction func paymentListBtnTapped(sender: AnyObject) {
        self.delegate?.openPaymentList()
    }
}