//
//  OrderListVC.swift
//  QuanZai
//
//  Created by i-chou on 6/27/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import Alamofire
import SwiftyJSON
import ObjectMapper
import SwiftyDrop
import KeychainAccess

class OrderListVC : BaseVC {
    
    let orderCellIdentifier: String!  = "OrderCell";
    var tableView : UITableView!
    var showMenuBtn : Bool = false
    var orders = [OrderModel]()
    var user_id : String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("历史订单")
        
//        if showMenuBtn {
//            let menuBtn = UIButton(imageName: "menu-icon", hlImageName: "menu-icon") { (menuBtn) in
//                self.openLeft()
//            }
//            menuBtn.size = ccs(35, 35)
//            self.showLeftBarItem(menuBtn)
//        }
        
        self.tableView = UITableView(frame: ccr(0, 0, k_SCREEN_W, k_SCREEN_H-k_NAV_BAR_H), style: .Plain)
        self.tableView.registerNib(UINib(nibName: "OrderCell", bundle: nil), forCellReuseIdentifier: orderCellIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
        
        self.getOrderList()
    }
    
    func setupUI() {
        
    }
    
    func getOrderList() {
        
        let request = Router.GetOrderList(user_id: self.user_id)
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            if let orders = Mapper<OrderModel>().mapArray(objc) {
                self.orders = orders
                self.tableView.reloadData()
            }
        }
    }
    
}

extension OrderListVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orders.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(orderCellIdentifier, forIndexPath: indexPath) as? OrderCell
        cell?.accessoryType = .DisclosureIndicator
        
        let order = self.orders[indexPath.row]
        
        cell?.chargeLabel.text = order.order_amount
        cell?.chargeStatusLabel.text = order.payment_status_display
        cell?.statusLabel.text = order.order_status_display
        cell?.nameLabel.text = order.car_name! + "(" + order.car_licence_plates! + ")"
        cell?.timeLabel.text = order.ctime
        cell?.setOrderStatus(OrderStatus(rawValue: Int(order.order_status!)!)!)
        cell?.setPaymentStatus(PaymentStatus(rawValue: Int(order.payment_status!)!)!)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let order = self.orders[indexPath.row]
        
        let orderDetailVC = OrderDetailVC()
        orderDetailVC.orderInfo = order
        self.navigationController?.pushViewController(orderDetailVC, animated: true)
        
    }
    
}
