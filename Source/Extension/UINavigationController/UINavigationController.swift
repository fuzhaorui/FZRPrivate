//
//  UINavigationController.swift
//  sender_swift
//
//  Created by fuzhaurui on 2016/11/11.
//  Copyright © 2016年 IOS-开发机. All rights reserved.
//

import UIKit
import Foundation

extension UINavigationController
{
    
    /*
     MARK:      - 截屏 包括UINavigationController
     @return    UIImage: 返回截图
     */
    var screenshot: UIImage {
        
        //截屏 下面方法,第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果,需要传NO,否则传YES。第三个参数就是屏幕密度了
        UIGraphicsBeginImageContextWithOptions(self.view.layer.bounds.size, self.view.layer.isOpaque, 0.0)
        
        //定义了如何画字的边缘层。为每个四个边(左,右,下,上)如果相应的位设置将antialiased边缘。通常此属性用于禁用抗锯齿的边缘邻接其他层,边缘消除接缝,就会出现。默认值是对于所有antialiased边缘
        self.view.layer .render(in: UIGraphicsGetCurrentContext()!)
        
        let  viewImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        
        UIGraphicsEndImageContext();
       
        return viewImage;
        
    }
    

}
