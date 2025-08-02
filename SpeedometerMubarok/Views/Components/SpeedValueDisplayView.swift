//
//  SpeedValueDisplayView.swift
//  SpeedometerMubarok
//
//  Created by mubarok on 2/8/25.
//

import SwiftUI

struct SpeedValueDisplayView: View {
    let value: String
    private let constants = SpeedometerConstants.self
    
    var body: some View {
        VStack(spacing: 0) {
            Text(value)
                .font(.system(size: constants.Typography.valueFontSize, weight: .bold, design: .rounded))
                .foregroundColor(constants.Colors.valueText)
        }
        .offset(y: constants.Dimensions.valueDisplayOffset)
    }
}

#Preview {
    SpeedValueDisplayView(value: "35k")
        .background(Color.black)
}
