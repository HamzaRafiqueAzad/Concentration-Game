//
//  ViewController.swift
//  Concentration Game
//
//  Created by Muhammad Azeem on 25/11/2020.
//

import UIKit

class MenuController: UIViewController {
    
    
    @IBAction func scoreBoard(_ sender: UIButton) {
        performSegue(withIdentifier: "scoreBoard", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

