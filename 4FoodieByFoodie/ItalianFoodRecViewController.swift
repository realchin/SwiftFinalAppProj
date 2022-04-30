//
//  ItalianFoodRecViewController.swift
//  4FoodieByFoodie
//
//  Created by Timothy Chin on 4/28/22.
//

import UIKit
import MapKit

class ItalianFoodRecViewController: UIViewController {
    
    @IBOutlet weak var italianMapView: MKMapView!
    @IBOutlet weak var foodGuessedLabel: UILabel!
    @IBOutlet weak var recButton: UIButton!
    @IBOutlet weak var bosRecList: UILabel!
    
    var italianWordsToGuess2 = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let otherVC = ItalianViewController()
        italianWordsToGuess2 = otherVC.wordsToGuess
        let italianWordsToGuess2CleanedPartly = italianWordsToGuess2[0...2].description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
        foodGuessedLabel.text = "Go out and taste the magic goodness of \(italianWordsToGuess2CleanedPartly.lowercased())"
        
        
        createBosLocations(locations: italianLocations)
        
        
    }
    
    let italianLocations = [
        ["title": "Davio's Northern Italian Steakhouse [$$$]", "latitude": 42.35022689225123, "longitude": -71.07028313779934],
        ["title": "The Salty Pig [$$]", "latitude": 42.346909255602995, "longitude": -71.07615269513961],
        ["title": "Casa Razdora [$]", "latitude": 42.35803663292029, "longitude": -71.05466612532071]
    ]
    
    func createBosLocations(locations: [[String : Any]]) {
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            italianMapView.addAnnotation(annotations)
        }
    }
    
    @IBAction func italianRecButtonPressed(_ sender: UIButton) {
        
        if recButton.isTouchInside {
            
            let italianWordsToGuess2Cleaned = italianWordsToGuess2.description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
            
            bosRecList.text = "The full list of Bostonian food recs is: \(italianWordsToGuess2Cleaned).".lowercased()
        } else {
            return
        }
        
        
    }
    
}
