//
//  UIColor.swift
//  Alcedo
//
//  Created by fuzhaorui on 2018/5/31.
//  Copyright © 2018年 yicheng. All rights reserved.
//

import UIKit

extension  UIColor {
    
    /**
     MARK:   - 将color转化为纯色image
     @param  rect:设置图片的CGRect
     @return 纯色UIImage
     */
    func imageFromColor(rect: CGRect) -> UIImage {
        
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(self.cgColor)
        context.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetCurrentContext()
        return image!
    }

}
