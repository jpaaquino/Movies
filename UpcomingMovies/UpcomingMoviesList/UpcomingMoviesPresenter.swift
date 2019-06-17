//
//  UpcomingMoviesPresenter.swift
//  UpcomingMovies
//
//  Created by Joao Paulo Aquino on 15/06/19.
//  Copyright © 2019 Joao Paulo Aquino. All rights reserved.
//

import UIKit

class UpcomingMoviesPresenter {
    
    private let networkResponse:MoviesResponse
    
    var movies: [Movie] {
        return Movies.list
    }
    var genresList: [Genre] {
        return Genres.list
    }
    var selectedMovie: Movie?
    
    var delegate: UpcomingMoviesDelegate?
    
    init(networkResponse:MoviesResponse){
        self.networkResponse = networkResponse
    }
    
    let barTintColor = UIColor.blueTheme
    let navBarTintColor = UIColor.white
    let titleColor = UIColor.white
    let title = "Upcoming Movies"
    
    func fetchGenres(completion: @escaping ((GenresResponse) -> Void)) {
        Genres.fetch(completion: { (response) in
            Genres.list = response.genres
            completion(response)
            })
    }
    
    func fetchMovies(page: Int, completion: @escaping ((MoviesResponse) -> Void)) {
        Movies.fetch(page: page, completion: { (response) in
            Movies.list = response.movies ?? []
            completion(response)
        })
    }

}
