//
//  DetailConfigurator.swift
//  Weather
//
//  Created by Volha Bychok on 18.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

protocol DetailConfiguratorProtocol: class {
    func configure(with viewController: DetailViewController)
}

final class DetailConfigurator: DetailConfiguratorProtocol {
    func configure(with viewController: DetailViewController) {
        let presenter = DetailPresenter(view: viewController)
        let interactor = DetailInteractor(presenter: presenter)
        let router = DetailRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
