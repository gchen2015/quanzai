//
//  CarDetailVC.swift
//  QuanZai
//
//  Created by i-chou on 6/28/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import Alamofire
import SwiftyJSON
import ObjectMapper
import SwiftyDrop

class CarDetailVC: BaseVC {
    
    var infoView : CarDetailView!
    var car_id : String!
    var dateTypes : NSMutableArray = []
    var okBtn : UIButton!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("车辆详情")
        self.setupUI()
        self.getCarInfo(self.car_id)
        self.getRentTypes(self.car_id)
    }
    
    func setupUI() {
        
        self.scrollView = UIScrollView(frame: ccr(0, 0, k_SCREEN_W, k_SCREEN_H-k_NAV_BAR_H))
        self.view.addSubview(self.scrollView)
        
        self.infoView = NSBundle.mainBundle().loadNibNamed("CarDetailView", owner: nil, options: nil).first as! CarDetailView
        self.infoView.delegate = self
        self.infoView.frame = ccr(10, 20, k_SCREEN_W-20, 600)
        self.scrollView.addSubview(infoView)
        
        self.okBtn = UIButton(imageName: "btn-blue",
                         hlImageName: "",
                         title: "租用",
                         titleColor: UIColorFromRGB(0x0aa29c),
                         font: HS_FONT(15)) { (nextBtn) in
                            self.okTapped()
        }
        self.okBtn.frame = ccr(30, CGRectGetMaxY(self.infoView.frame)+20, k_SCREEN_W-30*2, 40)
        self.scrollView.addSubview(self.okBtn)
        
        self.showUnitPayView(false)
    }
    
    func showUnitPayView(isShow: Bool) {
        
        UIView.animateWithDuration(0.3) {
            
            if isShow {
                self.infoView.unitPayView.alpha = 1
                self.infoView.priceView.alpha = 0
                self.infoView.height = 640
            } else {
                self.infoView.unitPayView.alpha = 0
                self.infoView.priceView.alpha = 1
                self.infoView.height = 600
            }
            self.okBtn.y = CGRectGetMaxY(self.infoView.frame)+20
            self.scrollView.contentSize.height = CGRectGetMaxY(self.okBtn.frame)+20
        }
    }
    
}

extension CarDetailVC {
    
    func okTapped() {
        let alertView = NSBundle.mainBundle().loadNibNamed("VerifyCodeView", owner: nil, options: nil).first as! VerifyCodeView
        alertView.size = ccs(k_SCREEN_W-40, 160)
        self.showAlert(alertView)
    }
}

// MARK: - API

extension CarDetailVC {
    
    //获取车辆信息
    func getCarInfo(car_id : String) {
        
        let request = Router.GetCarInfo(car_id: car_id)
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            if let carInfo = Mapper<CarModel>().map(objc) {
                print(carInfo.car_category_name)
                self.infoView.carIMG.af_setImageWithURL(URL(carInfo.picture!))
                self.infoView.nameLabel.text = carInfo.name! + "（" + carInfo.car_licence_plates! + "）"
                self.infoView.engineLabel.text = carInfo.gearbox_type_display
                self.infoView.soundSysLabel.text = carInfo.has_sound_sys_display
                self.infoView.displacementLabel.text = carInfo.engine_displacement
                self.infoView.radarLabel.text = carInfo.has_reversing_adar_display
                self.infoView.batteryLabel.text = carInfo.battery_life
                self.infoView.imageLabel.text = carInfo.has_reversing_image_display
                self.infoView.naviLabel.text = carInfo.has_satnav_display
                self.infoView.roofLabel.text = carInfo.has_sunroof_display
            }
        }
    }
    //获取租车类型
    func getRentTypes(car_id : String) {
            
        let request = Router.GetDateType(car_id: car_id)
        APIClient.sharedAPIClient().sendRequest(request) { (objc, error, badNetWork) in
            if let dateTypes = Mapper<DateTypeModel>().mapArray(objc) {
                self.dateTypes.removeAllObjects()
                for dateType in dateTypes {
                    self.dateTypes.addObject(dateType)
                    if dateType.date_type_name == "分钟" {
                        
                        self.infoView.unitPayRow1_TimeLabel.text = "<=" + dateType.time_point! + "小时"
                        self.infoView.unitPayRow2_TimeLabel.text = ">" + dateType.time_point! + "小时"
                        
                        if let inTimePrice = dateType.base_price_list?.filter({ (priceModel) -> Bool in
                            (priceModel as PriceModel).is_out_time! == "0"
                        }).first {
                            self.infoView.unitPayRow1_TimePriceLabel.text = inTimePrice.time_unit_price! + "/分钟"
                            self.infoView.unitPayRow1_MileagePriceLabel.text = inTimePrice.mileage_unit_price! + "/公里"
                        }
                        
                        if  let outTimePrice = dateType.base_price_list?.filter({ (priceModel) -> Bool in
                            (priceModel as PriceModel).is_out_time! == "1"
                        }).first {
                            self.infoView.unitPayRow2_TimePriceLabel.text = outTimePrice.time_unit_price! + "/分钟"
                            self.infoView.unitPayRow2_MileagePriceLabel.text = outTimePrice.mileage_unit_price! + "/公里"
                        }
                        
                    } else {
                        if let priceInfo = dateType.base_price_list?.first {
                            self.infoView.priceLabel.text = priceInfo.time_unit_price! + "元"
                        }
                    }
                }
            }
        }
    }
    
}

// MARK: - CarDetailViewProtocol

extension CarDetailVC : CarDetailViewProtocol {
    
    func paymentBtnTapped() {
        if self.dateTypes.count > 0 {
            self.alertDateTypes(self.dateTypes)
        } else {
            Drop.down("无可选类型，请稍后再试")
        }
        
    }
    
    func alertDateTypes(array : NSArray) {
        let alertControler = UIAlertController(title: "选择租用方式", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let types = array as! [DateTypeModel]
        
        for item in types {
            let action = UIAlertAction(title: item.date_type_name, style: UIAlertActionStyle.Default) { (maleAction) in
                self.infoView.paymentBtn.setTitle(item.date_type_name, forState: .Normal)
                self.infoView.paymentBtn.setTitleColor(UIColor.lightGrayColor() , forState: .Normal)
                if item.date_type_name == "分钟" {
                    self.showUnitPayView(true)
                } else {
                    self.showUnitPayView(false)
                }
            }
            alertControler.addAction(action)
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel) { (cancelAction) in
            //do nothing
        }
        alertControler.addAction(cancelAction)
        self.presentViewController(alertControler, animated: true, completion: nil)
    }
}

// MARK: - VerifyCodeViewProtocol

extension CarDetailVC : VerifyCodeViewProtocol {
        
    func rentTheCar() {
        //TODO: 确认租车
    }
}
