//
//  CollectionListViewModel.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/24.
//

import Foundation


class CollectionListViewModel {
    
    typealias User = String
    typealias isContacted = Bool
    
    public var user: User
    
    public var isContacted: isContacted
    
    private var collectedTeachers: [Teacher] = []
    
    //probably empty
    private var contactedTeachers: [Teacher] = []
    
    init(user withUser: User, isContacted isContacted: isContacted) {
        self.user = withUser
        self.isContacted = isContacted
    }

    
    //MARK: -Network
    func loadData(user: User, isContacted: isContacted){
        
        
    }
    
    func removeCollected() {
        
    }
    
    //MARK: -collectedTeachers
    func numberOfRowInSection(_ section: Int) -> Int {
        return self.isContacted ? contactedTeachers.count : collectedTeachers.count
    }
    
    func cellForRowAt(_ indexPath: IndexPath) -> Teacher {
        return self.isContacted ? contactedTeachers[indexPath.row] : collectedTeachers[indexPath.row]
    }
    
    func didSelectRowAt(_ indexPath: IndexPath) -> Teacher {
        return self.isContacted ? contactedTeachers[indexPath.row] : collectedTeachers[indexPath.row]
    }
    
}
