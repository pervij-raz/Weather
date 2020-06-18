//
//  MainViewController.swift
//  Weather
//
//  Created by Volha Bychok on 15.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import UIKit
import RealmSwift

protocol MainViewProtocol: class {
    func updateCollectionView()
    func showError(error: Error)
}

final class MainViewController: UIViewController {
    
    // MARK: Properties
    
    var presenter: MainPresenterProtocol!
    private let configurator: MainConfiguratorProtocol = MainConfigurator()
    private let reuseID = "MainCell"
    
    // MARK: UI Components
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cell = UINib(nibName: "MainCollectionViewCell",
                         bundle: nil)
        self.collectionView.register(cell, forCellWithReuseIdentifier: reuseID)
        configurator.configure(with: self)
        presenter.configureView()
    }
}

// MARK: MainViewProtocol

extension MainViewController: MainViewProtocol {
    func updateCollectionView() {
        collectionView.reloadData()
    }
    
    func showError(error: Error) {
        let alertController = UIAlertController(title: "Something went wrong", message: error.localizedDescription, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.forecasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(with: presenter.forecasts[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.openDetails(for: indexPath.row)
    }
}

