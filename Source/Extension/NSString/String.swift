//
//  String.swift
//  sender_swift
//
//  Created by IOS-开发机 on 16/7/29.
//  Copyright © 2016年 IOS-开发机. All rights reserved.
//

import UIKit
import Foundation


//
// @brief  String的通用扩展方法
// @date   2016-7-29
// @author fuzhaorui
//
enum TimeStyle:String {
    ///周一
    case TimeTypeOne    =  "周一"
    ///yyyy-MM-dd HH:mm:ss
    case TimeTypeTwo    =  "yyyy-MM-dd HH:mm:ss"
    ///MM-dd
    case TimeTypeThree  =  "MM-dd"
    ///HH:mm
    case TimeTypeFour   =  "HH:mm"
    ///MM月
    case TimeTypeFive   =  "MM月"
    ///yyyy-MM
    case TimeTypeSix    =  "yyyy-MM"
    ///yyyy-MM-dd
    case TimeTypeSeven  =  "yyyy-MM-dd"

}



extension String {
    
    
    /*
     MARK:     - 根据字体大小,获取字符串的高度
     @param    fontSize 字体大小CGFloat
     @param    width 限制一行显示的宽度
     @return   返回文本在width宽度的条件下的总高度
     */
    func heightfontSize(fontSize:CGFloat, width:CGFloat) -> CGFloat {
        let font:UIFont = UIFont.boldSystemFont(ofSize: fontSize)
        return self.heightfont(font: font, width: width)
    }
    
    /*
     MARK:     - 根据字体大小,获取字符串的size
     @param    fontSize 字体大小CGFloat
     @param    width 限制一行显示的宽度
     @return   返回文本在width宽度的条件下的总高度
     */
    func heightfont(font:UIFont, width:CGFloat) -> CGFloat {
        return self.stringSize(font: font, width: width).height
    }

    
    /*
     MARK:     - 根据字体大小,获取字符串的size
     @param    fontSize 字体大小CGFloat
     @param    width 限制一行显示的宽度
     @return   返回文本在width宽度的条件下的总高度
     */
    func stringSize(fontSize:CGFloat, width:CGFloat) -> CGSize {
        let font:UIFont = UIFont.boldSystemFont(ofSize: fontSize)
        return self.stringSize(font: font, width: width)
    }
    
    
    

    /*
     MARK:     - 根据字体,获取字符串的size
     @param    font 字体大小UIFont
     @param    width 限制一行显示的宽度
     @return   返回文本在width宽度的条件下的总高度
     */
    func stringSize(font:UIFont, width:CGFloat) -> CGSize {
        let size:CGSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = NSLineBreakMode.byCharWrapping
        
        let attributes = [kCTFontAttributeName: font, kCTParagraphStyleAttributeName: style.copy()];
        
        let text = self as NSString
        
        let rect = text.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes as [NSAttributedString.Key : Any]  ,context: nil)
        return rect.size
    }
    
    
    ///- 把时间戳转换成“2014年12月12日 8:20:20”格式的日期字符串  @param    timeStamp 返回时间格式 @return   根据timeStamp 返回时间格式 例:2014年12月12日 8:20:20”格式的日期字符串
    /**
     MARK:     - 把时间戳转换成“2014年12月12日 8:20:20”格式的日期字符串
     @param    timeStamp 返回时间格式
     @return   根据timeStamp 返回时间格式 例:2014年12月12日 8:20:20”格式的日期字符串
     */
    func timeSring(timeStyleType:TimeStyle!) ->String {
        
        let date = Date(timeIntervalSince1970: (self as NSString).doubleValue/1000)
        
        if(timeStyleType.rawValue .isEqualToString(TimeStyle.TimeTypeOne.rawValue))
        {

            let weekday:NSArray  = [NSNull()  ,NSLocalizedString("周日", comment: ""), NSLocalizedString("周一", comment: ""), NSLocalizedString("周二", comment: ""), NSLocalizedString("周三", comment: ""), NSLocalizedString("周四", comment: ""), NSLocalizedString("周五", comment: ""), NSLocalizedString("周六", comment: "")]
            
            let calendar:NSCalendar = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)!
            
            let dateComponents:NSDateComponents = calendar.components(NSCalendar.Unit.weekday, from: date) as NSDateComponents
            
            return weekday.object(at:dateComponents.weekday) as! String
            
        }
        
        let formatter = DateFormatter()
        
        formatter.dateFormat =  timeStyleType.rawValue
        
        return formatter.string(from: date)  
    }
    
    
    ///-  把 “2014年12月12日 8:20:20”格式的日期字符串转换成 时间戳    @param timeStamp 返回时间格式 @return   根据timeStamp 返回时间格式 例:2014年12月12日 8:20:20”格式的日期字符串
    /**
     MARK:     - 把时间戳转换成“2014年12月12日 8:20:20”格式的日期字符串
     @param    timeStamp 返回时间格式
     @return   根据timeStamp 返回时间格式 例:2014年12月12日 8:20:20”格式的日期字符串
     */
    func timeStamp(timeStyleType:TimeStyle!) -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat =  timeStyleType.rawValue
        
        let date:Date = formatter.date(from: self)!
        
        return String(stringInterpolationSegment:Int64((date.timeIntervalSince1970)*1000))
    }
    
    
    /*
     MARK:    - String扩展:将String转化为NSData
     @return  String扩展:将String转化为NSData
     */
    var data:Foundation.Data
    {
        return self.data(using: String.Encoding.utf8)!
    }
    
    
    /*
     MARK:    - String扩展:判断两个String 是否相同
     @return  Bool: String扩展:判断两个String 是否相同
     */
    func isEqualToString(_ find: String) -> Bool {
        return String(format: self) == find
    }
    
    /*
     MARK:    - String扩展:将NSString转化为UIColor
     @return  UIColor
     */
    var  color:UIColor
    {
        
        var cString:String = self
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedLongLong = 0, g:CUnsignedLongLong = 0, b:CUnsignedLongLong = 0;
        Scanner(string: rString).scanHexInt64(&r)
        Scanner(string: gString).scanHexInt64(&g)
        Scanner(string: bString).scanHexInt64(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
        
    }
    
    
    /*
     MARK:    - String扩展:将NSString转化为UIColor
     @param   alpha 设置color透明度
     @return  UIColor
     */
    func color(alpha: CGFloat) -> UIColor {
        var cString:String = self
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedLongLong = 0, g:CUnsignedLongLong = 0, b:CUnsignedLongLong = 0;
        Scanner(string: rString).scanHexInt64(&r)
        Scanner(string: gString).scanHexInt64(&g)
        Scanner(string: bString).scanHexInt64(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
        
    }

    
    
//    var utfData: Data? {
//        return self.data(using: .utf8)
//    }
//
//    var htmlAttributedString: NSAttributedString? {
//        guard let data = self.utfData else {
//            return nil
//        }
//        do {
//            return try NSAttributedString(data: data,
//                                          options: [.documentType: NSAttributedString.DocumentType.html,
//                                                    .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
//        } catch {
//            print(error.localizedDescription)
//            return nil
//        }
//    }
    
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}



