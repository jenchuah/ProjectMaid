//
//  NSMutableAttributedString+Extension.swift
//  ShopifyMobileApp
//
//  Created by Jen Min Chuah on 21/10/18.
//  Copyright © 2018 Jenuine Apps. All rights reserved.
//

extension NSMutableAttributedString {
    
    func addHyperlink(_ link: URL) {
        self.setAttributes([.link: link], range: NSMakeRange(0, self.length))
    }
}
