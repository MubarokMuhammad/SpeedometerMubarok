//
//  SpeedInputFormView.swift
//  SpeedometerMubarok
//
//  Created by mubarok on 2/8/25.
//

import SwiftUI

struct SpeedInputFormView: View {
    @Binding var inputText: String
    let onSubmit: () -> Void
    
    private let constants = SpeedometerConstants.self
    
    var body: some View {
        VStack(spacing: 10) {
            TextField("Enter Speed", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .frame(maxWidth: constants.Dimensions.formMaxWidth)
            
            Button("Submit") {
                onSubmit()
            }
            .disabled(inputText.isEmpty)
            .padding(.horizontal, 30)
            .padding(.vertical, 8)
            .background(inputText.isEmpty ? Color.gray.opacity(0.3) : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 30)
    }
}

#Preview {
    SpeedInputFormView(
        inputText: .constant("100"),
        onSubmit: {}
    )
}
