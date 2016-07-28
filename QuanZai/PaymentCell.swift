//
//  PaymentCell.swift
//  QuanZai
//
//  Created by i-chou on 7/1/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

//交易类型
enum TradeType : Int {
    case Unknown = 0,
         Topup = 1,     //充值
         PrePayDeposit, //预交保证金
         OrderPay,      //订单支付
         ReturnDeposit  //退还保证金
}

//交易状态
enum TradeStatus : Int {
    case Unknown = 0,
         TradeSuccessed = 1,  //成功
         TradeFailed          //失败
}



class PaymentCell: BaseCell {
    
    @IBOutlet weak var tradeTypeLabel: UILabel!
    @IBOutlet weak var tradeCapitalLabel: UILabel!
    @IBOutlet weak var tradeStatusLabel: Label!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layout()
    }
    
    func layout() {
        tradeTypeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(20)
            make.width.equalTo(100)
            make.height.equalTo(25)
        }
        tradeCapitalLabel.snp_makeConstraints { (make) in
            make.top.equalTo(tradeTypeLabel.snp_top)
            make.left.equalTo(tradeTypeLabel.snp_right)
            make.width.equalTo(100)
            make.height.equalTo(tradeTypeLabel.snp_height)
        }
        tradeStatusLabel.snp_makeConstraints { (make) in
            make.top.equalTo(tradeTypeLabel.snp_top)
            make.right.equalTo(self.snp_right).offset(-10)
            make.width.equalTo(60)
            make.height.equalTo(tradeTypeLabel.snp_height)
        }
        timeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(tradeTypeLabel.snp_bottom).offset(10)
            make.left.equalTo(tradeTypeLabel.snp_left)
            make.width.equalTo(150)
            make.height.equalTo(20)
        }
    }
    
    func setTradeType(type : TradeType) {
        switch type {
        case .Topup:
            tradeTypeLabel.text = "充值"
        case .PrePayDeposit:
            tradeTypeLabel.text = "预交保证金"
        case .OrderPay:
            tradeTypeLabel.text = "订单支付"
        case .ReturnDeposit:
            tradeTypeLabel.text = "退还保证金"
        default:
            tradeTypeLabel.text = "其他"
        }
    }
    
    func setTradeStatus(status : TradeStatus) {
        switch status {
        case .TradeSuccessed:
            self.tradeStatusLabel.text = "成功"
            self.tradeStatusLabel.backgroundColor = UIColorFromRGB(0x0aa29c)
        case .TradeFailed:
            self.tradeStatusLabel.text = "失败"
            self.tradeStatusLabel.backgroundColor = UIColor.redColor()
        default:
            self.tradeStatusLabel.text = "未知"
            self.tradeStatusLabel.backgroundColor = UIColor.lightGrayColor()
        }
    }
}
