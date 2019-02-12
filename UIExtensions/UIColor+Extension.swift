//
//  UIColor+Extension.swift
//  
//
//  Created by Jen Min Chuah on 11/10/18.
//

import UIKit

extension UIColor {
    func translucent() -> UIColor {
        return self.withAlphaComponent(0.1)
    }
}
