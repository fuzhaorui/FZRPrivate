//
//  JudgeJurisdiction.swift
//  EncryptedAlbum
//
//  Created by fuzhaorui on 2018/10/25.
//  Copyright © 2018 fuzhaorui. All rights reserved.
//

import UIKit
import Photos
class JudgeJurisdiction: NSObject {
    
    
    //MARK: - 判断相册权限
    ///MARK: - 判断相册权限
    class func judgePhoto()->Bool{
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            return true
            
        case .notDetermined:
            // 请求授权
            PHPhotoLibrary.requestAuthorization({ (status) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    _ = self.judgePhoto()
                })
            })
            
        default: ()
        DispatchQueue.main.async(execute: { () -> Void in
            let alertController = UIAlertController(title: "照片访问受限",
                                                    message: "点击“设置”，允许访问您的照片",
                                                    preferredStyle: .alert)
            let cancelAction = UIAlertAction(title:"取消", style: .cancel, handler:nil)
            
            let settingsAction = UIAlertAction(title:"设置", style: .default, handler: {
                (action) -> Void in
                let url = URL(string: UIApplication.openSettingsURLString)
                if let url = url, UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10, *) {
                        UIApplication.shared.open(url, options: [:],
                                                  completionHandler: {
                                                    (success) in
                        })
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            })
            alertController.addAction(cancelAction)
            alertController.addAction(settingsAction)
            UIViewController.getCurrentViewController().present(alertController, animated: true, completion: nil)
        })
        }
        return false
    }
    
    //MARK: - 判断相册权限
    ///MARK: - 判断相册权限
    class func judgeCamera()->Bool{
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch status {
        case .authorized:
            return true
            
        case .notDetermined:
            // 请求授权
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { (status) in
                DispatchQueue.main.async(execute: { () -> Void in
                    _ = self.judgeCamera()
                })
            }
            

        default: ()
        DispatchQueue.main.async(execute: { () -> Void in
            let alertController = UIAlertController(title: "相机访问受限",
                                                    message: "点击“设置”，允许访问您的相机",
                                                    preferredStyle: .alert)
            let cancelAction = UIAlertAction(title:"取消", style: .cancel, handler:nil)
            
            let settingsAction = UIAlertAction(title:"设置", style: .default, handler: {
                (action) -> Void in
                let url = URL(string: UIApplication.openSettingsURLString)
                if let url = url, UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10, *) {
                        UIApplication.shared.open(url, options: [:],
                                                  completionHandler: {
                                                    (success) in
                        })
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            })
            alertController.addAction(cancelAction)
            alertController.addAction(settingsAction)
            UIViewController.getCurrentViewController().present(alertController, animated: true, completion: nil)
        })
        }
        return false
    }

}
