//
//  OrderDetailView.swift
//  QuanZai
//
//  Created by i-chou on 6/28/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import UIKit

class OrderDetailView: UIView {

    @IBOutlet weak var headerTitle: Label!
    
    @IBOutlet weak var numberView: View!
    
    @IBOutlet weak var numberTitle: UILabel!
    @IBOutlet weak var numberLine: UIImageView!
    @IBOutlet weak var numberLabel: Label!

    @IBOutlet weak var brandView: View!
    @IBOutlet weak var brandTitle: UILabel!
    @IBOutlet weak var brandLine: UIImageView!
    @IBOutlet weak var brandLabel: Label!
    
    @IBOutlet weak var rentTypeView: View!
    @IBOutlet weak var rentTypeTitle: UILabel!
    @IBOutlet weak var rentTypeLine: UIImageView!
    @IBOutlet weak var rentTypeLabel: Label!
    
    @IBOutlet weak var startTimeView: View!
    @IBOutlet weak var startTimeTitle: UILabel!
    @IBOutlet weak var startTimeLine: UIImageView!
    @IBOutlet weak var startTimeLabel: Label!
    
    @IBOutlet weak var endTimeView: View!
    @IBOutlet weak var endTimeTitle: UILabel!
    @IBOutlet weak var endTimeLine: UIImageView!
    @IBOutlet weak var endTimeLabel: Label!
    
//    @IBOutlet weak var sumTimeView: View!
//    @IBOutlet weak var sumTimeTitle: UILabel!
//    @IBOutlet weak var sumTimeLine: UIImageView!
//    @IBOutlet weak var sumTimeLabel: Label!
    
//    @IBOutlet weak var startMileageView: View!
//    @IBOutlet weak var startMileageTitle: UILabel!
//    @IBOutlet weak var startMileageLine: UIImageView!
//    @IBOutlet weak var startMileageLabel: Label!
//
//    @IBOutlet weak var endMileageView: View!
//    @IBOutlet weak var endMileageTitle: UILabel!
//    @IBOutlet weak var endMileageLine: UIImageView!
//    @IBOutlet weak var endMileageLabel: Label!

    @IBOutlet weak var sumMileageView: View!
    @IBOutlet weak var sumMileageTitle: UILabel!
    @IBOutlet weak var sumMileageLine: UIImageView!
    @IBOutlet weak var sumMileageLabel: Label!
    
    
    @IBOutlet weak var priceView: View!
    @IBOutlet weak var priceTitle: UILabel!
    @IBOutlet weak var priceLine: UIImageView!
    @IBOutlet weak var priceLabel: Label!
    
    @IBOutlet weak var addrView: View!
    @IBOutlet weak var addrTitle: UILabel!
    @IBOutlet weak var addrLine: UIImageView!
    @IBOutlet weak var addrLabel: Label!
    
    
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
        numberView.snp_makeConstraints { (make) in
            make.top.equalTo(headerTitle.snp_bottom).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(self.snp_right).offset(-20)
            make.height.equalTo(30)
        }
        numberTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(80)
            make.height.equalTo(numberView.snp_height)
        }
        numberLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberTitle.snp_right).offset(-0.5)
            make.width.equalTo(0.5)
            make.height.equalTo(numberView.snp_height)
        }
        numberLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberLine.snp_right)
            make.right.equalTo(numberView.snp_right)
            make.height.equalTo(numberView.snp_height)
        }
        
        
        brandView.snp_makeConstraints { (make) in
            make.top.equalTo(numberView.snp_bottom).offset(10)
            make.left.equalTo(numberView.snp_left)
            make.right.equalTo(numberView.snp_right)
            make.height.equalTo(numberView.snp_height)
        }
        brandTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberTitle.snp_left)
            make.width.equalTo(numberTitle.snp_width)
            make.height.equalTo(numberTitle.snp_height)
        }
        brandLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(brandTitle.snp_right).offset(-0.5)
            make.width.equalTo(numberLine.snp_width)
            make.height.equalTo(numberLine.snp_height)
        }
        brandLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(brandLine.snp_right)
            make.right.equalTo(numberLabel.snp_right)
            make.height.equalTo(numberLabel.snp_height)
        }
        
        
        rentTypeView.snp_makeConstraints { (make) in
            make.top.equalTo(brandView.snp_bottom).offset(10)
            make.left.equalTo(numberView.snp_left)
            make.right.equalTo(numberView.snp_right)
            make.height.equalTo(numberView.snp_height)
        }
        rentTypeTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberTitle.snp_left)
            make.width.equalTo(numberTitle.snp_width)
            make.height.equalTo(numberTitle.snp_height)
        }
        rentTypeLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(rentTypeTitle.snp_right).offset(-0.5)
            make.width.equalTo(numberLine.snp_width)
            make.height.equalTo(numberLine.snp_height)
        }
        rentTypeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(rentTypeLine.snp_right)
            make.right.equalTo(numberLabel.snp_right)
            make.height.equalTo(numberLabel.snp_height)
        }
        
        
        startTimeView.snp_makeConstraints { (make) in
            make.top.equalTo(rentTypeView.snp_bottom).offset(10)
            make.left.equalTo(numberView.snp_left)
            make.right.equalTo(numberView.snp_right)
            make.height.equalTo(numberView.snp_height)
        }
        startTimeTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberTitle.snp_left)
            make.width.equalTo(numberTitle.snp_width)
            make.height.equalTo(numberTitle.snp_height)
        }
        startTimeLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberLine.snp_left)
            make.width.equalTo(numberLine.snp_width)
            make.height.equalTo(numberLine.snp_height)
        }
        startTimeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberLabel.snp_left)
            make.right.equalTo(numberLabel.snp_right)
            make.height.equalTo(numberLabel.snp_height)
        }
        
        endTimeView.snp_makeConstraints { (make) in
            make.top.equalTo(startTimeView.snp_bottom).offset(10)
            make.left.equalTo(numberView.snp_left)
            make.right.equalTo(numberView.snp_right)
            make.height.equalTo(numberView.snp_height)
        }
        endTimeTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberTitle.snp_left)
            make.width.equalTo(numberTitle.snp_width)
            make.height.equalTo(numberTitle.snp_height)
        }
        endTimeLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberLine.snp_left)
            make.width.equalTo(numberLine.snp_width)
            make.height.equalTo(numberLine.snp_height)
        }
        endTimeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberLabel.snp_left)
            make.right.equalTo(numberLabel.snp_right)
            make.height.equalTo(numberLabel.snp_height)
        }
        
        
//        sumTimeView.snp_makeConstraints { (make) in
//            make.top.equalTo(endTimeView.snp_bottom).offset(10)
//            make.left.equalTo(numberView.snp_left)
//            make.right.equalTo(numberView.snp_right)
//            make.height.equalTo(numberView.snp_height)
//        }
//        sumTimeTitle.snp_makeConstraints { (make) in
//            make.top.equalTo(0)
//            make.left.equalTo(numberTitle.snp_left)
//            make.width.equalTo(numberTitle.snp_width)
//            make.height.equalTo(numberTitle.snp_height)
//        }
//        sumTimeLine.snp_makeConstraints { (make) in
//            make.top.equalTo(0)
//            make.left.equalTo(numberLine.snp_left)
//            make.width.equalTo(numberLine.snp_width)
//            make.height.equalTo(numberLine.snp_height)
//        }
//        sumTimeLabel.snp_makeConstraints { (make) in
//            make.top.equalTo(0)
//            make.left.equalTo(numberLabel.snp_left)
//            make.right.equalTo(numberLabel.snp_right)
//            make.height.equalTo(numberLabel.snp_height)
//        }
        
        
//        startMileageView.snp_makeConstraints { (make) in
//            make.top.equalTo(sumTimeView.snp_bottom).offset(10)
//            make.left.equalTo(numberView.snp_left)
//            make.right.equalTo(numberView.snp_right)
//            make.height.equalTo(numberView.snp_height)
//        }
//        startMileageTitle.snp_makeConstraints { (make) in
//            make.top.equalTo(0)
//            make.left.equalTo(numberTitle.snp_left)
//            make.width.equalTo(numberTitle.snp_width)
//            make.height.equalTo(numberTitle.snp_height)
//        }
//        startMileageLine.snp_makeConstraints { (make) in
//            make.top.equalTo(0)
//            make.left.equalTo(numberLine.snp_left)
//            make.width.equalTo(numberLine.snp_width)
//            make.height.equalTo(numberLine.snp_height)
//        }
//        startMileageLabel.snp_makeConstraints { (make) in
//            make.top.equalTo(0)
//            make.left.equalTo(numberLabel.snp_left)
//            make.right.equalTo(numberLabel.snp_right)
//            make.height.equalTo(numberLabel.snp_height)
//        }
//        
//        endMileageView.snp_makeConstraints { (make) in
//            make.top.equalTo(startMileageView.snp_bottom).offset(10)
//            make.left.equalTo(numberView.snp_left)
//            make.right.equalTo(numberView.snp_right)
//            make.height.equalTo(numberView.snp_height)
//        }
//        endMileageTitle.snp_makeConstraints { (make) in
//            make.top.equalTo(0)
//            make.left.equalTo(numberTitle.snp_left)
//            make.width.equalTo(numberTitle.snp_width)
//            make.height.equalTo(numberTitle.snp_height)
//        }
//        endMileageLine.snp_makeConstraints { (make) in
//            make.top.equalTo(0)
//            make.left.equalTo(numberLine.snp_left)
//            make.width.equalTo(numberLine.snp_width)
//            make.height.equalTo(numberLine.snp_height)
//        }
//        endMileageLabel.snp_makeConstraints { (make) in
//            make.top.equalTo(0)
//            make.left.equalTo(numberLabel.snp_left)
//            make.right.equalTo(numberLabel.snp_right)
//            make.height.equalTo(numberLabel.snp_height)
//        }
        
        
        sumMileageView.snp_makeConstraints { (make) in
            make.top.equalTo(endTimeView.snp_bottom).offset(10)
            make.left.equalTo(numberView.snp_left)
            make.right.equalTo(numberView.snp_right)
            make.height.equalTo(numberView.snp_height)
        }
        sumMileageTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberTitle.snp_left)
            make.width.equalTo(numberTitle.snp_width)
            make.height.equalTo(numberTitle.snp_height)
        }
        sumMileageLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberLine.snp_left)
            make.width.equalTo(numberLine.snp_width)
            make.height.equalTo(numberLine.snp_height)
        }
        sumMileageLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberLabel.snp_left)
            make.right.equalTo(numberLabel.snp_right)
            make.height.equalTo(numberLabel.snp_height)
        }
        
        
        priceView.snp_makeConstraints { (make) in
            make.top.equalTo(sumMileageView.snp_bottom).offset(10)
            make.left.equalTo(numberView.snp_left)
            make.right.equalTo(numberView.snp_right)
            make.height.equalTo(numberView.snp_height)
        }
        priceTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberTitle.snp_left)
            make.width.equalTo(numberTitle.snp_width)
            make.height.equalTo(numberTitle.snp_height)
        }
        priceLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberLine.snp_left)
            make.width.equalTo(numberLine.snp_width)
            make.height.equalTo(numberLine.snp_height)
        }
        priceLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberLabel.snp_left)
            make.right.equalTo(numberLabel.snp_right)
            make.height.equalTo(numberLabel.snp_height)
        }
        
        
        addrView.snp_makeConstraints { (make) in
            make.top.equalTo(priceView.snp_bottom).offset(10)
            make.left.equalTo(numberView.snp_left)
            make.right.equalTo(numberView.snp_right)
            make.height.equalTo(numberView.snp_height)
        }
        addrTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberTitle.snp_left)
            make.width.equalTo(numberTitle.snp_width)
            make.height.equalTo(numberTitle.snp_height)
        }
        addrLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberLine.snp_left)
            make.width.equalTo(numberLine.snp_width)
            make.height.equalTo(numberLine.snp_height)
        }
        addrLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(numberLabel.snp_left)
            make.right.equalTo(numberLabel.snp_right)
            make.height.equalTo(numberLabel.snp_height)
        }
        
    }
    
    
}
