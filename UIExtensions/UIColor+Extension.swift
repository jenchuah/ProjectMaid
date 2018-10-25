//
//  UIColor+Extension.swift
//  
//
//  Created by Jen Min Chuah on 11/10/18.
//

import Foundation

extension UIColor {
    func translucent() -> UIColor {
        return self.withAlphaComponent(0.5)
    }
}
