//
//  MainInteractor.swift
//  Weather
//
//  Created by Volha Bychok on 15.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

protocol MainInteractorProtocol: class {
    func loadData(handler: @escaping ((Error?) -> ()))
}

final class MainInteractor: MainInteractorProtocol {
    weak var presenter: MainPresenterProtocol!
    private let manager = NetworkManager()
    
    func loadData(handler: @escaping ((Error?) -> ())) {
        manager.loadData(handler: handler)
    }
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    
}
