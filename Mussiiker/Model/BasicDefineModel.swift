//
//  BasicDefineModel.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/11.
//

import Foundation

//MARK: -BasicData
struct BasicData: Codable {
    var name: String
    var age: Int
    var gender: Gender
    var birthDay: Date?
    var profession: String?
}

enum Gender: Int ,Codable {
    case male = 0, female, thirdSex
    var text: String {
        switch self {
        case .male: return "男性"
        case .female: return "女性"
        case .thirdSex: return "其他"
        }
    }
}

enum Area: Int ,CaseIterable, Codable {
    case north = 0, middle, east, south, rural
    var areaString: String {
        switch self {
        case .north: return "北部"
        case .middle: return "中部"
        case .east: return "東部"
        case .south: return "南部"
        case .rural: return "偏鄉"
        }
    }
}
