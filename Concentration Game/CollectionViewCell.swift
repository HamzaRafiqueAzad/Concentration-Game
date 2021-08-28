//
//  CollectionViewCell.swift
//  Concentration Game
//
//  Created by Muhammad Azeem on 26/11/2020.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImage: UIImageView!
    
    
//    var card: Card?
    func setCard(_ card: Card) {
//        self.card = card
        if card.isMatched {
            cardImage.image = card.imageName
        }
        else {
            cardImage.image = card.imageBack
            card.isMatched = false
        }
    }
}
