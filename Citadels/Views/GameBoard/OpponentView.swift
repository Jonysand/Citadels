//
//  OpponentView.swift
//  Citadels
//
//  Created by Yongkun Li on 3/19/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct OpponentView: View {
    var body: some View {
        GeometryReader{geo in
            ZStack{
                ForEach(getCorners(center: CGPoint.init(x: geo.size.width, y: geo.size.height), corners: 4)){eachOpponentPoint in
                    
                }
            }
        }
    }
    
}

struct Star: Shape {
    let corners: Int

    func path(in rect: CGRect) -> Path {
        // at least 3 players
        guard corners >= 2 else { return Path() }
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

        // start from directly upwards (as opposed to down or to the right)
        var currentAngle = CGFloat.pi / 2

        // calculate how much we need to move with each star corner
        let angleAdjustment = .pi * 2 / CGFloat(corners)

        // we're ready to start with our path now
        var path = Path()

        // move to our initial position
        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))

        let eachOppenentOffsetFactor:CGFloat = 0.9;
        // loop over all our points/inner points
        for _ in 0..<corners  {
            // figure out the location of this point
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)

            // …and add a line to there
            path.addLine(to: CGPoint(x: center.x * cosAngle * eachOppenentOffsetFactor, y: center.y * sinAngle * eachOppenentOffsetFactor))

            // move on to the next corner
            currentAngle += angleAdjustment
        }

        // create and apply a transform that moves our path down by that amount, centering the shape vertically
        let transform = CGAffineTransform(translationX: center.x, y: center.y)
        return path.applying(transform)
    }
}

struct OpponentView_Previews: PreviewProvider {
    static var previews: some View {
        OpponentView()
    }
}
