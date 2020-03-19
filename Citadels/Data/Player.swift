//
//  Player.swift
//  Citadels
//
//  Created by Yongkun Li on 3/7/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import Foundation

class Player{
    var Hand: [District]
    var Estate: [District]
    var Role: Character
    var Wealth: Int = 2
    var hasAction: Bool = true
    
    init(Hand: [District], Estate: [District], Role: Character) {
        self.Hand = Hand
        self.Estate = Estate
        self.Role = Role
    }
}
