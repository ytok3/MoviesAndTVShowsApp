//
//  MainCollectionViewCell.swift
//  MovieAndTVApp
//
//  Created by Yasemin TOK on 4.08.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    private var moviesCollectionViewFeatures: MoviesCollectionViewFeatures = MoviesCollectionViewFeatures()
    lazy var moviesViewModel: MoviesViewModelProtocol = MoviesViewModel()
    
    // MARK: View
    
    var kindLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: Constant.Identifier.MOVIES_CELL)
        return collectionView
    }()
    
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.layer.cornerRadius = 5
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.white.cgColor
    
        setUpDelegate()
    }
    
    // MARK: Func
    
    func setUpDelegate() {
        
        collectionView.delegate = moviesCollectionViewFeatures
        collectionView.dataSource = moviesCollectionViewFeatures
        
        moviesCollectionViewFeatures.delegate = self
        
        moviesViewModel.setDelegateMovies(output: self)
        moviesViewModel.allMovies()
        
        configureCells()
    }
    
    func configureCells() {
        
        contentView.addSubview(kindLabel)
        contentView.addSubview(collectionView)
        
        moviesCollectionViewFeatures.title = kindLabel.text ?? " "
        
        configureCellsConstraint()
    }
    
    func configureCellsConstraint() {
        
        let padding: CGFloat = 4
        
        NSLayoutConstraint.activate([
        
            kindLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            kindLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            kindLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: kindLabel.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: Extensions

extension MainCollectionViewCell: MoviesOutput {
    
    func getHeight() -> CGFloat {
        return contentView.bounds.height * 3.5
    }
    
    func onSelected(ID: Int) {
        print(" ")
    }
    
    func listTopRated(values: [Movies]) {
        moviesCollectionViewFeatures.topRated = values
        collectionView.reloadData()
    }
    
    func listNowPlaying(values: [Movies]) {
        moviesCollectionViewFeatures.nowPlaying = values
        collectionView.reloadData()
    }
    
    func listPopular(values: [Movies]) {
        moviesCollectionViewFeatures.popular = values
        collectionView.reloadData()
    }
}

