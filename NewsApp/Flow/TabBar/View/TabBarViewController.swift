//
//  ViewController.swift
//  NewsApp
//
//  Created by саргашкаева on 18.07.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    
    // MARK: - Property
    
    let usersVC = UINavigationController(rootViewController: UsersViewController())
    let postsVC = UINavigationController(rootViewController: PostsViewController())
    
    
    // MARK: - Lifecycle VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Congigure
    
    private func configureUI() {
        postsVC.title = "All posts"
        usersVC.title = "All users"
        
        tabBar.tintColor = .systemBlue
        
        assignVC()
        setImages()
    }
    
    private func assignVC() {
        setViewControllers([postsVC, usersVC], animated: true)
    }
    
    private func setImages() {
        guard let items = self.tabBar.items else {return}
        let images = ["paperplane", "person"]
        for i in 0...images.count-1 {
            items[i].image = UIImage(systemName: images[i])
        }
    }
}

