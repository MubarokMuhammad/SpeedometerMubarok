//
//  SpeedometerConstants.swift
//  SpeedometerMubarok
//
//  Created by mubarok on 2/8/25.
//

import SwiftUI

struct SpeedometerConstants {
    
    // MARK: - Colors
    struct Colors {
        static let outerRingDark = Color(hex: "#101820")
        static let outerRingLight = Color(hex: "#C1C7CD")
        static let backgroundTop = Color(hex: "#676E75")
        static let backgroundBottom = Color(hex: "#101820")
        static let progressBlue = Color(hex: "#549FCD")
        static let centerHub = Color(hex: "#101820")
        static let needleColor = Color(hex: "#549FCD")
        static let labelText = Color.white
        static let valueText = Color(hex: "#549FCD")
        static let backgroundColor = Color.white
    }
    
    // MARK: - Dimensions
    struct Dimensions {
        static let outerCircleSize: CGFloat = 328
        static let innerCircleSize: CGFloat = 309
        static let progressCircleSize: CGFloat = 318.5
        static let centerHubSize: CGFloat = 62
        static let needleHubSize: CGFloat = 8
        static let progressLineWidth: CGFloat = 9.5
        static let needleLineWidth: CGFloat = 5
        static let needleLength: CGFloat = 120
        static let valueDisplayOffset: CGFloat = 88
        static let topSpacing: CGFloat = 50
        static let bottomSpacing: CGFloat = 40
        static let formMaxWidth: CGFloat = 200
    }
    
    // MARK: - Values
    struct Values {
        static let maxValue: Double = 100000
        static let minAngle: Double = -90
        static let maxAngle: Double = 90
        static let progressStartAngle: Double = -108.67 - 90
        static let centerX: Double = 164.0
        static let centerY: Double = 164.0
        static let labelOffsetY: Double = 14.26
        
        static let testValues: [Double] = [0, 1000, 5000, 10000, 15200, 25000, 50000, 100000]
        
        static let labelValues: [Double] = [0, 1000, 5000, 10000, 25000, 50000, 100000]
        
        static let labelPositions: [(x: Double, y: Double)] = [
            (28.52, 193.71),
            (26.14, 111.71),
            (76.06, 43.97),
            (149.74, 16.64),
            (230.55, 43.97),
            (273.33, 111.71),
            (251.94, 193.71)
        ]
        
        static let labelWidths: [Double] = [
            10.7,
            19.01,
            19.01,
            28.52,
            28.52,
            28.52,
            47.54
        ]
        
        static let labelTexts: [String] = ["0", "1k", "5k", "10k", "25k", "50k", "100k+"]
    }
    
    // MARK: - Animation
    struct Animation {
        static let speedTransitionDuration: Double = 1.2
        static let buttonPressDuration: Double = 0.1
    }
    
    // MARK: - Typography
    struct Typography {
        static let labelFontSize: CGFloat = 16
        static let valueFontSize: CGFloat = 24
        static let buttonFontSize: CGFloat = 16
    }
}
