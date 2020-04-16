//
//  DebugAI.swift
//  Citadels
//
//  Created by Yongkun Li on 4/15/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import Foundation
    
func SimDrawCharacter(playerIndex:Int, charDeck:inout[Character], depositChar:inout [Character], KingIndex:Int, playerCount:Int, PlayerList:inout [Player]){
    // deposit cards
    if playerIndex == KingIndex{
        depositChar = []
        switch playerCount {
        case 4:
            charDeck.remove(at: Int.random(in: 0..<charDeck.count))
            for _ in 0..<2 {
                let cardIndex = Int.random(in: 0..<charDeck.count)
                let thisCard = charDeck[cardIndex]
                charDeck.remove(at: cardIndex)
                depositChar.append(thisCard)
            }
        default:
            break
        }
    }
    
    // draw cards
    let cardIndex = Int.random(in: 0..<charDeck.count)
    let thisCard = charDeck[cardIndex]
    charDeck.remove(at: cardIndex)
    PlayerList[playerIndex].Role = thisCard
}
