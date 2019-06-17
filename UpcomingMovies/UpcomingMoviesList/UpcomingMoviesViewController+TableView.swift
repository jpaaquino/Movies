//
//  UpcomingMoviesViewController+TableView.swift
//  UpcomingMovies
//
//  Created by Joao Paulo Aquino on 16/06/19.
//  Copyright © 2019 Joao Paulo Aquino. All rights reserved.
//

import UIKit

extension UpcomingMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MovieTableViewCell
        let movie = presenter.movies[indexPath.row]
        let moviePresenter = MoviePresenter(movie: movie)
        cell.configure(with: moviePresenter)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectedMovie = presenter.movies[indexPath.row]
        self.performSegue(withIdentifier: "MovieDetailsViewController", sender: nil)
    }
    
}
