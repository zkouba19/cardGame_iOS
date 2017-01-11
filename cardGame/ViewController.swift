//
//  ViewController.swift
//  cardGame
//
//  Created by Zachary Kouba on 1/11/17.
//  Copyright © 2017 Zachary Kouba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentDeck: Deck!
    var player1: Player!
    @IBOutlet weak var firstCardImg: UIImageView!
    @IBOutlet weak var secondCardImg: UIImageView!
    @IBOutlet weak var thirdCardImg: UIImageView!
    @IBOutlet weak var fourthCardImg: UIImageView!
    @IBOutlet weak var fifthCardImg: UIImageView!
    @IBOutlet weak var sixthCardImg: UIImageView!
    
//    beginning of discard field
    @IBOutlet weak var discardSuit: UITextField!
    @IBOutlet weak var discardValue: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentDeck = Deck()
        player1 = Player(name: "zack")
        currentDeck.shuffle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var cardArr: Array<String> = []
    @IBAction func drawButtonClicked(_ sender: UIButton) {
        let card1 = player1.draw(deck: currentDeck)
        if let validCard = card1 {
            print(validCard)
            let suit = validCard.suit
            let index0 = suit.index(suit.startIndex,offsetBy: 0)
            let firstLetter = suit[index0]
            let suitVal = validCard.value
            print(cardArr)
            print(firstLetter)
            print(suitVal)
            cardArr.append("\(firstLetter)\(suitVal)")
            if cardArr.count == 1 {
                firstCardImg.image = UIImage(named: "\(cardArr[0])")
            }
            if cardArr.count == 2 {
                secondCardImg.image = UIImage(named: "\(cardArr[1])")
            }
            if cardArr.count == 3 {
                thirdCardImg.image = UIImage(named: "\(cardArr[2])")
            }
            if cardArr.count == 4 {
                fourthCardImg.image = UIImage(named: "\(cardArr[3])")
            }
            if cardArr.count == 5 {
                fifthCardImg.image = UIImage(named: "\(cardArr[4])")
            }
            if cardArr.count == 6 {
                sixthCardImg.image = UIImage(named: "\(cardArr[5])")
            }
        }
        
        
    }

    @IBAction func resetButtonClicked(_ sender: UIButton) {
        print(player1.hand)
        player1.clearHand()
        print(player1.hand)
        currentDeck.reset()
        currentDeck.shuffle()
        cardArr = []
        firstCardImg.image = UIImage(named: "b1fv" )
        secondCardImg.image = UIImage(named: "b1fv")
        thirdCardImg.image = UIImage(named: "b1fv")
        fourthCardImg.image = UIImage(named: "b1fv")
        fifthCardImg.image = UIImage(named: "b1fv")
        sixthCardImg.image = UIImage(named: "b1fv")
    }
    
    
    @IBAction func discardButtonClicked(_ sender: UIButton) {
        let validDiscard = player1.discard(suit: discardSuit.text!, value:discardValue.text!)
        print (validDiscard)
    }
    
}

