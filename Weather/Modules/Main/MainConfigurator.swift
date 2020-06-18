//
//  MainConfigurator.swift
//  Weather
//
//  Created by Volha Bychok on 15.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

protocol MainConfiguratorProtocol: class {
    func configure(with viewController: MainViewController)
}

final class MainConfigurator: MainConfiguratorProtocol {
    func configure(with viewController: MainViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
