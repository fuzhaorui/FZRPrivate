//
//  AnyObject.swift
//  sender_swift
//
//  Created by IOS-开发机 on 16/8/12.
//  Copyright © 2016年 IOS-开发机. All rights reserved.
//

import UIKit
import Foundation

extension Optional
{
    
    
    /*
     MARK:   - 检查是不是为空
     @param  string:当Optional就返回string
     @return 返回Optional 当Optional时  就返回string
     */
    func checkData(string:String) ->  String {
        
        if(self == nil)
        {
            return string
        }
        
        return String(describing: self)
        
    }
    
    
    /*
     MARK:   - 读取网络请求数据中的 Int64 类型 转化为  NSInteger 类型
     @param  key:读取数据key
     @return 读取数据转换NSInteger方便判断
     */
    func int(key:String ) -> NSInteger {
        
        
        let data:NSDictionary! = (self as! NSDictionary)
        
        let value:AnyObject = data.object(forKey: key)! as AnyObject
        
        return value.intValue
    }

}

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(_ object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}

