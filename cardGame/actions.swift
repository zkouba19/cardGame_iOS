//
//  actions.swift
//  cardGame
//
//  Created by Zachary Kouba on 1/11/17.
//  Copyright © 2017 Zachary Kouba. All rights reserved.
//

import UIKit


struct Card{
    var value: String
    var suit: String
    var numerical_value: Int
}

class Deck{
    var cards: Array<Card> = []
    init() {
        let suits = ["heart", "diamond", "club", "spade"]
        let values = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "j", "q", "k"]
        let numerical_values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
        for s in 0..<suits.count {
            
            for v in 0..<values.count {
                self.cards.append(Card(value: values[v], suit: suits[s], numerical_value: numerical_values[v]))
            }
        }
    }
    func deal() -> Card? {
        if self.cards.count > 0 {
            let topCard = self.cards.removeLast()
            return topCard
        }
        else {
            return nil
        }
    }
    func reset(){
        self.cards = []
        let suits = ["heart", "diamond", "club", "spade"]
        let values = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "j", "q", "k"]
        let numerical_values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
        for s in 0..<suits.count {
            
            for v in 0..<values.count {
                self.cards.append(Card(value: values[v], suit: suits[s], numerical_value: numerical_values[v]))
            }
        }
    }
    func shuffle(){
        let x = self.cards.count
        for z in 0..<x{
            let card1 = arc4random_uniform(UInt32(x))
            let card2 = arc4random_uniform(UInt32(x))
            if card1 != card2{
                swap(&self.cards[Int(card2)], &self.cards[Int(card1)])
            }
        }
    }
}



class Player{
    var name: String
    var hand: Array<Card> = []
    init(name: String) {
        self.name = name
    }
    func draw(deck: Deck) -> Card? {
        if self.hand.count < 6 {
            if let drawCard: Card = deck.deal(){
                self.hand.append(drawCard)
                print("drawing card")
                return(drawCard)
            }
            print("no cards remianing")
            return nil
        }
        else {
            print("hand is full. Must Discard.")
            return nil
        }
    }
    func discard(suit: String, value: String) -> Bool{
        for i in 0..<self.hand.count {
            if self.hand[i].value == value && self.hand[i].suit == suit {
                self.hand.remove(at: i)
                return true
            }
        }
        return false
    }
    func clearHand() {
        self.hand.removeAll()
    }
}
