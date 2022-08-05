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
    func listTopRated(values: [Movies])
    func listNowPlaying(values: [Movies])
    func listPopular(values: [Movies])
}

class MoviesCollectionViewFeatures: NSObject {
    
    // MARK: Properties
    
    var topRated: [Movies] = []
    var nowPlaying: [Movies] = []
    var popular: [Movies] = []
    
    var title: String = ""
    
    weak var delegate: MoviesOutput?
    
}

// MARK: Extensions

extension MoviesCollectionViewFeatures: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch title {
            
        case Constant.Kind.TOP_RATED:
            return topRated.count
        case Constant.Kind.NOW_PLAYING:
            return nowPlaying.count
        case Constant.Kind.POPULAR:
            return popular.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.Identifier.MOVIES_CELL,
            for: indexPath) as? MoviesCollectionViewCell
        else { return UICollectionViewCell() }
        
        switch title {
            
        case Constant.Kind.TOP_RATED:
            cell.saveMovies(model: topRated[indexPath.row])
            return cell
        case Constant.Kind.NOW_PLAYING:
            cell.saveMovies(model: nowPlaying[indexPath.row])
            return cell
        case Constant.Kind.POPULAR:
            cell.saveMovies(model: popular[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
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
