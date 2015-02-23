//
//  DailyWeather.swift
//  ClearWeatherApp
//
//  Created by Kenichi Saito on 2/21/15.
//  Copyright (c) 2015 FarConnection. All rights reserved.
//

import UIKit

class DailyWeather: NSObject {
    
    var aDescription = String()
    var temp_min = String()
    var temp_max = String()
    var main = String()
    var dt = String()
    
    class func parseJSON(data: AnyObject?) -> NSArray {
        var _weatherData = NSMutableArray()
        if let weatherData = data as? NSDictionary {
            if let lists = weatherData["list"] as? NSArray {
                for list in lists {
                    let weather = DailyWeather()
                    if let weatherArray = list["weather"] as? NSArray {
                        if let aDescription = weatherArray[0]["description"] as? String {
                            weather.aDescription = aDescription
                        }
                        if let main = weatherArray[0]["main"] as? String {
                            weather.main = main
                        }
                    }
                    if let main = list["main"] as? NSDictionary {
                        if let temp_min = main["temp_min"] as? Double {
                            weather.temp_min = translateDouble(temp_min)
                        }
                        if let temp_max = main["temp_max"] as? Double {
                            weather.temp_max = translateDouble(temp_max)
                        }
                    }
                    if let dt = list["dt"] as? NSTimeInterval {
                        weather.dt = translateTime(dt)
                    }
                    _weatherData.addObject(weather)
                }
            }
        }
        return _weatherData
    }
    
    // 時間の直し方わからなかったのでググりました。あってるかわかりませんm(_ _)m
    class func translateTime(unixDate:NSTimeInterval) -> String {
        var date = NSDate(timeIntervalSince1970: unixDate)
        var formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP")
        formatter.dateFormat = "MM/dd"
        return formatter.stringFromDate(date) as String
    }
    
    class func translateDouble(doubleValue:Double) -> String {
        return NSString(format: "%1.0f゜", floor(doubleValue - 273.15))
    }
}
