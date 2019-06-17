//
//  Movies.swift
//  UpcomingMovies
//
//  Created by Joao Paulo Aquino on 16/06/19.
//  Copyright © 2019 Joao Paulo Aquino. All rights reserved.
//

import Foundation

class Movies {
    
    static var list: [Movie] = []
    
    static func fetch(page: Int, completion: @escaping ((MoviesResponse) -> Void)){
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=1f54bd990f1cdfb230adb312546d765d&language=en-US&page=\(page)")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(MoviesResponse.self, from: data)
                completion(result)

            } catch {
                print("Error fetching movies: \(error)")
            }
        }
        
        task.resume()
    }
}
