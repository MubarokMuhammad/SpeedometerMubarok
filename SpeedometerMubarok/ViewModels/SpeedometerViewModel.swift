//
//  SpeedometerViewModel.swift
//  SpeedometerMubarok
//
//  Created by mubarok on 2/8/25.
//

import SwiftUI
import Combine

class SpeedometerViewModel: ObservableObject {
    @Published var speedometerData = SpeedometerModel()
    @Published var inputText: String = ""
    
    private let constants = SpeedometerConstants.self
    
    init() {
        updateAnglesForCurrentValue()
    }
    
    // MARK: - Public Methods
    
    func submitSpeed() {
        guard let value = Double(inputText) else {
            return
        }
        setSpeed(value)
        inputText = ""
    }
    
    func testRandomSpeed() {
        let randomValue = constants.Values.testValues.randomElement() ?? 15200
        setSpeed(randomValue)
    }
    
    func setSpeed(_ value: Double) {
        let inputValue = max(value, 0)
        let clampedValueForAnimation = min(inputValue, constants.Values.maxValue)
        
        provideFeedback()
        
        let newProgressValue = calculateProgressValue(for: clampedValueForAnimation)
        let newNeedleAngle = calculateNeedleAngle(for: clampedValueForAnimation)
        
        withAnimation(.easeInOut(duration: constants.Animation.speedTransitionDuration)) {
            speedometerData.progressValue = newProgressValue
            speedometerData.needleAngle = newNeedleAngle
        }
        
        speedometerData.currentValue = inputValue
    }
    
    func formatValue(_ value: Double) -> String {
        if value >= 1000 {
            let kValue = value / 1000
            if kValue.truncatingRemainder(dividingBy: 1) == 0 {
                return String(format: "%.0fk", kValue)
            } else {
                return String(format: "%.1fk", kValue)
            }
        } else {
            return String(format: "%.0f", value)
        }
    }
    
    // MARK: - Private Methods
    
    private func updateAnglesForCurrentValue() {
        speedometerData.needleAngle = calculateNeedleAngle(for: speedometerData.currentValue)
        speedometerData.progressValue = calculateProgressValue(for: speedometerData.currentValue)
    }
    
    private func provideFeedback() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
    
    private func calculateProgressValue(for value: Double) -> Double {
        let currentAngle = calculateNeedleAngle(for: value)
        let zeroAngle = calculateNeedleAngle(for: 0)
        let maxAngle = calculateNeedleAngle(for: constants.Values.maxValue)
        
        let progressAngle = currentAngle - zeroAngle
        let totalAngleRange = maxAngle - zeroAngle
        
        let normalizedProgress = progressAngle / totalAngleRange
        let circleProgress = normalizedProgress * (totalAngleRange / 360.0)
        
        let result = max(0, min(1, circleProgress))
        return result
    }
    
    private func calculateNeedleAngle(for value: Double) -> Double {
        let labelValues = constants.Values.labelValues
        let labelPositions = constants.Values.labelPositions
        let labelWidths = constants.Values.labelWidths
        
        let labelAngles: [Double] = labelPositions.enumerated().map { index, pos in
            let centerX = constants.Values.centerX
            let centerY = constants.Values.centerY
            let deltaX = pos.x + (labelWidths[index] / 2) - centerX
            let deltaY = pos.y + constants.Values.labelOffsetY - centerY
            
            let angleRad = atan2(Double(deltaX), Double(-deltaY))
            let angleDeg = angleRad * 180.0 / Double.pi
            return angleDeg
        }
        
        if value == 15200 {
            let angle10k = labelAngles[3]
            let angle25k = labelAngles[4]
            let proportion = (15200 - 10000) / (25000 - 10000)
            let result = angle10k + (angle25k - angle10k) * Double(proportion)
            return result
        }
        
        if value <= labelValues.first ?? 0 {
            let result = labelAngles.first ?? 0
            return result
        }
        if value >= labelValues.last ?? constants.Values.maxValue {
            let result = labelAngles.last ?? 0
            return result
        }
        
        for i in 0..<(labelValues.count - 1) {
            let lowerValue = labelValues[i]
            let upperValue = labelValues[i + 1]
            
            if value >= lowerValue && value <= upperValue {
                let lowerAngle = labelAngles[i]
                let upperAngle = labelAngles[i + 1]
                
                let proportion = (value - lowerValue) / (upperValue - lowerValue)
                let result = lowerAngle + (upperAngle - lowerAngle) * proportion
                return result
            }
        }
        
        let result = labelAngles.last ?? 0
        return result
    }
}
