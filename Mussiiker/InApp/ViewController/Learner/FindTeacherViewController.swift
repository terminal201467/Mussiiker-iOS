//
//  FindTeacherViewController.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/12.
//

import UIKit

class FindTeacherViewController: UIViewController {
    
    private var settingBarButton: UIBarButtonItem!
    private var alreadyCollectBarButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        title = "findTeachers".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor:UIColor.black]
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        alreadyCollectBarButton = UIBarButtonItem(image: UIImage(named: "bookmark.fill"), style: .plain, target: self, action: #selector(toCollectionList))
        settingBarButton = UIBarButtonItem(image: UIImage(named: "list.dash"), style: .plain, target: self, action: #selector(toSettingList))
        navigationItem.leftBarButtonItem = settingBarButton
        navigationItem.rightBarButtonItem = alreadyCollectBarButton
        
    }
    
    
    @objc private func toCollectionList() {
        let collectTeacherViewController = CollectTeacherViewController()
        navigationController?.pushViewController(collectTeacherViewController, animated: true)
    }

    @objc private func toSettingList() {
        
    }
    

}
