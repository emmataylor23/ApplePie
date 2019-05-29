//
//  ViewController.swift
//  ApplePie
//
//  Created by  on 5/29/19.
//  Copyright © 2019 EmmasApps. All rights reserved.
//
// i stopped at the top of page 283 in the tutorial but i think i got everything before that
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
    var totalLosses = 0
    
    
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        sender.isEnabled = false
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       newRound()
    }
    
    var currentGame: Game!
    
    func newRound()
    {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
    }


}

