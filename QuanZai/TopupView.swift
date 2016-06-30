//
//  TopupView.swift
//  QuanZai
//
//  Created by i-chou on 6/30/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

protocol TopupViewProtocol {
    func openAlipay()
    func openWechatPay()
}

//import DLRadioButton

@IBDesignable class TopupView: UIView {
    
    @IBOutlet weak var headerTitle: Label!
    @IBOutlet weak var otherMoneyTitle: UILabel!
    @IBOutlet weak var otherMoneyTxt: UITextField!
    @IBOutlet weak var remarkLabel: UILabel!
    @IBOutlet weak var alipayBtn: Button!
    @IBOutlet weak var wechatPayBtn: Button!

    var delegate : TopupViewProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layout()
    }
    
    func layout() {
        
        headerTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(self.snp_right)
            make.height.equalTo(40)
        }
        
        let frame = CGRectMake(20, CGRectGetMaxY(headerTitle.frame)+20, 100, 40)
        let firstRadioButton = createRadioButton(frame, title: "100元")
        firstRadioButton.selected = true
        firstRadioButton.iconSquare = true
        
        var otherbuttons : [DLRadioButton] = []
        let titles = ["200元", "500元", "1000元"]
        
        var i = 0
        var bottom : CGFloat = 0
        
        for title in titles {
            let frame = CGRectMake(20, CGRectGetMaxY(firstRadioButton.frame) + 40 * CGFloat(i), 100, 40)
            let radioButton = createRadioButton(frame, title: title)
            radioButton.iconSquare = true
            otherbuttons.append(radioButton)
            i += 1
            bottom = CGRectGetMaxY(radioButton.frame)
        }
        firstRadioButton.otherButtons = otherbuttons
        
        otherMoneyTitle.snp_makeConstraints { (make) in
            make.top.equalTo(bottom+20)
            make.left.equalTo(20)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        otherMoneyTxt.snp_makeConstraints { (make) in
            make.top.equalTo(otherMoneyTitle.snp_bottom).offset(10)
            make.left.equalTo(20)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        remarkLabel.snp_makeConstraints { (make) in
            make.top.equalTo(otherMoneyTxt.snp_top)
            make.left.equalTo(otherMoneyTxt.snp_right).offset(10)
            make.right.equalTo(self.snp_right)
            make.height.equalTo(otherMoneyTxt.snp_height)
        }
        alipayBtn.snp_makeConstraints { (make) in
            make.top.equalTo(otherMoneyTxt.snp_bottom).offset(20)
            make.left.equalTo(20)
            make.width.equalTo((self.width-45)/2)
            make.height.equalTo(30)
            
        }
        
        wechatPayBtn.snp_makeConstraints { (make) in
            make.top.equalTo(alipayBtn.snp_top)
            make.width.equalTo(alipayBtn.snp_width)
            make.right.equalTo(self.snp_right).offset(-20)
            make.height.equalTo(30)
            
        }
        
    }
    
    
    @IBAction func openAlipay(sender: AnyObject) {
        self.delegate?.openAlipay()
    }
    
    @IBAction func openWechatPay(sender: AnyObject) {
        self.delegate?.openWechatPay()
    }
    
    private func createRadioButton(frame : CGRect, title : String) -> DLRadioButton {
        let radioButton = DLRadioButton(frame: frame)
        radioButton.titleLabel!.font = HS_FONT(14)
        radioButton.setTitle(title, forState: UIControlState.Normal)
        radioButton.setTitleColor(UIColorFromRGB(0x727272), forState: UIControlState.Normal)
        radioButton.iconColor = UIColorFromRGB(0x00928b)
        radioButton.indicatorColor = UIColorFromRGB(0x00928b)
        radioButton.marginWidth = 10
        radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left;
        radioButton.addTarget(self, action: #selector(logSelectedButton), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(radioButton);
        
        return radioButton;
    }
    
    @objc @IBAction private func logSelectedButton(radioButton : DLRadioButton) {
        if (radioButton.multipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected.\n", button.titleLabel!.text!));
            }
        } else {
            print(String(format: "%@ is selected.\n", radioButton.selectedButton()!.titleLabel!.text!));
        }
    }
}
