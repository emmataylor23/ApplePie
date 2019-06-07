//
//  ClaudiasTVViewController.swift
//  ApplePieTV
//
//  Created by  on 6/7/19.
//  Copyright © 2019 EmmasApps. All rights reserved.
//

import UIKit

class ClaudiasTVViewController: UIViewController {

    @IBOutlet weak var myTVTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let newVC = segue.destination as! TVViewController
        if segue.identifier == "playSegue"
        {
            print("playTapped")
            // this is where you will enter the code for the textfield to become the new word
            // let hiddenWord = word entered into textfield
            newVC.wordLabelString = myTVTextField.text!
            //            newVC.listOfWords.append(newVC.wordLabelString)
        }
        
        if segue.identifier == "randomSegue"
        {
            print("randomTapped")
        }
    }
    
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

