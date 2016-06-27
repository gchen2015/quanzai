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
        scrollView.contentSize = ccs(k_SCREEN_W, scrollView.height+100)
        self.view.addSubview(scrollView)
        
        self.infoView = NSBundle.mainBundle().loadNibNamed("UserInfoView", owner: nil, options: nil).first as! UserInfoView
        self.infoView.delegate = self
        self.infoView.frame = ccr(10, 20, k_SCREEN_W-20, 235)
        scrollView.addSubview(infoView)
        
        let okBtn = UIButton(imageName: "btn-blue",
                               hlImageName: "",
                               title: "提交",
                               titleColor: UIColorFromRGB(0x0aa29c),
                               font: HS_FONT(15)) { (nextBtn) in
                                print("提交")
        }
        okBtn.frame = ccr(30, CGRectGetMaxY(self.infoView.frame)+20, k_SCREEN_W-30*2, 40)
        scrollView.addSubview(okBtn)
    }
}

extension UserInfoVC : UserInfoViewProtocol {
    
    func avatarTapped() {
        
        let alertControler = UIAlertController(title: "上传头像", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel) { (cancelAction) in
            print("取消")
        }
        
        let cameraAction = UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default) { (cameraAction) in
            print("拍照")
        }
        let photoAction = UIAlertAction(title: "相册", style: UIAlertActionStyle.Default) { (photoAction) in
            print("相册")
        }
        alertControler.addAction(cancelAction)
        alertControler.addAction(cameraAction)
        alertControler.addAction(photoAction)
        self.presentViewController(alertControler, animated: true, completion: nil)
        
    }
    
    func genderTapped() {
        
        let alertControler = UIAlertController(title: "选择性别", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let maleAction = UIAlertAction(title: "男", style: UIAlertActionStyle.Default) { (maleAction) in
            print("男")
        }
        let femaleAction = UIAlertAction(title: "女", style: UIAlertActionStyle.Default) { (femaleAction) in
            print("女")
        }
        alertControler.addAction(maleAction)
        alertControler.addAction(femaleAction)
        self.presentViewController(alertControler, animated: true, completion: nil)
        
    }
    
}

