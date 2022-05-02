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
        ["title": "MIDA [$$]", "latitude": 42.33902389234359, "longitude": -71.08046939629972],
        ["title": "Casa Razdora [$]", "latitude": 42.35803663292029, "longitude": -71.05466612532071],
        ["title": "Tartufo [$$ | near BC]", "latitude": 42.330299597696346, "longitude": -71.19114281504679],
        ["title": "Bottega di Capri [$$ | near BC]", "latitude": 42.334618712651476, "longitude": -71.11905891376512]
        
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
            
            let restCritiques = ["One fantastic restaurant to try out is:\nBottega di Capri.\nHere is what a food critic has to say about the superb Italian cuisine dining experience:\nFrom Coop, A very casual place with delicious food. The staff was absolutely lovely, the alfredo was amazing and I felt like i was eating in my Grandmothers kitchen! Lots of people came through for takeout (it looked as though that might be their primary dinner business).  The owner will make up any combination you like, of sauce, pasta, veges, meats, etc. I'm in boston every 3 months and will definitely happily put on a few pounds with these folks!", "One fantastic restaurant to try out is:\nTartufo.\nHere is what a food critic has to say about the superb Italian cuisine dining experience:\nFrom Steven Quat, Wow the are no words that effectively describe how fantastic the food and service are here. The atmosphere was welcoming and very homey. Each dish was better than the previous which is pretty hard when you start at excellent. We started with appetizers eggplant rollantini and grilled calamari with arugula salad. The  eggplant, thinly sliced stuffed with ricotta and spinach was top shelf. The grilled calamari was like no calamari we have ever eaten.  Grilled,  it melted in your mouth not chewy like fried calamari and the arugula added that balance. Our entrees were shrimp and scallop risotto,  lemon chicken with artichoke and red pepper,  homemade ravioli with meat ball and fennel sausage and scallops papardelle. The scallops were buttery, tender and all you did was squeeze it between your tongue and roof of your mouth and it just melted away.  Everything was way beyond expectations for a local eatery in Newton. A very nice lady stopped by our  table to see if everything was ok and we stuck up a conversation.  Turns out she was the owner Anna. We now have a new favorite go to Italian restaurant in the Boston area. Also don't forget to try the lemonciello. Top shelf. It just goes to show you that you don't have to go to the North end to get good Italian food.", "One fantastic restaurant to try out is:\nCasa Razdora.\nHere is what a food critic has to say about the superb Italian cuisine dining experience:\nFrom V Madison, Incredible food. Fresh, delicious, and huge portions. I live in the North End, so thankfully get to experience some pretty delicious Italian food, but this place is better than most (if not all?) of them, and of course much more reasonably priced. Well worth the wait when there’s a line. Highly recommend.", "One fantastic restaurant to try out is:\nThe Salty Pig.\nHere is what a food critic has to say about the superb Italian cuisine dining experience:\nFrom Cale Birk, Unexpected treasure! Went in for a bite of pizza and a beer, but had the most amazing charcuterie board (way too much for one person, but I did my best). Absolutely delicious, the staff was helpful and kind (Jill is so kind, hilarious and fun to chat with!), and the place was packed and fun. I have been back 2x (!). Strongly recommend for a Saturday lunch with friends or a pre-game charcuterie board. Can't wait to come back.", "One fantastic restaurant to try out is:\nDavio's Northern Italian Steakhouse.\nHere is what a food critic has to say about the superb Italian cuisine dining experience:\nFrom Jody Smith, An absolute incredible experience. The food was incredible but what was more amazing was the staff and their attention to detail. They made sure everything we needed and wanted was taken care of. They also were knowledgeable enough to give us advice on wine pairings for out meal. Amazing. Will definitely go again!", "One fantastic restaurant to try out is:\nMIDA.\nHere is what a food critic has to say about the superb Italian cuisine dining experience:\nFrom TRKMN, This is one of the best restaurants I’ve ever eaten at, waitress exceeded our expectations, our food was well prepared for our vegetarian specs, we asked for non alcoholic cocktail and asked them to surprise us, the bartender did his best, and at the end we were very satisfied happy customers. We tried the tiramisu, it was what we needed to end the night with. I will visit this place again, and again."]
            
            let randomRestCritiques = restCritiques.randomElement()!
            
            italianRecList.text = "\(randomRestCritiques)"
            
        }
        
    }
    
}
