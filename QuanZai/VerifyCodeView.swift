//
//  VerifyCodeView.swift
//  QuanZai
//
//  Created by i-chou on 6/29/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import KeychainAccess
import SwiftyDrop

protocol  VerifyCodeViewProtocol : class {
//    func getCode()
    func rentTheCar(verifyCodeView : VerifyCodeView)
}

@IBDesignable class VerifyCodeView : UIView {
    
    var delegate : VerifyCodeViewProtocol?
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var codeTitle: UILabel!
    @IBOutlet weak var codeTxt: TextField!
    @IBOutlet weak var codeBtn: Button!
    @IBOutlet weak var okBtn: Button!
    
    var countDown = 90
    var timer : NSTimer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layout()
        self.codeBtn.addTarget(self, action: #selector(codeBtnTapped), forControlEvents: .TouchUpInside)
        self.okBtn.addTarget(self, action: #selector(okBtnTapped), forControlEvents: .TouchUpInside)
        self.codeTxt.delegate = self
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        self.resetCountDown()
    }
    
    func codeBtnTapped() {
        let keychain = Keychain(service: service)
        if keychain[k_Phone] == nil {
            return
        }
        
        let request = Router.GetValidateCode(phone: keychain[k_Phone]!)
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
        }
        self.startCountDown()
    }
    
    func okBtnTapped () {
        if self.codeTxt.text?.characters.count == 0 {
            Drop.down("请输入验证码")
            return
        }
        self.codeTxt.endEditing(true)
        self.delegate?.rentTheCar(self)
    }
    
    func startCountDown() {
        self.countDown = 90
        self.codeBtn.userInteractionEnabled = false
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.timer!, forMode: NSRunLoopCommonModes)
        NSRunLoop.currentRunLoop().run()
    }
    
    func timerAction() {
        while self.countDown > 0 {
            self.countDown -= 1
            self.codeBtn.setTitle(String(self.countDown)+"秒", forState: UIControlState.Normal)
            return
        }
        self.codeBtn.setTitle("获取验证码", forState: UIControlState.Normal)
        self.codeBtn.userInteractionEnabled = true
        self.timer?.invalidate()
    }
    
    func resetCountDown() {
        self.codeTxt.text = ""
        if self.timer != nil {
            self.timer?.invalidate()
            self.timer = nil
        }
        self.codeBtn.setTitle("获取验证码", forState: UIControlState.Normal)
        self.codeBtn.userInteractionEnabled = true
    }
    
    func layout() {
        
        titleLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(self.snp_right)
            make.height.equalTo(40)
        }
        codeTitle.snp_makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottom).offset(20)
            make.left.equalTo(10)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        codeBtn.snp_makeConstraints { (make) in
            make.top.equalTo(codeTitle.snp_top)
            make.right.equalTo(self.snp_right).offset(-10)
            make.width.equalTo(70)
            make.height.equalTo(codeTitle.snp_height)
        }
        codeTxt.snp_makeConstraints { (make) in
            make.top.equalTo(codeTitle.snp_top)
            make.left.equalTo(codeTitle.snp_right)
            make.right.equalTo(codeBtn.snp_left).offset(-10)
            make.height.equalTo(codeTitle.snp_height)
        }
        
        okBtn.snp_makeConstraints { (make) in
            make.top.equalTo(codeTitle.snp_bottom).offset(20)
            make.left.equalTo(10)
            make.right.equalTo(self.snp_right).offset(-10)
            make.height.equalTo(40)
        }
    }
}

// MARK: - UITextFieldDelegate

extension VerifyCodeView : UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.codeTxt.endEditing(true)
        return true
    }
    
}
