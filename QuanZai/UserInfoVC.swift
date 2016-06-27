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
            //do nothing
        }
        
        let cameraAction = UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default) { (cameraAction) in
            self.openCamera()
        }
        let photoAction = UIAlertAction(title: "相册", style: UIAlertActionStyle.Default) { (photoAction) in
            self.openAlbum()
        }
        alertControler.addAction(cancelAction)
        alertControler.addAction(cameraAction)
        alertControler.addAction(photoAction)
        self.presentViewController(alertControler, animated: true, completion: nil)
        
    }
    
    func genderTapped() {
        
        let alertControler = UIAlertController(title: "选择性别", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let maleAction = UIAlertAction(title: "男", style: UIAlertActionStyle.Default) { (maleAction) in
            self.infoView.genderBtn.setTitle("男", forState: .Normal)
            self.infoView.genderBtn.setTitleColor( .blackColor(), forState: .Normal)
        }
        let femaleAction = UIAlertAction(title: "女", style: UIAlertActionStyle.Default) { (femaleAction) in
            self.infoView.genderBtn.setTitle("女", forState: .Normal)
            self.infoView.genderBtn.setTitleColor( .blackColor(), forState: .Normal)
        }
        alertControler.addAction(maleAction)
        alertControler.addAction(femaleAction)
        self.presentViewController(alertControler, animated: true, completion: nil)
        
    }
    
}

// MARK: - actions

extension UserInfoVC {
    
    func openCamera() {
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
        photoPicker.sourceType = .Camera
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
    func openAlbum() {
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
        photoPicker.sourceType = .PhotoLibrary
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
}

extension UserInfoVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
           
            var image = pickedImage
            if pickedImage.size.width > 1000 || pickedImage.size.height > 1000 {
                let scale = (CGFloat)(1000/pickedImage.size.width)
                image = pickedImage.scaleToSize(ccs(pickedImage.size.width*scale, pickedImage.size.height*scale))
            }
            self.infoView.avatarIMG.image = image
            self.infoView.avatarIMG.layer.cornerRadius = self.infoView.avatarIMG.width/2
            self.infoView.avatarIMG.layer.masksToBounds = true
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}

