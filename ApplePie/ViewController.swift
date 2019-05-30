//
//  ViewController.swift
//  ApplePie
//
//  Created by  on 5/29/19.
//  Copyright © 2019 EmmasApps. All rights reserved.
//

// i made an appIcon
//also i added a few more words to the list
// i added a ui controller so that you can enter the word you want to be used, and then it will take you to the page
// it's messed up because there is no backwards arrow on the thing
// the clauidasviewcontroller is where we will type to code for the page that you enter information from
// if you want me to come up tmr during class ask mr walter to call mr scholtz i would love to leave, and if this doesn't make sense i can talk to you about it
import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var lettersButtons: [UIButton]!
    var listOfWords = ["apple", "zoo", "beach", "doctor", "restaurant", "orange", "lion", "tiger", "dolphin", "jellyfish", ]
    let incorrectMovesAllowed = 7
    var totalWins = 0
    {
        didSet
        {
            newRound()
        }
    }
    var totalLosses = 0
    {
        didSet
        {
            newRound()
        }
    }

    
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
        
//        listOfWords.append("newWOrd")
    }
    
    func updateGameState()
    {
        if currentGame.incorrectMovesRemaining == 0
        {
            totalLosses += 1
        }
        else if currentGame.word == currentGame.formattedWord
        {
            totalWins += 1
        }
        else
        {
        updateUI()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       newRound()
    }
    
    var currentGame: Game!
    
    func newRound()
    {
        if !listOfWords.isEmpty
        {
        let newWord = listOfWords.removeLast()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters : [])
        enableLetterButtons(_enable: true)
        updateUI()
        }
        else
        {
         enableLetterButtons(_enable: false)
        }
    }
    
    func enableLetterButtons(_enable: Bool)
    {
    for button in lettersButtons
    {
        button.isEnabled = _enable
    }
    }
    
    func updateUI()
    {
        var letters = [String]()
        for letter in currentGame.formattedWord
        {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }


}
