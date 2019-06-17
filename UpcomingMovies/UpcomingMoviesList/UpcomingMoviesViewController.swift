//
//  ViewController.swift
//  UpcomingMovies
//
//  Created by Joao Paulo Aquino on 13/06/19.
//  Copyright © 2019 Joao Paulo Aquino. All rights reserved.
//

import UIKit
import Kingfisher

protocol UpcomingMoviesDelegate: class {
    func updateCurrentPage()
}

class UpcomingMoviesViewController: UIViewController {
    
    let presenter = UpcomingMoviesPresenter(networkResponse: MoviesResponse(movies: nil, page: nil, totalResults: nil, dates: nil, totalPages: nil))
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentPageLabel: UILabel!
    weak var delegate: UpcomingMoviesDelegate?
    
    var pageControlText: String {
        return "Page \(currentPage)/\(numberOfPages)"
    }
    
    var currentPage = 1 {
        didSet {
            self.updateCurrentPage()
        }
    }
    
    var numberOfPages = 1 {
        didSet {
            self.updateCurrentPage()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchGenresList()
        self.customizeNavBar()
        
    }
    
    func updateCurrentPage() {
        previousButton.isHidden = self.currentPage == 1
        nextButton.isHidden = self.currentPage == self.numberOfPages
        currentPageLabel.text = self.pageControlText
    }
    
    func customizeNavBar() {

        navigationController?.navigationBar.barTintColor = presenter.barTintColor
        navigationController?.navigationBar.tintColor = presenter.navBarTintColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : presenter.titleColor]
        self.title = presenter.title
    }
    
    //MARK: Network
    func fetchGenresList(){
        
        presenter.fetchGenres { (response) in
            
            self.fetchMoviesList(page: 1)
            
        }
    }
    
    func fetchMoviesList(page: Int) {
        presenter.fetchMovies(page: page, completion: { (moviesResponse) in
            DispatchQueue.main.async {
                self.numberOfPages = moviesResponse.totalPages ?? 1
                self.tableView.reloadData()
                let indexPath = IndexPath(row: 0, section: 0)
                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
            }
        })
    }
    
    //MARK: Flow
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MovieDetailsViewController {
            if let movie = presenter.selectedMovie {
                vc.presenter = MoviePresenter(movie: movie)
            }
        }
    }
    
    @IBAction func previousAction(_ sender: UIButton) {
        self.currentPage -= 1
        self.fetchMoviesList(page: self.currentPage)
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        self.currentPage += 1
        self.fetchMoviesList(page: self.currentPage)
    }
}


