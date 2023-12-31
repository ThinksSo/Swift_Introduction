//
//  FriendsModel.swift
//  GB_HW_OL
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
    var online: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last name"
        case photo = "photo_400_orig"
        case online
    }
}


