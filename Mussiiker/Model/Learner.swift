//
//  Model.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/11.
//

import Foundation

//MARK: -LearnerData
struct Learner: Codable {
    
    let basicData: BasicData
    let learningHistory: LearningHistory
    
    //MARK: -LearningHistory
    struct LearningHistory: Codable {
        var isExperienceWithInstrument: Bool
        var isExperienceWithInstrumentString: String {
            return isExperienceWithInstrument ? "有經驗" : "沒有經驗"
        }
        var learningExperienceAge: Int?
        var WannaLearnInstrument: [String]?
        var experienceLearnInstrument: [String]?
        var instrumentAging: Double
        var everAttendGroup: Bool
    }
    
    struct LearningStyle: Codable {
        var learningStyle: [LearningType]
        var hopeLearningSpendingPerHour: Int?
        var hopeLearningArea: [Area]
        var hopeLearningLocation: [String]
        var acceptRemoteLearning: Bool
        var acceptRemoteLearningString: String {
            return acceptRemoteLearning ? "可以接受遠端教學" : "希望見面教學"
        }
        var teacherGender: Gender
        var learningReson: String?
    }
}

enum LearningType: Int, CaseIterable, Codable {
    case learnBySelf = 0, teamLearning, oneByOne, limitedPeople
    var learnerStyle: String {
        switch self {
        case .learnBySelf:  return "自己學習"
        case .teamLearning: return "團體學習"
        case .oneByOne:     return "一對一教學"
        case .limitedPeople:return "限制人數"
        }
    }
}



