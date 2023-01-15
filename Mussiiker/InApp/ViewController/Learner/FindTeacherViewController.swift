//
//  FindTeacherViewController.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/12.
//

import UIKit

class FindTeacherViewController: UIViewController {
    
    @IBOutlet var settingBarButton: UIBarButtonItem!
    @IBOutlet var alreadyCollectBarButton: UIBarButtonItem!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    private func setUpNavigationBar() {
        title = "findTeachers".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }


    

}
