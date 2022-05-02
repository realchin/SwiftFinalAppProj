//
//  BosFoodRecViewController.swift
//  4FoodieByFoodie
//
//  Created by Timothy Chin on 4/24/22.
//

import UIKit
import MapKit

class BosFoodRecViewController: UIViewController {
    
    @IBOutlet weak var bosMapView: MKMapView!
    @IBOutlet weak var foodGuessedLabel: UILabel!
    @IBOutlet weak var foodBank: UIButton!
    @IBOutlet weak var recButton: UIButton!
    @IBOutlet weak var bosRecList: UILabel!
    
    var bosWordsToGuess2 = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let otherVC = BostonianViewController()
        bosWordsToGuess2 = otherVC.bosWordsToGuess
        
        let bosWordsToGuess2CleanedPartly = bosWordsToGuess2[0].description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
        
        
        foodGuessedLabel.text = "Go out and try the \(bosWordsToGuess2CleanedPartly.lowercased())! You won't regret it. But in the meantime, want to check out all the other tasty food you can try? If so, tap the top left button!"
        
        createBosLocations(locations: bosLocations)
        
    }
    
    let bosLocations = [
        ["title": "Atlantic Fish Company [$$$]", "latitude": 42.34924316187964, "longitude": -71.08117676710242],
        ["title": "Union Oyster House [$$]", "latitude": 42.36127871680426, "longitude": -71.05692478192037],
        ["title": "Walrus & Carpenter Oyster Bar [$]", "latitude": 42.35977608264614, "longitude": -71.05584593244332],
        ["title": "The Daily Catch Brookline [$ | near BC]", "latitude": 42.34614740578668, "longitude": -71.12777245523105],
        ["title": "Ivory Pearl [$ | near BC]", "latitude": 42.33872954377934, "longitude": -71.13903461223346]
    ]
    
    func createBosLocations(locations: [[String : Any]]) {
        
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            let region = MKCoordinateRegion(center: annotations.coordinate, latitudinalMeters: 3000, longitudinalMeters: 2500)
            bosMapView.setRegion(region, animated: true)
            bosMapView.addAnnotation(annotations)
        }
    }
    
    @IBAction func foodBankPressed(_ sender: UIButton) {
        
        if foodBank.isTouchInside {
            
            let bosWordsToGuess2Cleaned = bosWordsToGuess2.description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
            
            foodGuessedLabel.text = "The full list of Bostonian food recommendations is: \(bosWordsToGuess2Cleaned)."
        } else {
            return
        }
        
    }
    
    
    @IBAction func recButtonPressed(_ sender: UIButton) {
        
        if recButton.isTouchInside {
            
            bosRecList.text = "One fantastic restaurant to try out is:\nIvory Pearl.\nHere is what a food critic has to say about the superb Bostonian cuisine dining experience:\nFrom Nathan Spielvogel, An unreal hidden spot in Brookline. Has some of the best seafood in the city and out of it. I highly recommend the fish sandwich and the octopus hot dog. These foods look straight out of a commercial, some of the most helpful and kind staff that are out there. Love it here!"
            
        }
        
        
    }
    
    
    
}
