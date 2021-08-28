//
//  ScoresController.swift
//  Concentration Game
//
//  Created by Muhammad Azeem on 28/11/2020.
//

import UIKit

class ScoresController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
//    Table Views for single player and double player scores
    @IBOutlet weak var singlePlayerTableView: UITableView!
    @IBOutlet weak var doublePlayerTableView: UITableView!
    
//    arrays to store scores loaded from data storage
    var singleScores: [String] = []
    var doubleScores: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Delegates and datascources
        singlePlayerTableView.delegate = self
        singlePlayerTableView.dataSource = self
        doublePlayerTableView.delegate = self
        doublePlayerTableView.dataSource = self
        
//        single scores and double scores loaded and reversed so recent one appears at top
        singleScores = DataStorage().load(key: "singleScores")
        singleScores.reverse()
        doubleScores = DataStorage().load(key: "doubleScores")
        doubleScores.reverse()
        
    }
    
    
//   main menu button
    @IBAction func backToMenu(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
//    this declares show many will be given to each table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int?
        if tableView == self.singlePlayerTableView {
            
            count = singleScores.count
            
        } else if tableView == self.doublePlayerTableView {
            
            count = doubleScores.count
            
        }
        return count!
    }
    
//    This determines which table view will show which data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.doublePlayerTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "doubleCell")
            cell?.textLabel?.text = doubleScores[indexPath.row]
            cell?.textLabel?.font = UIFont(name: "Baskerville", size: 20)
            cell?.textLabel?.numberOfLines = 0
            
            return cell ?? UITableViewCell()
            
        }else if tableView == self.singlePlayerTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "singleCell")
            cell?.textLabel?.text = singleScores[indexPath.row]
            cell?.textLabel?.font = UIFont(name: "Baskerville", size: 20)
            cell?.textLabel?.numberOfLines = 0
            
            return cell ?? UITableViewCell()
            
        }
        
        return UITableViewCell()
        
    }
    
}
