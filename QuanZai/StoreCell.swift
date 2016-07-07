//
//  StoreCell.swift
//  QuanZai
//
//  Created by i-chou on 7/7/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class StoreCell : UITableViewCell {
    
    var storeNameLabel : UILabel!
    var distanceLabel : UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        self.storeNameLabel = UILabel()
        self.storeNameLabel.textColor = UIColorFromRGB(0x727272)
        self.storeNameLabel.font = HS_FONT(15)
        self.storeNameLabel.frame = ccr(20, (self.height-18)/2, 90, 18)
        
        self.distanceLabel = UILabel()
        self.distanceLabel.textColor = UIColorFromRGB(0x0ba29b)
        self.distanceLabel.font = HS_FONT(10)
        self.distanceLabel.frame = ccr(CGRectGetMaxX(self.storeNameLabel.frame), self.storeNameLabel.y+5, 100, 12)
        
        self.contentView.addSubview(self.storeNameLabel)
        self.contentView.addSubview(self.distanceLabel)
    }
}

