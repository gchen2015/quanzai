//
//  TimeShareVC.swift
//  QuanZai
//
//  Created by i-chou on 6/20/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

protocol TimeShareVCProtocol : class{
    func searchFor(type: String)
    func orderBtnTapped()
}

class TimeShareVC: BaseVC {
    var delegate : TimeShareVCProtocol!
    
    var isSearchStores : Bool  = false
    
    var cars : NSArray = []
    var stores : NSArray = []
    
    var aroundCarsBtn : UIButton!
    var allCarsBtn : UIButton!
    var aroundStoresBtn : UIButton!
    var allStoresBtn : UIButton!
    var ordersBtn : UIButton!
    var tablewView : UITableView!
    
    
    var aroundCarIsShow : Bool = false
    var allCarIsShow : Bool = false
    var aroundStoreIsShow : Bool = false
    var allStoreIsShow : Bool = false
    
    let carCellIdentifier: String!  = "carCellIdentifier";
    let storeCellIdentifier: String!  = "storeCellIdentifier";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }
    
}

// MARK: - UI

extension TimeShareVC {
    
    func setupUI() {
        
        self.view.backgroundColor = UIColorFromRGB(0x0aa29c)
        self.setupTabButtons()
        self.setupTableView()
        self.setupOrdersButton()
    }
    
    func setupTabButtons() {
        
        var x: CGFloat = 11
        var y: CGFloat = 20
        var w: CGFloat = (k_SCREEN_W-20)/4
        var h: CGFloat = 30 * k_SCREEN_SCALE
        
        self.aroundCarsBtn = UIButton(imageName: "btn-left",
                                      hlImageName: "btn-left",
                                      title: "附近车辆",
                                      titleColor: UIColorFromRGB(0x727272),
                                      font: HS_FONT(11),
                                      titleEdgeInsets: UIEdgeInsetsMake(0, 10, 0, 0),
                                      contentHorizontalAlignment: UIControlContentHorizontalAlignment.Center,
                                      onTapBlock: { (aroundCarsBtn) in
                                        
                                        self.aroundCarIsShow = !self.aroundCarIsShow
                                        self.allCarIsShow = false
                                        self.aroundStoreIsShow = false
                                        self.allStoreIsShow = false
                                        self.showAroundCars(self.aroundCarIsShow)
                                        
        })
        self.aroundCarsBtn.setTitleColor(UIColorFromRGB(0x000000), forState: UIControlState.Highlighted)
        self.aroundCarsBtn.frame = ccr(x, y, w, h)
        self.view.addSubview(self.aroundCarsBtn)
        
        
        x = CGRectGetMaxX(self.aroundCarsBtn.frame)-0.5
        y = self.aroundCarsBtn.y
        w = self.aroundCarsBtn.width
        h = self.aroundCarsBtn.height
        
        self.allCarsBtn = UIButton(imageName: "btn-center",
                                   hlImageName: "btn-center",
                                   title: "全部车辆",
                                   titleColor: UIColorFromRGB(0x727272),
                                   font: HS_FONT(11),
                                   titleEdgeInsets: UIEdgeInsetsMake(0, 10, 0, 0),
                                   contentHorizontalAlignment: UIControlContentHorizontalAlignment.Center,
                                   onTapBlock: { (aroundCarsBtn) in
                                    
                                    self.aroundCarIsShow = false
                                    self.allCarIsShow = !self.allCarIsShow
                                    self.aroundStoreIsShow = false
                                    self.allStoreIsShow = false
                                    self.showAllCars(self.allCarIsShow)
                                    
        })
        self.allCarsBtn.setTitleColor(UIColorFromRGB(0x000000), forState: UIControlState.Highlighted)
        self.allCarsBtn.frame = ccr(x, y, w, h)
        self.view.addSubview(self.allCarsBtn)
        
        
        x = CGRectGetMaxX(self.allCarsBtn.frame)-1.3
        y = self.aroundCarsBtn.y
        w = self.aroundCarsBtn.width
        h = self.aroundCarsBtn.height
        
        self.aroundStoresBtn = UIButton(imageName: "btn-center",
                                        hlImageName: "btn-center",
                                        title: "附近车场",
                                        titleColor: UIColorFromRGB(0x727272),
                                        font: HS_FONT(11),
                                        titleEdgeInsets: UIEdgeInsetsMake(0, 10, 0, 0),
                                        contentHorizontalAlignment: UIControlContentHorizontalAlignment.Center,
                                        onTapBlock: { (aroundCarsBtn) in
                                            self.allCarIsShow = false
                                            self.aroundCarIsShow = false
                                            self.aroundStoreIsShow = !self.aroundStoreIsShow
                                            self.allStoreIsShow = false
                                            self.showAroundStores(self.aroundStoreIsShow)
                                            
        })
        self.aroundStoresBtn.setTitleColor(UIColorFromRGB(0x000000), forState: UIControlState.Highlighted)
        self.aroundStoresBtn.frame = ccr(x, y, w, h)
        self.view.addSubview(self.aroundStoresBtn)
        
        
        x = CGRectGetMaxX(self.aroundStoresBtn.frame)-0.2
        y = self.aroundCarsBtn.y
        w = self.aroundCarsBtn.width
        h = self.aroundCarsBtn.height
        
        self.allStoresBtn = UIButton(imageName: "btn-right",
                                     hlImageName: "btn-right",
                                     title: "全部车场",
                                     titleColor: UIColorFromRGB(0x727272),
                                     font: HS_FONT(11),
                                     titleEdgeInsets: UIEdgeInsetsMake(0, 10, 0, 0),
                                     contentHorizontalAlignment: UIControlContentHorizontalAlignment.Center,
                                     onTapBlock: { (aroundCarsBtn) in
                                        self.allCarIsShow = false
                                        self.aroundCarIsShow = false
                                        self.aroundStoreIsShow = false
                                        self.allStoreIsShow = !self.allStoreIsShow
                                        self.showAllStores(self.allStoreIsShow)
                                        
        })
        self.allStoresBtn.setTitleColor(UIColorFromRGB(0x000000), forState: UIControlState.Highlighted)
        self.allStoresBtn.frame = ccr(x, y, w, h)
        self.view.addSubview(self.allStoresBtn)
        
        
        x = 12
        y = (self.aroundCarsBtn.height-5)/2
        w = 5
        h = 5
        
        let icon1 = UIImageView(image: IMG("blue-point"))
        icon1.frame = ccr(x, y, w, h)
        self.aroundCarsBtn.addSubview(icon1)
        
        let icon2 = UIImageView(image: IMG("green-point"))
        icon2.frame = icon1.frame
        self.allCarsBtn.addSubview(icon2)
        
        let icon3 = UIImageView(image: IMG("blue-point"))
        icon3.frame = icon1.frame
        self.aroundStoresBtn.addSubview(icon3)
        
        let icon4 = UIImageView(image: IMG("green-point"))
        icon4.frame = icon1.frame
        self.allStoresBtn.addSubview(icon4)
    }
    
    func setupTableView() {
        
        let x : CGFloat = self.aroundCarsBtn.x
        let y : CGFloat = CGRectGetMaxY(self.aroundCarsBtn.frame) + 10
        let w : CGFloat = k_SCREEN_W - self.aroundCarsBtn.x*2
        let h : CGFloat = 0.0
        
        self.tablewView = UITableView(frame: ccr(x, y, w, h))
        self.tablewView.delegate = self
        self.tablewView.dataSource = self
        self.tablewView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        self.view.addSubview(self.tablewView)
        self.tablewView.layer.cornerRadius = 5.0
        self.tablewView.layer.masksToBounds = true
        
    }
    
    func setupOrdersButton() {
        
        var x: CGFloat = self.aroundCarsBtn.x
        var y: CGFloat = CGRectGetMaxY(self.aroundStoresBtn.frame) + 10
        var w: CGFloat = k_SCREEN_W - self.aroundCarsBtn.x*2
        var h: CGFloat = 30 * k_SCREEN_SCALE
        
        self.ordersBtn = UIButton(imageName: "btn-white",
                                  hlImageName: "btn-white",
                                  title: "历史订单",
                                  titleColor: UIColorFromRGB(0x727272),
                                  font: HS_FONT(11),
                                  titleEdgeInsets: UIEdgeInsetsMake(0, 10, 0, 0),
                                  contentHorizontalAlignment: UIControlContentHorizontalAlignment.Center,
                                  onTapBlock: { (aroundCarsBtn) in
                                    self.delegate.orderBtnTapped()
                                    
        })
        self.ordersBtn.setTitleColor(UIColorFromRGB(0x000000), forState: UIControlState.Highlighted)
        self.ordersBtn.frame = ccr(x, y, w, h)
        self.view.addSubview(self.ordersBtn)
        
        x = self.ordersBtn.width/2 - 40
        y = (self.ordersBtn.height-5)/2
        w = 5
        h = 5
        let icon = UIImageView(image: IMG("orange-point"))
        icon.frame = ccr(x, y, w, h)
        self.ordersBtn.addSubview(icon)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension TimeShareVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if !self.isSearchStores {
            if let carInfo : CarModel = self.cars[indexPath.row] as? CarModel {
                let carDetailVC = CarDetailVC()
                carDetailVC.car_id = carInfo.id
                self.navigationController?.pushViewController(carDetailVC, animated: true)
            }
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.isSearchStores {
            return self.stores.count
        } else {
            return self.cars.count
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if self.isSearchStores {
            var cell = tableView.dequeueReusableCellWithIdentifier(storeCellIdentifier) as? StoreCell
            if cell == nil {
                cell = StoreCell(style: .Subtitle, reuseIdentifier: storeCellIdentifier)
            }
            if let storeInfo : CarStoreModel = self.stores[indexPath.row] as? CarStoreModel {
                cell?.storeNameLabel.text = storeInfo.name
                if storeInfo.distance != nil {
                    cell?.distanceLabel.text = "距离" + storeInfo.distance! + "公里"
                } else {
                    cell?.distanceLabel.text = "未知距离"
                }
            }
            return cell!
        } else {
            
            var cell = tableView.dequeueReusableCellWithIdentifier(carCellIdentifier) as? CarCell
            if cell == nil {
                cell = CarCell(style: .Subtitle, reuseIdentifier: carCellIdentifier)
            }
            if let carInfo : CarModel = self.cars[indexPath.row] as? CarModel {
                cell?.carNameLabel.text = carInfo.name
                cell?.carNumLabel.text = carInfo.car_licence_plates
                if carInfo.distance != nil {
                    cell?.distanceLabel.text = "距离" + carInfo.distance! + "公里"
                } else {
                    cell?.distanceLabel.text = "未知距离"
                }
            }
            return cell!
        }
    }
}

// MARK: - Actions

extension TimeShareVC {
    
    func showAroundCars(show: Bool) {
        
        if show {
            self.isSearchStores = false
            self.delegate.searchFor("附近车辆")
            self.aroundCarsBtn.setTitleColor(UIColorFromRGB(0x000000), forState: .Normal)
            self.allCarsBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
            self.aroundStoresBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
            self.allStoresBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
        } else {
            self.aroundCarsBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
        }
        self.showTableView(show)
    }
    
    func showAllCars(show: Bool) {
        
        if show {
            self.isSearchStores = false
            self.delegate.searchFor("全部车辆")
            self.aroundCarsBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
            self.allCarsBtn.setTitleColor(UIColorFromRGB(0x000000), forState: .Normal)
            self.aroundStoresBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
            self.allStoresBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
        } else {
            self.allCarsBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
        }
        self.showTableView(show)
    }
    
    func showAroundStores(show: Bool) {
        
        self.showTableView(show)
        if show {
            self.isSearchStores = true
            self.delegate.searchFor("附近车场")
            self.aroundCarsBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
            self.allCarsBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
            self.aroundStoresBtn.setTitleColor(UIColorFromRGB(0x000000), forState: .Normal)
            self.allStoresBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
        } else {
            self.aroundStoresBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
        }
    }
    
    func showAllStores(show: Bool) {
        
        self.showTableView(show)
        if show {
            self.isSearchStores = true
            self.delegate.searchFor("全部车场")
            self.aroundCarsBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
            self.allCarsBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
            self.aroundStoresBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
            self.allStoresBtn.setTitleColor(UIColorFromRGB(0x000000), forState: .Normal)
        } else {
            self.allStoresBtn.setTitleColor(UIColorFromRGB(0x727272), forState: .Normal)
        }
    }
    
    func showTableView(show: Bool) {
        
        UIView.animateWithDuration(0.3) {
            
            if show {
                self.tablewView.height = self.view.height - CGRectGetMaxY(self.aroundCarsBtn.frame) - 20
                self.ordersBtn.y = CGRectGetMaxY(self.tablewView.frame)+10
            } else {
                self.tablewView.height = 0
                self.ordersBtn.y = CGRectGetMaxY(self.aroundCarsBtn.frame)+10
            }
            
        }
    }
    
    func cars(cars : NSArray) {
        self.cars = cars
        self.tablewView.reloadData()
    }
    
    func stores(stores : NSArray) {
        self.stores = stores
        self.tablewView.reloadData()
    }

}