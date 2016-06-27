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
        
        self.showLogo(true)
        
        let menuBtn = UIButton(imageName: "menu-icon", hlImageName: "menu-icon") { (menuBtn) in
            self.openLeft()
        }
        menuBtn.size = ccs(35, 35)
        self.showLeftBarItem(menuBtn)
        
        self.tableView = UITableView(frame: self.view.bounds, style: .Plain)
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
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(orderCellIdentifier, forIndexPath: indexPath) as? OrderCell
        cell?.chargeLabel.text = "1000"
        cell?.chargeStatusLabel.text = "已支付"
        cell?.statusLabel.text = "订单完成"
        cell?.nameLabel.text = "宝马X5"
        cell?.timeLabel.text = "2016-06-27 18:08"
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}
