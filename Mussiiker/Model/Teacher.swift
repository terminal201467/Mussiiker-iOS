//
//  Teacher.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/11.
//

import Foundation

//MARK: -TeacherData
struct Teacher: Codable {
    
    var basic: BasicData
    var teachingHistory: TeachingHistory
    var teachingStyle: TeachingStyle
    
    struct TeachingHistory: Codable {
        var isHadTeachingExperience: Bool
        var teachingAge: Int
    }
    
    struct TeachingStyle: Codable {
        var hopeTeachingSpendingPerHour: Int?
        var hopeTeachingArea: [Area]
        var hopeTeachingLocation: [String]
        var acceptRemoteTeaching: Bool
        var acceptFreeTeaching: Bool
        var acceptRemoteTeachingString: String {
            return acceptRemoteTeaching ? "可以接受遠端教學" : "希望見面教學"
        }
        var teachingType: [TeachingType]
        var isUnderGraduate: Bool
        var hopeLearnGender: Gender
        var teachingReason: TeachingReason
    }
    
}

enum TeachingReason: Int, CaseIterable, Codable {
    case profession = 0, partTime, intership
    var reasonText: String {
        switch self {
        case .profession:   return "全職音樂工作者"
        case .partTime:     return "兼職音樂工作者"
        case .intership:    return "實習教師"
        }
    }
}

enum TeachingType: Int, CaseIterable, Codable {
    case learnBySelf = 0, teamLearning, oneByOne, remoteTeaching
    var type: String {
        switch self {
        case .learnBySelf:    return "遠端學習影片"
        case .teamLearning:   return "團體課程"
        case .oneByOne:       return "一對一教學"
        case .remoteTeaching: return "遠端教學"
        }
    }
    
}
