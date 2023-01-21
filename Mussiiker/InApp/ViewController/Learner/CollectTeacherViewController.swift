//
//  CollectTeacherViewController.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/13.
//

import UIKit
import SnapKit

class CollectTeacherViewController: UIViewController {
    
    @IBOutlet private var socialMenuSelector: UISegmentedControl!
    @IBOutlet private var pageContainerView: UIView!
    private var talkBoxBarButton: UIBarButtonItem!
    private var pageViewController: UIPageViewController!

    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        setPageViewController()
        setSegmentedSelector()
    }
    
    private func setNavigationBar() {
        title = "collectTeacher".localized
        talkBoxBarButton = UIBarButtonItem(image: UIImage(named: "tray.fill"), style: .plain, target: self, action: #selector(toChatBox))
        navigationItem.rightBarButtonItem = talkBoxBarButton
    }
    
    private func setSegmentedSelector() {
        socialMenuSelector = UISegmentedControl()
    }
    
    private func setPageViewController() {
        pageViewController = UIPageViewController()
        pageContainerView.addSubview(pageViewController.view)
        addChild(pageViewController)
        pageContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func toChatBox() {
        //to the ChatViewController
    }

}
