//
//  Weather.swift
//  Weather
//
//  Created by Volha Bychok on 16.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import RealmSwift

class Forecast: Object {
    @objc dynamic var name = ""
    @objc dynamic var minTemp = 0.0
    @objc dynamic var maxTemp = 0.0
    @objc dynamic var forecastDescription = ""
    @objc dynamic var icon = ""
    @objc dynamic var temp = 0.0
    @objc dynamic var feelsLike = 0.0
    @objc dynamic var pressure = 0
    @objc dynamic var humidity = 0
    @objc dynamic var windSpeed = 0.0
    
    
    var iconURL: URL? {
        URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png")
    }
}
