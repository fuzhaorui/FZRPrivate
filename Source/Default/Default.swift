//
//  Color.swift
//  senderSwift
//
//  Created by IOS-开发机 on 16/7/26.
//  Copyright © 2016年 IOS-开发机. All rights reserved.
//

import UIKit
import Foundation



//MARK:  - 设置默认尺寸
//MARK:  -获取屏幕rect
///获取屏幕rect
let Rect:CGRect = UIScreen.main.bounds


//MARK:  -获取屏幕size
///获取屏幕size
let SIZE:CGSize = UIScreen.main.bounds.size


//MARK:  -放大单位
///放大单位
let UNIT:CGFloat = UIScreen.main.bounds.size.width/320


//MARK:  - 等比例放大
///等比例放大
func magnifyViewFrame(_ view:UIView! ,frame:CGRect)  {

    if "UIButton" == NSStringFromClass(view .classForCoder)  {
        
        let button =  view as! UIButton
        button.titleLabel?.font = UIFont.systemFont(ofSize: (button.titleLabel?.font.pointSize)! * UNIT)
        
    }
    
    if "UILabel" == NSStringFromClass(view .classForCoder)  {
   
        let label = view as! UILabel
        label.font = UIFont.systemFont(ofSize: (label.font.pointSize) * UNIT)
        
    }
    
    if "UITextField" == NSStringFromClass(view .classForCoder)  {
        
        let textField = view as! UITextField
        textField.font = UIFont.systemFont(ofSize: (textField.font?.pointSize)! * UNIT)
        
    }
    
    view.translatesAutoresizingMaskIntoConstraints = true
    view.frame = CGRect(x: frame.origin.x * UNIT, y: frame.origin.y * UNIT, width: frame.size.width * UNIT, height: frame.size.height * UNIT)
    
}


/// 判断是否为: iPhone4

let isIphone4 = SIZE.height  < 568 ? true : false

/// 判断是否为: iPhone 5

let isIphone5 = SIZE.height  == 568 ? true : false

/// 判断是否为: iPhone 6

let isIphone6 = SIZE.height  == 667 ? true : false

/// 判断是否为: iphone 6P

let isIphone6P = SIZE.height == 736 ? true : false

/// 判断是否为: iphone X

let isIphoneX = SIZE.height >= 812 ? true : false

// navigationBarHeight

let navigationBarHeight : CGFloat = isIphoneX ? 88 : 64

// tabBarHeight

let tabBarHeight : CGFloat = isIphoneX ? 49 + 34 : 49



//MARK:  - 键盘回收
///键盘回收
func recoveryKeyboard() {
    UIApplication.shared.keyWindow?.endEditing(true)
}


//MARK:  - 声音数据 文件夹地址
///声音数据 文件夹地址
var MusicFolder:String
{
    let documentPaths:String  = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
    return documentPaths + "/MusicFolder"
}


//MARK:  - 图片数据 文件夹地址
///图片数据 文件夹地址
var ImageFolder:String
{
    let documentPaths:String  = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
    return documentPaths + "/ImageFolder"
}


//MARK:  - plist数据 文件夹地址
///plist数据 文件夹地址
var PlistFolder:String
{
    let documentPaths:String  = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
    return documentPaths + "/PlistFolder"
}

//MARK:  - Json数据 文件夹地址
///Json数据 文件夹地址
var JsonFolder:String
{
    let documentPaths:String  = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
    return documentPaths + "/JsonFolder"
}

