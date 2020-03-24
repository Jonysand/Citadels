//
//  GameManager.swift
//  Citadels
//
//  Created by Yongkun Li on 3/7/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import Foundation

class GameManager:ObservableObject{
    let characters = Characters()
    let districts = Districts()
    var PlayerList: [Player] = []
    var currentPlayer: Int = 0
    var Deck: [District] = []
    
    init() {
        
    }
}
