//
//  GroupsModel.swift
//  GB_HW_OL_S1_3
//
//  Created by OL on 20.08.2023.
//

struct GroupsModel: Decodable {
    var resconse: Groups
}

struct Groups: Decodable {
    var items: [Group]
}

struct Group: Codable {
    var id: Int
    var name: String?
    var photo: String?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_40"
        case description
    }
}
