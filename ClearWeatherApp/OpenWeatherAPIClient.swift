//
//  OpenWeatherAPIClient.swift
//  ClearWeatherApp
//
//  Created by Kenichi Saito on 2/21/15.
//  Copyright (c) 2015 FarConnection. All rights reserved.
//

import UIKit

class OpenWeatherAPIClient: NSObject {
    // シングルトン
    class var sharedClient: OpenWeatherAPIClient {
        struct Static {
            static let client: OpenWeatherAPIClient = OpenWeatherAPIClient()
        }
        return Static.client
    }
    
    func getWeather(callback: (Weather, NSError?) -> ()) {
        let baseURL = "http://api.openweathermap.org/data/2.5/weather?"
        let params = [
            "q": "Tokyo,jp"
        ]
        
        Alamofire.sharedAlamofire.request(.GET, baseURL, parameters: params, encoding: .URL).responseJSON({request, response, JSON, error in
            println(request)
            println(response)
            println(JSON)
            println(error)
            
            callback(Weather.parseJSON(JSON), error?)
        })
    }
    
    func getDailiyWeather(callback: ([DailyWeather], NSError?) -> ()) {
        let baseURL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
        let params = [
            "q": "Tokyo,jp",
            "mode": "json",
            "units": "metric",
            "cnt": "7"
        ]
        
        Alamofire.sharedAlamofire.request(.GET, baseURL, parameters: params, encoding: .URL).responseJSON({request, response, JSON, error in
            println(request)
            println(response)
            println(JSON)
            println(error)
            
            callback(DailyWeather.parseJSON(JSON), error?)
        })
    }
}
