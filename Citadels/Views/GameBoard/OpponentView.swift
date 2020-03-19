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
        Star(corners: 7)
            .fill(Color.red)
            .frame(width: 400, height: 400)
            .background(Color.green)
    }
    
    func getCorners(in rect: CGRect, corners: Int) -> [CGPoint] {
        var result: [CGPoint] = []
        guard corners >= 2 else { return [.zero, .zero] }
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

        // start from directly upwards (as opposed to down or to the right)
        var currentAngle = CGFloat.pi / 2

        // calculate how much we need to move with each star corner
        let angleAdjustment = .pi * 2 / CGFloat(corners)
        
        let transform = CGAffineTransform(translationX: center.x, y: center.y)

        // loop over all our points/inner points
        for _ in 0..<corners * 2  {
            // figure out the location of this point
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom: CGFloat

            // store this Y position
            bottom = center.y * sinAngle

            // …and add a line to there
            result.append(CGPoint(x: center.x * cosAngle, y: bottom).applying(transform))

            // move on to the next corner
            currentAngle += angleAdjustment
        }
        
        return result
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


        // loop over all our points/inner points
        for _ in 0..<corners * 2  {
            // figure out the location of this point
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom: CGFloat

            // store this Y position
            bottom = center.y * sinAngle

            // …and add a line to there
            path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))

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
