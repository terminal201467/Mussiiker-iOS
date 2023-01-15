//
//  FindTeacherViewController.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/12.
//

import UIKit

class FindTeacherViewController: UIViewController {
    
    //Buttons
    private var settingBarButton: UIBarButtonItem!
    private var alreadyCollectBarButton: UIBarButtonItem!
    private var searchTeacherViewController: SearchTeacherViewController!
    
    @IBOutlet private var recommedTeacherKnowMoreButton: UIButton!
    @IBOutlet private var stringInstrumentKnowMoreButton: UIButton!
    @IBOutlet private var drumKnowMoreButton: UIButton!
    @IBOutlet private var woodWindInstrumentKnowMoreButton: UIButton!
    @IBOutlet private var brassInstrumentKnowMoreButton: UIButton!
    @IBOutlet private var otherKindsKnowMoreButton: UIButton!
    
    //TeachersView
    @IBOutlet private var systemRecommendTeacherView: TeachersView!
    @IBOutlet private var stringInstrumentContainerView: TeachersView!
    @IBOutlet private var drumTeacherContainerView: TeachersView!
    @IBOutlet private var woodWindInstrumentsView: TeachersView!
    @IBOutlet private var brassInstrumentContainerView: TeachersView!
    @IBOutlet private var othersContainerView: TeachersView!
    
    //MARK: -Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavigationBar()
        setKnowMoreButtons()
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
    
    private func setKnowMoreButtons() {
        recommedTeacherKnowMoreButton.setTitle("knowMore".localized, for: .normal)
        stringInstrumentKnowMoreButton.setTitle("knowMore".localized, for: .normal)
        drumKnowMoreButton.setTitle("knowMore".localized, for: .normal)
        woodWindInstrumentKnowMoreButton.setTitle("knowMore".localized, for: .normal)
        brassInstrumentKnowMoreButton.setTitle("knowMore".localized, for: .normal)
        otherKindsKnowMoreButton.setTitle("knowMore".localized, for: .normal)
        
        recommedTeacherKnowMoreButton.addTarget(self, action: #selector(toKnowMorePage), for: .touchDown)
        stringInstrumentKnowMoreButton.addTarget(self, action: #selector(toKnowMorePage), for: .touchDown)
        drumKnowMoreButton.addTarget(self, action: #selector(toKnowMorePage), for: .touchDown)
        woodWindInstrumentKnowMoreButton.addTarget(self, action: #selector(toKnowMorePage), for: .touchDown)
        brassInstrumentKnowMoreButton.addTarget(self, action: #selector(toKnowMorePage), for: .touchDown)
        otherKindsKnowMoreButton.addTarget(self, action: #selector(toKnowMorePage), for: .touchDown)
    }
    
    @objc private func toKnowMorePage() {
        //Need Parameter to initiailization
        searchTeacherViewController = SearchTeacherViewController()
        navigationController?.pushViewController(searchTeacherViewController, animated: true)
    }
    
    @objc private func toCollectionList() {
        let collectTeacherViewController = CollectTeacherViewController()
        navigationController?.pushViewController(collectTeacherViewController, animated: true)
    }

    @objc private func toSettingList() {
        
    }
    

}
