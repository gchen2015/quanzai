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
                                self.okTapped()
        }
        okBtn.frame = ccr(30, CGRectGetMaxY(self.infoView.frame)+20, k_SCREEN_W-30*2, 40)
        scrollView.addSubview(okBtn)
        
        scrollView.contentSize = ccs(k_SCREEN_W, CGRectGetMaxY(okBtn.frame)+20)
        self.infoView.unitPayView.alpha = 0
    }
}

extension CarDetailVC {
    
    func okTapped() {
        let alertView = NSBundle.mainBundle().loadNibNamed("VerifyCodeView", owner: nil, options: nil).first as! VerifyCodeView
        alertView.size = ccs(k_SCREEN_W-40, 160)
        self.showAlert(alertView)
    }
}

// MARK: - CarDetailViewProtocol

extension CarDetailVC : CarDetailViewProtocol {
    
    func paymentBtnTapped() {
        let arr = [["name":"分时"],["name":"半日租"],["name":"日租"]]
        self.alertDateTypes(arr)
    }
    
    func alertDateTypes(array : NSArray) {
        let alertControler = UIAlertController(title: "选择租用方式", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        for item in array {
            let action = UIAlertAction(title: item["name"] as? String, style: UIAlertActionStyle.Default) { (maleAction) in
                self.infoView.paymentBtn.setTitle(item["name"] as? String, forState: .Normal)
                self.infoView.paymentBtn.setTitleColor(UIColor.lightGrayColor() , forState: .Normal)
            }
            alertControler.addAction(action)
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel) { (cancelAction) in
            //do nothing
        }
        alertControler.addAction(cancelAction)
        self.presentViewController(alertControler, animated: true, completion: nil)
    }
}

// MARK: - VerifyCodeViewProtocol

extension CarDetailVC : VerifyCodeViewProtocol {
        
    func rentTheCar() {
        //TODO: 确认租车
    }
}
