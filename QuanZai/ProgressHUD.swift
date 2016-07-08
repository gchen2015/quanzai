//
//  ProgressHUD.swift
//  QuanZai
//
//  Created by i-chou on 7/8/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import GradientCircularProgress

class ProgressHUD : GradientCircularProgress {
    
    func showInWindow(message: String) {
        
        return self.show(message: message, style: MyStyle())
    }
    
    func showInView(view: UIView, message: String) -> UIView? {
        
        let frame = ccr(50, 200, k_SCREEN_W-100, k_SCREEN_W-100)
        return self.show(frame: frame, message: message, style: MyStyle())
    }
    
}

struct MyStyle : StyleProperty {
    
    var progressSize: CGFloat = 200
    
    // Gradient Circular
    var arcLineWidth: CGFloat = 8.0
    var startArcColor: UIColor = UIColor.clearColor()
    var endArcColor: UIColor = UIColorFromRGB(0x0aa29c)
    
    // Base Circular
    var baseLineWidth: CGFloat? = 10.0
    var baseArcColor: UIColor? = UIColor.darkGrayColor()
    
    // Ratio
    var ratioLabelFont: UIFont? = UIFont(name: "Verdana-Bold", size: 14.0)
    var ratioLabelFontColor: UIColor? = UIColor.whiteColor()
    
    // Message
    var messageLabelFont: UIFont? = HS_FONT(14.0)
    var messageLabelFontColor: UIColor? = UIColor.whiteColor()
    
    // Background
    var backgroundStyle: BackgroundStyles = .Dark
    
}
