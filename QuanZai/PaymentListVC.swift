//
//  PaymentListVC.swift
//  QuanZai
//
//  Created by i-chou on 7/1/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import KeychainAccess
import ObjectMapper
import SwiftyDrop
import SwiftyJSON

class PaymentListVC :BaseVC {
    
    let paymentCellIdentifier: String!  = "PaymentCell";
    var tableView : UITableView!
    lazy var tradeList = [TradeModel]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("账户明细")
        self.setupUI()
        self.getUserAccountDetail()
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
    
    func getUserAccountDetail () {
        
        let keychain = Keychain(service: service)
        if keychain[k_UserID] == nil {
            self.showLoginVC(true)
            return
        }
        let request = Router.GetUserAccountDetail(user_id: keychain[k_UserID]!)
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            if let tradeList = Mapper<TradeModel>().mapArray(objc) {
                self.tradeList = tradeList
                self.tableView.reloadData()
            }
            
        }
        
    }
}

// MARK: - UITableViewDataSource

extension PaymentListVC : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tradeList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(paymentCellIdentifier, forIndexPath: indexPath) as? PaymentCell
        cell?.accessoryType = .None
        
        let trade = self.tradeList[indexPath.row]
        
        cell?.tradeTypeLabel.text = trade.trade_type_name
        cell?.tradeCapitalLabel.text = trade.trade_capital
        cell?.timeLabel.text = trade.ctime
        var trade_type = 0
        if trade.trade_type?.isEmpty == false {
            trade_type = Int(trade.trade_type!)!
        }
        var trade_status = 0
        if trade.trade_status?.isEmpty == false {
            trade_status = Int(trade.trade_status!)!
        }
        cell?.setTradeType(TradeType(rawValue: trade_type)!)
        cell?.setTradeStatus(TradeStatus(rawValue: trade_status)!)
        
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

