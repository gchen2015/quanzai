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

class HomeVC: BaseVC {
    
    var mapVC:MapVC?
    var categoryList : NSArray?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavBar()
        self.setupMapView()
        self.setupTimeShareVC()
        self.setupActionBar()
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
        self.mapVC?.view.frame = ccr(0, y: 0, width: k_SCREEN_W, height: 300)
        self.view.addSubview(self.mapVC!.view)
        self.mapVC?.didMoveToParentViewController(self)
    }
    
    func setupTimeShareVC() {
        
        let timeShareVC = TimeShareVC()
        timeShareVC.delegate = self
        self.addChildViewController(timeShareVC)
        timeShareVC.view.frame = ccr(0,
                                     y: 300-k_NAV_BAR_H,
                                     width: k_SCREEN_W,
                                     height: self.view.height-300-80+k_NAV_BAR_H)
        self.view.addSubview(timeShareVC.view)
        timeShareVC.didMoveToParentViewController(self)
        
    }
    
    func setupActionBar() {
        
        let actionBar = ActionBar(frame: ccr(0, y: k_SCREEN_H-k_NAV_BAR_H-80, width: k_SCREEN_W, height: 80))
        actionBar.delegate = self
        self.view.addSubview(actionBar)
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
