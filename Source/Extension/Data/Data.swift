//
//  NSData.swift
//  sender_swift
//
//  Created by IOS-开发机 on 16/8/8.
//  Copyright © 2016年 IOS-开发机. All rights reserved.
//

import UIKit


extension Data
{

    /*
     MARK:    -将 NSData 转成 NSDictionary
     @return  返回NSDictionary
     */
    var dictionary:NSDictionary{
        
//         return try! JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
        
        do{
            
            let json = try JSONSerialization.jsonObject(with: self, options: .mutableContainers)
            
            let  dic = json as!Dictionary<String, Any>
            
            return dic as NSDictionary
            
        }catch _{
            
            print("NSDictionary解析失败",self)
            
            return NSDictionary()
        }
        
    }
    
   
    /*
//     将 NSData 转成 NSArray
//     @return  返回NSArray
//     */
//    var array:NSArray{
//        
//         return NSKeyedUnarchiver.unarchiveObject(with: self) as!NSArray
//        
//    }
//    
    /*
     将 NSData 转成 String
     @return  返回String
     */
    var string:String{
        return NSString(data: self, encoding: String.Encoding.utf8.rawValue)! as String
    }
    
    
    

}


