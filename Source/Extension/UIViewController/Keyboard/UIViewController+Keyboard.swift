//
//  ViewController+Keyboard.swift
//  sender_swift
//
//  Created by IOS-开发机 on 16/8/1.
//  Copyright © 2016年 IOS-开发机. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


var _scrollView_keyboard:UIScrollView?
var _frame_keyboard:CGRect!
var _height_keyboard:CGFloat!
var _gestureRecognizerArray:NSMutableArray?

extension UIViewController:UIGestureRecognizerDelegate{
    
    
    //MARK: - 设置点击手势白名单
    ///设置点击手势白名单
    func addGestureRecognizerClass(_ gestureRecognizerClass:String)
    {
        _gestureRecognizerArray?.add(gestureRecognizerClass)
    }
    
    
    
    //MARK: - 设置控件高度
    ///设置控件高度
    func obtainHeight(_ view:UIView!)  {
        let rect:CGRect = view.convert(view.bounds, to: _scrollView_keyboard)
        _height_keyboard = rect.size.height + rect.origin.y
    }
    
    
    
    //MARK: - 添加scrollView点击回收手势
    ///添加scrollView点击回收手势
    func addScrollView(_ scrollView:UIScrollView) {
        
        _scrollView_keyboard = scrollView
        
        for subview in self.view.subviews {
            
            subview.translatesAutoresizingMaskIntoConstraints = true
        }
        
        _frame_keyboard = scrollView.frame
        _gestureRecognizerArray = NSMutableArray()
        
      
        let tapGestureRecognizer:UITapGestureRecognizer? = UITapGestureRecognizer(target: self, action: #selector(self.hiddenKeyBoard(_:)))
        tapGestureRecognizer?.delegate = self
        scrollView.addGestureRecognizer(tapGestureRecognizer!)

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    //MARK: - 键盘开始时
    ///键盘开始时
    @objc func keyboardWasShown(_ notification:Notification!) {
        let info:NSDictionary = notification.userInfo! as NSDictionary
        let value:NSValue = info.object(forKey: UIResponder.keyboardFrameEndUserInfoKey)as!NSValue
        let keyboardSize:CGSize = value.cgRectValue.size
        
        _scrollView_keyboard?.animation(rect: CGRect(x: 0, y: _frame_keyboard!.origin.y, width: SIZE.width, height: SIZE.height - _frame_keyboard!.origin.y - keyboardSize.height), duration: 0.25, delay: 0.1)
        if (_height_keyboard > (SIZE.height - keyboardSize.height - _frame_keyboard.origin.y)) {
            _scrollView_keyboard?.animation(point: CGPoint(x: 0,y: (20+_height_keyboard-(SIZE.height-keyboardSize.height-_frame_keyboard.origin.y))), duration: 0.3, delay: 0.1)
        }
    }
    
    
    
    //MARK: - 键盘回收时
    ///键盘回收时
    @objc func keyboardWasHidden(_ notification:Notification?) {
  
        _scrollView_keyboard?.animation(rect: CGRect(x: 0, y: _frame_keyboard.origin.y, width: SIZE.width, height: _frame_keyboard.size.height), duration: 0.25, delay: 0)
    }
    
    

    //MARK: - 点击手势实现代理  开始点击
    ///点击手势实现代理  开始点击
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        
        if "UITableViewCellContentView" == NSStringFromClass(view .classForCoder)
        {
            return false
        }
        if (_gestureRecognizerArray != nil && _gestureRecognizerArray?.count > 0) {
            for i in 0..<(_gestureRecognizerArray?.count)! {
                if _gestureRecognizerArray![i] as!String ==  NSStringFromClass(view .classForCoder){
                    return false
                }
            }
        }
        
        return true
    }
    
    

    //MARK: - 结束输入回收
    ///结束输入回收
    @objc func hiddenKeyBoard(_ tapGestureRecognizer:UITapGestureRecognizer) {

       recoveryKeyboard()

    }

}
