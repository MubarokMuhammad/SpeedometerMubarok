//
//  NeedleView.swift
//  SpeedometerMubarok
//
//  Created by mubarok on 2/8/25.
//

import SwiftUI

struct NeedleView: View {
    let angle: Double
    private let constants = SpeedometerConstants.self
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: constants.Values.centerX, y: constants.Values.centerY))
                path.addLine(to: CGPoint(x: constants.Values.centerX, y: constants.Values.centerY - constants.Dimensions.needleLength))
            }
            .stroke(constants.Colors.needleColor, lineWidth: constants.Dimensions.needleLineWidth)
            .rotationEffect(.degrees(angle), anchor: UnitPoint(x: 0.5, y: 0.5))
            
            Circle()
                .fill(constants.Colors.centerHub)
                .frame(width: constants.Dimensions.needleHubSize, height: constants.Dimensions.needleHubSize)
        }
        .frame(width: constants.Dimensions.outerCircleSize, height: constants.Dimensions.outerCircleSize)
    }
}

#Preview {
    NeedleView(angle: 45)
        .background(Color.gray)
}
