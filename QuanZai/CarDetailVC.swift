//
//  CarDetailVC.swift
//  QuanZai
//
//  Created by i-chou on 6/28/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class CarDetailVC: BaseVC {
    
    var infoView : CarDetailView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("车辆详情")
        self.setupUI()
    }
    
    func setupUI() {
        
        let scrollView = UIScrollView(frame: ccr(0, 0, k_SCREEN_W, k_SCREEN_H-k_NAV_BAR_H))
        self.view.addSubview(scrollView)
        
        self.infoView = NSBundle.mainBundle().loadNibNamed("CarDetailView", owner: nil, options: nil).first as! CarDetailView
        self.infoView.delegate = self
        self.infoView.frame = ccr(10, 20, k_SCREEN_W-20, 600)
        scrollView.addSubview(infoView)
        
        let okBtn = UIButton(imageName: "btn-blue",
                             hlImageName: "",
                             title: "租用",
                             titleColor: UIColorFromRGB(0x0aa29c),
                             font: HS_FONT(15)) { (nextBtn) in
                                print("租用")
        }
        okBtn.frame = ccr(30, CGRectGetMaxY(self.infoView.frame)+20, k_SCREEN_W-30*2, 40)
        scrollView.addSubview(okBtn)
        
        scrollView.contentSize = ccs(k_SCREEN_W, CGRectGetMaxY(okBtn.frame)+20)
        self.infoView.unitPayView.alpha = 0
    }
}

extension CarDetailVC : CarDetailViewProtocol {
    
    func paymentBtnTapped() {
        
    }
}
