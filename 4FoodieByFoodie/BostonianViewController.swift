//
//  BostonianViewController.swift
//  4FoodieByFoodie
//
//  Created by Timothy Chin on 4/27/22.
//

import UIKit

    class BostonianViewController: UIViewController {

    @IBOutlet weak var foodsGuessedLabel: UILabel!
    @IBOutlet weak var foodsMissedLabel: UILabel!
    
    @IBOutlet weak var foodBeingRevealedLabel: UILabel!
    @IBOutlet weak var guessedLetterTextField: UITextField!
    @IBOutlet weak var guessedLetterButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var gameStatusMessageLabel: UILabel!
    @IBOutlet weak var bostonianImageView: UIImageView!
        
    var foodsToGuess = ["CLAMCHOWDER", "LOBSTERROLL", "ROLL"] // uppercase...
    var currentFoodIndex = 0
    var foodToGuess = ""
    var lettersGuessed = ""
    let maxNumOfWrongGuesses = 8 // num of images needed
    var wrongGuessesRemaining = 8
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = guessedLetterTextField.text!
        guessedLetterButton.isEnabled = !(text.isEmpty)
        foodToGuess = foodsToGuess[currentFoodIndex]
        foodBeingRevealedLabel.text = "_" + String(repeating: " _", count: foodToGuess.count-1)
            
        }
    
    func updateUIAfterGuess() {
        guessedLetterTextField.resignFirstResponder()
        guessedLetterTextField.text! = ""
        guessedLetterButton.isEnabled = false
    
    }
        
    func formatRevealedFood() {
        var revealedFood = ""

        for letter in foodToGuess {
            
            if lettersGuessed.contains(letter) {
                revealedFood = revealedFood + "\(letter) "
            } else {
                revealedFood = revealedFood + "_ "
            }
        }
        revealedFood.removeLast()
        foodBeingRevealedLabel.text = revealedFood
    }
        
    func guessALetter() {
        let currentLetterGuessed = guessedLetterTextField.text!
        lettersGuessed = lettersGuessed + currentLetterGuessed
        
        formatRevealedFood()
        
    }
        
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        sender.text = String(sender.text?.last ?? " ").trimmingCharacters(in: .whitespaces)
        guessedLetterButton.isEnabled = !(sender.text!.isEmpty)
    }
        
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        
        guessALetter()
        
        updateUIAfterGuess()
    }
        
    @IBAction func guessedLetterButtonPressed(_ sender: UIButton) {
        
        guessALetter()
        
        updateUIAfterGuess()
    }
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        
        
    }
    
    
    
}
