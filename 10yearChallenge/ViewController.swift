//
//  ViewController.swift
//  10yearChallenge
//
//  Created by 方芸萱 on 2020/8/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
/*
https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=601f629301937693059c425f165d0077&text=&per_page=20&max_upload_date=2009-12-31%2023:59:59&min_upload_date=2009-01-01%2000:00:00&format=json&nojsoncallback=1

https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=601f629301937693059c425f165d0077&text=&per_page=20&max_upload_date=2009-12-31%2023:59:59&min_upload_date=2009-01-01%2000:00:00&format=json&nojsoncallback=1

{"photos":{"page":1,"pages":3250,"perpage":20,"total":"65000","photo":[{"id":"4233256590","owner":"54601874@N00","secret":"a9c33305ea","server":"2660","farm":3,"title":"DSC_0467","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4233256034","owner":"54601874@N00","secret":"1f42882e93","server":"2688","farm":3,"title":"DSC_0326","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4233255456","owner":"37024174@N00","secret":"5acd53ded4","server":"2661","farm":3,"title":"Sometimes she's not sure she wants to keep posing for me.","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4232476221","owner":"99116376@N00","secret":"6836cb2edf","server":"4002","farm":5,"title":"IMG_0025","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4232467113","owner":"89109423@N00","secret":"f3e2c00cb0","server":"4019","farm":5,"title":"Tepak Sireh Pembuka Kata","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4232464943","owner":"98563730@N00","secret":"582e2a640d","server":"4019","farm":5,"title":"\u7a32\u6bdb\u6d45\u9593\u795e\u793e","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4233232528","owner":"77239986@N00","secret":"9045426563","server":"2540","farm":3,"title":"IMG_7110","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4233231950","owner":"41932652@N06","secret":"8cf965066e","server":"4047","farm":5,"title":"DSC00884","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4232459311","owner":"96689747@N00","secret":"e3d148567b","server":"2615","farm":3,"title":"partial lunar eclipse 2010 RG01012010HDL11","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4232437775","owner":"51035762527@N01","secret":"23b4364426","server":"2712","farm":3,"title":"IMG_0171","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4233208666","owner":"51035762527@N01","secret":"e102ed4be7","server":"2673","farm":3,"title":"IMG_0150","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4232435303","owner":"99116376@N00","secret":"075b89e187","server":"2672","farm":3,"title":"IMG_0002","ispublic":1,"isfriend":0,"isfamily":0},{"id":"2333214519","owner":"14192663@N07","secret":"9b0d95aced","server":"2103","farm":3,"title":"Carron Dam","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4233206428","owner":"99116376@N00","secret":"679d422979","server":"2658","farm":3,"title":"IMG_0001","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4233199034","owner":"98621234@N00","secret":"bbf9467caa","server":"4062","farm":5,"title":"Portrait","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4232421673","owner":"98621234@N00","secret":"d552df1f44","server":"2506","farm":3,"title":"3 Idiots","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4233191644","owner":"51035762527@N01","secret":"90e8d2f49b","server":"2718","farm":3,"title":"DSCF7406","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4233188272","owner":"30946323@N06","secret":"a579e3393c","server":"2670","farm":3,"title":"P1180305.JPG","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4232409119","owner":"71808974@N00","secret":"79573de91a","server":"2532","farm":3,"title":"Arief","ispublic":1,"isfriend":0,"isfamily":0},{"id":"4232398373","owner":"74595729@N00","secret":"2d92b4c86d","server":"2722","farm":3,"title":"xmas lights","ispublic":1,"isfriend":0,"isfamily":0}]},"stat":"ok"}

[_0yearChallenge.Photo(farm: 3, secret: "a9c33305ea", id: "4233256590", server: "2660", title: "DSC_0467"), _0yearChallenge.Photo(farm: 3, secret: "1f42882e93", id: "4233256034", server: "2688", title: "DSC_0326"), _0yearChallenge.Photo(farm: 3, secret: "5acd53ded4", id: "4233255456", server: "2661", title: "Sometimes she\'s not sure she wants to keep posing for me."), _0yearChallenge.Photo(farm: 5, secret: "6836cb2edf", id: "4232476221", server: "4002", title: "IMG_0025"), _0yearChallenge.Photo(farm: 5, secret: "f3e2c00cb0", id: "4232467113", server: "4019", title: "Tepak Sireh Pembuka Kata"), _0yearChallenge.Photo(farm: 5, secret: "582e2a640d", id: "4232464943", server: "4019", title: "稲毛浅間神社"), _0yearChallenge.Photo(farm: 3, secret: "9045426563", id: "4233232528", server: "2540", title: "IMG_7110"), _0yearChallenge.Photo(farm: 5, secret: "8cf965066e", id: "4233231950", server: "4047", title: "DSC00884"), _0yearChallenge.Photo(farm: 3, secret: "e3d148567b", id: "4232459311", server: "2615", title: "partial lunar eclipse 2010 RG01012010HDL11"), _0yearChallenge.Photo(farm: 3, secret: "23b4364426", id: "4232437775", server: "2712", title: "IMG_0171"), _0yearChallenge.Photo(farm: 3, secret: "e102ed4be7", id: "4233208666", server: "2673", title: "IMG_0150"), _0yearChallenge.Photo(farm: 3, secret: "075b89e187", id: "4232435303", server: "2672", title: "IMG_0002"), _0yearChallenge.Photo(farm: 3, secret: "9b0d95aced", id: "2333214519", server: "2103", title: "Carron Dam"), _0yearChallenge.Photo(farm: 3, secret: "679d422979", id: "4233206428", server: "2658", title: "IMG_0001"), _0yearChallenge.Photo(farm: 5, secret: "bbf9467caa", id: "4233199034", server: "4062", title: "Portrait"), _0yearChallenge.Photo(farm: 3, secret: "d552df1f44", id: "4232421673", server: "2506", title: "3 Idiots"), _0yearChallenge.Photo(farm: 3, secret: "90e8d2f49b", id: "4233191644", server: "2718", title: "DSCF7406"), _0yearChallenge.Photo(farm: 3, secret: "a579e3393c", id: "4233188272", server: "2670", title: "P1180305.JPG"), _0yearChallenge.Photo(farm: 3, secret: "79573de91a", id: "4232409119", server: "2532", title: "Arief"), _0yearChallenge.Photo(farm: 3, secret: "2d92b4c86d", id: "4232398373", server: "2722", title: "xmas lights")]

get Json From Flickr done
226 bytes
SearchData(photos: _0yearChallenge.PhotoData(photo: [_0yearChallenge.Photo(farm: 3, secret: "bcbba5e633", id: "2031626141", server: "2183", title: "Cat15")]))
PhotoData(photo: [_0yearChallenge.Photo(farm: 3, secret: "bcbba5e633", id: "2031626141", server: "2183", title: "Cat15")])

get Json From Flickr done
78 bytes
SearchData(photos: _0yearChallenge.PhotoData(photo: []))
PhotoData(photo: [])
*/

