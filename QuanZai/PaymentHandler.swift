//
//  PaymentHandler.swift
//  QuanZai
//
//  Created by i-chou on 7/13/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import SwiftyJSON
import SwiftyDrop
import Alamofire

class PaymentHandler: NSObject {
    
    private static let paymentHandler: PaymentHandler = {
        return PaymentHandler()
    }()
    
    class func sharedPaymentHandler() -> PaymentHandler {
        return paymentHandler
    }
    
}

// MARK: - WXApiDelegate

extension PaymentHandler: WXApiDelegate {
    
    func onReq(req: BaseReq!) {
        print("微信支付请求：type=\(req.type),openID=\(req.openID)")
    }
    
    func onResp(resp: BaseResp!) {
        
        print("error code=\(resp.errCode) \n error message=\(resp.errStr) \n type=\(resp.type)")
        
        if !resp.isKindOfClass(PayResp) {
            return
        }
        
        switch resp.errCode {
        case WXSuccess.rawValue:
            Drop.down("支付成功", state: .Success)
        default:
            Drop.down("支付失败", state: .Error)
        }
        
    }
}

