//
//  WeatherNetworker.swift
//  Stormy
//
//  Created by Kristopher Valas on 12/14/18.
//  Copyright © 2018. All rights reserved.
//

import Foundation


fileprivate let darkSkyAPIKey = "47a8be12063203ed131ce7cabb2500ac"
fileprivate var baseURL = URL(string: "https://api.darksky.net/forecast/\(darkSkyAPIKey)/")

typealias JSON = [String:AnyObject]


 class WeaterNetworker {
    
    let downloader = JSONDownloader()

    //completion handler for networker
    
    func buildJSON(withLocation coordinates : Coordinates, completion handler: @escaping (JSON?, APIError?) -> Void) -> Void {
       
        guard let forecastURL = URL(string: coordinates.stringify(), relativeTo: baseURL)
            else {
                handler(nil, .invalidCoordinates)
                return
        }
        
        let request = buildRequest(for: forecastURL)
        let session = buildSession()
        
        
        let dataTask = downloader.callAPI(for: session, request: request){ json, error in
            DispatchQueue.main.async {
            
                guard let json = json else {
                    handler(nil, error)
                    return
                }
                handler(json, nil)
            }
        }
        
        dataTask.resume()
    }
    
    func buildSession() -> URLSession {
        return URLSession(configuration: .default)
        
    }
    
    func buildRequest(for url: URL) -> URLRequest {
        return URLRequest(url: url)
    }
    
    
    //Completion handler for JSON Downloader
//    func parseData(_ json: JSON?,_ error: APIError?, handler completion: (JSON?, APIError?) -> Void) -> Void{
//
//        if(error != nil){
//            print(error!)
//            return
//        }
//        guard let currentWeatherJson = json, let weatherModel = WeatherModel(json: currentWeatherJson) else{
//            return
//        }
//
//        currentWeather = weatherModel
//
//        print("model after parse: \(weatherModel)")
//
//    }
    
    
    

    
}
