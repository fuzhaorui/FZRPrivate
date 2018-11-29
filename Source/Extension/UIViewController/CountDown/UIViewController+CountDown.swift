//
//  ViewController+CountDown.swift
//  sender_swift
//
//  Created by IOS-开发机 on 16/8/1.
//  Copyright © 2016年 IOS-开发机. All rights reserved.
//

import UIKit

var _codeTimer:Timer!
var _button:UIButton!
var _buttom_tilte:String!

var _countDownTimer:NSInteger!

extension UIViewController
{
    
    
    //MARK:  - 初始化倒计时按钮 开始倒计时
    ///初始化倒计时按钮 开始倒计时
    func codeTimerStart(_ sender:UIButton ,countDownTimer:NSInteger) {
        _button = sender
        _buttom_tilte = sender.titleLabel?.text
        _countDownTimer = countDownTimer
        _button.isUserInteractionEnabled = false
        _button.tintColor = UIColor.gray
        _countDownTimer  = _countDownTimer - 1
        _button.setTitle("\(String(describing: _countDownTimer))秒", for: UIControl.State())
        _codeTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.codeTimerDo) , userInfo: nil, repeats: true)

    }
    
    
    //MARK:  - 定时调用倒计时方法
    @objc func codeTimerDo() {
        if _countDownTimer > 1 {
            _countDownTimer  = _countDownTimer - 1
            _button.setTitle("\(String(describing: _countDownTimer))秒", for: UIControl.State())
        }
        else
        {
            self.codeTimerStop()
        }
        
    }
    
    
    //MARK:  - 结束倒计时
    func codeTimerStop() {
        if _codeTimer != nil {
            _codeTimer.invalidate()
            _codeTimer = nil
            _button.isUserInteractionEnabled = true
            _button.setTitle(_buttom_tilte, for: UIControl.State())
        }
    }
    
}
