//
//  DetailPresenter.swift
//  Weather
//
//  Created by Volha Bychok on 18.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

protocol DetailPresenterProtocol: class {
    func configureView()
    var forecast: Forecast? { get set }
    var router: DetailRouterProtocol! { set get }
}

final class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol!
    var interactor: DetailInteractorProtocol!
    var router: DetailRouterProtocol!
    var forecast: Forecast? {
        get {
        interactor.forecast
        }
        set {
            interactor.forecast = newValue
        }
    }
    
    required init(view: DetailViewProtocol) {
        self.view = view
    }
    
    func configureView() {
        guard let forecast = forecast else { return }
        view.setup(with: forecast)
    }
    
    func closeDetail() {
        router.closeDetail()
    }
}
