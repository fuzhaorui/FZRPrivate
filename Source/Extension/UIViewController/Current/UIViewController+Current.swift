//
//  ViewController+CountDown.swift
//  sender_swift
//
//  Created by IOS-开发机 on 16/8/1.
//  Copyright © 2016年 IOS-开发机. All rights reserved.
//

import UIKit


extension UIViewController
{
    
    class func getCurrentViewController() ->UIViewController {
        var result:UIViewController? = nil
        var window:UIWindow? = UIApplication.shared.keyWindow
        //app默认windowLevel是UIWindowLevelNormal，如果不是，找到它
        if(window?.windowLevel != UIWindow.Level.normal)
        {
            let windows:[UIWindow] = UIApplication.shared.windows
            for tmpWindow in windows {
                if(tmpWindow.windowLevel != UIWindow.Level.normal)
                {
                    window = tmpWindow
                    break
                }
            }
        }
        
        
        var nextResponder:AnyObject? = nil
        
        let appRootVC:UIViewController = (window?.rootViewController)!
        
        if((appRootVC.presentedViewController) != nil)
        {
            nextResponder = appRootVC.presentedViewController
        }
        else
        {
            let frontView:UIView = (window?.subviews[0])!
            nextResponder = frontView.next
        }
        
        if (nextResponder is UITabBarController)
        {
            let tabbar:UITabBarController = nextResponder as!  UITabBarController
            
            let nav:UIViewController = tabbar.viewControllers![tabbar.selectedIndex]
            result = nav.children.last
        }
        else if(nextResponder is UINavigationController)
        {
            let nav:UIViewController = nextResponder as! UIViewController
            result = nav.children.last
        }
        else
        {
            result = (nextResponder as! UIViewController)
        }
        
        return result!
    }
    
    
}
