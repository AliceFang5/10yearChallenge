//
//  show10yearViewController.swift
//  10yearChallenge
//
//  Created by 方芸萱 on 2020/8/21.
//

import UIKit

class show10yearViewController: UIViewController {

    var photos = [Photo]()
    let yearStart = 2008
    let demoSearch = "Emma Watson"
    
    @IBOutlet weak var beforeImageView: UIImageView!
    @IBOutlet weak var afterImageView: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchTextCount: UILabel!
    @IBOutlet weak var fontSize: UILabel!
    @IBOutlet weak var sloganLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var beforeYearLabel: UILabel!
    @IBOutlet weak var afterYearLabel: UILabel!
    
    @IBOutlet weak var datePickerShow: UIDatePicker!
    @IBOutlet weak var yearSlider: UISlider!
    @IBOutlet weak var autoPlaySwitch: UISwitch!
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initial()
        getJsonFromFlickr()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            if self.autoPlaySwitch.isOn{
                var yearIndex = Int((self.yearSlider.value))
                print(yearIndex)
                if yearIndex >= 9{
                    yearIndex = 0
                }else{
                    yearIndex += 1
                }
                self.showAfterImage(yearIndex)
                self.updateDatePicker(yearIndex)
                //update slider
                self.yearSlider.setValue(Float(yearIndex), animated: true)
                self.updateYearLabel(yearIndex)
            }else{
                print("Don't auto play")
            }
        })
    }
    func initial(){
        initTime()
        autoPlaySwitch.setOn(false, animated: true)
        //init photos for array remove/insert
        let photoInit = Photo(farm: 0, secret: "0", id: "0", server: "0", title: "0")
        photos = [Photo](repeating: photoInit, count: 10)
    }
    func getJsonFromFlickr(){
        //check searchTextField
        searchTextField.placeholder = demoSearch
        var searchString = String(searchTextField.text ?? "")
        if searchString == ""{
            searchString = demoSearch
        }
        print("Search: \(searchString) by year \(yearStart)-\(yearStart+9)")
        let searchStringReplaceSpace = searchString.replacingOccurrences(of: " ", with: "+")
        //get json from flickr by year
        for yearIndex in 0...9{
            let year = yearStart + yearIndex
            let urlString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=601f629301937693059c425f165d0077&tags=\(searchStringReplaceSpace)&text=actor&text=actress&per_page=1&max_upload_date=\(year)-12-31%2023:59:59&min_upload_date=\(year)-01-01%2000:00:00&format=json&nojsoncallback=1"
            print(urlString)
            
            if let url = URL(string: urlString){
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data, let searchData = try? JSONDecoder().decode(SearchData.self, from: data){
//                        print(self.photos.count)
                        print("yearIndex = \(yearIndex)")
//                        print(self.photos[yearIndex])
                        
                        self.photos.remove(at: yearIndex)
                        self.photos.insert(contentsOf: searchData.photos.photo, at: yearIndex)

                        print("get Json From Flickr done")
                        print(searchData.photos.photo)
                        print(self.photos)
//                        print(self.photos.count)
                        
                        if self.photos.count < 10{
                            self.photos.insert(Photo(farm: 0, secret: "0", id: "0", server: "0", title: "0"), at: yearIndex)
                        }
                        self.showBeforeImage()
                        self.showAfterImage(0)
                    }
                }
                task.resume()
            }
        }
    }

    func showBeforeImage(){
        if photos[0].id == "0"{
            DispatchQueue.main.async {
                self.beforeImageView.image = UIImage(named: "sorry")
            }
        }else{
            let url = photos[0].imageUrl
             print(url)
             let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                 if let data = data, let image = UIImage(data: data){
                     DispatchQueue.main.async {
                         self.beforeImageView.image = image
                     }
                 }
             }
             task.resume()
        }
    }
    func showAfterImage(_ index:Int){
        if photos[index].id == "0"{
            DispatchQueue.main.async {
                self.afterImageView.image = UIImage(named: "sorry")
            }
        }else{
            let url = photos[index].imageUrl
            print(url)
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.afterImageView.image = image
                    }
                }
            }
            task.resume()
        }
    }

    @IBAction func pressSearchButton(_ sender: UIButton) {
        getJsonFromFlickr()
        updateDatePicker(0)
        //update slider
        yearSlider.setValue(0, animated: true)
        updateYearLabel(0)
    }
    @IBAction func pressSlider(_ sender: UISlider) {
        let yearIndex = Int((sender.value))
//        print(yearIndex)
        showAfterImage(yearIndex)
        updateDatePicker(yearIndex)
        updateYearLabel(yearIndex)
    }
    @IBAction func datePickerChangeValue(_ sender: UIDatePicker) {
        let date = sender.date
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: date)
        let yearIndex = dateComponents.year! - yearStart
        showAfterImage(yearIndex)
        //update slider
        yearSlider.setValue(Float(yearIndex), animated: true)
        updateYearLabel(yearIndex)
    }
    func initTime(){
        //init datePicker
        var yearString = yearStart.description
        let dateMin = "\(yearString)/01/01"
        yearString = (yearStart+9).description
        let dateMax = "\(yearString)/12/31"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        var datePickerInit = formatter.date(from: dateMin)!
        datePickerShow.setDate(datePickerInit, animated: true)
        datePickerInit = formatter.date(from: dateMin)!
        datePickerShow.minimumDate = datePickerInit
        datePickerInit = formatter.date(from: dateMax)!
        datePickerShow.maximumDate = datePickerInit
        
        //init yearLabel
        yearLabel.text = String(yearStart)
        beforeYearLabel.text = String(yearStart)
        afterYearLabel.text = String(yearStart+9)
        //init slider
        yearSlider.setValue(0, animated: true)
        //init font label
        searchTextCount.text = String("字數：0")
        fontSize.text = String("Size：20")
        let font = sloganLabel.font!
        let newfont = font.withSize(CGFloat(20))
        sloganLabel.font = newfont
        searchTextField.font = newfont
    }
    func updateDatePicker(_ yearIndex:Int){
        //update datePicker
        let yearString = String(yearStart+yearIndex)
        let date = "\(yearString)/01/01"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let dateInit = formatter.date(from: date)!
        datePickerShow.setDate(dateInit, animated: true)
    }
    
    func updateYearLabel(_ yearIndex:Int){
        //update yearLabel and font size
        let yearString = String(yearStart+yearIndex)
        yearLabel.text = yearString
        let font = sloganLabel.font!
        let newfont = font.withSize(CGFloat(20+yearIndex))
        sloganLabel.font = newfont
        searchTextField.font = newfont
        fontSize.text = String("Size：\(20+yearIndex)")
    }
    
    @IBAction func editTextField(_ sender: UITextField) {
        let count = searchTextField.text?.count
        searchTextCount.text = String("字數：\(count!)")
     }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
