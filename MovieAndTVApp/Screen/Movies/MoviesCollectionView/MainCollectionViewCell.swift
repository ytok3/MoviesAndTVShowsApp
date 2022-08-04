//
//  MainCollectionViewCell.swift
//  MovieAndTVApp
//
//  Created by Yasemin TOK on 4.08.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    // MARK: View
    
    private let kindLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.text = "Top Rated Movies"
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .green
        //collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: Constant.Identifier.MOVIES_CELL)
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
        let margins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.layer.cornerRadius = 5
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.black.cgColor
        
        configureCells()
    }
    
    // MARK: Func
    
    func configureCells() {
        
        contentView.addSubview(kindLabel)
        contentView.addSubview(collectionView)
        
        configureCellsConstraint()
    }
    
    func configureCellsConstraint() {
        
        let padding: CGFloat = 4
        
        NSLayoutConstraint.activate([
        
            kindLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            kindLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            kindLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: kindLabel.bottomAnchor,constant: padding),

        ])
    }
}
