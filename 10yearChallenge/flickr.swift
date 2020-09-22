//
//  flickr.swift
//  10yearChallenge
//
//  Created by 方芸萱 on 2020/8/21.
//

import Foundation

struct Media: Decodable {
   let m: URL
}
struct Item: Decodable {
   let title: String
   let media: Media
}
struct FeedData: Decodable {
   let items: [Item]
}

//flickr API key
/*
The App Garden
Create an App API Documentation Feeds What is the App Garden?
Done! Here's the API key and secret for your new app:

    10YearChallenge
Key:
601f629301937693059c425f165d0077

Secret:
86be0735ec199bd7

Edit app details - Edit auth flow for this app - View all Apps by You

 https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=601f629301937693059c425f165d0077&text=Emma+Watson&per_page=20&max_upload_date=2009-12-31%2023:59:59&min_upload_date=2009-01-01%2000:00:00&format=json&nojsoncallback=1
 
https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg
https://farm5.staticflickr.com/4001/4232131289_d3a9ed71e9_m.jpg
https://farm3.staticflickr.com/2601/4220954304_184ac41dde_m.jpg

{"id":"4232131289","owner":"44182428@N05","secret":"d3a9ed71e9","server":"4001","farm":5,"title":"emma watson","ispublic":1,"isfriend":0,"isfamily":0},
*/
