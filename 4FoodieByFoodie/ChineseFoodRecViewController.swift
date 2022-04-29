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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBosLocations(locations: bosLocations)

    }
    
    let bosLocations = [
        ["title": "Fris Course 1", "latitude": 40.003252, "longitude": -86.0655897],
        ["title": "Fris Course 2", "latitude": 39.7636057, "longitude": -86.4080829]
    ]
    
    func createBosLocations(locations: [[String : Any]]) {
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            chineseMapView.addAnnotation(annotations)
        }
    }

}
