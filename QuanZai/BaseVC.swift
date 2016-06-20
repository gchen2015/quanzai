//
//  BaseVC.swift
//  QuanZai
//
//  Created by i-chou on 6/20/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    func showLogo(show: Bool) {
        
        if show {
            let logo = UIImageView(image: IMG("title"))
            logo.size = ccs(140, height: 20)
            self.navigationItem.titleView = logo
        } else {
            self.navigationItem.titleView = nil
        }
        
    }
    
    func showTitle(title: String?) {
        self.navigationItem.titleView = nil
        let dict = [NSFontAttributeName: HS_FONT(18),
                    NSForegroundColorAttributeName: UIColorFromRGB(0xffffff)]
        self.navigationController!.navigationBar.titleTextAttributes = dict
        
        self.title = title
    }
    
    func showLeftBarItem(btn: UIButton) {
        let barItem = UIBarButtonItem(customView: btn)
        self.navigationItem.leftBarButtonItem = barItem
    }
    
    func showRightBarItem(btn: UIButton) {
        let barItem = UIBarButtonItem(customView: btn)
        self.navigationItem.rightBarButtonItem = barItem
    }
}