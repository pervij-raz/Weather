//
//  MainPresenter.swift
//  Weather
//
//  Created by Volha Bychok on 15.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

protocol MainPresenterProtocol: class {
    func configureView()
    var forecasts: [Forecast] { get }
}

final class MainPresenter: MainPresenterProtocol {
    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var forecasts: [Forecast] {
        interactor.forecasts.sorted { $0.name < $1.name }
    }
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    func configureView() {
        interactor.loadData(handler: { [weak self] error in
            guard let error = error else {
                self?.view.updateCollectionView()
                return
            }
            self?.view.showError(error: error)
        })
    }
}
