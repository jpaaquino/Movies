//
//  NetworkResponse.swift
//  UpcomingMovies
//
//  Created by Joao Paulo Aquino on 13/06/19.
//  Copyright © 2019 Joao Paulo Aquino. All rights reserved.
//

import Foundation

struct MoviesResponse: Codable {
    let movies: [Movie]? 
    let page, totalResults: Int?
    let dates: Dates?
    let totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case dates
        case totalPages = "total_pages"
        case movies = "results"
    }
}
