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
    @IBOutlet weak var foodGuessedLabel: UILabel!
    @IBOutlet weak var foodBank: UIButton!
    @IBOutlet weak var recButton: UIButton!
    @IBOutlet weak var chineseRecList: UILabel!
    
    var chineseWordsToGuess2 = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let otherVC = ChineseViewController()
        chineseWordsToGuess2 = otherVC.wordsToGuess
        let bosWordsToGuess2CleanedPartly = chineseWordsToGuess2[0].description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
        
        foodGuessedLabel.text = "Go out and try the \(bosWordsToGuess2CleanedPartly.lowercased())! You won't regret it. But in the meantime, want to check out all the other tasty food you can try? If so, tap the top left button!"
        
        createBosLocations(locations: chineseLocations)
        
    }
    
    let chineseLocations = [
        ["title": "Zoe's Chinese Restaurant [$$]", "latitude": 42.38352144998973, "longitude": -71.11309308571049],
        ["title": "Hei La Moon Restaurant [$]", "latitude": 42.352384168728044, "longitude": -71.060214839188],
        ["title": "Empire Garden Restaurant [$]", "latitude": 42.35132667565789, "longitude": -71.0627595073544],
        ["title": "MDM Noodles [$ | near BC]", "latitude": 42.34918494931043, "longitude": -71.15285169535248]
    ]
    
    func createBosLocations(locations: [[String : Any]]) {
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            let region = MKCoordinateRegion(center: annotations.coordinate, latitudinalMeters: 3000, longitudinalMeters: 2500)
            chineseMapView.setRegion(region, animated: true)
            chineseMapView.addAnnotation(annotations)
        }
    }
    
    @IBAction func foodBankPressed(_ sender: UIButton) {
        
        if foodBank.isTouchInside {
            
            let chineseWordsToGuess2Cleaned = chineseWordsToGuess2.description.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
            
            foodGuessedLabel.text = "The full list of Bostonian food recs is: \(chineseWordsToGuess2Cleaned)."
        } else {
            return
        }
        
    }
    
    
    @IBAction func chineseRecButtonPressed(_ sender: UIButton) {
        
        if recButton.isTouchInside {
            
            chineseRecList.text = "One fantastic restaurant to try out is:\nMDM Noodles.\nHere is what a food critic has to say about the superb Chinese cuisine dining experience:\nFrom A S, Sometimes you don't realize the hidden gems in your own backyard! MDM is certainly one of them.\nThe food is delicious. We had the hand pulled noodles, hot pot fish fillet and the mala veggie stir fry. We asked for everything to be mild spicy and they absolutely got it right. The hand pulled noodles were the right amount of chewy, delicately spiced and well cooked. The fish fillets were fresh, crispy and very tasty. For the stir fry, we selected a veggie basket. You get to select the veggies that go into your stir fry but the server does it for you. They have bok choy, broccoli, lotus root, tofu skin, bean sprouts, mushroom, cabbage, noodles, fungus and a few more - unfortunately no labels on the veggie containers. So ask your server what they have. We got a little of everything and is was great - the veggies were crisp, you could definitely taste the spicy sauce but it wasn't overpowering.\nCustomer service was friendly too. They patiently answered our questions. Parking wise, there's a municipal lot out back or street parking.\nIn our books, MDM is a big hit and we'll certainly be back especially for the hot pot fish fillets!"
        
        }
        
    }
    
    
}
    

