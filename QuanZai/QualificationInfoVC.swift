//
//  QualificationInfoVC.swift
//  QuanZai
//
//  Created by i-chou on 6/23/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import KeychainAccess
import SwiftyDrop
import ObjectMapper

class QualificationInfoVC : BaseVC {
    
    var infoView : QualificationView!
    var picUrl : String?
    var userId : String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("租车资格验证")
        
//        let menuBtn = UIButton(imageName: "menu-icon", hlImageName: "menu-icon") { (menuBtn) in
//            self.openLeft()
//        }
//        menuBtn.size = ccs(35, 35)
//        self.showLeftBarItem(menuBtn)
        
        self.setupUI()
        self.getUserValidateInfo()
    }
    
    func setupUI() {
        
        let scrollView = UIScrollView(frame: ccr(0, 0, k_SCREEN_W, k_SCREEN_H-k_NAV_BAR_H))
        scrollView.contentSize = ccs(k_SCREEN_W, scrollView.height)
        self.view.addSubview(scrollView)
        
        self.infoView = NSBundle.mainBundle().loadNibNamed("QualificationView", owner: nil, options: nil).first as! QualificationView
        self.infoView.delegate = self
        self.infoView.frame = ccr(10, 20, k_SCREEN_W-20, 320)
        scrollView.addSubview(infoView)
        
        let okBtn = UIButton(imageName: "btn-blue",
                               hlImageName: "",
                               title: "提交",
                               titleColor: UIColorFromRGB(0x0aa29c),
                               font: HS_FONT(15)) { (nextBtn) in
            self.submit()
        }
        okBtn.frame = ccr(30, CGRectGetMaxY(self.infoView.frame)+20, k_SCREEN_W-30*2, 40)
        scrollView.addSubview(okBtn)
    }
    
}

extension QualificationInfoVC : QualificationViewProtocol {
    
    func plusTapped() {
        
        let alertControler = UIAlertController(title: "上传证件照", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
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
    
}

// MARK: - actions

extension QualificationInfoVC {
    
    func openCamera() {
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .Camera
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
    func openAlbum() {
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .PhotoLibrary
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
    //TODO: 获取租车验证信息
    func getUserValidateInfo() {
        
        let request = Router.GetUserValidateInfo(user_id: self.userId)
        
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            if let validateInfo = Mapper<UserValidateInfoModel>().map(objc) {
                self.infoView.nameTxt.text = validateInfo.real_name
                self.infoView.IDTxt.text = validateInfo.driving_license
                self.infoView.plusIcon.af_setImageWithURL(URL(validateInfo.dirving_picture!),
                                                          placeholderImage: IMG("plus"),
                                                          filter: nil, progress: nil,
                                                          progressQueue: dispatch_get_main_queue(),
                                                          imageTransition: .CrossDissolve(0.2),
                                                          runImageTransitionIfCached: true,
                                                          completion: { response in
                    self.infoView.plusIcon.frame = self.infoView.photoView.bounds
                })
                
            }
        }
    }
    
    //上传头像
    func uploadPic(image: UIImage) {
        
        let request = Router.UploadPicture(type: "1")
        let imageData: NSData = UIImageJPEGRepresentation(image, 1)!
        
        APIClient.sharedAPIClient().uploadRequest(request, data: imageData, progressHandler: { (bytesWritten, totalBytesWritten, totalBytesExpectedToWrite) in
            
            let persent = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)*100
            print("上传进度：\(persent)%")
            
        }) { (objc, error, badNetWork) in
            self.infoView.plusIcon.frame = self.infoView.photoView.bounds
            self.infoView.plusIcon.image = image
            if objc != nil {
                self.picUrl = String(objc!)
            } else {
                self.picUrl = ""
            }
        }
    }
    
    //提交信息
    func submit() {
        
        let keychain = Keychain(service: service)
        if keychain[k_UserID] == nil { return }
        let user_id = keychain[k_UserID]!
        let real_name = self.infoView.nameTxt.text!
        let driving_license = self.infoView.IDTxt.text!
        
        let request = Router.EditValidateInfo(user_id: user_id, real_name: real_name, driving_license: driving_license, dirving_picture: self.picUrl!)
        
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            if objc != nil {
                Drop.down("提交成功", state: .Success)
                self.infoView.endEditing(true)
            }
        }
    }
}

extension QualificationInfoVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
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

