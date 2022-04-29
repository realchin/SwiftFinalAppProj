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
    @IBOutlet weak var recButton: UIButton!
    @IBOutlet weak var bosRecList: UILabel!
    
    var koreanWordsToGuess2 = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let otherVC = KoreanViewController()
        koreanWordsToGuess2 = otherVC.wordsToGuess
        let koreanWordsToGuess2CleanedPartly = koreanWordsToGuess2[0...2].description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
        foodGuessedLabel.text = "Go out and taste the magic goodness of \(koreanWordsToGuess2CleanedPartly.lowercased())"
        
        
        createBosLocations(locations: koreanLocations)
        
        
    }
    
    let koreanLocations = [
        ["title": "Ruka [$$$]", "latitude": 42.35444874124745, "longitude": -71.0617552148486],
        ["title": "Mahaniyom [$$]", "latitude": 42.33267120807803, "longitude": -71.1187899000212],
        ["title": "Coreanos Allston [$]", "latitude": 42.352967013136386, "longitude": -71.1330532047291]
    ]
    
    func createBosLocations(locations: [[String : Any]]) {
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            koreanMapView.addAnnotation(annotations)
        }
    }
    
    @IBAction func koreanRecButtonPressed(_ sender: UIButton) {
        
        if recButton.isTouchInside {
            
            let koreanWordsToGuess2Cleaned = koreanWordsToGuess2.description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
            
            bosRecList.text = "The full list of Bostonian food recs is: \(koreanWordsToGuess2Cleaned).".lowercased()
        } else {
            return
        }
        
        
    }
    
}
