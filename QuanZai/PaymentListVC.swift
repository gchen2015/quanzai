//
//  PaymentListVC.swift
//  QuanZai
//
//  Created by i-chou on 7/1/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class PaymentListVC :BaseVC {
    
    let paymentCellIdentifier: String!  = "PaymentCell";
    var tableView : UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("账户明细")
        self.setupUI()
    }
    
    func setupUI() {
        self.tableView = UITableView(frame: ccr(0, 0, k_SCREEN_W, k_SCREEN_H-k_NAV_BAR_H), style: .Plain)
        self.tableView.allowsSelection = false
        self.tableView.registerNib(UINib(nibName: "PaymentCell", bundle: nil), forCellReuseIdentifier: paymentCellIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension PaymentListVC : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(paymentCellIdentifier, forIndexPath: indexPath) as? PaymentCell
        cell?.accessoryType = .None
        cell?.tradeTypeLabel.text = "充值"
        cell?.tradeCapitalLabel.text = "1,000元"
        cell?.timeLabel.text = "2016-06-27 18:08"
        
        if indexPath.row == 1 || indexPath.row == 3 {
            cell?.setTradeType(.Topup)
            cell?.setTradeStatus(.TradeSuccessed)
        } else if indexPath.row == 2 {
            cell?.setTradeType(.OrderPay)
            cell?.setTradeStatus(.TradeFailed)
        } else if indexPath.row == 5 || indexPath.row == 6 {
            cell?.setTradeType(.PrePayDeposit)
            cell?.setTradeStatus(.TradeFailed)
        } else {
            cell?.setTradeType(.ReturnDeposit)
            cell?.setTradeStatus(.TradeSuccessed)
        }
        return cell!
        
    }
    
}

// MARK: - UITableViewDelegate

extension PaymentListVC : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}

