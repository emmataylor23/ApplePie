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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playSegue"
        {
            print("playTapped")
            // this is where you will enter the code for the textfield to become the new word
        
        }
        
        if segue.identifier == "randomSegue"
        {
            print("randomTapped")
        }
    }
}
