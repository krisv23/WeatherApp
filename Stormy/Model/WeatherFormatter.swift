//
//  WeatherFormatter.swift
//  Stormy
//
//  Created by Kristopher Valas on 12/14/18.
//  Copyright © 2018. All rights reserved.
//

import Foundation
import UIKit

struct WeatherFormatter {
    let temperature : String
    let humidity: String
    let precipProbability : String
    let summary : String
    let icon : UIImage
    
    init(model : WeatherModel) {
        let roundedTemp = Int(model.temperature)
        self.temperature = "\(roundedTemp)"
        
        let humidityAsPercent = Int(model.humidity * 100)
        self.humidity = "\(humidityAsPercent)"
        
        let precipAsPercent = Int(model.precipitation * 100)
        self.precipProbability = "\(precipAsPercent)"
        
        self.summary = model.summary
        self.icon = model.iconImage
    }
}
