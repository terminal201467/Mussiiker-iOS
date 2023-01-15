//
//  TeachersViewModel.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/15.
//

import Foundation

//Singleton
class TeacherDataModel {
    
    static let shared = TeacherDataModel()
    
    private var teachers: [Teacher] = [] {
        didSet {
            
        }
    }
    
    var click: ((Int) -> Int)?
    
    //MARK: -network
    public func loadData() {
        
    }
    
    public func postData() {
        
    }
    
    public func loadSpecificData() {
        
    }
    
    //MARK: - CRUD function
    public func appendTeacherData(by teacher: Teacher) {
        teachers.append(teacher)
    }
    
    public func clearAllData() {
        teachers.removeAll()
    }
    
    public func removeSpecificData(at row: Int) {
        teachers.remove(at: row)
    }
    
    public func appendSpecificData(at row: Int, withTeacher teacher: Teacher) {
        teachers.insert(teacher, at: row)
    }
    
    public func editSpecificData(at row: Int, withTeacher teacher: Teacher) {
        teachers.remove(at: row)
        teachers.insert(teacher, at: row)
    }
    
    //MARK: -CollectionView's custom function
    public func numberOfItemsInSection(_ section: Int) -> Int {
        if teachers.isEmpty {
            fatalError("EmptyData in the teachers Data")
        } else {
            return teachers.count
        }
    }
    
    public func cellForItemsAtSection(_ indexPath: IndexPath) -> Teacher {
        return teachers[indexPath.row]
    }
    
    //MARK: -DataErrors
//    private func judgeTheDataAndRequstAgain() throws -> String {
//
//
//    }
    
    
    
}
