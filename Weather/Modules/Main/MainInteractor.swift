//
//  MainInteractor.swift
//  Weather
//
//  Created by Volha Bychok on 15.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import RealmSwift

protocol MainInteractorProtocol: class {
    func loadData(handler: @escaping ((Error?, WeatherResponse?) -> ()))
}

final class MainInteractor: MainInteractorProtocol {
    weak var presenter: MainPresenterProtocol!
    private let manager = NetworkManager()
    private let realm = try! Realm()
    private lazy var forecasts: Results<Forecast> = { self.realm.objects(Forecast.self) }()
    
    func loadData(handler: @escaping ((Error?, WeatherResponse?) -> ())) {
        manager.loadData(handler: { [weak self] error, data in
            guard let data = data else {
                // show error
                return
            }
            self?.saveData(data)
            handler(error, data)
        })
    }
    
    private func saveData(_ data: WeatherResponse) {
        for weather in data.list {
            guard let name = weather?.name else { return }
            if let forecast = forecasts.filter { $0.name == name }.first {
                try? realm.write() {
                    forecast.minTemp = weather?.tempMin ?? 0
                    forecast.maxTemp = weather?.tempMax ?? 0
                    forecast.forecastDescription = weather?.description ?? ""
                }
            } else {
                try? realm.write() {
                    let forecast = Forecast()
                    forecast.name = weather?.name ?? ""
                    forecast.minTemp = weather?.tempMin ?? 0
                    forecast.maxTemp = weather?.tempMax ?? 0
                    forecast.forecastDescription = weather?.description ?? ""
                    self.realm.add(forecast)
                }
            }
        }
    }
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    
}
