//
//  QualificationInfoVC.swift
//  QuanZai
//
//  Created by i-chou on 6/23/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class QualificationInfoVC : BaseVC {
    
    var infoView : QualificationView!
    
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
        scrollView.contentSize = ccs(k_SCREEN_W, scrollView.height)
        self.view.addSubview(scrollView)
        
        self.infoView = NSBundle.mainBundle().loadNibNamed("QualificationView", owner: nil, options: nil).first as! QualificationView
        self.infoView.delegate = self
        self.infoView.frame = ccr(10, 20, k_SCREEN_W-20, 320)
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

extension QualificationInfoVC : QualificationViewProtocol {
    
    func plusTapped() {
        print("plusTapped")
    }
    
}
