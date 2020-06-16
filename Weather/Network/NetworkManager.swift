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
        URL(string: "http://api.openweathermap.org/data/2.5/box/city?bbox=12,32,15,37,10&appid=0732da88478eabca2216d946d5758695")
    }()
    
    func loadData(handler: @escaping ((Error?) -> ()) ) {
        guard let url = self.url else { return }
        AF.request(url, method: .get).responseData { response in
            switch response.result {
            case let .success(data):
                let weather: WeatherResponse = try! JSONDecoder().decode(WeatherResponse.self, from: data)
                print(weather)
                handler(nil)
            case let .failure(error):
                handler(error)
            }
        }
    }
}
