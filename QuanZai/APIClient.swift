
//  APIClient.swift
//  QuanZai
//
//  Created by i-chou on 6/17/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import Alamofire
import SwiftyJSON
import SwiftyDrop

typealias Finished = ((objc: AnyObject?, error: NSError?, badNetWork: Bool) -> ())?
typealias ProgressHandler = ((bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) -> Void)?

enum JSONDataType {
    case List, Detail
}

class APIClient : Alamofire.Manager {
    
    private static let tool: APIClient = {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = Manager.defaultHTTPHeaders
        return APIClient(configuration: configuration)
    }()
    
    class func sharedAPIClient() -> APIClient {
        return tool
    }
}

// MARK: - 上传API封装

extension APIClient {

    func uploadRequest(URLString: URLRequestConvertible, data: NSData, progressHandler: ProgressHandler, finished: Finished) {
        
        print("URLRequest:\(URLString.URLRequest)")
        
        upload(URLString, multipartFormData: { multipartFormData in
            
            let name = "picture"
            let fileName = "picture.jpg"
            let mimeType = "MultipartFile"
            multipartFormData.appendBodyPart(data: data,
                                             name: name,
                                         fileName: fileName,
                                         mimeType: mimeType)
            }, encodingCompletion: { encodingResult in
                
                switch encodingResult {
                case .Success(let upload, _, _):
                    upload.responseJSON { response in
                        self.requestResult(response, finished: finished)
                    }
                    upload.progress(progressHandler)
                case .Failure(let encodingError):
                    print(encodingError)
                    finished!(objc: nil, error: nil, badNetWork: true)
                }
        })
    }

}

// MARK: - 普通API封装

extension APIClient {
    
    func sendRequest(URLString: URLRequestConvertible, finished: Finished) {
        
        print("URLRequest:\(URLString.URLRequest)")
        
        request(URLString).responseJSON { response in
            self.requestResult(response, finished: finished)
        }
    }
    
    func wxPayRequest(URLString: URLRequestConvertible, finished: Finished) {
        
        print("wxPayRequest : \(URLString.URLRequest)")
        
        request(URLString).responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    if let retcode = json["retcode"].string {
                        if Int(retcode) == 0 {
                            let req = PayReq()
                            req.partnerId = json["partnerid"].string
                            req.prepayId  = json["prepayid"].string
                            req.nonceStr  = json["noncestr"].string
                            req.timeStamp = json["timestamp"].uInt32!
                            req.package   = json["package"].string
                            req.sign      = json["sign"].string
                            WXApi.sendReq(req)
                            finished!(objc: req, error: nil, badNetWork: false)
                        } else {
                            finished!(objc:nil, error: NSError(domain: "WxPayError", code: 400, userInfo: ["retmsg": json["retmsg"].string!]), badNetWork: false)
                        }
                    } else {
                        finished!(objc: nil, error: NSError(domain: "WxPayError", code: 400, userInfo: ["retmsg": "服务器返回错误，请重试！"]), badNetWork: false)
                    }
                } else {
                    finished!(objc:nil, error: NSError(domain: "WxPayError", code: 500, userInfo: ["retmsg": "服务器返回错误，请重试！"]), badNetWork: false)
                }
                
            case .Failure(let error):
                print(error)
                finished!(objc:nil, error: error, badNetWork: true)
            }
        }
    }
    
    func aliPayRequest(URLString: URLRequestConvertible, finished: Finished) {
        
        print("URLRequest : \(URLString.URLRequest)")
        print("URLRequest httpBody : \(URLString.URLRequest.HTTPBody)")
        
        request(URLString).responseJSON { response in
            switch response.result {
            case .Success:
                let orderStr = String(data: response.data!, encoding: NSUTF8StringEncoding)
                if "0" == orderStr || "500" == orderStr {
                    finished!(objc:nil, error: NSError(domain: "AliPayError", code: Int(orderStr!)!, userInfo: ["retmsg": "打开支付宝失败"]), badNetWork: true)
                } else {
                    finished!(objc: orderStr, error: nil, badNetWork: false)
                }
            case .Failure(let error):
                print(error)
                finished!(objc: nil, error: error, badNetWork: true)
            }
        }
    }
}

// MARK: - 返回结果处理

extension APIClient {
    
    private func requestResult(response: Response<AnyObject, NSError>, finished: Finished) {
        
        print(response.debugDescription)
        switch response.result {
        case .Success:
            if let value = response.result.value {
                let json = JSON(value)
                if let status = json["state"]["code"].string {
                    if status == "200" {
                        finished!(objc: json["data"].rawValue, error: nil, badNetWork: false)
                    } else {
                        let msg = json["state"]["msg"].string
                        finished!(objc: nil, error:response.result.error, badNetWork: false)
                        Drop.down(msg!, state: DropState.Error)
                    }
                }
            }
            
        case .Failure(let error):
            print(error)
            finished!(objc: nil, error: error, badNetWork: true)
            Drop.down("网络出错，请重试", state: DropState.Error)
        }
    }
    
}