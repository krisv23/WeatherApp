//
//  Coordinates.swift
//  Stormy
//
//  Created by Kristopher Valas on 12/18/18.
//  Copyright © 2018. All rights reserved.
//

import Foundation

struct Coordinates {

    var lat : Double
    var long : Double
    
}

extension Coordinates {
    
    func stringify() -> String {
        return "\(lat),\(long)"
    }
    
}

