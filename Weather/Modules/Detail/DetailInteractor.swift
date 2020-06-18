//
//  DetailInteractor.swift
//  Weather
//
//  Created by Volha Bychok on 18.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

protocol DetailInteractorProtocol: class {
    var forecast: Forecast? { get set }
}

final class DetailInteractor: DetailInteractorProtocol {
    weak var presenter: DetailPresenterProtocol!
    var forecast: Forecast?
    
    required init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
    }
}

