//
//  BostonianViewController.swift
//  4FoodieByFoodie
//
//  Created by Timothy Chin on 4/22/22.
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
    @IBOutlet weak var bostonImageView: UIImageView!
    
    var bosWordsToGuess = ["CLAMCHOWDER", "LOBSTERROLL", "LOBSTERBISQUE", "BAKEDBEANS", "OYSTER", "FENWAYFRANK", "ROASTBEEF", "CLAMCAKE"]
    
    var currentWordIndex = 0
    var wordToGuess = ""
    var lettersGuessed = ""
    let maxNumOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
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

        for letter in wordToGuess {
    
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + "\(letter) "
            } else {
                revealedWord = revealedWord + "_ "
            }
        }
        
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
            bostonImageView.image = UIImage(named: "lobster\(wrongGuessesRemaining)")
                self.playSound(name: "incorrect")
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
            gameStatusMessageLabel.text = "Good Job! Now check out some Boston Food! In 3...2...1"
            guessLetterButton.isHidden = true
            self.playSound(name: "word-guessed")
            DispatchQueue.main.asyncAfter(deadline: .now() + 6.0, execute: {
                self.performSegue(withIdentifier: "ShowBostonianFoodRec", sender: nil)
            })
            
        } else if wrongGuessesRemaining == 0 {
            gameStatusMessageLabel.text = "You are all out of guesses! However, don't fret! Do check out some Bostonian food!"
            wordsMissedCount += 1
            updateAfterWinOrLose()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
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
        bostonImageView.image = UIImage(named: "lobster\(maxNumOfWrongGuesses)")
        lettersGuessed = ""
        updateGameStatusLabels()
        gameStatusMessageLabel.text = "You've Made Zero Guesses"
        
    }
    
    
    
}
