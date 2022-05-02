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
        ["title": "Walrus & Carpenter Oyster Bar [$ | Faneuil Hall Marketplace]", "latitude": 42.35977608264614, "longitude": -71.05584593244332],
        ["title": "The Daily Catch Brookline [$ | near BC]", "latitude": 42.34614740578668, "longitude": -71.12777245523105],
        ["title": "Shaking Crab - Brookline [$ | near BC]", "latitude": 42.341415455483535, "longitude": -71.1212208782475],
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
            
            let restCritiques = ["One fantastic restaurant to try out is:\nIvory Pearl.\nHere is what a food critic has to say about the superb Bostonian cuisine dining experience:\nFrom Nathan Spielvogel, An unreal hidden spot in Brookline. Has some of the best seafood in the city and out of it. I highly recommend the fish sandwich and the octopus hot dog. These foods look straight out of a commercial, some of the most helpful and kind staff that are out there. Love it here!", "One fantastic restaurant to try out is:\nThe Daily Catch Brookline.\nHere is what a food critic has to say about the superb Bostonian cuisine dining experience:\nFrom Jea Kim, Known for their signature black pasta and amazing seafood, Daily Catch is one of the best places to get Italian-inspired seafood dishes in Boston. We initially wanted to try their original location in North End, but they were temporarily closed for remodeling. We decided to do a takeout instead at this Brookline branch, and got the lobster fra diavolo for two, fried calamari, and the agile olio black pasta. Everything was surprisingly as good as the hype. Seasoning for the calamari was perfect, and their signature black pasta was amazing. Aglio olio came with a heavy garlic flavor, but the chewy texture of the black pasta definitely made it better. Lobster fra diavolo came in a huge aluminum plate with good amounts of seafood. The condensed seafood flavor was nicely integrated into the sauce and the pasta, and I liked how they cut the lobster shells for convenience. Would definitely come back to try more of their menu and get the black pasta with other sauces.", "One fantastic restaurant to try out is:\nShaking Crab - Brookline.\nHere is what a food critic has to say about the superb Bostonian cuisine dining experience:\nFrom Christine Annichiarico, I can’t even begin to describe how good everything about this was. An entire experience. 2 Lobsters Clams and Mussels in a butter garlic lime cilantro sauce. And potatoes and corn too. Paper lined table, gloves, obligatory bib and off you go. They dropped this massive tray of food and then brought us a side of Cajun sauce just to try. Staff was super nice and made great suggestions.\nAnd the music was 🔥 🔥 I don’t know who was in charge of the music, but great food and a banging soundtrack just made it 1000x better. Literally shoving buttery potatoes in mah face and dancing in the booth.\nDigging into this meal with no utensils, just our hands, is exactly what we needed tonight.\nWe are definitely full and safe from any vampires. A very immersive meal and would highly recommend if you come to Boston.", "One fantastic restaurant to try out is:\nThe Walrus & Carpenter Oyster Bar located in Faneuil Hall Marketplace.\nHere is what a food critic has to say about the superb Bostonian cuisine dining experience:\nFrom Andrew Heim, Solid clam chowder! Love the flavor and shoutout for them for leaving samples out for stray passengers like myself ... damn I love samples.\nOne does wish for some garlic butter lathered on a bread bowl lid roasted AND toasted. Maybe next visit they will read this review and change their ways. A few years later I’ll come back and leave another review on how much they have improved. That will be the day! That will put a warm smile on my face.", "One fantastic restaurant to try out is:\nUnion Oyster House.\nHere is what a food critic has to say about the superb Bostonian cuisine dining experience:\nFrom Marina Kumanina, Recommend for visiting, the oldest America’s restaurant !! Here you can taste Boston cuisine and atmosphere of old Boston !!! Oyster clam chowder in bowl , Samuel Adamson beer and lobsters!!! Staff is very friendly and professional , better to make reservations.", "One fantastic restaurant to try out is:\nAtlantic Fish Company.\nHere is what a food critic has to say about the superb Bostonian cuisine dining experience:\nFrom Robert Birmele, Excellent restaurant.  First off. It's a beautiful setting.  Second   it was very clean. Third,  the service was outstanding. \nLast but not least the food. The New England clam chowder may have been the best we ever had.  I had the fisherman's pasta, outstanding. My wife had the haddock with crab stuffing, good but not quite outstanding. Drinks were good."]
            
            let randomRestCritiques = restCritiques.randomElement()!
            
            bosRecList.text = "\(randomRestCritiques)"
            
        }
        
        
    }
    
    
    
}
