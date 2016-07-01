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
    var showMenuBtn : Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("历史订单")
        
        if showMenuBtn {
            let menuBtn = UIButton(imageName: "menu-icon", hlImageName: "menu-icon") { (menuBtn) in
                self.openLeft()
            }
            menuBtn.size = ccs(35, 35)
            self.showLeftBarItem(menuBtn)
        }
        
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
        cell?.nameLabel.text = "宝马X5 (辽B123456)"
        cell?.timeLabel.text = "2016-06-27 18:08"
        
        if indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 4 {
            cell?.setOrderStatus(.Returned)
            cell?.setPaymentStatus(.Paid)
        } else if indexPath.row == 2 {
            cell?.setOrderStatus(.Close)
            cell?.setPaymentStatus(.UnPaid)

        } else if indexPath.row == 5 || indexPath.row == 6 {
            cell?.setOrderStatus(.Overtime)
            cell?.setPaymentStatus(.UnPaid)
        } else {
            cell?.setOrderStatus(.Overtime)
            cell?.setPaymentStatus(.UnPaid)
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let orderDetailVC = OrderDetailVC()
        orderDetailVC.paymentStatus = .Paid
        self.navigationController?.pushViewController(orderDetailVC, animated: true)
        
    }
    
}
