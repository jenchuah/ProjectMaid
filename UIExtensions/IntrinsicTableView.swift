//
//  IntrinsicTableView.swift
//  ShopifyMobileApp
//
//  Created by Jen Min Chuah on 3/10/18.
//  Copyright © 2018 Jenuine Apps. All rights reserved.
//

import UIKit

class IntrinsicTableView: UITableView {

    override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIViewNoIntrinsicMetric, height: contentSize.height)
    }
}
