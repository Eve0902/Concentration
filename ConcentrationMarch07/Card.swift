//
//  Card.swift
//  ConcentrationMarch07
//
//  Created by Lizhu Li on 2019-03-12.
//  Copyright © 2019 Eve Li. All rights reserved.
//

import Foundation

struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    
    
    
    // static : send to the global card type to get the uniqueIdentifier
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        //self.identifier means my identifier
        self.identifier = Card.getUniqueIdentifier()
    }
    
    
}
