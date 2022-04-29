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
    
    var foodsToGuess = ["ROLL", "CLAMCHOWDER", "LOBSTERROLL"] // uppercase.../ txt file? pull from it
    var currentFoodIndex = 0
    var foodToGuess = ""
    var lettersGuessed = ""
    let maxNumOfWrongGuesses = 8 // num of images needed
    var wrongGuessesRemaining = 8
    var foodsGuessedCount = 0
    var foodsMissedCount = 0
    var guessCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = guessedLetterTextField.text!
        guessedLetterButton.isEnabled = !(text.isEmpty)
        foodsToGuess = foodsToGuess.shuffled() // SHUFFLING
        foodToGuess = foodsToGuess[currentFoodIndex]
        foodBeingRevealedLabel.text = "_" + String(repeating: " _", count: foodToGuess.count-1)
        
        updateGameStatusLabels()
        
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
    
    func updateAfterWinOrLose() {
        currentFoodIndex += 1
        guessedLetterTextField.isEnabled = false
        guessedLetterButton.isEnabled = false
        playAgainButton.isHidden = false
        
        updateGameStatusLabels()
    }
    
    func updateGameStatusLabels() {
        foodsGuessedLabel.text = "Foods Guessed: \(foodsGuessedCount)"
        foodsMissedLabel.text = "Foods Missed: \(foodsMissedCount)"
    }
    
    func guessALetter() {
        let currentLetterGuessed = guessedLetterTextField.text!
        lettersGuessed = lettersGuessed + currentLetterGuessed
        
        formatRevealedFood()
        
        if foodToGuess.contains(currentLetterGuessed) == false {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            bostonianImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        
        guessCount += 1
//        var guesses = "Guesses"
//        if guessCount == 1 {
//            guesses = "Guess"
//        }
        let guesses = (guessCount == 1 ? "Guess" : "Guesses") // using ternary op; less code
        gameStatusMessageLabel.text = "You've Made \(guessCount) \(guesses)."
        
        if foodBeingRevealedLabel.text!.contains("_") == false { // THIS IS WHERE WE TRANSITION TO MAPVIEW
            performSegue(withIdentifier: "ShowBostonianRec", sender: nil)
            gameStatusMessageLabel.text = "You've Guessed It! It took you \(guessCount) guesses to guess the word."
            foodsGuessedCount += 1
            updateAfterWinOrLose()
        } else if wrongGuessesRemaining == 0 {
            gameStatusMessageLabel.text = "So sorry. You are all out of guesses."
            foodsMissedCount += 1
            updateAfterWinOrLose()
        }
        
        if currentFoodIndex == foodsToGuess.count {
            gameStatusMessageLabel.text! += "\n\nYou've tried all of the words! Restart from the beginning?"
        }
        
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        sender.text = String(sender.text?.last ?? " ").trimmingCharacters(in: .whitespaces).uppercased()
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
        if currentFoodIndex == foodToGuess.count {
            currentFoodIndex = 0
            foodsGuessedCount = 0
            foodsMissedCount = 0
        }
        
        playAgainButton.isHidden = true
        guessedLetterTextField.isEnabled = true
        guessedLetterButton.isEnabled = false
        foodToGuess = foodsToGuess[currentFoodIndex]
        wrongGuessesRemaining = maxNumOfWrongGuesses
        foodBeingRevealedLabel.text = "_" + String(repeating: " _", count: foodToGuess.count-1)
        guessCount = 0
        bostonianImageView.image = UIImage(named: "flower\(maxNumOfWrongGuesses)")
        lettersGuessed = ""
        updateGameStatusLabels()
        gameStatusMessageLabel.text = "You've Made Zero Guesses"
        
    }
    
    
    
}
