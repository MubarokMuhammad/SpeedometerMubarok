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
            Capsule()
                .fill(constants.Colors.needleColor)
                .frame(width: constants.Dimensions.needleLineWidth, height: constants.Dimensions.needleLength - constants.Dimensions.needleHubSize / 2)
                .offset(y: -(constants.Dimensions.needleLength - constants.Dimensions.needleHubSize / 2) / 2 - constants.Dimensions.needleHubSize / 2)
                .rotationEffect(.degrees(angle), anchor: .center)
            
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
