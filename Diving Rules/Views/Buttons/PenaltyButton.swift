//
//  PenaltyButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 30/03/2021.
//

import SwiftUI

struct PenaltyButton: View {
    var buttonImage: String
    var buttonText: String
    var buttonImageWidth: CGFloat
    var buttonImageHeight: CGFloat
    @State var isOn: Bool
    @Binding var sanctionSelection: Int
    var sanctionID: Int

    var body: some View {
             Button(action: {
                isOn.toggle()
                // Does this action get executed ?????
                if isOn {
                    sanctionSelection = sanctionID
                } else {
                    sanctionSelection = 50
                }
                print("Button activated: \(sanctionID) - toggle: \(isOn) -  sanctionSelection: \(sanctionSelection)")

             }) {
                VStack {
                    Image (systemName: buttonImage)
                        .resizable()
                        .frame(width: buttonImageWidth, height: buttonImageHeight)
                    Text (buttonText)
                        .font(.caption)
                }
                .frame(width: 80.0)
                .padding(.all, 10.0)
//                .foregroundColor((isSet ? Color("AccentColor") : Color.secondary))
                .foregroundColor((isOn ? Color("AccentColor") : Color.gray))

//             .onTapGesture {
//                // Does this action get executed ?????
//                if isOn {
//                    sanctionSelection = sanctionID
//                } else {
//                    sanctionSelection = 50
//                }
//             }
        
             }

        
    }
}

struct PenaltyButton_Previews: PreviewProvider {
    @State static var sanctionPreview = 10
    static var previews: some View {
        PenaltyButton(buttonImage: "0.circle", buttonText: "Button-0pts", buttonImageWidth: 40.0, buttonImageHeight: 40.0, isOn: true, sanctionSelection: $sanctionPreview, sanctionID: 0)
    }
}
