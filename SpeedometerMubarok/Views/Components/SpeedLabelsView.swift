//
//  SpeedLabelsView.swift
//  SpeedometerMubarok
//
//  Created by mubarok on 2/8/25.
//

import SwiftUI

struct SpeedLabelsView: View {
    private let constants = SpeedometerConstants.self
    
    var body: some View {
        ZStack {
            ForEach(0..<constants.Values.labelTexts.count, id: \.self) { index in
                Text(constants.Values.labelTexts[index])
                    .font(.system(size: constants.Typography.labelFontSize, weight: .bold, design: .rounded))
                    .foregroundColor(constants.Colors.labelText)
                    .position(
                        x: constants.Values.labelPositions[index].x + (constants.Values.labelWidths[index] / 2),
                        y: constants.Values.labelPositions[index].y + constants.Values.labelOffsetY
                    )
            }
        }
        .frame(width: constants.Dimensions.outerCircleSize, height: constants.Dimensions.outerCircleSize)
    }
}

#Preview {
    SpeedLabelsView()
        .background(Color.black)
}
