//
//  cards.swift
//  CardGame
//
//  Created by Damian S on 2023-01-11.
//

//
//  cards.swift
//  Play Poker
//
//  Created by Damian S on 2023-01-11.
//

import UIKit

class singleCard {
    var faceValue: String = "0"
    var type: Character = "X"
    var image: UIImage = UIImage()
    
    init(faceValue: String, type: Character){
        self.faceValue = faceValue
        self.type = type
        self.image = UIImage(named: "\(self.faceValue)\(self.type)")!
    }
    
}

struct card {
    static var allCards: [singleCard] = [
        singleCard(faceValue: "2", type: "H"),
        singleCard(faceValue: "3", type: "H"),
        singleCard(faceValue: "4", type: "H"),
        singleCard(faceValue: "5", type: "H"),
        singleCard(faceValue: "6", type: "H"),
        singleCard(faceValue: "7", type: "H"),
        singleCard(faceValue: "8", type: "H"),
        singleCard(faceValue: "9", type: "H"),
        singleCard(faceValue: "10", type: "H"),
        singleCard(faceValue: "J", type: "H"),
        singleCard(faceValue: "Q", type: "H"),
        singleCard(faceValue: "K", type: "H"),
        singleCard(faceValue: "A", type: "H"),
        
        singleCard(faceValue: "2", type: "S"),
        singleCard(faceValue: "3", type: "S"),
        singleCard(faceValue: "4", type: "S"),
        singleCard(faceValue: "5", type: "S"),
        singleCard(faceValue: "6", type: "S"),
        singleCard(faceValue: "7", type: "S"),
        singleCard(faceValue: "8", type: "S"),
        singleCard(faceValue: "9", type: "S"),
        singleCard(faceValue: "10", type: "S"),
        singleCard(faceValue: "J", type: "S"),
        singleCard(faceValue: "Q", type: "S"),
        singleCard(faceValue: "K", type: "S"),
        singleCard(faceValue: "A", type: "S"),
        
        singleCard(faceValue: "2", type: "C"),
        singleCard(faceValue: "3", type: "C"),
        singleCard(faceValue: "4", type: "C"),
        singleCard(faceValue: "5", type: "C"),
        singleCard(faceValue: "6", type: "C"),
        singleCard(faceValue: "7", type: "C"),
        singleCard(faceValue: "8", type: "C"),
        singleCard(faceValue: "9", type: "C"),
        singleCard(faceValue: "10", type: "C"),
        singleCard(faceValue: "J", type: "C"),
        singleCard(faceValue: "Q", type: "C"),
        singleCard(faceValue: "K", type: "C"),
        singleCard(faceValue: "A", type: "C"),
        
        singleCard(faceValue: "2", type: "D"),
        singleCard(faceValue: "3", type: "D"),
        singleCard(faceValue: "4", type: "D"),
        singleCard(faceValue: "5", type: "D"),
        singleCard(faceValue: "6", type: "D"),
        singleCard(faceValue: "7", type: "D"),
        singleCard(faceValue: "8", type: "D"),
        singleCard(faceValue: "9", type: "D"),
        singleCard(faceValue: "10", type: "D"),
        singleCard(faceValue: "J", type: "D"),
        singleCard(faceValue: "Q", type: "D"),
        singleCard(faceValue: "K", type: "D"),
        singleCard(faceValue: "A", type: "D"),
        
    ]
    
//    static var allValues = [
//        UIImage(named: "2H")!,
//        UIImage(named: "3H")!,
//        UIImage(named: "4H")!,
//        UIImage(named: "5H")!,
//        UIImage(named: "6H")!,
//        UIImage(named: "7H")!,
//        UIImage(named: "8H")!,
//        UIImage(named: "9H")!,
//        UIImage(named: "10H")!,
//        UIImage(named: "JH")!,
//        UIImage(named: "QH")!,
//        UIImage(named: "KH")!,
//        UIImage(named: "AH")!,
//
//        UIImage(named: "2S")!,
//        UIImage(named: "3S")!,
//        UIImage(named: "4S")!,
//        UIImage(named: "5S")!,
//        UIImage(named: "6S")!,
//        UIImage(named: "7S")!,
//        UIImage(named: "8S")!,
//        UIImage(named: "9S")!,
//        UIImage(named: "10S")!,
//        UIImage(named: "JS")!,
//        UIImage(named: "QS")!,
//        UIImage(named: "KS")!,
//        UIImage(named: "AS")!,
//
//        UIImage(named: "2C")!,
//        UIImage(named: "3C")!,
//        UIImage(named: "4C")!,
//        UIImage(named: "5C")!,
//        UIImage(named: "6C")!,
//        UIImage(named: "7C")!,
//        UIImage(named: "8C")!,
//        UIImage(named: "9C")!,
//        UIImage(named: "10C")!,
//        UIImage(named: "JC")!,
//        UIImage(named: "QC")!,
//        UIImage(named: "KC")!,
//        UIImage(named: "AC")!,
//
//        UIImage(named: "2D")!,
//        UIImage(named: "3D")!,
//        UIImage(named: "4D")!,
//        UIImage(named: "5D")!,
//        UIImage(named: "6D")!,
//        UIImage(named: "7D")!,
//        UIImage(named: "8D")!,
//        UIImage(named: "9D")!,
//        UIImage(named: "10D")!,
//        UIImage(named: "JD")!,
//        UIImage(named: "QD")!,
//        UIImage(named: "KD")!,
//        UIImage(named: "AD")!
//    ]
}
