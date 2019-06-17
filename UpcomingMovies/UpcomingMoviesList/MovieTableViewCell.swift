//
//  MovieTableViewCell.swift
//  UpcomingMovies
//
//  Created by Joao Paulo Aquino on 14/06/19.
//  Copyright © 2019 Joao Paulo Aquino. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    func configure(with presenter: MoviePresenter) {
        self.titleLabel.text = presenter.title
        self.genreLabel.text = presenter.genreName
        self.yearLabel.text = presenter.releaseDate
        self.posterImageView.kf.indicatorType = .activity
        self.posterImageView.kf.setImage(with: presenter.imageURLWith(height: 60))

    }
    
    
  
}
