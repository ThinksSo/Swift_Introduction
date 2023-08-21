//
//  FriendsModel.swift
//  GB_HW_OL_S1_3
//
//  Created by OL on 20.08.2023.
//

struct FriendsModel: Decodable {
    var response: Friends
}

struct Friends: Decodable {
    var items: [Friend]
}

struct Friend: Decodable {
    var id: Int
    var firstName: String?
    var lastName: String?
    var photo: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last name"
        case photo = "photo_400"
    }
}
