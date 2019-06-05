//
//  ViewController.swift
//  ApplePie
//
//  Created by  on 5/29/19.
//  Copyright © 2019 EmmasApps. All rights reserved.
//

// ok i figured out the first part of it now the word doesn't show up, but i want to figure out how i can allow the array to be randomized without messing with the word entered into it

//the other thing that i might have messed up is that it doesnt show the blanks until someone taps one of the letter buttons
//other wise it still works

// i'm not sure what it means that you wrote ahead of this, but i don't see it happening i might have accidentally got it fixed.

import UIKit

class ViewController: UIViewController
{
    var wordLabelString = ""
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var lettersButtons: [UIButton]!
    var listOfWords = ["apple", "zoo", "beach", "doctor", "restaurant", "orange", "lion", "tiger", "dolphin", "jellyfish", "absence", "discover", "against", "package", "american", "elect", "author", "bench", "front", "bike", "deserve", "galaxy", "blanket", "earth", "branch", "educate", "celebrity", "cheap", "content", "office", "enjoy", "school", "factory", "everyday", "father", "glance", "flower", "groceries", "helicopter", "mouse", "noise", "rapidly", "service", "thousand", "yesterday"]
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
       
        listOfWords.shuffle()
        if wordLabelString != ""
        {
            listOfWords.append(wordLabelString)
        }
//        correctWordLabel.text = wordLabelString
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
