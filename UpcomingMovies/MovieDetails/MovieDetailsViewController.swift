//
//  MovieDetailsViewController.swift
//  UpcomingMovies
//
//  Created by Joao Paulo Aquino on 14/06/19.
//  Copyright © 2019 Joao Paulo Aquino. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var presenter: MoviePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    func configureView() {
        
        guard let presenter = presenter else {return}
        
        self.movieTitleLabel.text = presenter.title
        self.genreLabel.text = presenter.genreName
        self.overviewLabel.text = presenter.overview
        self.releaseDateLabel.text = presenter.releaseDate
        self.posterImageView.kf.indicatorType = .activity
        self.posterImageView.kf.setImage(with: presenter.imageURLWith(height: 100))
        
    }
}
