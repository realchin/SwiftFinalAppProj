//
//  ChineseFoodRecViewController.swift
//  4FoodieByFoodie
//
//  Created by Timothy Chin on 4/28/22.
//

import UIKit
import MapKit

class ChineseFoodRecViewController: UIViewController {
    
    @IBOutlet weak var chineseMapView: MKMapView!
    @IBOutlet weak var recButton: UIButton!
    @IBOutlet weak var bosRecList: UILabel!
    
    var chineseWordsToGuess2 = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let otherVC = BostonianViewController()
        chineseWordsToGuess2 = otherVC.chinesew
        let bosWordsToGuess2CleanedPartly = bosWordsToGuess2[0...2].description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
        foodGuessedLabel.text = "Go out and taste the magic goodness of \(bosWordsToGuess2CleanedPartly.lowercased())"
        
        
        createBosLocations(locations: bosLocations)
        
    }
    
    let bosLocations = [
        ["title": "Zoe's Chinese Restaurant [$$]", "latitude": 42.38352144998973, "longitude": -71.11309308571049],
        ["title": "Hei La Moon Restaurant [$]", "latitude": 42.352384168728044, "longitude": -71.060214839188],
        ["title": "Empire Garden Restaurant [$]", "latitude": 42.35132667565789, "longitude": -71.0627595073544]
    ]
    
    func createBosLocations(locations: [[String : Any]]) {
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            chineseMapView.addAnnotation(annotations)
        }
    }
    
    @IBAction func chineseRecButtonPressed(_ sender: UIButton) {
        
        if recButton.isTouchInside {
            
            let bosWordsToGuess2Cleaned = bosWordsToGuess2.description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
            
            bosRecList.text = "The full list of Bostonian food recs is: \(bosWordsToGuess2Cleaned).".lowercased()
        } else {
            return
        }
        
        
    }
        
    }
    
    
}
