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
    var tempMin: Double?
    var tempMax: Double?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case main
        case weather
    }
    
    enum MainCodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
    enum DescriptionCodingKeys: String, CodingKey {
        case description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String?.self, forKey: .name)
        let main = try container.nestedContainer(keyedBy: MainCodingKeys.self, forKey: .main)
        self.tempMin = try main.decode(Double?.self, forKey: .tempMin)
        self.tempMax = try main.decode(Double?.self, forKey: .tempMax)
        let weather = try container.decode([Weather].self, forKey: .weather)
        self.description = weather.first?.description
    }
}

struct Weather: Decodable {
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(String?.self, forKey: .description)
    }
}

