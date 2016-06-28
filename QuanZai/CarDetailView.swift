//
//  CarDetailView.swift
//  QuanZai
//
//  Created by i-chou on 6/28/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

@IBDesignable class CarDetailView: UIView {

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
        self.setDelegates()
        self.layout()
    }
    
    func setDelegates() {

    }
    
    func layout() {
        
    }
}
