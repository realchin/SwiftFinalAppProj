//
//  BostonianViewController.swift
//  4FoodieByFoodie
//
//  Created by Timothy Chin on 4/27/22.
//

import UIKit
import AVFoundation

class BostonianViewController: UIViewController {
    
    @IBOutlet weak var wordsGuessedLabel: UILabel!
    @IBOutlet weak var wordsMissedLabel: UILabel!
    
    @IBOutlet weak var wordBeingRevealedLabel: UILabel!
    @IBOutlet weak var guessedLetterTextField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var gameStatusMessageLabel: UILabel!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    var bosWordsToGuess = ["ROLL", "CLAMCHOWDER", "LOBSTERROLL", "BAKEDBEANS", "CREAMPIE", "OYSTER", "FENWAYFRANK", "ROASTBEEF", "CLAMCAKE"]
    
    var currentWordIndex = 0
    var wordToGuess = ""
    var lettersGuessed = ""
    let maxNumOfWrongGuesses = 5 // num of images needed
    var wrongGuessesRemaining = 5
    var wordsGuessedCount = 0
    var wordsMissedCount = 0
    var guessCount = 0
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = guessedLetterTextField.text!
        guessLetterButton.isEnabled = !(text.isEmpty)
        wordToGuess = bosWordsToGuess[currentWordIndex]
        wordBeingRevealedLabel.text = "_" + String(repeating: " _", count: wordToGuess.count-1)
        
        updateGameStatusLabels()
    }
    
    func updateUIAfterGuess() {
        guessedLetterTextField.resignFirstResponder()
        guessedLetterTextField.text! = ""
        guessLetterButton.isEnabled = false
        
    }
    
    func formatRevealedWord() {
        var revealedWord = ""

        // loop through all letters in wordToGuess
        for letter in wordToGuess {
            // check if letter in wordToGuess is in lettersGuessed (i.e. did you guess this letter already?)
            if lettersGuessed.contains(letter) {
                // if so, add this letter + a blank space, to revealedWord
                revealedWord = revealedWord + "\(letter) "
            } else {
                // if not, add an underscore + a blank space, to revealedWord
                revealedWord = revealedWord + "_ "
            }
        }
        // remove the extra space at the end of revealedWord
        revealedWord.removeLast()
        wordBeingRevealedLabel.text = revealedWord
    }
    
    func updateAfterWinOrLose() {
        
        currentWordIndex += 1
        guessedLetterTextField.isEnabled = false
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = false
        
        updateGameStatusLabels()
    }
    
    func updateGameStatusLabels() {
        wordsGuessedLabel.text = "Words Guessed: \(wordsGuessedCount)"
        wordsMissedLabel.text = "Words Missed: \(wordsMissedCount)"
    }
    
    func drawCFoodAndPlaySound(currentLetterGuessed: String) {
        if wordToGuess.contains(currentLetterGuessed) == false {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                UIView.transition(with: self.flowerImageView, duration: 0.5, options: .transitionCrossDissolve, animations: {self.flowerImageView.image = UIImage(named: "wilt\(self.wrongGuessesRemaining)")}) { (_) in
                    
                    if self.wrongGuessesRemaining != 0 {
                        self.flowerImageView.image = UIImage(named: "flower\(self.wrongGuessesRemaining)")
                    } else {
                        self.playSound(name: "word-not-guessed")
                        UIView.transition(with: self.flowerImageView, duration: 0.5, options: .transitionCrossDissolve, animations: {self.flowerImageView.image = UIImage(named: "flower\(self.wrongGuessesRemaining)")}, completion: nil)
                        }
                    
                    
                    }
                self.playSound(name: "incorrect")
            }
        } else {
            playSound(name: "correct")
        }
    }
    
    func guessALetter() {
        let currentLetterGuessed = guessedLetterTextField.text!
        lettersGuessed = lettersGuessed + currentLetterGuessed
        
        formatRevealedWord()
        drawCFoodAndPlaySound(currentLetterGuessed: currentLetterGuessed)
        
        guessCount += 1
        
        let guesses = (guessCount == 1 ? "Guess" : "Guesses") // using ternary op; less code
        gameStatusMessageLabel.text = "You've Made \(guessCount) \(guesses)."
        
        if wordBeingRevealedLabel.text!.contains("_") == false { // THIS IS WHERE WE TRANSITION TO MAPVIEW
            wordsGuessedCount += 1
            updateAfterWinOrLose()
            gameStatusMessageLabel.text = "Good Job! Now check out some Bostonian Foods!"
            guessLetterButton.isHidden = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 7.0, execute: {
                self.performSegue(withIdentifier: "ShowBostonianFoodRec", sender: nil)
            })
            
        } else if wrongGuessesRemaining == 0 {
            gameStatusMessageLabel.text = "You are all out of guesses! However, don't fret! Do check out some Bostonian foods!"
            wordsMissedCount += 1
            updateAfterWinOrLose()
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0, execute: {
                self.performSegue(withIdentifier: "ShowBostonianFoodRec", sender: nil)
            })
        }
        
//        if currentWordIndex == bosWordsToGuess.count {
//            gameStatusMessageLabel.text! += "\n\nYou've tried all of the words! Restart from the beginning?"
//        } // this will never happen 
    }
    
    func playSound(name: String){
        if let sound = NSDataAsset(name: name){
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR!")
            }
        } else {
            print("ERROR!")
        }
    }
    
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        
        updateUIAfterGuess()
    }
    
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        sender.text = String(sender.text?.last ?? " ").trimmingCharacters(in: .whitespaces).uppercased()
        guessLetterButton.isEnabled = !(sender.text!.isEmpty)
    }
    
    
    @IBAction func guessedLetterButtonPressed(_ sender: UIButton) {
        
        guessALetter()
        
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        if currentWordIndex == wordToGuess.count {
            currentWordIndex = 0
            wordsGuessedCount = 0
            wordsMissedCount = 0
        }
        
        playAgainButton.isHidden = true
        guessedLetterTextField.isEnabled = true
        guessLetterButton.isEnabled = false // doesn't turn true until a char is in the text field
        wordToGuess = bosWordsToGuess[currentWordIndex]
        wrongGuessesRemaining = maxNumOfWrongGuesses
        wordBeingRevealedLabel.text = "_" + String(repeating: " _", count: wordToGuess.count-1)
        guessCount = 0
        flowerImageView.image = UIImage(named: "flower\(maxNumOfWrongGuesses)")
        lettersGuessed = ""
        updateGameStatusLabels()
        gameStatusMessageLabel.text = "You've Made Zero Guesses"
        
    }
    
    
    
}
