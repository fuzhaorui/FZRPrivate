//
//  UIView.swift
//  senderSwift
//
//  Created by fuzhaurui on 2016/11/16.
//  Copyright © 2016年 fuzhaurui. All rights reserved.
//

import UIKit
import Foundation


extension UIView
{
    /*
     MARK:      - 截 任意UIView 图
     @return    UIImage: 返回截图
     */
    var screenshot: UIImage {
        
        //截屏 下面方法,第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果,需要传NO,否则传YES。第三个参数就是屏幕密度了
        UIGraphicsBeginImageContextWithOptions(self.layer.bounds.size, self.layer.isOpaque, 0.0)
        
        //定义了如何画字的边缘层。为每个四个边(左,右,下,上)如果相应的位设置将antialiased边缘。通常此属性用于禁用抗锯齿的边缘邻接其他层,边缘消除接缝,就会出现。默认值是对于所有antialiased边缘
        self.layer .render(in: UIGraphicsGetCurrentContext()!)
        
        let  viewImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        
        UIGraphicsEndImageContext();
        
        return viewImage;
        
    }
    

    /*
     MARK:    - UIView:rect的动画
     @param   1.rect :动画后 UIView的frame
     @param   2.duration :动画耗时
     @param   3.delay :动画延迟时间
     */
    func animation(rect:CGRect,duration:TimeInterval,delay:TimeInterval) {
        //创建动画
        UIView.beginAnimations(nil, context: nil)
        //动画时间
        UIView.setAnimationDuration(duration)
        //延迟时间
        UIView.setAnimationDelay(delay)
        //动画效果
        self.frame = rect
        //开始动画
        UIView.commitAnimations()
    }
    
    /*
     MARK:    - UIView:point的动画
     @param   1.point :动画后 UIView的contentOffset
     @param   2.duration :动画耗时
     @param   3.delay :动画延迟时间
     */
    func animation(point:CGPoint,duration:TimeInterval,delay:TimeInterval) {
        //创建动画
        UIView.beginAnimations(nil, context: nil)
        //动画时间
        UIView.setAnimationDuration(duration)
        //延迟时间
        UIView.setAnimationDelay(delay)

        self.center = point
     
        //开始动画
        UIView.commitAnimations()
    }
    
    /*
     MARK:    - UIView:alpha的动画
     @param   1.alpha :动画后 UIView的alpha
     @param   2.duration :动画耗时
     @param   3.delay :动画延迟时间
     */
    func animation(alpha:CGFloat,duration:TimeInterval,delay:TimeInterval) {
        //创建动画
        UIView.beginAnimations(nil, context: nil)
        //动画时间
        UIView.setAnimationDuration(duration)
        //延迟时间
        UIView.setAnimationDelay(delay)
        //动画效果
        self.alpha = alpha
        //开始动画
        UIView.commitAnimations()
    }
    
    /*
     MARK:    -  UIView: backgroundColor的动画
     @param   1.backgroundColor :动画后 UIView的backgroundColor
     @param   2.duration :动画耗时
     @param   3.delay :动画延迟时间
     */
    func animation(backgroundColor:UIColor,duration:TimeInterval,delay:TimeInterval) {
        //创建动画
        UIView.beginAnimations(nil, context: nil)
        //动画时间
        UIView.setAnimationDuration(duration)
        //延迟时间
        UIView.setAnimationDelay(delay)
        //动画效果
        self.backgroundColor = backgroundColor
        //开始动画
        UIView.commitAnimations()
    }
    
    /*
     MARK:    - UIView: center的动画
     @param   1.center :动画后 UIView的center
     @param   2.duration :动画耗时
     @param   3.delay :动画延迟时间
     */
    func animation(center:CGPoint,duration:TimeInterval,delay:TimeInterval) {
        //创建动画
        UIView.beginAnimations(nil, context: nil)
        //动画时间
        UIView.setAnimationDuration(duration)
        //延迟时间
        UIView.setAnimationDelay(delay)
        //动画效果
        self.center = center
        //开始动画
        UIView.commitAnimations()
    }
    
    /*
     MARK:   - 设置默认Layer
     */
    func setDefaultLayer()  {
        
        self .setDefaultShadow()
        self.layer.cornerRadius = 5
        self.layer.borderColor  = "#CCCCCC".color.cgColor
        self.layer.borderWidth  = 0.3
    }
    
    
    /*
     MARK:   - 设置默认Shadow
     */
    func setDefaultShadow()  {
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 2
        
    }
    
    /*
     MARK:    - 设置Layer
     @param   borderColor     边框颜色
     @param   borderWinth     边框大小
     @param   cornerRadius    设置圆角
     @param   clipsToBounds   去除多余圆角
     */
    func setLayer(borderColor:UIColor!,borderWinth:CGFloat,cornerRadius:CGFloat,clipsToBounds:Bool)  {
        if borderColor != nil  {
            self.layer.borderColor = borderColor.cgColor
        }
        self.layer.borderWidth  = borderWinth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipsToBounds
    }

    /*
     MARK:    - 设置Shadow
     @param   shadowColor     阴影颜色
     @param   shadowOffset    阴影偏移
     @param   shadowOpacity   阴影透明度
     @param   shadowRadius    阴影半径
     @param   cornerRadius    半径
     */
 
    func setViewShadow(shadowColor:UIColor! ,shadowOffset:CGSize ,shadowOpacity:Float ,shadowRadius:CGFloat ,cornerRadius:CGFloat)  {
        if shadowColor != nil {
            self.layer.shadowColor = shadowColor.cgColor
        }
        self.layer.shadowOffset  = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius  = shadowRadius
        self.layer.cornerRadius  = cornerRadius
    }
    
    /*
     MARK:    - 设置Shadow
     @param   shadowColor     阴影颜色
     @param   shadowOffset    阴影偏移
     @param   shadowOpacity   阴影透明度
     @param   shadowRadius    阴影半径
     @param   cornerRadius    半径
     @param   borderColor     边框颜色
     @param   borderWinth     边框大小
     */
    
    func setViewShadow(shadowColor:UIColor! ,shadowOffset:CGSize ,shadowOpacity:Float ,shadowRadius:CGFloat ,cornerRadius:CGFloat ,borderColor:UIColor! ,borderWinth:CGFloat)  {
        if shadowColor != nil {
            self.layer.shadowColor = shadowColor.cgColor
        }
        self.layer.shadowOffset  = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius  = shadowRadius
        self.layer.cornerRadius  = cornerRadius
        if borderColor != nil {
            self.layer.borderColor = borderColor.cgColor
        }
        self.layer.borderWidth = borderWinth
    }
    
}
