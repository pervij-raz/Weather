//
//  WeatherResponse.swift
//  Weather
//
//  Created by Volha Bychok on 15.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

struct WeatherResponse: Decodable {
    var list: [CityWeather?]
    
    enum CodingKeys: String, CodingKey {
        case list
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.list = try container.decode([CityWeather?].self, forKey: .list)
    }
}

struct CityWeather: Decodable {
    var name: String?
    var temp: Double?
    var feelsLike: Double?
    var tempMin: Double?
    var tempMax: Double?
    var description: String?
    var icon: String?
    var pressure: Int?
    var humidity: Int?
    var windSpeed: Double?
    
    enum CodingKeys: String, CodingKey {
        case name
        case main
        case weather
        case wind
    }
    
    enum MainCodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case temp
        case feelsLike = "feels_like"
        case pressure
        case humidity
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String?.self, forKey: .name)
        let main = try container.nestedContainer(keyedBy: MainCodingKeys.self, forKey: .main)
        self.tempMin = try main.decode(Double?.self, forKey: .tempMin)
        self.tempMax = try main.decode(Double?.self, forKey: .tempMax)
        self.temp = try main.decode(Double?.self, forKey: .temp)
        self.feelsLike = try main.decode(Double?.self, forKey: .feelsLike)
        self.pressure = try main.decode(Int?.self, forKey: .pressure)
        self.humidity = try main.decode(Int?.self, forKey: .humidity)
        let weather = try container.decode([Weather].self, forKey: .weather)
        self.description = weather.first?.description
        self.icon = weather.first?.icon
        let wind = try container.decode(Wind.self, forKey: .wind)
        self.windSpeed = wind.speed
    }
}

struct Weather: Decodable {
    var description: String?
    var icon: String?
    
    enum CodingKeys: String, CodingKey {
        case description
        case icon
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(String?.self, forKey: .description)
        self.icon = try container.decode(String?.self, forKey: .icon)
    }
}

struct Wind: Decodable {
    var speed: Double?
    
    enum CodingKeys: String, CodingKey {
        case speed
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.speed = try container.decode(Double?.self, forKey: .speed)
    }
}

