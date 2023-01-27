//
//  CollectionListViewController.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/24.
//

import UIKit

enum Menu: Int, CaseIterable {
    case collect = 0, contact
    var text: String {
        switch self {
        case .collect: return "collected".localized
        case .contact: return "contacted".localized
        }
    }
}

class CollectionListViewController: UIViewController {

    @IBOutlet var collectOrContactMenu: UISegmentedControl!
    
    @IBOutlet var pageViewContainerView: UIView!
    
    private var pageViewController: UIPageViewController!
    
    private var viewControllers: [UIViewController] = [CollectedTeacherViewController(user: "", isContacted: false),CollectedTeacherViewController(user: "", isContacted: true)]
    
    private var currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setCollectOrContactMenu()
        setPageViewController()
        // Do any additional setup after loading the view.
    }


    private func setPageViewController() {
        pageViewContainerView.addSubview(pageViewController.view)
        addChild(pageViewController)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
        pageViewContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setCollectOrContactMenu() {
        collectOrContactMenu = UISegmentedControl(items:Menu.allCases)
        collectOrContactMenu.selectedSegmentIndex = currentPage
        collectOrContactMenu.tintColor = .white
        collectOrContactMenu.backgroundColor = .gray
        collectOrContactMenu.addTarget(self, action: #selector(onChanged), for: .valueChanged)
    }
    
    private func setPreloadPageViewController(_ currentPage: Int) -> UIViewController? {
        if currentPage < 0 || currentPage > 1 {
            return nil
        } else {
            return viewControllers[currentPage]
        }
    }
    
    @objc private func onChanged(sender: UISegmentedControl) {
        let menu = Menu(rawValue: sender.selectedSegmentIndex)
        switch menu {
        case .collect: currentPage = 0
        case .contact: currentPage = 1
        case .none: print("none")
        }
    }

}

extension CollectionListViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return setPreloadPageViewController(currentPage - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return setPreloadPageViewController(currentPage + 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished {
            print("Animated Finished")
            //if change viewController animated done, there is somthing happend
        }
    }
    
}
