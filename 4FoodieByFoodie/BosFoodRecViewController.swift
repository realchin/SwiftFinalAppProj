//
//  BosFoodRecViewController.swift
//  4FoodieByFoodie
//
//  Created by Timothy Chin on 4/28/22.
//

import UIKit
import MapKit

class BosFoodRecViewController: UIViewController {
    
    @IBOutlet weak var bosMapView: MKMapView!
    @IBOutlet weak var foodGuessedLabel: UILabel!
    @IBOutlet weak var recButton: UIButton!
    @IBOutlet weak var bosRecList: UILabel!
    
    var bosWordsToGuess2 = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let otherVC = BostonianViewController()
        bosWordsToGuess2 = otherVC.bosWordsToGuess
        let bosWordsToGuess2CleanedPartly = bosWordsToGuess2[0...2].description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
        foodGuessedLabel.text = "Go out and taste the magic goodness of \(bosWordsToGuess2CleanedPartly.lowercased())"
        
        
        createBosLocations(locations: bosLocations)
        
        // autherizeLocalNotifications()
        
    }
    
    let bosLocations = [
        ["title": "Atlantic Fish Company [$$$]", "latitude": 42.34924316187964, "longitude": -71.08117676710242],
        ["title": "Union Oyster House [$$]", "latitude": 42.36127871680426, "longitude": -71.05692478192037],
        ["title": "Walrus & Carpenter Oyster Bar [$]", "latitude": 42.35977608264614, "longitude": -71.05584593244332]
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
    
//    func autherizeLocalNotifications() {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
//            guard error == nil else {
//                print("ERROR!")
//                return
//            }
//            if granted {
//                print("Notifications granted!")
//            } else {
//                print("Denied notifications")
//            }
//        }
//    }
    
    
    @IBAction func recButtonPressed(_ sender: UIButton) {
        
        if recButton.isTouchInside {
            
            let bosWordsToGuess2Cleaned = bosWordsToGuess2.description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
            
            bosRecList.text = "The full list of Bostonian food recs is: \(bosWordsToGuess2Cleaned).".lowercased()
        } else {
            return
        }
        
        
    }
    
    
    
}
