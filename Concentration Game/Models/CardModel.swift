//
//  CardModel.swift
//  Concentration Game
//
//  Created by Muhammad Azeem on 27/11/2020.
//

import UIKit

class CardModel {
    var car = [Card]()
    var cardImages: [UIImage] = [
        UIImage(named: "AC")!,
        UIImage(named: "AD")!,
        UIImage(named: "AH")!,
        UIImage(named: "AS")!,
        UIImage(named: "2C")!,
        UIImage(named: "2D")!,
        UIImage(named: "2H")!,
        UIImage(named: "2S")!,
        UIImage(named: "3C")!,
        UIImage(named: "3D")!,
        UIImage(named: "3H")!,
        UIImage(named: "3S")!,
        UIImage(named: "4C")!,
        UIImage(named: "4D")!,
        UIImage(named: "4H")!,
        UIImage(named: "4S")!,
        UIImage(named: "5C")!,
        UIImage(named: "5D")!,
        UIImage(named: "5H")!,
        UIImage(named: "5S")!,
        UIImage(named: "6C")!,
        UIImage(named: "6D")!,
        UIImage(named: "6H")!,
        UIImage(named: "6S")!,
        UIImage(named: "7C")!,
        UIImage(named: "7D")!,
        UIImage(named: "7H")!,
        UIImage(named: "7S")!,
        UIImage(named: "8C")!,
        UIImage(named: "8D")!,
        UIImage(named: "8H")!,
        UIImage(named: "8S")!,
        UIImage(named: "9C")!,
        UIImage(named: "9D")!,
        UIImage(named: "9H")!,
        UIImage(named: "9S")!,
        UIImage(named: "JC")!,
        UIImage(named: "JD")!,
        UIImage(named: "JH")!,
        UIImage(named: "JS")!,
        UIImage(named: "QC")!,
        UIImage(named: "QD")!,
        UIImage(named: "QH")!,
        UIImage(named: "QS")!,
        UIImage(named: "KC")!,
        UIImage(named: "KD")!,
        UIImage(named: "KH")!,
        UIImage(named: "KS")!,
        UIImage(named: "KC")!,
    ]
    
    func generateCard() -> [Card] {
        var rArr = cardImages
        rArr.shuffle()
        let iArr = [UIImage] (rArr[0...15])
        var i = 0
        while i < 15 {
            let cardOne = Card()
            cardOne.imageName = iArr[i]
            car.append(cardOne)
            i += 1
        }
        i = 0
        car = car + car
        car.shuffle()
        while i < 30 {
            let cardOne = car[i]
            cardOne.cardIndex = i
            i += 1
        }
        return car
    }
    
}
