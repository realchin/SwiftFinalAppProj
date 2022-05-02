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
        ["title": "BonChon Allston [$$]", "latitude": 42.35302463815574, "longitude": -71.1309198572335],
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
            
            let restCritiques = ["One fantastic restaurant to try out is:\nkimchipapi kitchen.\nHere is what a food critic has to say about the superb Korean cuisine dining experience:\nFrom Brian Ramos, So in my native state of Florida we have nothing of this most delicious caliber. Kimchipapi Kitchen is hands down worth every penny, every bite. The Korean Corndogs and Spam sliders, famous to myself because of Tik Tok, were something my wife and I have hunted down since leaving our state on multiple adventures. Enter Kimchipapi, a Harvard pop up with delicious Korean street food. Hands down recommend this place to anyone looking for something both delicious and atypical.", "One fantastic restaurant to try out is:\nBab Korean Bistro.\nHere is what a food critic has to say about the superb Korean cuisine dining experience:\nFrom Anji Fred, Fresh, hot, and delicious! The portion size is enough for two meals in my opinion and I was pleased with the ready to eat packaging :) I got the Kimchi Jjigae which was packed with a hearty portion ready to eat with the steam radiating off despite my windy 10 minute walk to my apartment. It could sustain a longer walk even- dare I say a train! Very satisfied.", "One fantastic restaurant to try out is:\nCoreanos Allston.\nHere is what a food critic has to say about the superb Korean cuisine dining experience:\nFrom Jea Kim, Came here with my friends to check out the hype on the coreanos bowl. They had limited seats available, so we decided to get a takeout instead. Had to wait over 30 minutes to get our order, but it was worth the wait. \nGot the yang yum chicken, coreanos bowl, kimchi fried rice, and the tteokbokiki, and everything was satisfying. Tteokbokki and the kimchi fried rice were on par with what you would normally get at typical Korean restaurants around. Nothing special, but decent choices to get in the meal. The real standout was obviously the coreanos bowl. Topped with some magical sauce, it kept me going for more. The rice had a good amount of fatty flavor from the meat, and with the slice of the fried egg, it was a perfect bite. The yang yum chicken was also good and not too spicy. \nHighly recommend trying the coreanos bowl, but make sure to order ahead as they can get really busy in the evenings.", "One fantastic restaurant to try out is:\nBonChon Allston.\nHere is what a food critic has to say about the superb Korean cuisine dining experience:\nFrom Kelly C, Can't get enough of this chicken! A family dinner, we highly recommend the spicy chicken drumsticks with Tteokbokki (stir fried rice cakes in a spicy Korean sauce topped with melted cheese). The fried chicken that we got was half soy garlic which I would say has no spice level (lots of flavor) and the other half was spicy! A perfect 50/50 ratio for those in our group that can't handle spicy food. \nYou get free refills of coleslaw and pickled radish which are great palate cleansers! \nThe wait can be frustrating sometimes, but we got lucky and only had to wait 5 minutes.", "One fantastic restaurant to try out is:\nMahaniyom.\nHere is what a food critic has to say about the superb Korean cuisine dining experience:\nFrom Joey Cosco, I have been thinking about Mahaniyom's food all week. It is extraordinary. Thai tapas is a great concept and the execution is even better. My wife and I shared a few dishes (beef panang and BBQ&Crispy Pork On Rice were our favs) and a couple of cocktails. We had a great time dining in. Would recommend to any adventurous eater who finds themselves in Brookline.", "One fantastic restaurant to try out is:\nRUKA (Asian Fusion).\nHere is what a food critic has to say about the superb Korean cuisine dining experience:\nFrom Hadil Charafeddine, This place is AMAZING! So classy, fun & young ambiance, and, best of all, amazing food! We got 2 sushi dishes, one ceviche dish and the calamari dish. Nothing tasted like anything I’ve had before. It was a great new experience and it was so refreshing to see this nice twist on known dishes!"]
            
            let randomRestCritiques = restCritiques.randomElement()!
            
            koreanRecList.text = "\(randomRestCritiques)"
            
        }
        
        
    }
    
}
