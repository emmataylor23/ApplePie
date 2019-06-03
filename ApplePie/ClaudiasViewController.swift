//
//  ClaudiasViewController.swift
//  ApplePie
//
//  Created by  on 5/30/19.
//  Copyright © 2019 EmmasApps. All rights reserved.
//

import UIKit

class ClaudiasViewController: UIViewController
{
    @IBOutlet weak var myTextfield: UITextField!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //hello
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let newVC = segue.destination as! ViewController
        if segue.identifier == "playSegue"
        {
            print("playTapped")
            // this is where you will enter the code for the textfield to become the new word
            // let hiddenWord = word entered into textfield
            newVC.wordLabelString = myTextfield.text!
            newVC.listOfWords.append(newVC.wordLabelString)
        }
        
        if segue.identifier == "randomSegue"
        {
            print("randomTapped")
        }
    }
    
}
