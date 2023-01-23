//
//  TeacherDetailViewController.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/22.
//

import UIKit

class TeacherDetailViewController: UIViewController {
    
    public var teacherDataParameter: String
    
    init(by parameter: String) {
        self.teacherDataParameter = parameter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    private func setNavigationBar() {
        
    }

}
