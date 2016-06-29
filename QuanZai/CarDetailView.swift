//
//  CarDetailView.swift
//  QuanZai
//
//  Created by i-chou on 6/28/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

protocol CarDetailViewProtocol : class {
    func paymentBtnTapped()
}

@IBDesignable class CarDetailView: UIView {

    var delegate : CarDetailViewProtocol?
    
    
    //照片
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var carIMG: UIImageView!
    
    //车辆信息
    @IBOutlet weak var carInfoHeader: Label!
    
    //车名
    @IBOutlet weak var infoView1: View!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var nameLine: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    //发动机
    @IBOutlet weak var infoView2: View!
    @IBOutlet weak var engineTitle: UILabel!
    @IBOutlet weak var infoView2_Line1: UIImageView!
    @IBOutlet weak var engineLabel: UILabel!
    
    //音响
    @IBOutlet weak var infoView2_Line2: UIImageView!
    @IBOutlet weak var soundSysTitle: UILabel!
    @IBOutlet weak var infoView2_Line3: UIImageView!
    @IBOutlet weak var soundSysLabel: UILabel!
    
    //排量
    @IBOutlet weak var infoView3: View!
    @IBOutlet weak var displacementTitle: UILabel!
    @IBOutlet weak var infoView3_Line1: UIImageView!
    @IBOutlet weak var displacementLabel: UILabel!
    
    //雷达
    @IBOutlet weak var infoView3_Line2: UIImageView!
    @IBOutlet weak var radarTitle: UILabel!
    @IBOutlet weak var infoView3_Line3: UIImageView!
    @IBOutlet weak var radarLabel: UILabel!
    
    //续航
    @IBOutlet weak var infoView4: View!
    @IBOutlet weak var batteryTitle: UILabel!
    @IBOutlet weak var infoView4_Line1: UIImageView!
    @IBOutlet weak var batteryLabel: UILabel!
    
    //倒车影像
    @IBOutlet weak var infoView4_Line2: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var infoView4_Line3: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    //导航
    @IBOutlet weak var infoView5: View!
    @IBOutlet weak var naviTitle: UILabel!
    @IBOutlet weak var infoView5_Line1: UIImageView!
    @IBOutlet weak var naviLabel: UILabel!
    
    //天窗
    @IBOutlet weak var infoView5_Line2: UIImageView!
    @IBOutlet weak var roofTitle: UILabel!
    @IBOutlet weak var infoView5_Line3: UIImageView!
    @IBOutlet weak var roofLabel: UILabel!
    
    
    //费用信息
    @IBOutlet weak var paymentHeader: Label!
    
    //租用方式
    @IBOutlet weak var paymentView: View!
    @IBOutlet weak var paymentTitle: UILabel!
    @IBOutlet weak var paymentLine: UIImageView!
    @IBOutlet weak var paymentBtn: UIButton!
    
    //分时计费
    @IBOutlet weak var unitPayView: View!
    @IBOutlet weak var unitPayHeaderView: View!
    @IBOutlet weak var unitPayTimeTitle: UILabel!
    @IBOutlet weak var unitPayTimePriceTitle: UILabel!
    @IBOutlet weak var unitPayMileagePriceTItle: UILabel!
    
    //第一行分时计费
    @IBOutlet weak var unitPayRow1: UIView!
    @IBOutlet weak var unitPayRow1_TimeLabel: UILabel!
    @IBOutlet weak var unitPayRow1_TimePriceLabel: UILabel!
    @IBOutlet weak var unitPayRow1_MileagePriceLabel: UILabel!
    
    //第二行分时计费
    @IBOutlet weak var unitPayRow2: UIView!
    @IBOutlet weak var unitPayRow2_TimeLabel: UILabel!
    @IBOutlet weak var unitPayRow2_TimePriceLabel: UILabel!
    @IBOutlet weak var unitPayRow2_MileagePriceLabel: UILabel!
    
    
    //日租/半日租 价格
    @IBOutlet weak var priceView: View!
    @IBOutlet weak var priceTitle: UILabel!
    @IBOutlet weak var priceLine: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layout()
    }
    
    @IBAction func paymentBtnTapped(sender: AnyObject) {
       self.delegate?.paymentBtnTapped()
    }
    
    func layout() {
        
        photoView.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(photoView.superview!.snp_right)
            make.height.equalTo(180)
        }
        carIMG.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(carIMG.superview!.snp_right)
            make.height.equalTo(160)
        }
        carInfoHeader.snp_makeConstraints { (make) in
            make.top.equalTo(photoView.snp_bottom)
            make.left.equalTo(0)
            make.right.equalTo(carInfoHeader.superview!.snp_right)
            make.height.equalTo(40)
        }
        infoView1.snp_makeConstraints { (make) in
            make.top.equalTo(carInfoHeader.snp_bottom).offset(20)
            make.left.equalTo(carInfoHeader.snp_left).offset(20)
            make.right.equalTo(carInfoHeader.snp_right).offset(-20)
            make.height.equalTo(30)
        }
        nameTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(infoView1.snp_left)
            make.width.equalTo((k_SCREEN_W-30*2)/4)
            make.height.equalTo(infoView1.snp_height)
        }
        nameLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(nameTitle.snp_right)
            make.width.equalTo(0.5)
            make.bottom.equalTo(nameLine.superview!.snp_bottom)
        }
        nameLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(nameLine.snp_right)
            make.right.equalTo(nameLabel.superview!.snp_right)
            make.height.equalTo(nameLabel.superview!.snp_height)
        }
        
        infoView2.snp_makeConstraints { (make) in
            make.top.equalTo(infoView1.snp_bottom).offset(10)
            make.left.equalTo(infoView1.snp_left)
            make.right.equalTo(infoView1.snp_right)
            make.height.equalTo(infoView1.snp_height)
        }
        engineTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(infoView2.snp_height)
        }
        infoView2_Line1.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(engineTitle.snp_right).offset(-0.5)
            make.width.equalTo(0.5)
            make.height.equalTo(infoView2.snp_height)
        }
        engineLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(infoView2_Line1.snp_right)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(infoView2.snp_height)
        }
        infoView2_Line2.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(engineLabel.snp_right).offset(-0.5)
            make.width.equalTo(0.5)
            make.height.equalTo(infoView2.snp_height)
        }
        soundSysTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(infoView2_Line2.snp_right)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(infoView2.snp_height)
        }
        infoView2_Line3.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(soundSysTitle.snp_right).offset(-0.5)
            make.width.equalTo(0.5)
            make.height.equalTo(infoView2.snp_height)
        }
        soundSysLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(infoView2_Line3.snp_right)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(infoView2.snp_height)
        }
        
        
        
        infoView3.snp_makeConstraints { (make) in
            make.top.equalTo(infoView2.snp_bottom).offset(10)
            make.left.equalTo(infoView1.snp_left)
            make.right.equalTo(infoView1.snp_right)
            make.height.equalTo(infoView1.snp_height)
        }
        displacementTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(engineTitle.snp_height)
        }
        infoView3_Line1.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(displacementTitle.snp_right).offset(-0.5)
            make.width.equalTo(0.5)
            make.height.equalTo(infoView1.snp_height)
        }
        displacementLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(infoView3_Line1.snp_right)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(infoView1.snp_height)
        }
        infoView3_Line2.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(displacementLabel.snp_right).offset(-0.5)
            make.width.equalTo(0.5)
            make.height.equalTo(infoView1.snp_height)
        }
        radarTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(infoView3_Line2.snp_right)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(infoView1.snp_height)
        }
        infoView3_Line3.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(radarTitle.snp_right).offset(-0.5)
            make.width.equalTo(0.5)
            make.height.equalTo(infoView1.snp_height)
        }
        radarLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(infoView3_Line3.snp_right)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(infoView1.snp_height)
        }
        
        
        
        
        infoView4.snp_makeConstraints { (make) in
            make.top.equalTo(infoView3.snp_bottom).offset(10)
            make.left.equalTo(infoView1.snp_left)
            make.right.equalTo(infoView1.snp_right)
            make.height.equalTo(infoView1.snp_height)
        }
        batteryTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(engineTitle.snp_height)
        }
        infoView4_Line1.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(batteryTitle.snp_right).offset(-0.5)
            make.width.equalTo(0.5)
            make.height.equalTo(infoView1.snp_height)
        }
        batteryLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(infoView4_Line1.snp_right)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(infoView1.snp_height)
        }
        infoView4_Line2.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(batteryLabel.snp_right).offset(-0.5)
            make.width.equalTo(0.5)
            make.height.equalTo(infoView1.snp_height)
        }
        imageTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(infoView4_Line2.snp_right)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(infoView1.snp_height)
        }
        infoView4_Line3.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(imageTitle.snp_right).offset(-0.5)
            make.width.equalTo(0.5)
            make.height.equalTo(infoView1.snp_height)
        }
        imageLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(infoView4_Line3.snp_right)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(infoView1.snp_height)
        }
        
        
        infoView5.snp_makeConstraints { (make) in
            make.top.equalTo(infoView4.snp_bottom).offset(10)
            make.left.equalTo(infoView1.snp_left)
            make.right.equalTo(infoView1.snp_right)
            make.height.equalTo(infoView1.snp_height)
        }
        naviTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(engineTitle.snp_height)
        }
        infoView5_Line1.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(naviTitle.snp_right).offset(-0.5)
            make.width.equalTo(0.5)
            make.height.equalTo(infoView1.snp_height)
        }
        naviLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(infoView5_Line1.snp_right)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(infoView1.snp_height)
        }
        infoView5_Line2.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(naviLabel.snp_right).offset(-0.5)
            make.width.equalTo(0.5)
            make.height.equalTo(infoView1.snp_height)
        }
        roofTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(infoView5_Line2.snp_right)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(infoView1.snp_height)
        }
        infoView5_Line3.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(roofTitle.snp_right).offset(-0.5)
            make.width.equalTo(0.5)
            make.height.equalTo(infoView1.snp_height)
        }
        roofLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(infoView5_Line3.snp_right)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(infoView1.snp_height)
        }
        
        
        //费用
        paymentHeader.snp_makeConstraints { (make) in
            make.top.equalTo(infoView5.snp_bottom).offset(20)
            make.left.equalTo(0)
            make.right.equalTo(paymentHeader.superview!.snp_right)
            make.height.equalTo(carInfoHeader.snp_height)
        }
        paymentView.snp_makeConstraints { (make) in
            make.top.equalTo(paymentHeader.snp_bottom).offset(20)
            make.left.equalTo(infoView1.snp_left)
            make.right.equalTo(infoView1.snp_right)
            make.height.equalTo(infoView1.snp_height)
        }
        paymentTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(nameTitle.snp_left)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(nameTitle.snp_height)
        }
        paymentLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(nameLine.snp_left)
            make.width.equalTo(0.5)
            make.bottom.equalTo(paymentLine.superview!.snp_bottom)
        }
        paymentBtn.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(nameLabel.snp_left).offset(20)
            make.right.equalTo(nameLabel.snp_right)
            make.height.equalTo(nameLabel.snp_height)
        }
        
        //分时计费表格
        unitPayView.snp_makeConstraints { (make) in
            make.top.equalTo(paymentView.snp_bottom).offset(10)
            make.left.equalTo(paymentView.snp_left)
            make.right.equalTo(paymentView.snp_right)
            make.height.equalTo(75)
        }
        unitPayHeaderView.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(unitPayHeaderView.superview!.snp_right)
            make.height.equalTo(25)
        }
        unitPayTimeTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(unitPayTimeTitle.superview!.width/3)
            make.height.equalTo(unitPayTimeTitle.superview!.snp_height)
        }
        unitPayTimePriceTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(unitPayTimeTitle.snp_right)
            make.width.equalTo(unitPayTimePriceTitle.superview!.width/3)
            make.height.equalTo(unitPayTimePriceTitle.superview!.snp_height)
        }
        unitPayMileagePriceTItle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(unitPayTimePriceTitle.snp_right)
            make.width.equalTo(unitPayMileagePriceTItle.superview!.width/3)
            make.height.equalTo(unitPayMileagePriceTItle.superview!.snp_height)
        }
        
        //第一行分时计费
        unitPayRow1.snp_makeConstraints { (make) in
            make.top.equalTo(unitPayHeaderView.snp_bottom)
            make.left.equalTo(0)
            make.right.equalTo(unitPayHeaderView.snp_right)
            make.height.equalTo(unitPayHeaderView.snp_height)
        }
        unitPayRow1_TimeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(unitPayTimeTitle.snp_width)
            make.height.equalTo(unitPayTimeTitle.snp_height)
        }
        unitPayRow1_TimePriceLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(unitPayTimeTitle.snp_right)
            make.width.equalTo(unitPayTimePriceTitle.snp_width)
            make.height.equalTo(unitPayTimePriceTitle.snp_height)
        }
        unitPayRow1_MileagePriceLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(unitPayTimePriceTitle.snp_right)
            make.width.equalTo(unitPayMileagePriceTItle.snp_width)
            make.height.equalTo(unitPayMileagePriceTItle.snp_height)
        }
        
        //第二行分时计费
        unitPayRow2.snp_makeConstraints { (make) in
            make.top.equalTo(unitPayRow1.snp_bottom)
            make.left.equalTo(0)
            make.right.equalTo(unitPayHeaderView.snp_right)
            make.height.equalTo(unitPayHeaderView.snp_height)
        }
        unitPayRow2_TimeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(unitPayTimeTitle.snp_width)
            make.height.equalTo(unitPayTimeTitle.snp_height)
        }
        unitPayRow2_TimePriceLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(unitPayTimeTitle.snp_right)
            make.width.equalTo(unitPayTimePriceTitle.snp_width)
            make.height.equalTo(unitPayTimePriceTitle.snp_height)
        }
        unitPayRow2_MileagePriceLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(unitPayTimePriceTitle.snp_right)
            make.width.equalTo(unitPayMileagePriceTItle.snp_width)
            make.height.equalTo(unitPayMileagePriceTItle.snp_height)
        }
        
        //日租/半日租 价格
        priceView.snp_makeConstraints { (make) in
            make.top.equalTo(paymentView.snp_bottom).offset(10)
            make.left.equalTo(infoView1.snp_left)
            make.right.equalTo(infoView1.snp_right)
            make.height.equalTo(infoView1.snp_height)
        }
        priceTitle.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(nameTitle.snp_left)
            make.width.equalTo(nameTitle.snp_width)
            make.height.equalTo(nameTitle.snp_height)
        }
        priceLine.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(nameLine.snp_left)
            make.width.equalTo(0.5)
            make.bottom.equalTo(priceLine.superview!.snp_bottom)
        }
        priceLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(nameLabel.snp_left)
            make.right.equalTo(nameLabel.snp_right)
            make.height.equalTo(nameLabel.snp_height)
        }
    }
}
