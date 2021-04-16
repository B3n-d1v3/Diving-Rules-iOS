//
//  PenaltyViewButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 09/04/2021.
//

import SwiftUI

struct PenaltyViewButton: View {
    var buttonImage: String
    var buttonText: String
    @State var isOn: Bool

    var body: some View {
        Button(action: {
        isOn.toggle()
    }) {
        VStack {
            Image (systemName: buttonImage)
                .resizable()
                .frame(width: 40.0, height: 40.0)
            Text (buttonText)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        .frame(width: 90.0)
        .padding(.all, 5.0)
        .foregroundColor((isOn ? Color("AccentColor") : Color.gray))
     }    }
}

struct PenaltyViewButton_Previews: PreviewProvider {
    static var previews: some View {
        PenaltyViewButton(buttonImage: "0.circle", buttonText: "Button-0pts", isOn: true)
            .previewLayout(.sizeThatFits)
    }
}
