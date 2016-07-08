//
//  OrderCell.swift
//  QuanZai
//
//  Created by i-chou on 6/27/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

//支付类型
enum PaymentStatus : Int {
    case Paid = 0,   //0.已支付
         UnPaid      //1.未支付
}

//订单状态
enum OrderStatus : Int {
    case Reserve = 1,  //1.预订
         Created,      //2.生成
         Returned,     //3.完成（已还车）
         Close,        //4.关闭订单（预付保证金返还）
         Overtime,     //5.预约超时
         Cancel        //6.取消
}

@IBDesignable class OrderCell : BaseCell {
    
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var chargeTitle: UILabel!
    @IBOutlet weak var chargeLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var chargeStatusLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!

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
        case .Paid:
            self.chargeStatusLabel.textColor = UIColorFromRGB(0x0aa29c)
            self.chargeStatusLabel.text = "已支付"
        case .UnPaid:
            self.chargeStatusLabel.textColor = UIColor.redColor()
            self.chargeStatusLabel.text = "未支付"
        }
    }
    
    func setOrderStatus(status : OrderStatus) {
        switch status {
        case .Reserve:
            self.statusLabel.text = "预约"
            self.statusLabel.backgroundColor = UIColorFromRGB(0x0aa29c)
        case .Created:
            self.statusLabel.text = "订单生成"
            self.statusLabel.backgroundColor = UIColorFromRGB(0x0aa29c)
        case .Returned:
            self.statusLabel.text = "交易完成"
            self.statusLabel.backgroundColor = UIColorFromRGB(0x0aa29c)
        case .Close:
            self.statusLabel.text = "订单关闭"
            self.statusLabel.backgroundColor = UIColor.lightGrayColor()
        case .Overtime:
            self.statusLabel.text = "预约超时"
            self.statusLabel.backgroundColor = UIColor.redColor()
        case .Cancel:
            self.statusLabel.text = "订单取消"
            self.statusLabel.backgroundColor = UIColor.lightGrayColor()
        }
    }
    
}

