//
//  SpeedometerBackgroundView.swift
//  SpeedometerMubarok
//
//  Created by mubarok on 2/8/25.
//

import SwiftUI

struct SpeedometerBackgroundView: View {
    private let constants = SpeedometerConstants.self
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            constants.Colors.outerRingDark,
                            constants.Colors.outerRingLight
                        ],
                        center: .center,
                        startRadius: 130,
                        endRadius: 164
                    )
                )
                .frame(width: constants.Dimensions.outerCircleSize, height: constants.Dimensions.outerCircleSize)
            
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            constants.Colors.backgroundTop,
                            constants.Colors.backgroundBottom
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: constants.Dimensions.innerCircleSize, height: constants.Dimensions.innerCircleSize)
                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
            
            Circle()
                .fill(constants.Colors.centerHub)
                .frame(width: constants.Dimensions.centerHubSize, height: constants.Dimensions.centerHubSize)
                .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 2)
        }
    }
}

#Preview {
    SpeedometerBackgroundView()
}
