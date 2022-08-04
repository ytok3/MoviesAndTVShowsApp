//
//  Services.swift
//  MovieAndTVApp
//
//  Created by Yasemin TOK on 29.07.2022.
//

import Foundation
import Alamofire

protocol ServicesProtocol {
    
    func topRatedMovies(onSuccess: @escaping ([Movies]?) -> Void, onError: @escaping (AFError) -> Void)
    func nowPlayingMovies(onSuccess: @escaping ([Movies]?) -> Void, onError: @escaping (AFError) -> Void)
    func popularMovies(onSuccess: @escaping ([Movies]?) -> Void, onError: @escaping (AFError) -> Void)
}

final class Services: ServicesProtocol {

    // MARK: Func
    
    func topRatedMovies(onSuccess: @escaping ([Movies]?) -> Void, onError: @escaping (AFError) -> Void) {
        
        ServiceManager.shared.fetch(
            path: Constant.Network.BASE_URL + Constant.Firebase.TOP_RATED + Constant.Network.API_KEY,
            data: nil,
            method: HTTPMethod.get
        ) { (response: MoviesList) in
            onSuccess(response.results)
            print(response)
        } onError: { error in
            onError(error)
            print(error)
        }
    }
    
    func nowPlayingMovies(onSuccess: @escaping ([Movies]?) -> Void, onError: @escaping (AFError) -> Void) {
        
        ServiceManager.shared.fetch(
            path: Constant.Network.BASE_URL + Constant.Firebase.NOW_PLAYING + Constant.Network.API_KEY,
            data: nil,
            method: HTTPMethod.get
        ) { (response: MoviesList) in
            onSuccess(response.results)
            print(response)
        } onError: { error in
            onError(error)
            print(error)
        }
    }
    
    func popularMovies(onSuccess: @escaping ([Movies]?) -> Void, onError: @escaping (AFError) -> Void) {
        
        ServiceManager.shared.fetch(
            path: Constant.Network.BASE_URL + Constant.Firebase.POPULAR + Constant.Network.API_KEY,
            data: nil,
            method: HTTPMethod.get
        ) { (response: MoviesList) in
            onSuccess(response.results)
            print(response)
        } onError: { error in
            onError(error)
            print(error)
        }
    }
}
