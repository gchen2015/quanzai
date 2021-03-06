//
//  ActionBar.swift
//  QuanZai
//
//  Created by i-chou on 6/20/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

enum ActionType: Int {
    case Open = 0,    //开门
         Lock,        //锁门
         ReturnCar,   //还车
         Pay          //结算
}

protocol actionProtocol : class{
    func itemTapped(type: ActionType)
}

class ActionBar: UIView {
    
    var delegate : actionProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColorFromRGB(0xeeeff0)
        
        let img_size = CGSize(width: 20, height: 20)
        let title_size = CGSize(width: 50, height: 20)
        var frame = ccr(0, 0, self.width/4, self.height)
        
        
        let unlockBtn = UIButton(imageName: "", hlImageName: "", onTapBlock: { (unlockBtn) in
            self.delegate.itemTapped(ActionType.Open)
        })
        unlockBtn.frame = frame
        
        let unlockIMG = UIImageView(image: IMG("tab-unlock"))
        unlockIMG.size = img_size
        unlockIMG.centerX = unlockBtn.centerX
        unlockIMG.y = 15
        
        let unlockTitle = UILabel()
        unlockTitle.font = HS_FONT(13)
        unlockTitle.textColor = UIColorFromRGB(0x727272)
        unlockTitle.text = "开门"
        unlockTitle.textAlignment = NSTextAlignment.Center
        unlockTitle.size = title_size
        unlockTitle.centerX = unlockBtn.centerX
        unlockTitle.y = CGRectGetMaxY(unlockIMG.frame)+10
        
        self.addSubview(unlockIMG)
        self.addSubview(unlockTitle)
        self.addSubview(unlockBtn)
        
        
        frame = ccr(CGRectGetMaxX(unlockBtn.frame), 0, self.width/4, self.height)
        
        let lockBtn = UIButton(imageName: "", hlImageName: "", onTapBlock: { (lockBtn) in
            self.delegate.itemTapped(ActionType.Lock)
        })
        lockBtn.frame = frame
        
        let lockIMG = UIImageView(image: IMG("tab-lock"))
        lockIMG.size = img_size
        lockIMG.centerX = lockBtn.centerX
        lockIMG.y = unlockIMG.y
        
        let lockTitle = UILabel()
        lockTitle.font = HS_FONT(13)
        lockTitle.textColor = unlockTitle.textColor
        lockTitle.text = "锁门"
        lockTitle.textAlignment = NSTextAlignment.Center
        lockTitle.size = title_size
        lockTitle.centerX = lockBtn.centerX
        lockTitle.y = unlockTitle.y
        
        self.addSubview(lockIMG)
        self.addSubview(lockTitle)
        self.addSubview(lockBtn)
        
        
        frame = ccr(CGRectGetMaxX(lockBtn.frame), 0, self.width/4, self.height)
        
        let returnBtn = UIButton(imageName: "", hlImageName: "", onTapBlock: { (returnBtn) in
            self.delegate.itemTapped(ActionType.ReturnCar)
        })
        returnBtn.frame = frame
        
        let returnIMG = UIImageView(image: IMG("tab-star"))
        returnIMG.size = img_size
        returnIMG.centerX = returnBtn.centerX
        returnIMG.y = unlockIMG.y
        
        let returnTitle = UILabel()
        returnTitle.font = HS_FONT(13)
        returnTitle.textColor = unlockTitle.textColor
        returnTitle.text = "还车"
        returnTitle.textAlignment = NSTextAlignment.Center
        returnTitle.size = title_size
        returnTitle.centerX = returnBtn.centerX
        returnTitle.y = unlockTitle.y
        
        self.addSubview(returnIMG)
        self.addSubview(returnTitle)
        self.addSubview(returnBtn)
        
        
        frame = ccr(CGRectGetMaxX(returnBtn.frame), 0, self.width/4, self.height)
        
        let chargeBtn = UIButton(imageName: "", hlImageName: "", onTapBlock: { (returnBtn) in
            self.delegate.itemTapped(ActionType.Pay)
        })
        chargeBtn.frame = frame
        
        let chargeIMG = UIImageView(image: IMG("tab-charge"))
        chargeIMG.size = img_size
        chargeIMG.centerX = chargeBtn.centerX
        chargeIMG.y = unlockIMG.y
        
        let chargeTitle = UILabel()
        chargeTitle.font = HS_FONT(13)
        chargeTitle.textColor = unlockTitle.textColor
        chargeTitle.text = "结算"
        chargeTitle.textAlignment = NSTextAlignment.Center
        chargeTitle.size = title_size
        chargeTitle.centerX = chargeBtn.centerX
        chargeTitle.y = unlockTitle.y
        
        self.addSubview(chargeIMG)
        self.addSubview(chargeTitle)
        self.addSubview(chargeBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
