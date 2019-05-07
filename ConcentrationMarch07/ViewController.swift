//
//  ViewController.swift
//  ConcentrationMarch07
//
//  Created by Lizhu Li on 2019-03-07.
//  Copyright © 2019 Eve Li. All rights reserved.
//

import UIKit
//                      this is the superClass
class ViewController: UIViewController {
    // lazy is really useful . Because if we do not use lazy. we cannot use game as we did not finish initiat it. But lazy means we do not care until we use it. But without finishing we will not use it
   lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    var flipCount = 0{
        didSet {
              flipCountLabel.text = "Flips :\(flipCount)"
    }
    }
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!

    
    
    // function   name of the Method  One argument: from UIbuttom
    //every argument has a name, you need to include in a method
    // external name and internal name
    
    // I do not know which is sender.???
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
//             flipCard(withEoji: emojiChoices[cardNumber], on: sender)
        } else{
            print("chosen card was not in cardButtons")
        }
    }
        
        func updateViewFromModel(){
            for index in cardButtons.indices{
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp{
                    button.setTitle(emoji(for:card), for:UIControlState.normal )
                    button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                }else{
                    button.setTitle("", for: UIControlState.normal)
                    button.backgroundColor = card.isMatched ?   #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                }
            }
        }
        
        var emojiChoies =  ["🎃","👻","😈","🧛‍♂️","🧛‍♀️","🍬","🍭","🍎"]
    var emoji = [Int: String]()
        
        func emoji(for card: Card) -> String {
            if emoji[card.identifier] == nil,  emojiChoies.count > 0{
                let randomIndex = Int (arc4random_uniform(UInt32(emojiChoies.count)))
                emoji[card.identifier] = emojiChoies.remove(at:randomIndex)
            
            }
            // above code is the same as the below code
            return emoji[card.identifier] ?? "?"
    }
    
    
    
    //             external name and internal name
//    func flipCard(withEoji emoji:String, on button: UIButton){
//
//        if button.currentTitle == emoji{
//            button.setTitle("", for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//
//
//        } else{
//            button.setTitle(emoji, for:UIControlState.normal )
//            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        }
    
        
        
    }
    



