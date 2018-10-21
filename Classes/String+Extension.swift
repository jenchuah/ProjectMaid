//
//  String+Extension.swift
//  
//
//  Created by Jen Min Chuah on 11/10/18.
//

extension String {
    func capitalizeFirstLetter() -> String {
        let lowercasedString = self.lowercased()
        return lowercasedString.prefix(1).uppercased() + lowercasedString.dropFirst()
    }
    
    func htmlToAttributedString() -> NSAttributedString? {
        do {
            let data = self.data(using: String.Encoding.utf8, allowLossyConversion: true)
            if let d = data {
                let str = try NSAttributedString(data: d,
                                                 options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue],
                                                 documentAttributes: nil)
                
                return str
            }
        } catch {
        }
        return nil
    }
    
    func strikeThrough() -> NSMutableAttributedString {
        let attrStr: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attrStr.addAttribute(.strikethroughStyle, value: 1, range: NSMakeRange(0, attrStr.length))
        
        return attrStr
    }
    
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
}
