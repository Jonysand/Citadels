//
//  GameManager.swift
//  Citadels
//
//  Created by Yongkun Li on 3/7/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import Foundation
import SwiftUI

class GameManager{
    var PlayerList: [Player] = []
    var currentPlayer: Int = 0
    var Deck: [District] = []
    var playerViewPositions:[CGPoint] = []
    
    init(screenCenter: CGPoint, corners: Int) {
        // init player list
        
        
        // calculate positions
        var currentAngle = CGFloat.pi / 2
        let angleAdjustment = .pi * 2 / CGFloat(corners)
        let eachOppenentOffsetFactor:CGFloat = 0.9;
        let transform = CGAffineTransform(translationX: screenCenter.x, y: screenCenter.y)
        for i in 0..<corners  {
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)

            currentAngle += angleAdjustment
            if i > 0 {
                playerViewPositions.append(CGPoint.init(x: screenCenter.x * cosAngle * eachOppenentOffsetFactor, y: screenCenter.y * sinAngle * eachOppenentOffsetFactor).applying(transform))
            }
        }
    }
}
