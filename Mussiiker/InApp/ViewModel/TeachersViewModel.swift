//
//  TeachersViewModel.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/15.
//

import Foundation

enum DataType: String {
    case recommend, stringInstrument, drums, woodWind, brassInstrument, otherkinds
}

//Singleton
class TeacherDataModel {
    //MARK: -Parameters
    var requestDataType: DataType
    
    //MARK: -StoreData
    private var teachers: [Teacher] = []
    
    //MARK: -Value Passing Closure
    var click: ((Int)->(Void))?
    
    //MARK: -Initailization
    init (by dataType: DataType) {
        self.requestDataType = dataType
    }
    
    //MARK: -Network
    public func loadData() -> [Teacher] {
        return teachers
    }
    
    public func postData() {
        
    }
    
    public func loadSpecificData() {
        
    }
    
    //MARK: - CRUD functions
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
            do{
                return try loadData().count
            }catch{
                print(ErrorState.isEmpty)
            }
        } else {
            return teachers.count
        }
    }
    
    public func cellForItemsAtSection(_ indexPath: IndexPath) -> Teacher {
        return teachers[indexPath.row]
    }
    
    
    
}
