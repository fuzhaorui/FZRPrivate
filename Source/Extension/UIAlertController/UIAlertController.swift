//
//  String.swift
//  sender_swift
//
//  Created by IOS-开发机 on 16/7/29.
//  Copyright © 2016年 IOS-开发机. All rights reserved.
//

import UIKit
import Foundation


class AlertActionModel: NSObject {
    
    var title:String = ""
    var style:UIAlertAction.Style = .default
    var handler:((UIAlertAction) -> Swift.Void)? = nil
    
    init(title:String,style:UIAlertAction.Style,handler:((UIAlertAction) -> Swift.Void)?){
       
        self.title = title
        self.style = style
        self.handler = handler
    }
 
}

extension UIAlertController {
    
    static let share:UIAlertController = UIAlertController()

    //MARK: - 快速创建便捷提示框（ UIAlertController ）
    /**
     *@brief   快速创建便捷提示框（ UIAlertController ）
     *@param   title              提示框标题
     *@param   message            提示框内容
     *@param   preferredStyle     提示框类型（ UIAlertControllerStyle ）
     *@param   modelArray         提示框按钮数组（  [AlertActionModel]  ）
     *@return             UIAlertController
     */
    class func alertController(title:String, message:String,style:UIAlertController.Style,
                                modelArray:[AlertActionModel]) -> UIAlertController
    {
        let alertController:UIAlertController = UIAlertController.init(title: title, message: message, preferredStyle: style)
        
        for model in modelArray {
            alertController.addAction(UIAlertAction.init(title: model.title, style: model.style, handler: model.handler))
        }
        
        return alertController
    }
    
    //MARK: - 快速显示便捷提示框（ UIAlertController ）
    /**
     *@brief   快速显示便捷提示框（ UIAlertController ）
     *@param   title              提示框标题
     *@param   message            提示框内容
     *@param   preferredStyle     提示框类型（ UIAlertControllerStyle ）
     *@param   modelArray         提示框按钮数组（  [AlertActionModel]  ）
     */
    class func showAlertController(title:String, message:String,style:UIAlertController.Style,
                                modelArray:[AlertActionModel])
    {
        let alertController:UIAlertController = UIAlertController.alertController(title: title, message: message, style: style, modelArray: modelArray)
        (Dispatch.DispatchQueue.main).async() {
            
            UIViewController.getCurrentViewController().present(alertController, animated: true, completion: nil)
        }
        
    }
    
}



