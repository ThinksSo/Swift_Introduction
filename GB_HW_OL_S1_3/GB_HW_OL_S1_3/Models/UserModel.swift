//
//  UserModel.swift
//  GB_HW_OL
//



struct UserModel: Decodable {
    
    var response: [User]
}

struct User: Decodable {
    var firstName: String?
    var lastName: String?
    var photo: String?
    enum Codingkeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo 400 orig"
    }
}
