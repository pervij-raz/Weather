//
//  MainRouter.swift
//  Weather
//
//  Created by Volha Bychok on 18.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import UIKit

protocol MainRouterProtocol: class {
    func openDetail(for forecast: Forecast)
}

class MainRouter: MainRouterProtocol {
    weak var viewController: MainViewController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func openDetail(for forecast: Forecast) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {return}
        detailVC.configurator.configure(with: detailVC)
        detailVC.setForecast(forecast)
        self.viewController.navigationController?.pushViewController(detailVC, animated: true)
    }
}
