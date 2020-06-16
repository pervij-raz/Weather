//
//  MainInteractor.swift
//  Weather
//
//  Created by Volha Bychok on 15.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import RealmSwift

protocol MainInteractorProtocol: class {
    func loadData(handler: @escaping ((Error?) -> ()))
    var forecasts: Results<Forecast> { get }
}

final class MainInteractor: MainInteractorProtocol {
    weak var presenter: MainPresenterProtocol!
    private let manager = NetworkManager()
    private let realm = try! Realm()
    lazy var forecasts: Results<Forecast> = { self.realm.objects(Forecast.self) }()
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func loadData(handler: @escaping ((Error?) -> ())) {
        manager.loadData(handler: { [weak self] error, data in
            guard let data = data, error == nil else {
                handler(error)
                return
            }
            self?.saveData(data)
            handler(nil)
        })
    }
    
    private func saveData(_ data: WeatherResponse) {
        for weather in data.list {
            guard let name = weather?.name else { return }
            if let forecast = forecasts.filter({ $0.name == name }).first {
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
}
