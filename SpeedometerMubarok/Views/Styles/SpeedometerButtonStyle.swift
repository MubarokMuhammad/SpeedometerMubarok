//
//  SpeedometerButtonStyle.swift
//  SpeedometerMubarok
//
//  Created by mubarok on 2/8/25.
//

import SwiftUI

struct SpeedometerButtonStyle: ButtonStyle {
    private let constants = SpeedometerConstants.self
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(.system(size: constants.Typography.buttonFontSize, weight: .medium))
            .padding(.horizontal, 30)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.35, green: 0.67, blue: 0.87))
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: constants.Animation.buttonPressDuration), value: configuration.isPressed)
    }
}

#Preview {
    Button("Test Button") {
        // Action
    }
    .buttonStyle(SpeedometerButtonStyle())
}
