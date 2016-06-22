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
import AlamofireObjectMapper
import SwiftyDrop
import HMSegmentedControl

class HomeVC: BaseVC {
    
    var mapVC:MapVC!
    var categoryList : NSArray?
    
    lazy var timeShareVC : TimeShareVC = self.setupTimeShareVC()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavBar()
        self.setupMapView()
        self.setupTimeShareVC()
        self.setupSegmentedBar()
        self.setupActionBar()
        self.showTimeShareVC()
        self.fetchData()
        
    }
    
}

// MARK: - API

extension HomeVC {
    
    func fetchData() {
        
        Alamofire.request(Router.CategoryList()).responseArray(keyPath: "data") { (response: Response<[CategoryModel], NSError>) in
            
            switch response.result {
            case .Success:
                
                self.categoryList = response.result.value
                
                
                //
                //                if let value = response.result.value {
                //                    let json = JSON(value)
                //                    if let name = json["data"][0]["name"].string {
                //                        print("第一个分类名称是：",name)
                //                    }
            //                }
            case .Failure(let error):
                print(error)
            }
            
        }
        
        //        Alamofire.request(Router.CategoryList()).responseJSON { response in
        //            switch response.result {
        //            case .Success:
        //                if let value = response.result.value {
        //                    let json = JSON(value)
        //                    if let name = json["data"][0]["name"].string {
        //                        print("第一个分类名称是：",name)
        //                    }
        //                }
        //            case .Failure(let error):
        //                print(error)
        //            }
        //        }
    }
    
}

// MARK: - SetupUI

extension HomeVC {
    
    func setupNavBar() {
        
        self.showLogo(true)
        
        let menuBtn = UIButton(imageName: "menu-icon", hlImageName: "menu-icon") { (menuBtn) in
            self.openLeft()
        }
        menuBtn.size = ccs(35, height: 35)
        self.showLeftBarItem(menuBtn)
    }
    
    func setupMapView() {
        
        self.mapVC = MapVC()
        self.addChildViewController(self.mapVC!)
        self.mapVC.view.frame = ccr(0, y: 0, width: k_SCREEN_W, height: 300)
        self.view.addSubview(self.mapVC.view)
        self.mapVC.didMoveToParentViewController(self)
    }
    
    func setupSegmentedBar() {
        
        let titles = ["马上用车","预约用车","分时租赁","同城速递"]
        let segmentedControl = HMSegmentedControl(sectionTitles: titles)
        segmentedControl.frame = ccr(0, y: 300-k_NAV_BAR_H, width: k_SCREEN_W, height: 30)
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
                                     y: 300-k_NAV_BAR_H+30,
                                     width: k_SCREEN_W,
                                     height: self.view.height-300-80+k_NAV_BAR_H-30)
        return timeShareVC
    }
    
    func setupActionBar() {
        
        let actionBar = ActionBar(frame: ccr(0, y: k_SCREEN_H-k_NAV_BAR_H-80, width: k_SCREEN_W, height: 80))
        actionBar.delegate = self
        self.view.addSubview(actionBar)
    }
    
    func showTimeShareVC() {
        self.addChildViewController(self.timeShareVC)
        self.view.addSubview(self.timeShareVC.view)
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
            self.addChildViewController(self.timeShareVC)
            self.view.addSubview(self.timeShareVC.view)
            self.timeShareVC.didMoveToParentViewController(self)
        case 3:
            Drop.down("功能待开发")
            self.timeShareVC.view.removeFromSuperview()
            self.timeShareVC.removeFromParentViewController()
        default:
            self.addChildViewController(self.timeShareVC)
            self.view.addSubview(self.timeShareVC.view)
            self.timeShareVC.didMoveToParentViewController(self)
        }
    }
    
}

// MARK: - actionProtocol

extension HomeVC: actionProtocol {
    
    func itemTapped(index: Int) {
        print(index)
        self.fetchData()
    }
}

// MARK: - TimeShareVCProtocol

extension HomeVC: TimeShareVCProtocol {
    
    func searchFor(url: String) {
        print(url)
    }
    
    func orderBtnTapped() {
        print("orderBtnTapped")
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
