//
//  PhotosModel.swift
//  GB_HW_OL_S1_3
//
//  Created by OL on 20.08.2023.
//


struct PhotosModel: Decodable {
    var response: Photos
}

struct Photos: Decodable {
    var items: [Photo]
}

struct Photo: Decodable {
    var id: Int
    var text: String?
    var sizes: [Sizes]
}

struct Sizes: Codable {
    var url: String
}
