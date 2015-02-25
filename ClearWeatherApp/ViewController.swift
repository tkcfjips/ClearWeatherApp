//
//  ViewController.swift
//  ClearWeatherApp
//
//  Created by Kenichi Saito on 2/21/15.
//  Copyright (c) 2015 FarConnection. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var tableView: UITableView!
    var weatherImageView: UIImageView!
    var descriptionLabel: UILabel!
    var minLabel: UILabel!
    var maxLabel: UILabel!
    var nameLabel: UILabel!
    
    var weatherArray = [DailyWeather]()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        let kScreenSize = UIScreen.mainScreen().bounds.size
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back")!)
        self.view.layer.cornerRadius = 10

        tableView = UITableView(frame: CGRectMake(0, kScreenSize.height/2, kScreenSize.width, kScreenSize.height/2))
        tableView.separatorColor = UIColor.clearColor()
        tableView.backgroundColor = UIColor.clearColor()
        tableView.rowHeight = 100
        tableView.dataSource = self
        
        weatherImageView = UIImageView(frame: CGRectMake(0, 0, kScreenSize.width/3, kScreenSize.width/3))
        weatherImageView.layer.position = CGPoint(x: kScreenSize.width/2, y: kScreenSize.width/2)
        weatherImageView.tintColor = UIColor.whiteColor()
        
        descriptionLabel = UILabel(frame: CGRectMake(0, 0, 200, 30))
        descriptionLabel.layer.position = CGPoint(x: kScreenSize.width/2, y: kScreenSize.width/2 + kScreenSize.width/5)
        descriptionLabel.textAlignment = NSTextAlignment.Center;
        descriptionLabel.textColor = UIColor.whiteColor()
        descriptionLabel.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        
        minLabel = UILabel(frame: CGRectMake(0, 0, 100, 40))
        minLabel.layer.position = CGPoint(x: 3*kScreenSize.width/4, y: kScreenSize.width/2)
        minLabel.textColor = UIColor.whiteColor()
        minLabel.textAlignment = NSTextAlignment.Right;
        minLabel.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        
        maxLabel = UILabel(frame: CGRectMake(0, 0, 100, 40))
        maxLabel.layer.position = CGPoint(x: kScreenSize.width/4, y: kScreenSize.width/2)
        maxLabel.textColor = UIColor.whiteColor()
        maxLabel.textAlignment = NSTextAlignment.Left;
        maxLabel.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        
        nameLabel = UILabel(frame: CGRectMake(0, 0, 200, 40))
        nameLabel.layer.position = CGPoint(x: kScreenSize.width/2, y: kScreenSize.width/2 - kScreenSize.width/5)
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.textAlignment = NSTextAlignment.Center;
        nameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        
        self.view.addSubview(tableView)
        self.view.addSubview(weatherImageView)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(minLabel)
        self.view.addSubview(maxLabel)
        self.view.addSubview(nameLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        OpenWeatherAPIClient.sharedClient.getWeather({data, error in
            let weather: Weather = data
            self.weatherImageView.image = UIImage(named: weather.main)?.imageWithRenderingMode(.AlwaysTemplate)
            self.descriptionLabel.text = weather.aDescription
            self.maxLabel.text = weather.temp_max
            self.minLabel.text = weather.temp_min
            self.nameLabel.text = weather.name
        })
        
        OpenWeatherAPIClient.sharedClient.getDailiyWeather({data, error in
            let dailyWeather: [DailyWeather] = data
            self.weatherArray = data
            self.tableView.reloadData()
        })
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = WeatherTableViewCell(style: .Default, reuseIdentifier: "Cell")
        updateCell(cell, indexPath: indexPath)
        return cell
    }
    
    func updateCell(cell: WeatherTableViewCell, indexPath: NSIndexPath) {
        cell.dateLabel.text = weatherArray[indexPath.row].dt
        cell.minLabel.text = weatherArray[indexPath.row].min
        cell.maxLabel.text = weatherArray[indexPath.row].max
        cell.descriptionLabel.text = weatherArray[indexPath.row].aDescription
        cell.weatherImageView.image = UIImage(named:weatherArray[indexPath.row].main)?.imageWithRenderingMode(.AlwaysTemplate)
    }
    
    // MARK: - Deinit

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

