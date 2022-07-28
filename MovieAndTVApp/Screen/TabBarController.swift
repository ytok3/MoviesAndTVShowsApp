//
//  TabBarController.swift
//  MovieAndTVApp
//
//  Created by Yasemin TOK on 28.07.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setUpVCs()
    }
    
    func setUpVCs() {
        viewControllers = [
            createNavController(for: MoviesViewController(), title: NSLocalizedString("Movies", comment: ""),
                                   image: UIImage(systemName: "film.fill")!),
            createNavController(for: TVShowsViewController(), title: NSLocalizedString("TV Shows", comment: ""),
                                   image: UIImage(systemName: "tv.fill")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
    

}
