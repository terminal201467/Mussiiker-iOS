//
//  CollectedTeacherViewController.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/24.
//

import UIKit

class CollectedTeacherViewController: UIViewController {
    
    typealias User = String
    typealias isContacted = Bool
    
    var collectOrContactViewModel: CollectionListViewModel!
    
    @IBOutlet var teacherInfoTable: UITableView!
    
    var isContacted: isContacted = false
    
    init(user: User, isContacted: isContacted) {
        collectOrContactViewModel = CollectionListViewModel(user: user, isContacted: isContacted)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setTableView() {
        teacherInfoTable.delegate = self
        teacherInfoTable.dataSource = self
    }
    
    
    
}

extension CollectedTeacherViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        collectOrContactViewModel.numberOfRowInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectedOrContactedTableViewCell.identifier, for: indexPath) as! CollectedOrContactedTableViewCell
        cell.configure(info: collectOrContactViewModel.cellForRowAt(indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.isContacted {
            //push to the chatPage
            print("to chat page")
            let chatViewController = ChatViewController()
            navigationController?.pushViewController(chatViewController, animated: true)
        } else {
            //present the teacherInfo page
            print("to teacherInfo page")
            let teacherDetailViewController = TeacherDetailViewController(by: collectOrContactViewModel.didSelectRowAt(indexPath))
            present(teacherDetailViewController, animated: true, completion: nil)
        }
    }
    
}
