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
    var min = String()
    var max = String()
    var main = String()
    var dt = String()
    
    class func parseJSON(data: AnyObject?) -> [DailyWeather] {
        var dailyWeather = [DailyWeather]()
        if let weatherData = data as? NSDictionary {
            if let list = weatherData["list"] as? NSArray {
                for lst in list {
                    let weather = DailyWeather()
                    if let weatherArray = lst["weather"] as? NSArray {
                        if let aDescription = weatherArray[0]["description"] as? String {
                            weather.aDescription = aDescription
                        }
                        if let main = weatherArray[0]["main"] as? String {
                            weather.main = main
                        }
                    }
                    if let dt = lst["dt"] as? NSTimeInterval {
                        weather.dt = translateTime(dt)
                    }
                    if let temp = lst["temp"] as? NSDictionary {
                        if let temp_min = temp["min"] as? Double {
                            weather.min = translateDouble(temp_min)
                        }
                        if let temp_max = temp["max"] as? Double {
                            weather.max = translateDouble(temp_max)
                        }
                    }
                    dailyWeather.append(weather)
                }
            }
        }
        return dailyWeather
    }
    
    // 時間の直し方わからなかったのでググりました。あってるかわかりませんm(_ _)m
    private class func translateTime(unixDate: NSTimeInterval) -> String {
        
        let dateComp: NSDateComponents = NSCalendar.currentCalendar().components(NSCalendarUnit.MonthCalendarUnit|NSCalendarUnit.DayCalendarUnit, fromDate: NSDate(timeIntervalSince1970: unixDate))
        return "\(dateComp.month)/\(dateComp.day)"
    }
    
    private class func translateDouble(doubleValue: Double) -> String {
        return NSString(format: "%1.0f°", floor(doubleValue))
    }
}
