//
//  ProgressArcView.swift
//  SpeedometerMubarok
//
//  Created by mubarok on 2/8/25.
//

import SwiftUI

struct ProgressArcView: View {
    let progressValue: Double
    private let constants = SpeedometerConstants.self
    
    var body: some View {
        Circle()
            .trim(from: 0, to: max(0, min(1, progressValue)))
            .stroke(
                constants.Colors.progressBlue,
                style: StrokeStyle(lineWidth: constants.Dimensions.progressLineWidth, lineCap: .round)
            )
            .frame(width: constants.Dimensions.progressCircleSize, height: constants.Dimensions.progressCircleSize)
            .rotationEffect(.degrees(constants.Values.progressStartAngle))
    }
}

#Preview {
    ProgressArcView(progressValue: 0.6)
        .background(Color.black)
}
