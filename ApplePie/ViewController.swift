//
//  ViewController.swift
//  ApplePie
//
//  Created by  on 5/29/19.
//  Copyright © 2019 EmmasApps. All rights reserved.
//
// i think it should be done
//we might want to add more words but it works over all
import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var lettersButtons: [UIButton]!
    var listOfWords = ["apple", "zoo", "beach", "doctor", "restaurant"]
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
        let newWord = listOfWords.removeFirst()
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
        for letter in currentGame.formattedWord.characters
        {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }


}
