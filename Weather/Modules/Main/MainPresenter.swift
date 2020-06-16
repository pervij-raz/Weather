//
//  MainPresenter.swift
//  Weather
//
//  Created by Volha Bychok on 15.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

protocol MainPresenterProtocol: class {
    func configureView()
}

final class MainPresenter: MainPresenterProtocol {
    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    func configureView() {
        interactor.loadData(handler: { error in
        })
    }
}
