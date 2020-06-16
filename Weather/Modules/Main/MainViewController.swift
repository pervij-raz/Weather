//
//  MainViewController.swift
//  Weather
//
//  Created by Volha Bychok on 15.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import UIKit

protocol MainViewProtocol: class {
    
}

final class MainViewController: UIViewController, MainViewProtocol {
    
    // MARK: Properties
    
    var presenter: MainPresenterProtocol!
    private let configurator: MainConfiguratorProtocol = MainConfigurator()
    private let reuseID = "MainCell"
    
    // MARK: UI Components
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        let cell = UINib(nibName: "MainCollectionViewCell",
                                  bundle: nil)
        self.collectionView.register(cell, forCellWithReuseIdentifier: reuseID)
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

