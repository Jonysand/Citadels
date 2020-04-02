//
//  GameManager.swift
//  Citadels
//
//  Created by Yongkun Li on 3/7/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import Foundation
import SwiftUI

struct DraggedCard{
    var card:District
    var x:CGFloat = 0
    var y:CGFloat = 0
}

class GameManager:ObservableObject{
    let characters = Characters()
    let districts = Districts()
    var PlayerList: [Player] = []
    var currentPlayer: Int = 0
    var Deck: [District] = []
    
    // for local player
    @Published var draggedCard:DraggedCard? = nil;
    
    init() {
        // init full deck
        initDeck(Deck: &Deck)
    }
}
