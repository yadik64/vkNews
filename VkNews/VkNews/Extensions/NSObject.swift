//
//  NSObject.swift
//  VkNews
//
//  Created by Дмитрий Яровой on 25/06/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import Foundation

extension NSObject {
    
    static func className() -> String {
        return String(describing: self)
    }
    
}
