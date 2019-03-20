//
//  WeatherModel.swift
//  Stormy
//
//  Created by Kristopher Valas on 12/14/18.
//  Copyright © 2018. All rights reserved.
//

import Foundation
import UIKit

struct WeatherModel {
    
    var temperature: Double
    var humidity: Double
    var precipitation: Double
    var weatherIcon: String
    var summary: String
    
}


extension WeatherModel {
    
    var iconImage : UIImage {
        switch weatherIcon {
        case "clear-day":
            return UIImage(named: "clear-day", in: nil, compatibleWith: nil)!
        case "clear-night":
            return UIImage(named: "clear-night", in: nil, compatibleWith: nil)!
        case "rain":
            return UIImage(named: "rain", in: nil, compatibleWith: nil)!
        case "snow":
            return UIImage(named: "snow", in: nil, compatibleWith: nil)!
        case "sleet":
            return UIImage(named: "sleet", in: nil, compatibleWith: nil)!
        case "wind":
            return UIImage(named: "wind", in: nil, compatibleWith: nil)!
        case "fog":
            return UIImage(named: "fog", in: nil, compatibleWith: nil)!
        case "cloudy":
            return UIImage(named: "cloudy", in: nil, compatibleWith: nil)!
        case "partly-cloudy-day", "partly-cloudy-night":
            return UIImage(named: "partly-cloudy", in: nil, compatibleWith: nil)!
        default:
            return UIImage(named: "default", in: nil, compatibleWith: nil)!
        }
    }
    
}

extension WeatherModel {
    
    init?(json : [String : AnyObject]){
        
        guard let data = json["currently"] else {
            return nil
        }
        
        guard let temp = data["temperature"] as? Double,
        let humidity = data["humidity"] as? Double,
        let precip = data["precipProbability"] as? Double,
        let summary = data["summary"] as? String,
        let icon = data["icon"] as? String
        else {
             return nil
        }
        self.humidity = humidity
        self.weatherIcon = icon
        self.precipitation = precip
        self.summary = summary
        self.temperature = temp
    }
    
}
