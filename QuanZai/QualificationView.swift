//
//  QualificationView.swift
//  QuanZai
//
//  Created by i-chou on 6/23/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import SnapKit

protocol QualificationViewProtocol: class {
    func plusTapped()
}

@IBDesignable

class QualificationView: UIView {
    
    var delegate : QualificationViewProtocol?
    
    @IBOutlet internal var remarksLabel: UILabel!
    @IBOutlet var plusBtn: UIButton!
    @IBOutlet internal var plusIcon: UIImageView!
    @IBOutlet internal var photoView: View!
    @IBOutlet var IDTxt: UITextField!
    @IBOutlet var IDLine: UIImageView!
    @IBOutlet var IDTItle: UILabel!
    @IBOutlet var IDView: View!
    @IBOutlet var nameTxt: UITextField!
    @IBOutlet var nameLine: UIImageView!
    @IBOutlet var nameTitle: UILabel!
    @IBOutlet var nameView: View!
    @IBOutlet var headerTitle: UILabel!
    @IBOutlet var headerView: UIView!
    
    override func awakeFromNib() {
        
        self.setDelegates()
        self.layout()
    }
    
    func setDelegates() {
        self.nameTxt.delegate = self
        self.IDTxt.delegate = self
    }
    
    @IBAction func plusTapped(sender: AnyObject) {
        self.delegate?.plusTapped()
    }
    
}

// MARK: - layout UI

extension QualificationView {
    
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
        
        self.IDView.snp_makeConstraints { (make) in
            make.top.equalTo(self.nameView.snp_bottom).offset(10)
            make.left.equalTo(self.nameView.snp_left)
            make.size.equalTo(self.nameView.snp_size)
        }
        
        self.IDTItle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.size.equalTo(self.nameTitle.snp_size)
            
        }
        
        self.IDLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(self.nameLine.snp_left)
            make.size.equalTo(self.nameLine.snp_size)
        }
        
        self.IDTxt.snp_makeConstraints { (make) in
            make.top.equalTo(self.IDView.snp_top)
            make.left.equalTo(self.nameTxt.snp_left)
            make.size.equalTo(self.nameTxt.snp_size)
        }
        
        self.photoView.snp_makeConstraints { (make) in
            make.top.equalTo(self.IDView.snp_bottom).offset(10)
            make.left.equalTo(self.IDView.snp_left)
            make.right.equalTo(self.IDView.snp_right)
            make.height.equalTo(150)
        }
        
        self.plusBtn.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.plusIcon.snp_makeConstraints { (make) in
            make.size.equalTo(ccs(30, 30))
            make.center.equalTo((self.plusIcon.superview?.snp_center)!)
        }
        
        self.remarksLabel.snp_makeConstraints { (make) in
            make.top.equalTo(self.photoView.snp_bottom).offset(10)
            make.left.equalTo(self.photoView.snp_left)
            make.right.equalTo(self.photoView.snp_right)
            make.height.equalTo(15)
        }
    }
}

// MARK: - UITextFieldDelegate

extension QualificationView: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.nameTxt {
            self.IDTxt.becomeFirstResponder()
        } else if textField == self.IDTxt {
            textField.endEditing(true)
        }
        return true
    }
}
