//
//  MenuVC.swift
//  QuanZai
//
//  Created by i-chou on 6/20/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import SlideMenuControllerSwift

enum LeftMenu: Int {
    case 首页  = 0
    case 我的行程
    case 我的包裹
    case 活动中心
    case 账户余额
    case 开发票
    case 个人信息修改
    case 租车资格验证
    case 设置
    case 关于
}

protocol MenuProtocol : class {
    func changeViewController(menu: LeftMenu)
}

class MenuVC : UIViewController {
    
    let menus = ["首页", "我的行程", "我的包裹", "活动中心", "账户余额", "开发票", "个人信息修改", "租车资格验证" , "关于"]
    
    var homeVC : UIViewController!
//    var homeVC2 : UIViewController!
//    var homeVC3 : UIViewController!
//    var homeVC4 : UIViewController!
//    var homeVC5 : UIViewController!
//    var homeVC6 : UIViewController!
//    var homeVC7 : UIViewController!
    
    var avatarIMG : UIImageView!
    var screenNameLabel : UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let homeVC = HomeVC()
        self.homeVC = UINavigationController(rootViewController: homeVC)
//        self.homeVC2 = UINavigationController(rootViewController: homeVC)
//        self.homeVC3 = UINavigationController(rootViewController: homeVC)
//        self.homeVC4 = UINavigationController(rootViewController: homeVC)
//        self.homeVC5 = UINavigationController(rootViewController: homeVC)
//        self.homeVC6 = UINavigationController(rootViewController: homeVC)
//        self.homeVC7 = UINavigationController(rootViewController: homeVC)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupUI()
        self.view.layoutIfNeeded()
    }
}

// MARK: - setupUI

extension MenuVC {
    
    func setupUI() {
        self.view.backgroundColor = UIColorFromRGB(0x0aa29c)
        
        var x : CGFloat = 0
        var y : CGFloat = 0
        var w : CGFloat = self.view.width
        var h : CGFloat = k_NAV_BAR_H
        let headerView = UIView(frame:ccr(x, y: y, width: w, height: h))
        headerView.backgroundColor = UIColorFromRGB(0x1b5b76)
        
        x = 20
        y = 10
        w = 40
        h = w
        self.avatarIMG = UIImageView(frame:ccr(x, y: y, width: w, height: h))
        self.avatarIMG.image = IMG("menu-icon")
        
        x = CGRectGetMaxX(self.avatarIMG.frame)+20
        y = self.avatarIMG.y
        w = 100
        h = self.avatarIMG.height
        self.screenNameLabel = UILabel(frame: ccr(x, y: y, width: w, height: h),
                                       color: UIColor.whiteColor(),
                                       font: HS_FONT(15),
                                       text: "任飞",
                                       alignment: NSTextAlignment.Left,
                                       numberOfLines: 1)
        
        
        headerView.addSubview(self.avatarIMG)
        headerView.addSubview(self.screenNameLabel)
        self.view.addSubview(headerView)
        
        for index in 0 ..< self.menus.count {
            let title : String = self.menus[index]

            let menuBtn = UIButton(imageName: "",
                                   hlImageName: "",
                                   title: title,
                                   titleColor: UIColor.whiteColor(),
                                   font: HS_FONT(15),
                                   titleEdgeInsets: UIEdgeInsetsZero,
                                   contentHorizontalAlignment: UIControlContentHorizontalAlignment.Left,
                                   onTapBlock: { (menuBtn) in
                                    self.menuTapped(index)
            })
            
            if index == self.menus.count-1 {
                x = 20
                y = 40 * CGFloat(index) + CGRectGetMaxY(headerView.frame)+30
                w = self.view.width - 20*2
                h = 0.5
                let line = UIImageView(frame: ccr(x, y: y, width: w, height: h))
                line.backgroundColor = UIColorFromRGBA(0xcccccc, alpha: 0.5)
                self.view.addSubview(line)
                
                x = self.screenNameLabel.x
                y = CGRectGetMaxY(line.frame)+20
                w = 100
                h = 20
                
            } else {
                x = self.screenNameLabel.x
                y = 40 * CGFloat(index) + CGRectGetMaxY(headerView.frame)+30
                w = 100
                h = 20
            }
            menuBtn.frame = ccr(x, y: y, width: w, height: h)
            self.view.addSubview(menuBtn)
        }
    }
    
    func menuTapped(index: Int) {
        if let menu = LeftMenu(rawValue: index) {
            self.changeViewController(menu)
        }
    }
}

// MARK: - MenuProtocol

extension MenuVC : MenuProtocol {
    
    func changeViewController(menu: LeftMenu) {
        switch menu {
        case .首页:
            self.slideMenuController()?.changeMainViewController(self.homeVC, close: true)
        case .我的行程:
            self.slideMenuController()?.changeMainViewController(self.homeVC, close: true)
        case .我的包裹:
            self.slideMenuController()?.changeMainViewController(self.homeVC, close: true)
        case .活动中心:
            self.slideMenuController()?.changeMainViewController(self.homeVC, close: true)
        case .账户余额:
            self.slideMenuController()?.changeMainViewController(self.homeVC, close: true)
        case .开发票:
            self.slideMenuController()?.changeMainViewController(self.homeVC, close: true)
        case .个人信息修改:
            self.slideMenuController()?.changeMainViewController(self.homeVC, close: true)
        case .租车资格验证:
            self.slideMenuController()?.changeMainViewController(self.homeVC, close: true)
        case .设置:
            break
        case .关于:
            self.slideMenuController()?.changeMainViewController(self.homeVC, close: true)
        }
    }
}