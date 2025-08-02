//
//  SpeedometerModel.swift
//  SpeedometerMubarok
//
//  Created by mubarok on 2/8/25.
//

import Foundation

struct SpeedometerModel {
    var currentValue: Double
    var needleAngle: Double
    var progressValue: Double
    var isAnimating: Bool
    
    init(currentValue: Double = 0) {
        self.currentValue = currentValue
        self.needleAngle = 0
        self.progressValue = 0
        self.isAnimating = false
    }
}

struct SpeedLabel {
    let text: String
    let value: Double
    let position: CGPoint
    let width: Double
    
    init(text: String, value: Double, x: Double, y: Double, width: Double) {
        self.text = text
        self.value = value
        self.position = CGPoint(x: x, y: y)
        self.width = width
    }
}
