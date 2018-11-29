//
//  NSDate.swift
//  Alcedo
//
//  Created by fuzhaorui on 2018/6/8.
//  Copyright © 2018年 yicheng. All rights reserved.
//

import UIKit
import Foundation

extension NSDate
{
    ///获取当前时间的时间辍
    func timeString() -> String {
        return String(stringInterpolationSegment:Int64((self.timeIntervalSince1970)*1000))
    }
    
}

