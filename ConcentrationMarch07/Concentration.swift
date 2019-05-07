//
//  Concentration.swift
//  ConcentrationMarch07
//
//  Created by Lizhu Li on 2019-03-12.
//  Copyright © 2019 Eve Li. All rights reserved.
//

import Foundation
class Concentration
{
    var cards = [Card]()
    var indexOfTheOnlyFaceUpCard : Int?

    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfTheOnlyFaceUpCard, matchIndex != index{
                // check if the card mathch
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfTheOnlyFaceUpCard = nil
                
                
            }else {
                // either no or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfTheOnlyFaceUpCard = index
            }
            
        
//        if cards[index].isFaceUp{
//            cards[index].isFaceUp = false
//        }else{
//            cards[index].isFaceUp = true
        
        }
    }
    
    
    init(numberOfPairsOfCards: Int){
        //_ means ignore it
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
            // TODO: Shuffle the cards
       // cards.shuffle()
            
            
            
//            cards.append(card)
//            cards.append(card)
//            same as above
            
        
        }
    }
   
//    func shuffle(cards:[Card] ) -> [Card]{
//       var numOfcards = cards.count
//        if numOfcards < 2 { return cards }
//        for i in 0..<(numOfcards - 1) {
//            let j = Int(arc4random_uniform(UInt32(numOfcards - i))) + i
//            let swap(&cards[i], &cards[j])
//        }
//    }
//    return cards
//}
    
}
