//
//  CFCompetition.swift
//  CF Comps
//
//  Created by marcosgn1 on 4/13/18.
//  Copyright © 2018 Marcos G. All rights reserved.
//
//  Data model to handle the Crossfit Competitions
//
//    * name:   Name of the competition
//    * style:  Competition Style, Individual or Team
//
///

import UIKit

class CFCompetition: NSObject {
    
    public enum CFStyle: String {
        case Individual = "Individual"
        case Team = "Team"
    }
    
    var name: String
    var style: CFStyle
    
    init(name: String, style: CFStyle) {
        self.name = name
        self.style = style
    }

}


