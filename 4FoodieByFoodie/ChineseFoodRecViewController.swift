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
        ["title": "Dumpling Xuan [$$]", "latitude": 42.37167982051088, "longitude": -71.08402547480105],
        ["title": "Our Zone 第五空间 [$$ | near BC]", "latitude": 42.344228393796804, "longitude": -71.14306362935726],
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
            
            let restCritiques = ["One fantastic restaurant to try out is:\nMDM Noodles.\nHere is what a food critic has to say about the superb Chinese cuisine dining experience:\nFrom A S, Sometimes you don't realize the hidden gems in your own backyard! MDM is certainly one of them.\nThe food is delicious. We had the hand pulled noodles, hot pot fish fillet and the mala veggie stir fry. We asked for everything to be mild spicy and they absolutely got it right. The hand pulled noodles were the right amount of chewy, delicately spiced and well cooked. The fish fillets were fresh, crispy and very tasty. For the stir fry, we selected a veggie basket. You get to select the veggies that go into your stir fry but the server does it for you. They have bok choy, broccoli, lotus root, tofu skin, bean sprouts, mushroom, cabbage, noodles, fungus and a few more - unfortunately no labels on the veggie containers. So ask your server what they have. We got a little of everything and is was great - the veggies were crisp, you could definitely taste the spicy sauce but it wasn't overpowering.\nCustomer service was friendly too. They patiently answered our questions. Parking wise, there's a municipal lot out back or street parking.\nIn our books, MDM is a big hit and we'll certainly be back especially for the hot pot fish fillets!", "One fantastic restaurant to try out is:\nDumpling Xuan.\nHere is what a food critic has to say about the superb Chinese cuisine dining experience:\nFrom Michael Chen, We tried out this place quite a few times last year when it was relatively new and I thought the food was decent but silly me always forgot to write a review for it. I had a even better visit few weekends ago so decided not to procrastinate any longer to tell my positive experience here :). \nThe fried intestine was one of my favorite dish here and I'm really happy they got it quite right that its not overly dry and not overly spicy either. The pork mince meat rice was pretty good but definitely I would recommend their main entrees. The scallion pancake beef roll was superb and I liked their unique presentation of serving it like sushi rolls :). \nThe staff were very friendly as I had remembered from last year's visits and last time wasn't any different. The only minor downside would be having to find parking but if you can take bus or bike that definitely would be easier in my opinion.  I hope they have many many years of success as we'll be regular patrons here for sure", "One fantastic restaurant to try out is:\nOur Zone 第五空间.\nHere is what a food critic has to say about the superb Chinese cuisine dining experience:\nFrom Wanwan Fei, When I say this owner and her husband know what is authentic Sichuan food, I mean it. \nThis small restaurant is a hidden gem in Brighton. I genuinely believe their presence elevates the neighborhood. \nTheir menu is small because (1) their dishes are carefully selected and (2) they continue to remove unpopular dishes throughout the year and add new dishes that they master. /nThe place looks frill-less from the outside, but their dishes can take you on a trip to inland China with just one bite.", "One fantastic restaurant to try out is:\nEmpire Garden Restaurant (Dim Sum).\nHere is what a food critic has to say about the superb Chinese cuisine dining experience:\nFrom Julie Chamberlin,Dropping our daughter off at South Station to get a bus back to college, we realized that we hadn't had dim sum in a long time. Both of the places we used to visit are closed now, so we decided to try Empire Garden. The atmosphere is amazing if you like old theaters. The food was fresh and delicious and the service is perfect; many offerings but not overbearing. Very friendly and welcoming staff. Will definitely visit again. 😊", "One fantastic restaurant to try out is:\nHei La Moon Restaurant.\nHere is what a food critic has to say about the superb Chinese cuisine dining experience:\nFrom David Tran, I'm a Boston native and for many years of eating Dim Sum at many spots in the city, nothing beats here. They serve the food warm with such flavor. FYI, they have moved to a new location at 83 Essex St, Boston, MA 02111!!! The space was the old Chau Chow City. Hei La Moon has 'rebirthed' the place and it looks really nice.", "One fantastic restaurant to try out is:\nZoe's Chinese Restaurant.\nHere is what a food critic has to say about the superb Chinese cuisine dining experience:\nFrom Anton Belenky, Great place and amazing food! My wife and myself spent a lot of time in China and Asia and we can say for sure this place is very authentic with similar taste to the source. Great soup with dumplings, dim sum, lo mein and especially the duck! Great service and reasonable prices. Well done guys!"]
            
            let randomRestCritiques = restCritiques.randomElement()!
            
            chineseRecList.text = "\(randomRestCritiques)"
        
        }
        
    }
    
    
}
    

