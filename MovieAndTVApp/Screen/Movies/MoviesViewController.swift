//
//  MoviesViewController.swift
//  MovieAndTVApp
//
//  Created by Yasemin TOK on 28.07.2022.
//

import UIKit

final class MoviesViewController: UIViewController {
    
    private var mainCollectionViewCell: MainCollectionViewCell = MainCollectionViewCell()
    
    
    // MARK: View

    private let moviesKind: [String] = [Constant.Kind.TOP_RATED , Constant.Kind.NOW_PLAYING, Constant.Kind.POPULAR]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: Constant.Identifier.MAIN_CELL)
        return collectionView
    }()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        

        setUpDelegate()
    }
    
    // MARK: Func
    
    func setUpDelegate() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setUpView()
    }
    
    func setUpView() {
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        setUpConstraint()
    }
    
    private func setUpConstraint() {
        
        let padding: CGFloat = 4
        
        NSLayoutConstraint.activate([
    
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding)

        ])
    }
}

extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.Identifier.MAIN_CELL, for: indexPath)
                as? MainCollectionViewCell else { return UICollectionViewCell() }
        cell.kindLabel.text = moviesKind[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height / 3.6)
    }
}

