//
//  UIActivityIndicator+Extension.swift
//  
//
//  Created by Jen Min Chuah on 11/10/18.
//

import UIKit

extension UIActivityIndicatorView {
    func startAnimatingAndBeginIgnoring() {
        DispatchQueue.main.async {
            self.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
        }
    }
    
    func stopAnimatingAndEndIgnoring() {
        DispatchQueue.main.async {
            self.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
}

