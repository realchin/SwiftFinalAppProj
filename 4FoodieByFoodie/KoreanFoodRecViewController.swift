//
//  KoreanFoodRecViewController.swift
//  4FoodieByFoodie
//
//  Created by Timothy Chin on 4/28/22.
//

import UIKit
import MapKit

class KoreanFoodRecViewController: UIViewController {
    
    @IBOutlet weak var koreanMapView: MKMapView!
    @IBOutlet weak var foodGuessedLabel: UILabel!
    @IBOutlet weak var foodBank: UIButton!
    @IBOutlet weak var recButton: UIButton!
    @IBOutlet weak var koreanRecList: UILabel!
    
    var koreanWordsToGuess2 = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let otherVC = KoreanViewController()
        koreanWordsToGuess2 = otherVC.wordsToGuess
        let koreanWordsToGuess2CleanedPartly = koreanWordsToGuess2[0].description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
        foodGuessedLabel.text = "Go out and try the \(koreanWordsToGuess2CleanedPartly.lowercased())! You won't regret it. But in the meantime, want to check out all the other tasty food you can try? If so, tap the top left button!"
        
        
        createBosLocations(locations: koreanLocations)
        
        
    }
    
    let koreanLocations = [
        ["title": "Ruka [$$$]", "latitude": 42.35444874124745, "longitude": -71.0617552148486],
        ["title": "Mahaniyom [$$]", "latitude": 42.33267120807803, "longitude": -71.1187899000212],
        ["title": "Coreanos Allston [$]", "latitude": 42.352967013136386, "longitude": -71.1330532047291],
        ["title": "Bab Korean Bistro [$$ | near BC]", "latitude": 42.341765908386, "longitude": -71.12363385600571],
        ["title": "kimchipapi kitchen [$$ | near BC]", "latitude": 42.3535318107894, "longitude": -71.13234027633744]
    ]
    
    func createBosLocations(locations: [[String : Any]]) {
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            let region = MKCoordinateRegion(center: annotations.coordinate, latitudinalMeters: 3000, longitudinalMeters: 2500)
            koreanMapView.setRegion(region, animated: true)
            koreanMapView.addAnnotation(annotations)
        }
    }
    
    @IBAction func foodBankPressed(_ sender: UIButton) {
        
        if foodBank.isTouchInside {
            
            let koreanWordsToGuess2Cleaned = koreanWordsToGuess2.description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
            
            foodGuessedLabel.text = "The full list of Bostonian food recs is: \(koreanWordsToGuess2Cleaned)."
        } else {
            return
        }
        
    }
    
    
    @IBAction func koreanRecButtonPressed(_ sender: UIButton) {
        
        if recButton.isTouchInside {
            
            koreanRecList.text = "One fantastic restaurant to try out is:\nkimchipapi kitchen.\nHere is what a food critic has to say about the superb Korean cuisine dining experience:\nFrom Brian Ramos, So in my native state of Florida we have nothing of this most delicious caliber. Kimchipapi Kitchen is hands down worth every penny, every bite. The Korean Corndogs and Spam sliders, famous to myself because of Tik Tok, were something my wife and I have hunted down since leaving our state on multiple adventures. Enter Kimchipapi, a Harvard  pop up with delicious Korean street food. Hands down recommend this place to anyone looking for something both delicious and atypical."
            
        }
        
        
    }
    
}
