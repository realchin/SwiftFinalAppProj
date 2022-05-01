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
    @IBOutlet weak var foodBank: UIButton!
    @IBOutlet weak var recButton: UIButton!
    @IBOutlet weak var italianRecList: UILabel!
    
    var italianWordsToGuess2 = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let otherVC = ItalianViewController()
        italianWordsToGuess2 = otherVC.wordsToGuess
        let italianWordsToGuess2CleanedPartly = italianWordsToGuess2[0].description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
        
        foodGuessedLabel.text = "Go out and try the \(italianWordsToGuess2CleanedPartly.lowercased())! You won't regret it. But in the meantime, want to check out all the other tasty food you can try? If so, tap the top left button!"
        
        
        createBosLocations(locations: italianLocations)
        
        
    }
    
    let italianLocations = [
        ["title": "Davio's Northern Italian Steakhouse [$$$]", "latitude": 42.35022689225123, "longitude": -71.07028313779934],
        ["title": "The Salty Pig [$$]", "latitude": 42.346909255602995, "longitude": -71.07615269513961],
        ["title": "Casa Razdora [$]", "latitude": 42.35803663292029, "longitude": -71.05466612532071],
        ["title": "Tartufo [$$ | near BC]", "latitude": 42.330299597696346, "longitude": -71.19114281504679]
        
    ]
    
    func createBosLocations(locations: [[String : Any]]) {
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            let region = MKCoordinateRegion(center: annotations.coordinate, latitudinalMeters: 3000, longitudinalMeters: 2500)
            italianMapView.setRegion(region, animated: true)
            italianMapView.addAnnotation(annotations)
        }
    }
    
    @IBAction func foodBankPressed(_ sender: UIButton) {
        
        if foodBank.isTouchInside {
            
            let italianWordsToGuess2Cleaned = italianWordsToGuess2.description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
            
            foodGuessedLabel.text = "The full list of Bostonian food recs is: \(italianWordsToGuess2Cleaned)."
        } else {
            return
        }
        
    }
    
    
    @IBAction func italianRecButtonPressed(_ sender: UIButton) {
        
        if recButton.isTouchInside {
            
            italianRecList.text = "One fantastic restaurant to try out is:\nTartufo.\nHere is what a food critic has to say about the superb Italian cuisine dining experience:\nFrom David Nguyen, Pleasant, lively ambience. Excellent food. One of Newton's greatest local restaurants."
            
        }
        
    }
    
}
