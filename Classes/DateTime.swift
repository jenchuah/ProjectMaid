//
//  DateTime.swift
//  ShopifyMobileApp
//
//  Created by Jen Min Chuah on 18/10/18.
//  Copyright © 2018 Jenuine Apps. All rights reserved.
//

import Foundation

struct DateTime{
    
    private static let formatter: DateFormatter = {
        let formatter           = DateFormatter()
        formatter.dateStyle     = .medium
        formatter.timeStyle     = .short
        return formatter
    }()
    
    static func stringFrom(_ date: Date, locale: Locale? = nil) -> String {
        if let locale = locale {
            self.formatter.locale = locale
        } else {
            self.formatter.locale = Locale.current
        }
        return self.formatter.string(from: date)
    }
}
