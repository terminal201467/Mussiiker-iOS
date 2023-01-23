//
//  MoreTeacherDataBase.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/21.
//

import Foundation

class MoreTeacherViewModel {
    //MARK: -Parameters
    public var requestDataType: TeacherDataType
    
    public var isCollected: Bool = false {
        didSet {
            print("isCollected")
            updateCollected()
        }
    }
    
    private var teachers: [Teacher] = []
    
    init(by type: TeacherDataType) {
        self.requestDataType = type
    }
    
    //MARK: -Network
    func loadData() -> [Teacher] {
        return self.teachers
    }
    
    func updateCollected() {
        
    }
    
    //MARK: -TableView
    
    func numberOfRowsInSection(_ section: Int) -> Int {
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
    
    func cellForRowAt(_ indexPath: IndexPath) -> Teacher {
        return teachers[indexPath.row]
    }
    
    
}
