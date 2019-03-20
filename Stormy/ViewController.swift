//
//  ViewController.swift
//  Stormy
//
//  Created by Kristopher Valas on 12/14/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let model = WeatherModel(temperature: 85.0, humidity: 0.4, precipitation: 0.1, weatherIcon: "clear-day", summary: "Hot!")
//        let weatherFormat = WeatherFormatter(model: model)
//        displayWeather(withModel: weatherFormat)
        
        let wrapper = WeatherWrapper()
        let coordinates = Coordinates(lat: 28.5383, long: 81.3792)
        
        wrapper.getModel(withLocation: coordinates) { [unowned self] (model, error) in
            if(error != nil){
                print("Error: \(error!)")
            }
            
            print("We did it! We're in the VC and the model is: \(model)")
            self.displayWeather(withModel: WeatherFormatter(model: model!))
            
        }
        
       
    }
    
    func displayWeather(withModel  weather: WeatherFormatter){
        currentTemperatureLabel.text = weather.temperature
        currentHumidityLabel.text = weather.humidity
        currentWeatherIcon.image = weather.icon
        currentSummaryLabel.text = weather.summary
        
    }
    
    func getCoordinates() -> Coordinates {
        return Coordinates(lat: 42.3601, long: -71.0589)
    }
}

