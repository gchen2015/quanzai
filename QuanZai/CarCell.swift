//
//  CarCell.swift
//  QuanZai
//
//  Created by i-chou on 6/21/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class CarCell : UITableViewCell {
    
    var carNameLabel : UILabel!
    var carNumLabel : UILabel!
    var distanceLabel : UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        self.carNameLabel = UILabel()
        self.carNameLabel.textColor = UIColorFromRGB(0x727272)
        self.carNameLabel.font = HS_FONT(14)
        self.carNameLabel.frame = ccr(20, (self.height-18)/2, 60, 18)
        
        self.carNumLabel = UILabel()
        self.carNumLabel.textColor = UIColorFromRGB(0x727272)
        self.carNumLabel.font = HS_FONT(14)
        self.carNumLabel.frame = ccr(CGRectGetMaxX(self.carNameLabel.frame), (self.height-18)/2, self.width/3, 18)
        
        self.distanceLabel = UILabel()
        self.distanceLabel.textColor = UIColorFromRGB(0x0ba29b)
        self.distanceLabel.font = HS_FONT(10)
        self.distanceLabel.frame = ccr(CGRectGetMaxX(self.carNumLabel.frame), self.carNumLabel.y+5, self.width/3, 12)
        
        self.contentView.addSubview(self.carNameLabel)
        self.contentView.addSubview(self.carNumLabel)
        self.contentView.addSubview(self.distanceLabel)
    }
}
