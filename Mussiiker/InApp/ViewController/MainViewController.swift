//
//  MainViewController.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/12.
//

import UIKit

class MainViewController: UITabBarController {
    
    private var controllers: [UIViewController]? = nil
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controllers = [
            UINavigationController(rootViewController: FindTeacherViewController()),
            UINavigationController(rootViewController: NearMusicClassRoomViewController()),
            UINavigationController(rootViewController: FindGroupViewController()),
            UINavigationController(rootViewController: RecentActivityViewController())
        ]
        self.viewControllers = controllers
        setUpTabBar()
    }
    
    private func setUpTabBar() {
        controllers?[0].tabBarItem = UITabBarItem(title: "findTeachers".localized, image: UIImage(named: "magnifyingglass.circle"), selectedImage: nil)
        controllers?[1].tabBarItem = UITabBarItem(title: "findClassRoom".localized, image: UIImage(named: "square.split.bottomrightquarter"), selectedImage: nil)
        controllers?[2].tabBarItem = UITabBarItem(title: "findGroup".localized, image: UIImage(named: "person.3"), selectedImage: nil)
        controllers?[3].tabBarItem = UITabBarItem(title: "recentActivity".localized, image: UIImage(named: "cursorarrow.rays"), selectedImage: nil)
    }
}
