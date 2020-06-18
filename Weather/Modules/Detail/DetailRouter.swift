//
//  DetailRouter.swift
//  Weather
//
//  Created by Volha Bychok on 18.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

protocol DetailRouterProtocol: class {
    func closeDetail()
}

class DetailRouter: DetailRouterProtocol {
    weak var viewController: DetailViewController!
    
    init(viewController: DetailViewController) {
        self.viewController = viewController
    }
    
    func closeDetail() {
        viewController.navigationController?.popViewController(animated: true)
    }
}
