//
//  DoublePlayerController.swift
//  Concentration Game
//
//  Created by Muhammad Azeem on 27/11/2020.
//

import UIKit

class DoublePlayerController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //    CollectionView
    @IBOutlet weak var collectionView: UICollectionView!
    //    Labels
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    
    
    
    //    Rounds and Matches to keep track of successful matches of each player and round
    var rounds = 0
    var p1matches = 0
    var p2matches = 0
    var playerToggle = 0
    
    //    DataStorage to save and load data with scores as array to be passed
    var dataStorage = DataStorage()
    var scores: [String] = []
    
    //    CardModel and cards array that contains shuffled cards
    var cardModel = CardModel()
    var cardsArray: [Card] = []
    var flippedImages: [Card] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        To stop any scrolling from occuring
        self.collectionView.isScrollEnabled = false;
        
        //        delegate and datasource
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //        Generate shuffled cards array
        cardsArray = cardModel.generateCard()
        
        //        load previous scores
        scores = dataStorage.load(key: "doubleScores")
    }
    
    //    save scores when player goes back using menu button or back button
    override func viewWillDisappear(_ animated: Bool) {
        
        scores.append("P1 Matches: \(p1matches) P2 Matches: \(p2matches) Rounds \(rounds)")
        dataStorage.save(score: scores, key: "doubleScores")
        
        super.viewWillDisappear(true)
    }
    
    
    //    main menu button to go back to menu screen
    @IBAction func backToMenu(_ sender: UIButton) {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    //    for spacing between items of collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return -5
        
    }
    
    //    for spacing between line of collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return -1.9
        
    }
    
    //    Declare number of cells to be created in collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 30
        
    }
    
    //    This function makes each cell as it appears to be
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //        create a cell as our collection view cell that is in another file
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        //      call set card function that is in our collectionViewCell file to set the card
        cell.setCard(cardsArray[indexPath.item])
        
        return cell
        
    }
    
    //    our game runs on this function, didSelectItemAt will change our card faces from to back view to front view and check if the cards match
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //        get the cell that was touched
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
        //                  if rounds equal 30, means a complete game hase been played therefore move back to main menu
        if (rounds == 30) {
            
            self.navigationController?.popToRootViewController(animated: true)
            
        }
        
        //        our card has a property isMatched which is boolean, if the card was matched before it can't be touched upon
        if(cardsArray[indexPath.item].isMatched){
            return
        }
        
        //       a function 'image' that will check if both UIImages match or not
        //       here it is used to check if face of card is front or back
        //       if back then change it to front
        if(!(image(image1: cell.cardImage.image!, isEqualTo: cardsArray[indexPath.item].imageName))){
            
            //          this will change face of card to front
            cell.cardImage.image = cardsArray[indexPath.item].imageName
            
            if(flippedImages.count < 2){
                
                //                add to array if less then 2
                flippedImages.append(cardsArray[indexPath.item])
                
            }
            
            //          if front facing cards are 2 then it will check if they match
            if (flippedImages.count == 2){
                
                rounds += 1
                roundLabel.text = "Round Number: \(rounds)/30"
                
                //              checking if they match
                if(image(image1: flippedImages[0].imageName, isEqualTo: flippedImages[1].imageName)){
                    
                    //                  if matched, change their isMatched property to True
                    cardsArray[flippedImages[0].cardIndex].isMatched = true
                    cardsArray[flippedImages[1].cardIndex].isMatched = true
                    
                    //                    This will check which player's turn it is, to increase scores accordingly
                    if (playerToggle%2==0) {
                        
                        //                  Increase succesful matches and display
                        p1matches += 1
                        player1Label.text = "Player 1 Successful Matches: \(p1matches)"
                        
                        
                    } else {
                        
                        //                  Increase succesful matches and display
                        p2matches += 1
                        player2Label.text = "Player 2 Successful Matches: \(p2matches)"
                        
                        
                    }    
                    
                }
                //              else when cards do not match flip them back
                else {
                    
                    _ = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (timer) in
                        
                        collectionView.reloadData()
                        timer.invalidate()
                        
                    }
                    
                }
                
                playerToggle += 1
                flippedImages.removeAll()
                
            }
        } else {
            
            cell.cardImage.image = UIImage(named: "blue_back")!
            flippedImages.removeAll()
            
        }
    }
    
    //    function to check if UIImages match or not
    func image(image1: UIImage, isEqualTo image2: UIImage) -> Bool {
        
        let data1: NSData = image1.pngData()! as NSData
        let data2: NSData = image2.pngData()! as NSData
        
        return data1.isEqual(data2)
    }
    
}
