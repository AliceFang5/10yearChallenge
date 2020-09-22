//
//  flickrUrl.swift
//  10yearChallenge
//
//  Created by 方芸萱 on 2020/8/21.
//

import Foundation

struct Photo: Decodable {
   let farm: Int
   let secret: String
   let id: String
   let server: String
   let title: String
   var imageUrl: URL {
      return URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg")!
   }
}
struct PhotoData: Decodable {
   let photo: [Photo]
}
struct SearchData: Decodable {
   let photos: PhotoData
}

struct Song{
    let title:String
    let artist:String
    var formattedTitle:String{
        return "\(title) by \(artist)"
    }
}
