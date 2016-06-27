//
//  UserInfoView.swift
//  QuanZai
//
//  Created by i-chou on 6/23/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import SnapKit

protocol UserInfoViewProtocol: class {
    func avatarTapped()
    func genderTapped()
}

@IBDesignable class UserInfoView: UIView {
    
    var delegate : UserInfoViewProtocol?
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerTitle: UILabel!
    
    @IBOutlet var nameView: View!
    @IBOutlet var nameTitle: UILabel!
    @IBOutlet var nameLine: UIImageView!
    @IBOutlet var nameTxt: UITextField!
    
    @IBOutlet var genderView: View!
    @IBOutlet var genderTitle: UILabel!
    @IBOutlet var genderLine: UIImageView!
    @IBOutlet var genderBtn: UIButton!
    
    @IBOutlet var avatarView: View!
    @IBOutlet var avatarTitle: UILabel!
    @IBOutlet var avatarLine: UIImageView!
    @IBOutlet var avatarIMG: UIImageView!
    @IBOutlet var avatarBtn: UIButton!
    
    @IBOutlet var phoneView: View!
    @IBOutlet var phoneTitle: UILabel!
    @IBOutlet var phoneLine: UIImageView!
    @IBOutlet var phoneTxt: UITextField!
    
//    @IBOutlet var passwordView: View!
//    @IBOutlet var passwordTitle: UILabel!
//    @IBOutlet var passwordLine: UIImageView!
//    @IBOutlet var passwordTxt: UITextField!
    
    
    override func awakeFromNib() {
        
        self.setDelegates()
        self.layout()
    }
    
    func setDelegates() {
        self.nameTxt.delegate = self
        self.phoneTxt.delegate = self
//        self.passwordTxt.delegate = self
    }
    
    @IBAction func avatarTapped(sender: AnyObject) {
        self.delegate?.avatarTapped()
    }
    
    @IBAction func genderTapped(sender: AnyObject) {
        self.delegate?.genderTapped()
    }
}

extension UserInfoView {
    
    func layout() {
        
        self.headerView.snp_makeConstraints { (make) in
            make.top.equalTo(self.snp_top)
            make.left.equalTo(self.snp_left)
            make.right.equalTo(self.snp_right)
            make.height.equalTo(40)
        }
        self.headerTitle.snp_makeConstraints { (make) in
            make.top.equalTo(self.headerView.snp_top)
            make.left.equalTo(self.headerView.snp_left).offset(20)
            make.right.equalTo(self.headerView.snp_right)
            make.height.equalTo(self.headerView.snp_height)
        }
        
        
        self.nameView.snp_makeConstraints { (make) in
            make.top.equalTo(self.headerView.snp_bottom).offset(10)
            make.left.equalTo(self.snp_left).offset(20)
            make.right.equalTo(self.snp_right).offset(-20)
            make.height.equalTo(30)
        }
        self.nameTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(self.nameView.snp_left)
            make.width.equalTo(80)
            make.height.equalTo(self.nameView.snp_height)
        }
        self.nameLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(self.nameTitle.snp_right)
            make.width.equalTo(0.5)
            make.bottom.equalTo(self.nameLine.superview!.snp_bottom)
        }
        self.nameTxt.snp_makeConstraints { (make) in
            make.top.equalTo(self.nameView.snp_top)
            make.left.equalTo(self.nameLine.snp_right).offset(10)
            make.right.equalTo(self.nameTxt.superview!.snp_right)
            make.height.equalTo(self.nameTxt.superview!.snp_height)
        }
        
        
        self.genderView.snp_makeConstraints { (make) in
            make.top.equalTo(self.nameView.snp_bottom).offset(10)
            make.left.equalTo(self.nameView.snp_left)
            make.size.equalTo(self.nameView.snp_size)
        }
        self.genderTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.size.equalTo(self.nameTitle.snp_size)
        }
        self.genderLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(self.nameLine.snp_left)
            make.size.equalTo(self.nameLine.snp_size)
        }
        self.genderBtn.snp_makeConstraints { (make) in
            make.top.equalTo(self.genderView.snp_top)
            make.left.equalTo(self.nameTxt.snp_left)
            make.size.equalTo(self.nameTxt.snp_size)
        }
        
        
        self.avatarView.snp_makeConstraints { (make) in
            make.top.equalTo(self.genderView.snp_bottom).offset(10)
            make.left.equalTo(self.genderView.snp_left)
            make.height.equalTo(50)
            make.width.equalTo(self.genderView.snp_width)
        }
        self.avatarTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(self.nameTitle.snp_width)
            make.height.equalTo(self.avatarView.snp_height)
        }
        self.avatarLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(self.nameLine.snp_left)
            make.width.equalTo(self.nameLine.snp_width)
            make.height.equalTo(self.avatarView.snp_height)
        }
        self.avatarIMG.snp_makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(self.nameTxt.snp_left)
            make.bottom.equalTo(self.avatarView.snp_bottom).offset(-5)
            make.width.equalTo(self.avatarIMG.snp_height)
        }
        self.avatarBtn.snp_makeConstraints { (make) in
            make.edges.equalTo(self.avatarIMG)
        }
        
        
        
        self.phoneView.snp_makeConstraints { (make) in
            make.top.equalTo(self.avatarView.snp_bottom).offset(10)
            make.left.equalTo(self.nameView.snp_left)
            make.size.equalTo(self.nameView.snp_size)
        }
        self.phoneTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.size.equalTo(self.nameTitle.snp_size)
        }
        self.phoneLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(self.nameLine.snp_left)
            make.size.equalTo(self.nameLine.snp_size)
        }
        self.phoneTxt.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(self.nameTxt.snp_left)
            make.size.equalTo(self.nameTxt.snp_size)
        }

        /*
        self.passwordView.snp_makeConstraints { (make) in
            make.top.equalTo(self.phoneView.snp_bottom).offset(10)
            make.left.equalTo(self.nameView.snp_left)
            make.size.equalTo(self.nameView.snp_size)
        }
        self.passwordTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.size.equalTo(self.nameTitle.snp_size)
        }
        self.passwordLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(self.nameLine.snp_left)
            make.size.equalTo(self.nameLine.snp_size)
        }
        self.passwordTxt.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(self.nameTxt.snp_left)
            make.size.equalTo(self.nameTxt.snp_size)
        }
        */
 
        self.avatarIMG.layer.cornerRadius = self.avatarIMG.width/2
        self.avatarIMG.layer.masksToBounds = true
        
    }
    
    
}

// MARK: - UITextFieldDelegate

extension UserInfoView : UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
//        if textField == self.nameTxt {
//            
//        } else if textField == self.phoneTxt {
//            
//        }
        textField.endEditing(true)
        return true
    }
    
}


