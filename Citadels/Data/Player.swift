//
//  Player.swift
//  Citadels
//
//  Created by Yongkun Li on 3/7/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import Foundation
import SwiftUI

class Player:Hashable{
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    var id:Int
    var Hand: [District]
    var Estate: [District]
    var Role: Character
    var Wealth: Int = 2
    var hasAction: Bool = true
    
    init(id:Int, Hand: [District], Estate: [District], Role: Character) {
        self.id = id
        self.Hand = Hand
        self.Estate = Estate
        self.Role = Role
    }
    
    func getPlayerViewPosition(screenCenter: CGPoint, corners: Int) -> CGSize{
        var currentAngle = CGFloat.pi / 2
        let angleAdjustment = .pi * 2 / CGFloat(corners)
        let eachOppenentOffsetFactor:CGFloat = 0.6
        let eachOppenentOffset:CGFloat = 20
        currentAngle += angleAdjustment * CGFloat.init(self.id)
        let sinAngle = sin(currentAngle)
        let cosAngle = cos(currentAngle)
        return CGSize.init(width: screenCenter.x * cosAngle * eachOppenentOffsetFactor, height: screenCenter.y * sinAngle * eachOppenentOffsetFactor + eachOppenentOffset)
    }
}
