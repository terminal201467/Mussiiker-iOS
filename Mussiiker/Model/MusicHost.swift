//
//  MusicHost.swift
//  Mussiiker
//
//  Created by Jhen Mu on 2023/1/11.
//

import Foundation

//MARK: -MusicHost
struct MusicHost: Codable {
    let host: BasicData
    var classRoomArea: Area?
    var classRoomAdress: String?
    var classRoomName: String?
    var contactNumber: [String]?
    var webContact: [String]?
    var hostInfo: HostInfo
    
    struct HostInfo: Codable {
        var instrumentKinds: [String]
        var teachingRoomNumber: Int
        var rentSpendingDescription: [String]
        var teachingRoomPhoto: [String]?
        var isAllowEatOrDrink: Bool
        var isSaleInstruments: Bool
        var saleInstrumentsInHome: [String]
    }
}
