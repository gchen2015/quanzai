//
//  OrderListVC.swift
//  QuanZai
//
//  Created by i-chou on 6/27/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class OrderListVC : BaseVC {
    
    let orderCellIdentifier: String!  = "OrderCell";
    var tableView : UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("历史订单")
        
//        let menuBtn = UIButton(imageName: "menu-icon", hlImageName: "menu-icon") { (menuBtn) in
//            self.openLeft()
//        }
//        menuBtn.size = ccs(35, 35)
//        self.showLeftBarItem(menuBtn)
        
        self.tableView = UITableView(frame: ccr(0, 0, k_SCREEN_W, k_SCREEN_H-k_NAV_BAR_H), style: .Plain)
        self.tableView.registerNib(UINib(nibName: "OrderCell", bundle: nil), forCellReuseIdentifier: orderCellIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
        self.tableView.reloadData()
    }
    
    func setupUI() {
        
    }
}

extension OrderListVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(orderCellIdentifier, forIndexPath: indexPath) as? OrderCell
        cell?.accessoryType = .DisclosureIndicator
        
        cell?.chargeLabel.text = "1,000"
        cell?.chargeStatusLabel.text = "已支付"
        cell?.statusLabel.text = "订单完成"
        cell?.nameLabel.text = "宝马X5"
        cell?.timeLabel.text = "2016-06-27 18:08"
        
        if indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 4 {
            cell?.setOrderStatus(OrderStatus.returned)
            cell?.setPaymentStatus(PaymentStatus.paid)
        } else if indexPath.row == 2 {
            cell?.setOrderStatus(OrderStatus.close)
            cell?.setPaymentStatus(PaymentStatus.noPay)

        } else if indexPath.row == 5 || indexPath.row == 6 {
            cell?.setOrderStatus(OrderStatus.overtime)
            cell?.setPaymentStatus(PaymentStatus.noPay)
        } else {
            cell?.setOrderStatus(OrderStatus.overtime)
            cell?.setPaymentStatus(PaymentStatus.noPay)
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}
