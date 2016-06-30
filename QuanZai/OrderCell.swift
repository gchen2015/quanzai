//
//  OrderCell.swift
//  QuanZai
//
//  Created by i-chou on 6/27/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

enum PaymentStatus : Int {
    case paid = 0,  //0.已支付
         noPay      //1.未支付
}

enum OrderStatus : Int {
    case reserve = 1,  //1.预订
         created,      //2.生成
         returned,     //3.完成（已还车）
         close,        //4.关闭订单（预付保证金返还）
         overtime,     //5.预约超时
         cancel        //6.取消
}

@IBDesignable class OrderCell : UITableViewCell {
    
    @IBOutlet var nameTitle: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var chargeTitle: UILabel!
    @IBOutlet var chargeLabel: UILabel!
    
    @IBOutlet var statusLabel: UILabel!
    
    @IBOutlet var chargeStatusLabel: UILabel!
    
    @IBOutlet var timeLabel: UILabel!

    //TODO: auto layout
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layout()
    }
    
    func layout() {
        
        self.nameTitle.snp_makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(10)
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
        self.nameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self.nameTitle.snp_right)
            make.top.equalTo(self.nameTitle.snp_top)
            make.width.equalTo(150)
            make.height.equalTo(self.nameTitle.snp_height)
        }
        self.statusLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self.statusLabel.superview!.snp_right).offset(-80-20)
            make.top.equalTo(self.nameTitle.snp_top)
            make.width.equalTo(80)
            make.height.equalTo(self.nameTitle.snp_height)
        }
        self.chargeTitle.snp_makeConstraints { (make) in
            make.left.equalTo(self.nameTitle.snp_left)
            make.top.equalTo(self.nameTitle.snp_bottom).offset(10)
            make.width.equalTo(self.nameTitle.snp_width)
            make.height.equalTo(self.nameTitle.snp_height)
        }
        self.chargeLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self.nameLabel.snp_left)
            make.top.equalTo(self.chargeTitle.snp_top)
            make.width.equalTo(self.nameLabel.snp_width)
            make.height.equalTo(self.nameLabel.snp_height)
        }
        self.chargeStatusLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self.statusLabel.snp_left)
            make.top.equalTo(self.chargeTitle.snp_top)
            make.width.equalTo(60)
            make.height.equalTo(self.nameLabel.snp_height)
        }
        self.timeLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self.nameTitle.snp_left)
            make.top.equalTo(self.chargeTitle.snp_bottom).offset(10)
            make.width.equalTo(150)
            make.height.equalTo(self.nameTitle.snp_height)
        }
    }
    
    func setPaymentStatus(status : PaymentStatus) {
        switch status {
        case .paid:
            self.chargeStatusLabel.textColor = UIColorFromRGB(0x0aa29c)
            self.chargeStatusLabel.text = "已支付"
        case .noPay:
            self.chargeStatusLabel.textColor = UIColor.redColor()
            self.chargeStatusLabel.text = "未支付"
        }
    }
    
    func setOrderStatus(status : OrderStatus) {
        switch status {
        case .reserve:
            self.statusLabel.text = "预约"
            self.statusLabel.backgroundColor = UIColorFromRGB(0x0aa29c)
        case .created:
            self.statusLabel.text = "订单生成"
            self.statusLabel.backgroundColor = UIColorFromRGB(0x0aa29c)
        case .returned:
            self.statusLabel.text = "交易完成"
            self.statusLabel.backgroundColor = UIColorFromRGB(0x0aa29c)
        case .close:
            self.statusLabel.text = "订单关闭"
            self.statusLabel.backgroundColor = UIColor.lightGrayColor()
        case .overtime:
            self.statusLabel.text = "预约超时"
            self.statusLabel.backgroundColor = UIColor.redColor()
        case .cancel:
            self.statusLabel.text = "订单取消"
            self.statusLabel.backgroundColor = UIColor.lightGrayColor()
        }
    }
    
}

