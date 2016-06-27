//
//  UserInfoEditingVC.swift
//  QuanZai
//
//  Created by i-chou on 6/23/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class UserInfoVC: BaseVC {
    
    var infoView : UserInfoView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showLogo(true)
        
        let menuBtn = UIButton(imageName: "menu-icon", hlImageName: "menu-icon") { (menuBtn) in
            self.openLeft()
        }
        menuBtn.size = ccs(35, 35)
        self.showLeftBarItem(menuBtn)
        
        self.setupUI()
    }
    
    func setupUI() {
        
        let scrollView = UIScrollView(frame: ccr(0, 0, k_SCREEN_W, k_SCREEN_H-k_NAV_BAR_H))
        scrollView.contentSize = ccs(k_SCREEN_W, scrollView.height+150)
        self.view.addSubview(scrollView)
        
        self.infoView = NSBundle.mainBundle().loadNibNamed("UserInfoView", owner: nil, options: nil).first as! UserInfoView
        self.infoView.delegate = self
        self.infoView.frame = ccr(10, 20, k_SCREEN_W-20, 280)
        scrollView.addSubview(infoView)
        
        let nextBtn = UIButton(imageName: "btn-blue",
                               hlImageName: "",
                               title: "提交",
                               titleColor: UIColorFromRGB(0x0aa29c),
                               font: HS_FONT(15)) { (nextBtn) in
                                print("下一步")
        }
        nextBtn.frame = ccr(30, CGRectGetMaxY(self.infoView.frame)+20, k_SCREEN_W-30*2, 40)
        scrollView.addSubview(nextBtn)
    }
}

extension UserInfoVC : UserInfoViewProtocol {
    
    func avatarTapped() {
        print("avatarTapped")
    }
    
    func genderTapped() {
        print("genderTapped")
    }
    
}
