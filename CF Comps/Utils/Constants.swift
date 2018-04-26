//
//  Constants.swift
//  CF Comps
//
//  Constants class is used as a central place to contain all the constants for the project
//  Using Name Space Pattern to keep the constants in an `enum` so we can access easy from
//  any other place of the project, using an `enum` to avoid exposing any initializer
//
//  Created by Marcos Garcia on 4/26/18.
//  Copyright © 2018 Marcos G. All rights reserved.
//

import UIKit

enum CFConstants {
    static let kRowHeight: CGFloat = 78.0
    static let kSections = 1
    static let kCellNibName = "CFCompCell"
    static let kSearchPlaceHolder = "Search Competitions"
    static let kScope = "All"
    static let kCFDetailView = "CFDetailTableViewController"
    static let kFooterHeight: CGFloat = 64.0
    static let kCFBannerView = "CFBannerView"
}
