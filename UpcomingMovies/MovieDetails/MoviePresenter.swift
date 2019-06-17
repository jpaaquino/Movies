//
//  MoviePresenter.swift
//  UpcomingMovies
//
//  Created by Joao Paulo Aquino on 16/06/19.
//  Copyright © 2019 Joao Paulo Aquino. All rights reserved.
//

import Foundation

class MoviePresenter {
    
    private let movie:Movie
    
    init(movie:Movie){
        self.movie = movie
    }
    
    var overview: String? {
        return movie.overview
    }
    
    var title: String? {
        return movie.title
    }
    
    var genreName: String? {
        if let genreId = movie.genreIDS?.first {
            let genreName = Genres.list.filter {$0.id == genreId}.first?.name
            return genreName
        }
        return nil
    }
    
    var releaseDate: String? {
        return movie.releaseDate
    }
    
    func imageURLWith(height: Int) -> URL? {
        let base = "https://image.tmdb.org/t/p/h\(height)"
        if let posterPath = movie.posterPath {
            return URL(string: "\(base)\(posterPath)")
        }else if let backdropPath = movie.backdropPath {
            return URL(string: "\(base)\(backdropPath)")
        }
        return nil
    }
    
}
