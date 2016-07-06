//
//  UserInfoEditingVC.swift
//  QuanZai
//
//  Created by i-chou on 6/23/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import KeychainAccess
import SwiftyDrop
import SwiftyJSON

class UserInfoVC: BaseVC {
    
    var infoView : UserInfoView!
    var avatar_url : String?
    var gender : String?
    var phone : String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("个人信息修改")
        
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
        self.infoView.frame = ccr(10, 20, k_SCREEN_W-20, 195)
        scrollView.addSubview(infoView)
        
        let okBtn = UIButton(imageName: "btn-blue",
                               hlImageName: "",
                               title: "提交",
                               titleColor: UIColorFromRGB(0x0aa29c),
                               font: HS_FONT(15)) { (nextBtn) in
                                self.setUserInfo()
        }
        okBtn.frame = ccr(30, CGRectGetMaxY(self.infoView.frame)+20, k_SCREEN_W-30*2, 40)
        scrollView.addSubview(okBtn)
        
        self.infoView.genderBtn.setTitle(self.gender, forState: .Normal)
        self.infoView.avatarIMG.af_setImageWithURL(URL(self.avatar_url!))
        self.infoView.phoneTxt.text = self.phone!
    }
}

// MARK: - UserInfoViewProtocol

extension UserInfoVC : UserInfoViewProtocol {
    
     // MARK: 点击修改头像
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
    
    // MARK: 点击修改性别
    func genderTapped() {
        
        let alertControler = UIAlertController(title: "选择性别", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let maleAction = UIAlertAction(title: "男", style: UIAlertActionStyle.Default) { (maleAction) in
            self.infoView.genderBtn.setTitle("男", forState: .Normal)
            self.infoView.genderBtn.setTitleColor( .blackColor(), forState: .Normal)
            self.gender = "1"
        }
        let femaleAction = UIAlertAction(title: "女", style: UIAlertActionStyle.Default) { (femaleAction) in
            self.infoView.genderBtn.setTitle("女", forState: .Normal)
            self.infoView.genderBtn.setTitleColor( .blackColor(), forState: .Normal)
            self.gender = "2"
        }
        alertControler.addAction(maleAction)
        alertControler.addAction(femaleAction)
        self.presentViewController(alertControler, animated: true, completion: nil)
    }
}

// MARK: - actions

extension UserInfoVC {
    
    //打开拍照
    func openCamera() {
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
        photoPicker.sourceType = .Camera
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
    //打开相册
    func openAlbum() {
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
        photoPicker.sourceType = .PhotoLibrary
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
    //提交个人信息
    func setUserInfo() {
        
        let keychain = Keychain(service: service)
        if keychain[k_UserID] == nil { return }
        let user_id = keychain[k_UserID]!
        let phone = self.infoView.phoneTxt.text!
        let gender = self.infoView.genderBtn.titleLabel!.text!
        let head_portrait = self.avatar_url!
        
        let request = Router.EditUserInfo(user_id: user_id, phone: phone, gender: gender, head_portrait: head_portrait)
        
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            Drop.down("修改成功", state: .Success)
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    //上传头像
    func uploadPic(image: UIImage) {
        
        let request = Router.UploadPicture(type: "0")
        let imageData: NSData = UIImageJPEGRepresentation(image, 1)!
        
        APIClient.sharedAPIClient().uploadRequest(request, data: imageData, progressHandler: { (bytesWritten, totalBytesWritten, totalBytesExpectedToWrite) in
            
            let persent = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)*100
            print("上传进度：\(persent)%")
            }) { (objc, error, badNetWork) in
                self.infoView.avatarIMG.image = image
                self.infoView.avatarIMG.layer.cornerRadius = self.infoView.avatarIMG.width/2
                self.infoView.avatarIMG.layer.masksToBounds = true
                if objc != nil {
                    self.avatar_url = String(objc!)
                }
        }
    }
    
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

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
            self.uploadPic(image)
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}

