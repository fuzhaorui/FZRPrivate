//
//  NSDictionary.swift
//  sender_swift
//
//  Created by IOS-开发机 on 16/8/8.
//  Copyright © 2016年 IOS-开发机. All rights reserved.
//

import UIKit

extension NSDictionary {

    /*
      MARK:    - 将 NSDictionary 拼接成网络请求参数 String
      @return  将 NSDictionary 的 key,value 拼接起来
      */
    var mosaicParameter: String {
        
        var string:String = ""
        var bool:Bool = true
        
        for (key,value) in self {
            
          
            
            if bool
            {
                string = (key as! String) + "=" + (value as! String)
                bool = false
            }
            else
            {
                
                string = string + "&" + (key as! String) + "=" + (value as! String)
            }
            
        }
        
        return string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
   
    }
    
    var storeKitMosaicParameter: String {
        
        var string:String = ""
        var bool:Bool = true
        
        for (key,value) in self {
            
            
            
            if bool
            {
                string = (key as! String) + "=" + (value as! String)
                bool = false
            }
            else
            {
                
                string = string + "&" + (key as! String) + "=" + (value as! String)
            }
            
        }
        string = string.replacingOccurrences(of: "+", with: "%2B")
        string = string.replacingOccurrences(of: "\n", with: "")
        string = string.replacingOccurrences(of: "\r", with: "")
        
        return string
        
        
    }
    
    

    /*
      MARK:    - 将 NSDictionary 转成 NSData
      @return  将 NSDictionary 转成 NSData
      */
      var data:Foundation.Data{
      
        return NSKeyedArchiver.archivedData(withRootObject: self)
        
    }
}
