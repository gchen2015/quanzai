//
//  HomeVC.swift
//  QuanZai
//
//  Created by i-chou on 6/20/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

//未选中状态的字体颜色是575757
import SlideMenuControllerSwift
import Alamofire
import SwiftyJSON
import ObjectMapper
import SwiftyDrop
import HMSegmentedControl
import KeychainAccess

class HomeVC: BaseVC {
    
    var mapVC:MapVC!
    var categoryList : NSArray?
    var userLocation : MAUserLocation!
    
    lazy var timeShareVC : TimeShareVC = self.setupTimeShareVC()
    var actionBar : ActionBar!
    var isFirstLoad : Bool = true
    var current_order_id : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slideMenuController()?.delegate = self
        
        self.setupNavBar()
        self.setupMapView()
        self.setupTimeShareVC()
        self.setupSegmentedBar()
        self.setupActionBar()
        self.showTimeShareVC()
    }
    
}

// MARK: - API

extension HomeVC {
    
    //开门，关门
    func ControlCarRight(type: ActionType) {
        
        guard let user_id = Keychain(service: service)[k_UserID] else {
            self.showLoginVC(true)
            return
        }
        let request = Router.ControlCarRight(user_id: user_id,
                                             lng: String(self.userLocation.coordinate.longitude),
                                             lat: String(self.userLocation.coordinate.latitude),
                                             type: String(type))
        APIClient.sharedAPIClient().sendRequest(request, finished: { (objc, error, badNetWork) in
            
        })
    }
    
    //还车围栏验证
    func returnCarAddressConfirm() {
        
        guard let user_id = Keychain(service: service)[k_UserID] else {
            self.showLoginVC(true)
            return
        }
        
        let progressHUD = ProgressHUD()
        progressHUD.showInView(self.view, message: "正在进行车场验证...")
        let request = Router.ReturnCarAddressConfirm(user_id: user_id)
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            if let store = Mapper<CarStoreModel>().map(objc) {
                if store.car_id == nil || store.id == nil || store.order_id == nil {
                    progressHUD.dismiss({
                        Drop.down("数据有误，请联系客服")
                    })
                    return
                }
                self.current_order_id = store.order_id
                progressHUD.dismiss()
                self.returnCar(user_id, car_id: store.car_id!, store_id: store.id!, order_id: store.order_id!)
            }
        }
    }
    
    //还车
    func returnCar(user_id: String, car_id: String, store_id: String, order_id: String) {
        let progressHUD = ProgressHUD()
        progressHUD.showInView(self.view, message: "车场验证成功，\n正在还车...")
        let request = Router.ReturnCar(user_id: user_id, car_id: car_id, store_id: store_id, order_id: order_id)
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            progressHUD.dismiss({ 
                Drop.down("还车成功", state: .Success)
            })
        }
    }
}


// MARK: - SetupUI

extension HomeVC {
    
    func setupNavBar() {
        
        self.showLogo(true)
        
        let menuBtn = UIButton(imageName: "menu-icon", hlImageName: "menu-icon") { (menuBtn) in
            if self.checkHaveLogin() {
                self.openLeft()
            }
        }
        menuBtn.size = ccs(35, 35)
        self.showLeftBarItem(menuBtn)
    }
    
    func setupMapView() {
        
        self.mapVC = MapVC()
        self.mapVC.delegate = self
        self.addChildViewController(self.mapVC!)
        self.mapVC.view.frame = ccr(0, 0, k_SCREEN_W, 250*k_SCREEN_SCALE)
        self.view.addSubview(self.mapVC.view)
        self.mapVC.didMoveToParentViewController(self)
        
        self.userLocation = MAUserLocation()
    }
    
    func setupSegmentedBar() {
        
        let titles = ["马上用车","预约用车","分时租赁","同城速递"]
        let segmentedControl = HMSegmentedControl(sectionTitles: titles)
        segmentedControl.frame = ccr(0, 250*k_SCREEN_SCALE-k_NAV_BAR_H, k_SCREEN_W, 30)
        segmentedControl.selectedSegmentIndex = 2
        segmentedControl.backgroundColor = UIColorFromRGB(0xefefef)
        segmentedControl.titleTextAttributes = [NSFontAttributeName:HS_FONT(11),NSForegroundColorAttributeName:UIColorFromRGB(0x727272)]
        segmentedControl.selectedTitleTextAttributes = [NSFontAttributeName:HS_FONT(11),NSForegroundColorAttributeName:UIColorFromRGB(0x000000)]
        segmentedControl.selectionIndicatorColor = UIColor.clearColor()
        segmentedControl.addTarget(self, action: #selector(segmentedControlChangedValue(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(segmentedControl)
    }
    
    func setupTimeShareVC() -> TimeShareVC {
        
        let timeShareVC = TimeShareVC()
        timeShareVC.delegate = self
        timeShareVC.view.frame = ccr(0,
                                     250*k_SCREEN_SCALE-k_NAV_BAR_H+30,
                                     k_SCREEN_W,
                                     self.view.height-250*k_SCREEN_SCALE-80+k_NAV_BAR_H-30)
        return timeShareVC
    }
    
    func setupActionBar() {
        
        self.actionBar = ActionBar(frame: ccr(0, k_SCREEN_H-k_NAV_BAR_H-80, k_SCREEN_W, 80))
        self.actionBar.delegate = self
        self.view.addSubview(self.actionBar)
    }
    
    func showTimeShareVC() {
        self.addChildViewController(self.timeShareVC)
        self.view.insertSubview(self.timeShareVC.view, belowSubview: self.actionBar)
        self.timeShareVC.didMoveToParentViewController(self)
    }
    
    func segmentedControlChangedValue(segmentedControl: HMSegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            Drop.down("功能待开发")
            self.timeShareVC.view.removeFromSuperview()
            self.timeShareVC.removeFromParentViewController()
        case 1:
            Drop.down("功能待开发")
            self.timeShareVC.view.removeFromSuperview()
            self.timeShareVC.removeFromParentViewController()
        case 2:
            self.showTimeShareVC()
        case 3:
            Drop.down("功能待开发")
            self.timeShareVC.view.removeFromSuperview()
            self.timeShareVC.removeFromParentViewController()
        default:
            self.showTimeShareVC()
        }
    }
    
}

// MARK: - actionProtocol

extension HomeVC: actionProtocol {
    
    func itemTapped(type: ActionType) {
        
        //未登录用户先登录
        guard let _ = Keychain(service: service)[k_UserID] else {
            self.showLoginVC(true)
            return
        }
        
        switch type {
        case .Open,
             .Lock:
            self.ControlCarRight(type)
        case .ReturnCar:
            self.returnCarAddressConfirm()
        case .Pay:
            if self.current_order_id == nil {
                Drop.down("您还没有租车订单需要结算")
                return
            }
            let orderVC = OrderDetailVC()
            orderVC.order_id = self.current_order_id
            self.navigationController?.pushViewController(orderVC, animated: true)
        }
    }
}

// MARK: - TimeShareVCProtocol

extension HomeVC: TimeShareVCProtocol {
    
    func searchFor(type: String) {
        
        let request :URLRequestConvertible!
        
        switch type {
        case "附近车辆":
            request = Router.SearchCar(lng: String(self.userLocation.coordinate.longitude),
                                       lat: String(self.userLocation.coordinate.latitude),
                                       type: "0")
            APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
                
                if let cars = Mapper<CarModel>().mapArray(objc) {
                    let pois = NSMutableArray()
                    for car in cars {
                        let poi = MAPointAnnotation()
                        poi.coordinate = CLLocationCoordinate2DMake(Double(car.lat!)!, Double(car.lng!)!)
                        pois.addObject(poi)
                    }
                    self.mapVC.setPoi(pois)
                    self.mapVC.mapView.setZoomLevel(14.1, animated: true)
                    self.timeShareVC.cars(cars)
                } else {
                    self.timeShareVC.cars([])
                    self.timeShareVC.tablewView.reloadData()
                }
            }
        case "全部车辆":
            request = Router.SearchCar(lng: String(self.userLocation.coordinate.longitude),
                                       lat: String(self.userLocation.coordinate.latitude),
                                       type: "1")
            APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
                
                if let cars = Mapper<CarModel>().mapArray(objc) {
                    let pois = NSMutableArray()
                    for car in cars {
                        let poi = MAPointAnnotation()
                        poi.coordinate = CLLocationCoordinate2DMake(Double(car.lat!)!, Double(car.lng!)!)
                        pois.addObject(poi)
                    }
                    self.mapVC.setPoi(pois)
                    self.mapVC.mapView.setZoomLevel(10.1, animated: true)
                    self.timeShareVC.cars(cars)
                } else {
                    self.timeShareVC.cars([])
                    self.timeShareVC.tablewView.reloadData()
                }
            }
        case "附近车场":
            request = Router.SerachNearStore(lng: String(self.userLocation.coordinate.longitude),
                                       lat: String(self.userLocation.coordinate.latitude),
                                       type: "0")
            APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
                
                if let stores = Mapper<CarStoreModel>().mapArray(objc) {
                    let pois = NSMutableArray()
                    for store in stores {
                        let poi = MAPointAnnotation()
                        poi.coordinate = CLLocationCoordinate2DMake(Double(store.lat!)!, Double(store.lng!)!)
                        pois.addObject(poi)
                    }
                    self.mapVC.setPoi(pois)
                    self.mapVC.mapView.setZoomLevel(10.1, animated: true)
                    self.timeShareVC.stores(stores)
                } else {
                    self.timeShareVC.stores([])
                    self.timeShareVC.tablewView.reloadData()
                }
            }
        case "全部车场":
            request = Router.SerachNearStore(lng: String(self.userLocation.coordinate.longitude),
                                             lat: String(self.userLocation.coordinate.latitude),
                                             type: "1")
            APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
                
                if let stores = Mapper<CarStoreModel>().mapArray(objc) {
                    let pois = NSMutableArray()
                    for store in stores {
                        let poi = MAPointAnnotation()
                        poi.coordinate = CLLocationCoordinate2DMake(Double(store.lat!)!, Double(store.lng!)!)
                        pois.addObject(poi)
                    }
                    self.mapVC.setPoi(pois)
                    self.mapVC.mapView.setZoomLevel(10.1, animated: true)
                    self.timeShareVC.stores(stores)
                } else {
                    self.timeShareVC.stores([])
                    self.timeShareVC.tablewView.reloadData()
                }
            }
        default:
            request = Router.SearchCar(lng: String(self.userLocation.coordinate.longitude),
                                       lat: String(self.userLocation.coordinate.latitude),
                                       type: "1")
            APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
                
                if let cars = Mapper<CarModel>().mapArray(objc) {
                    let pois = NSMutableArray()
                    for car in cars {
                        let poi = MAPointAnnotation()
                        poi.coordinate = CLLocationCoordinate2DMake(Double(car.lat!)!, Double(car.lng!)!)
                        pois.addObject(poi)
                    }
                    self.mapVC.setPoi(pois)
                    self.timeShareVC.cars(cars)
                }
            }
            
        }
        
    }
    
    func orderBtnTapped() {
        
        if checkHaveLogin() {
            let orderListVC = OrderListVC()
            orderListVC.showMenuBtn = false
            self.navigationController?.pushViewController(orderListVC, animated: true)
        }
    }
}

extension HomeVC : MapVCProtocol {
    
    func getUserLocation(locaion: MAUserLocation) {
        
        self.userLocation = locaion
        print("当前位置:\n latitude: \(self.userLocation.coordinate.latitude)\n longitude: \(self.userLocation.coordinate.longitude)")
        
        //第一次取得定位加载默认附近车辆
        if isFirstLoad {
            self.showNearbyCars()
        }
    }
    
    func showNearbyCars() {
        
        isFirstLoad = false
        
        let request = Router.SearchCar(lng: String(self.userLocation.coordinate.longitude),
                                       lat: String(self.userLocation.coordinate.latitude),
                                       type: "0")
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            
            if let cars = Mapper<CarModel>().mapArray(objc) {
                let pois = NSMutableArray()
                for car in cars {
                    let poi = MAPointAnnotation()
                    poi.coordinate = CLLocationCoordinate2DMake(Double(car.lat!)!, Double(car.lng!)!)
                    pois.addObject(poi)
                }
                self.mapVC.setPoi(pois)
                
            }
        }
    }
    
}

// MARK: - SlideMenuControllerDelegate

extension HomeVC: SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
    
}

// MARK: - MenuProtocol

extension HomeVC : MenuProtocol {
    
    func changeViewController(menu: LeftMenu) {
        switch menu {
//        case .首页:
//            break
//        case .我的行程:
//            guard let user_id = Keychain(service: service)[k_UserID] else {
//                self.showLoginVC(true)
//                return
//            }
//            let orderListVC = OrderListVC()
//            orderListVC.user_id = user_id
//            self.navigationController?.pushViewController(orderListVC, animated: true)
        case .账户余额:
            guard let user_id = Keychain(service: service)[k_UserID] else {
                self.showLoginVC(true)
                return
            }
            let walletVC = WalletVC()
            walletVC.user_id = user_id
            self.navigationController?.pushViewController(walletVC, animated: true)
        case .个人信息修改:
            guard let user_id = Keychain(service: service)[k_UserID] else {
                self.showLoginVC(true)
                return
            }
            let userInfoVC = UserInfoVC()
            userInfoVC.user_id = user_id
            self.navigationController?.pushViewController(userInfoVC, animated: true)
        case .租车资格验证:
            guard let user_id = Keychain(service: service)[k_UserID] else {
                self.showLoginVC(true)
                return
            }
            let qualificationInfoVC = QualificationInfoVC()
            qualificationInfoVC.user_id = user_id
            self.navigationController?.pushViewController(qualificationInfoVC, animated: true)
        case .关于:
            break
        }
        
    }
}
