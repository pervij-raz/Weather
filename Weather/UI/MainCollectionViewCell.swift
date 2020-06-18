//
//  MainCollectionViewCell.swift
//  Weather
//
//  Created by Volha Bychok on 15.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

import UIKit
import AlamofireImage

final class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(with data: Forecast) {
        cityLabel.text = data.name
        minTempLabel.text = "\(Int(data.minTemp.rounded()))°C"
        maxTempLabel.text = "\(Int(data.maxTemp.rounded()))°C"
        descriptionLabel.text = data.forecastDescription
        if let url = data.iconURL {
            imageView.af.setImage(withURL: url)
        }
    }
}
