//
//  UISearchBar+Extension.swift
//  
//
//  Created by Jen Min Chuah on 11/10/18.
//

import UIKit

extension UISearchBar {
    func getTrimmedValue() -> String? {
        if let fieldValue = self.text?.trimmingCharacters(in: .whitespacesAndNewlines), !fieldValue.isEmpty {
            return fieldValue
        }
        return nil
    }
}
