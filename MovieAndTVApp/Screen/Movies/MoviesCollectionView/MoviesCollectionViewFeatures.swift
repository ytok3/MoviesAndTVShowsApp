//
//  MoviesCollectionViewFeatures.swift
//  MovieAndTVApp
//
//  Created by Yasemin TOK on 4.08.2022.
//

import UIKit


protocol MoviesOutput: AnyObject {
    
    func getHeight() -> CGFloat
    func onSelected(ID: Int)
    func listTRMovies(values: [Movies])
    func listNPMovies(values: [Movies])
    func listPMovies(values: [Movies])
}

class MoviesCollectionViewFeatures: NSObject {
    
    // MARK: Properties
    
    var resultsTopRated: [Movies] = []
    var resultsNowPlaying: [Movies] = []
    var resultsPopular: [Movies] = []
    
    weak var delegate: MoviesOutput?
    
}

// MARK: Extensions

extension MoviesCollectionViewFeatures: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.Identifier.MOVIES_CELL, for: indexPath)
                as? MoviesCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = .systemMint
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let colums: CGFloat = 2
        let collectioViewWith = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (colums - 1)
        let adjustedWith = collectioViewWith - spaceBetweenCells
        let width: CGFloat = floor(adjustedWith / colums)
        let height = (delegate?.getHeight() ?? 300.0 ) / 4
        return CGSize(width: width, height: height)
        
    }
   
}
