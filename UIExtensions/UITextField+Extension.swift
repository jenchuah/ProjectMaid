//
//  UITextField+Extension.swift
//  
//
//  Created by Jen Min Chuah on 11/10/18.
//

import UIKit

extension UITextField {
    func getTrimmedValue() -> String? {
        if let fieldValue = self.text?.trimmingCharacters(in: .whitespacesAndNewlines), !fieldValue.isEmpty {
            return fieldValue
        }
        return nil
    }
    
    func stylise(_ placeholderText: String, borderColour: CGColor, borderWidth: CGFloat, cornerRadius: CGFloat) {
        self.layer.borderColor = borderColour
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.placeholder = placeholderText
    }
    
    enum ValidationState {
        case validating, passed, failed, none
    }
    
    func showValidationState(_ state: ValidationState, passedImage: UIImage, failedImage: UIImage, passedColour: UIColor, failedColour: UIColor) {
        switch state {
        case .validating:
            let validationActivityIndicator = UIActivityIndicatorView()
            validationActivityIndicator.hidesWhenStopped = true
            validationActivityIndicator.style = .gray
            validationActivityIndicator.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            self.rightView = validationActivityIndicator
            validationActivityIndicator.startAnimating()
        case .passed, .failed:
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            imageView.image = (state == .passed) ? passedImage : failedImage
            imageView.tintColor = (state == .passed) ? passedColour : failedColour
            imageView.contentMode = .scaleAspectFit
            self.rightView = imageView
        case .none:
            self.rightView = nil
        }
        self.rightViewMode = .always
    }
}
