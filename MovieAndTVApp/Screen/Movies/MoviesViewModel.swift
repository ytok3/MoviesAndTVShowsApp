//
//  MoviesViewModel.swift
//  MovieAndTVApp
//
//  Created by Yasemin TOK on 5.08.2022.
//

import Foundation

protocol MoviesViewModelProtocol {
    
    func setDelegateMovies(output: MoviesOutput)
    func allMovies()
}

final class MoviesViewModel: MoviesViewModelProtocol {
 
    // - MARK: Properties
    
    var movies: [Movies]? = []
    var services: ServicesProtocol
    var moviesOutput: MoviesOutput?
    
    // - MARK: init
    
    init() {
        services = Services()
    }
    
    // MARK: Func
    
    func setDelegateMovies(output: MoviesOutput) {
        moviesOutput = output
    }
    
    func allMovies() {
        services.topRatedMovies { [weak self] (response) in
            self?.movies = response ?? []
            self?.moviesOutput?.listTopRated(values: self?.movies ?? [])
        } onError: { error in
            print(error)
        }

        services.nowPlayingMovies { [weak self] (response) in
            self?.movies = response ?? []
            self?.moviesOutput?.listNowPlaying(values: self?.movies ?? [])
        } onError: { error in
            print(error)
        }
        
        services.popularMovies { [weak self] (response) in
            self?.movies = response ?? []
            self?.moviesOutput?.listPopular(values: self?.movies ?? [])
        } onError: { error in
            print(error)
        }
    }
}
