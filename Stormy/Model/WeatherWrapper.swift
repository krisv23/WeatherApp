//
//  WeatherWrapper.swift
//  Stormy
//
//  Created by Kristopher Valas on 12/14/18.
//  Copyright © 2018. All rights reserved.
//

import Foundation


class WeatherWrapper {
    
    let networker = WeaterNetworker()
    
    func getModel(withLocation coordinates: Coordinates, completion handler: @escaping (WeatherModel?, APIError?) -> Void) -> Void {
        
        networker.buildJSON(withLocation: coordinates) { (json, error) in
            //here is where we will create model or return error
            if(error != nil){
                handler(nil, error)
                return
            }
            
            guard let model = WeatherModel(json: json!) else {
                handler(nil, .invalidJSONProperty)
                return
            }
            
            handler(model, nil)
        }
    }
    
}
