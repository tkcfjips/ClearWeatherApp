//
//  WeatherTableViewCell.swift
//  ClearWeatherApp
//
//  Created by Kenichi Saito on 2/25/15.
//  Copyright (c) 2015 FarConnection. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    let dateLabel = UILabel()
    let descriptionLabel = UILabel()
    let weatherImageView = UIImageView()
    let minLabel = UILabel()
    let maxLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.backgroundColor = UIColor.clearColor()
        
        weatherImageView = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        weatherImageView.tintColor = UIColor.whiteColor()
        
        dateLabel = UILabel(frame: CGRectZero)
        dateLabel.textColor = UIColor.whiteColor()
        dateLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 25)
        
        maxLabel = UILabel(frame: CGRectZero)
        maxLabel.textColor = UIColor.whiteColor()
        maxLabel.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        maxLabel.textAlignment = NSTextAlignment.Right;
        
        minLabel = UILabel(frame: CGRectZero)
        minLabel.textColor = UIColor.whiteColor()
        minLabel.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        minLabel.textAlignment = NSTextAlignment.Right;
        
        descriptionLabel = UILabel(frame: CGRectZero)
        descriptionLabel.textColor = UIColor.whiteColor()
        descriptionLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        
        self.contentView.addSubview(weatherImageView)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(maxLabel)
        self.contentView.addSubview(minLabel)
        self.contentView.addSubview(descriptionLabel)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let kCellSize: CGSize = self.frame.size
        weatherImageView.frame = CGRectMake(0, 0, 80, 80);
        weatherImageView.layer.position = CGPointMake(kCellSize.width/2, kCellSize.height/2);
        dateLabel.frame = CGRectMake(20, 20, 100, 40);
        maxLabel.frame = CGRectMake(kCellSize.width - 120, 20, 100, 40);
        minLabel.frame = CGRectMake(kCellSize.width - 120, 50, 100, 40);
        descriptionLabel.frame = CGRectMake(20, 45, 200, 40);
        
//        FCAnimation().performAnimation(self.weatherImageView, duration: 0.5, delay: 0.8, type: .FadeIn)
//        FCAnimation().performAnimation(self.descriptionLabel, duration: 0.5, delay: 0.4, type: .FadeIn)
//        FCAnimation().performAnimation(self.maxLabel, duration: 0.5, delay: 0.6, type: .FadeIn)
//        FCAnimation().performAnimation(self.minLabel, duration: 0.5, delay: 0.4, type: .FadeIn)
//        FCAnimation().performAnimation(self.dateLabel, duration: 0.5, delay: 0.6, type: .FadeIn)
        
    }
}
