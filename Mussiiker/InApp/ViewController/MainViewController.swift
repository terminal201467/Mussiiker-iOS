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
//        controllers[0].tabBarItem = UITabBarItem(title: "findTeacher".localized, image: <#T##UIImage?#>, selectedImage: <#T##UIImage?#>)
//        controllers[1].tabBarItem = UITabBarItem(title: "findClassRoom".localized, image: <#T##UIImage?#>, selectedImage: <#T##UIImage?#>)
//        controllers[2].tabBarItem = UITabBarItem(title: "findGroup".localized, image: <#T##UIImage?#>, selectedImage: <#T##UIImage?#>)
//        controllers[3].tabBarItem = UITabBarItem(title: "recentActivity".localized, image: <#T##UIImage?#>, selectedImage: <#T##UIImage?#>)
    }
    
    //RecentActivityViewController
       //CollectionView(近期活動資訊）
       //TableView(依照使用者有興趣的部分）
       
       //右上方也許會有個鍵：找不到有興趣的活動嗎?
       //點擊之後進到搜尋頁面

}
