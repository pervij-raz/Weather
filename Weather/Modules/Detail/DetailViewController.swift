//
//  DetailViewController.swift
//  Weather
//
//  Created by Volha Bychok on 18.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import UIKit

protocol DetailViewProtocol: class {
    func setForecast(_ forecast: Forecast)
    func setup(with data: Forecast)
}

class DetailViewController: UIViewController {
    
    // MARK: Properties
    
    var presenter: DetailPresenterProtocol!
    let configurator: DetailConfiguratorProtocol = DetailConfigurator()
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.configureView()
    }
    
    // MARK: Methods
    
    func setup(with data: Forecast) {
        cityLabel.text = data.name
        tempLabel.text = "\(data.temp) °C"
        feelsLikeLabel.text = "\(data.feelsLike) °C"
        pressureLabel.text = "\(data.pressure) hPa"
        humidityLabel.text = "\(data.humidity) %"
        windLabel.text = "\(data.windSpeed) km/h"
    }
}

// MARK: DetailViewProtocol

extension DetailViewController: DetailViewProtocol {
    func setForecast(_ forecast: Forecast) {
        presenter.forecast = forecast
    }
}
