//
//  SpeedometerView.swift
//  SpeedometerMubarok
//
//  Created by mubarok on 2/8/25.
//

import SwiftUI

struct SpeedometerView: View {
    @StateObject private var viewModel = SpeedometerViewModel()
    private let constants = SpeedometerConstants.self
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: constants.Dimensions.topSpacing)
            
            ZStack {
                SpeedometerBackgroundView()
                
                ProgressArcView(progressValue: viewModel.speedometerData.progressValue)
                
                SpeedLabelsView()
                
                NeedleView(angle: viewModel.speedometerData.needleAngle)
                
                SpeedValueDisplayView(value: viewModel.formatValue(viewModel.speedometerData.currentValue))
            }
            
            Spacer().frame(height: constants.Dimensions.bottomSpacing)
            
            SpeedInputFormView(
                inputText: $viewModel.inputText,
                onSubmit: viewModel.submitSpeed
            )
        }
        .background(constants.Colors.backgroundColor)
    }
}

#Preview {
    SpeedometerView()
}
