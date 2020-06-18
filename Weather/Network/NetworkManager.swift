//
//  NetworkManager.swift
//  Weather
//
//  Created by Volha Bychok on 15.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import Alamofire

class NetworkManager {
    
    private var url: URL? = {
        URL(string: "http://api.openweathermap.org/data/2.5/box/city?bbox=10,32,15,37,150&appid=0732da88478eabca2216d946d5758695")
    }()
    
    func loadData(handler: @escaping ((Error?, WeatherResponse?) -> ()) ) {
        guard let url = self.url else { return }
        AF.request(url, method: .get).responseData { response in
            switch response.result {
            case let .success(data):
                let weather: WeatherResponse = try! JSONDecoder().decode(WeatherResponse.self, from: data)
                handler(nil, weather)
            case let .failure(error):
                handler(error, nil)
            }
        }
    }
}
