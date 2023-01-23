//
//  MoreTeacherViewController.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/21.
//

import UIKit

class MoreTeacherViewController: UIViewController {
    
    @IBOutlet var teacherDetailTable: UITableView!
    
    private var viewModel: MoreTeacherViewModel!
    
    private var teacherDetailViewController: TeacherDetailViewController!
    
    private var detailTeacher: Teacher? = nil
    
    init(by kinds: TeacherDataType) {
        self.viewModel = MoreTeacherViewModel(by: kinds)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTeacher = nil
        setTable()
    }
    
    private func setTable() {
        teacherDetailTable.delegate = self
        teacherDetailTable.dataSource = self
    }
    
    private func pushMoreDetailViewController(by teacher: Teacher) {
        teacherDetailViewController = TeacherDetailViewController(by: teacher)
        navigationController?.pushViewController(teacherDetailViewController, animated: true)
        teacherDetailViewController.toCollect = {
            print("collectTheTeacher")
            //Save the Teacher info into the learner Backend
        }
        teacherDetailViewController.toContact = {
            //turn to the cellPhone
        }
        teacherDetailViewController.toEmail = {
            //turn to Apple Email
        }
    }
    
}

extension MoreTeacherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoreTeacherTableViewCell.identifier, for: indexPath) as! MoreTeacherTableViewCell
        cell.configure(viewModel.cellForRowAt(indexPath))
        cell.toMoreDetail = {
            print("toMoreDetail")
            self.pushMoreDetailViewController(by: self.detailTeacher!)
        }
        cell.collectTeacher = {
            print("collectTeacher")
            self.viewModel.isCollected.toggle()
        }
        return cell
    }
    
    
}
