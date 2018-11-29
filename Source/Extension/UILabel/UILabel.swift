//
//  UILabel.swift
//  senderSwift
//
//  Created by fuzhaurui on 2016/11/17.
//  Copyright © 2016年 fuzhaurui. All rights reserved.
//

import UIKit
import Foundation

extension UILabel
{
    
    /*
     将label赋值自定义字符串
     @param label                赋值自定义字符串的Label
     @param stringArray          返回要展示的字符串数组
     @param colorArray           返回字符串颜色数组
     @param fontFloatArray       返回字符串字体大小数组
     */
    func customShow(stringArray:NSArray,colorArray:NSArray,fontFloatArray:NSArray) {
        
        var string:String = "";
        for i in 0..<stringArray.count {

            string = "\(string)\(stringArray[i])"
    
        }
        
        var length:Int = 0;
        let mutableAttributedString:NSMutableAttributedString = NSMutableAttributedString.init(string: string)
        
        
        for i in 0..<stringArray.count {
            let str:String = stringArray[i] as! String
            

            mutableAttributedString.addAttributes(
                [
//                    给字加边框
//                    NSAttributedString.Key.strokeColor: UIColor.red,
//                    NSAttributedString.Key.strokeWidth : -2.0,
                    NSAttributedString.Key.foregroundColor : colorArray[i],
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: CGFloat(fontFloatArray[i] as! Double))
                ],
                range: NSMakeRange(length, str.count))
            
            length = length+str.count;
        }
        self.attributedText = mutableAttributedString;
        
    }
    
    /*
     将label赋值自定义字符串
     @param label                赋值自定义字符串的Label
     @param stringArray          返回要展示的字符串数组
     @param colorArray           返回字符串颜色数组
     @param fontArray            返回字符串字体数组
     */
    func customShow(stringArray:NSArray,colorArray:NSArray,fontArray:NSArray) {
        
        var string:String = "";
        for i in 0..<stringArray.count {
            
            string = "\(string)\(stringArray[i])"
            
        }
        
        var length:Int = 0;
        let mutableAttributedString:NSMutableAttributedString = NSMutableAttributedString.init(string: string)
        
        for i in 0..<stringArray.count {
            let str:String = stringArray[i] as! String
//
//            mutableAttributedString .addAttribute(kCTForegroundColorAttributeName as NSAttributedString.Key, value: colorArray[i], range:NSMakeRange(length, str.count))
//
//            mutableAttributedString .addAttribute(kCTFontAttributeName as NSAttributedString.Key, value: fontArray[i] as! UIFont, range:NSMakeRange(length, str.count))
            
            mutableAttributedString.addAttributes(
                [
                    //                    给字加边框
                    //                    NSAttributedString.Key.strokeColor: UIColor.red,
                    //                    NSAttributedString.Key.strokeWidth : -2.0,
                    NSAttributedString.Key.foregroundColor : colorArray[i],
                    NSAttributedString.Key.font : fontArray[i]
                ],
                range: NSMakeRange(length, str.count))
            
            length = length+str.count;
//
            
            length = length+str.count;
        }
        self.attributedText = mutableAttributedString;
        
    }
    
    
    
    
}
