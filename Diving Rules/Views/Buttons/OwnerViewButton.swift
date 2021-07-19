//
//  OwnerViewButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 09/04/2021.
//

import SwiftUI

struct OwnerViewButton: View {
    // The button used to show the penalty owner selection
    // Within the Penalty Detail View
    var buttonImage: String
    var imageWidth: CGFloat
    var imageHeigth: CGFloat
    var buttonText: String
    @State var isOn: Bool

    var body: some View {
        Button(action: {
            isOn.toggle()
       }) {
            VStack {
                // Ownership Referee
                Image (systemName: buttonImage)
                    .resizable()
                    .frame(width: imageWidth, height: imageHeigth)
                Text (buttonText)
                    .font(.caption)
            }
            .foregroundColor((isOn ? Color("AccentColor") : Color.gray))
        }
        
    }
}

struct OwnerViewButton_Previews: PreviewProvider {
    // Referee:
    // Image (systemName: "person.fill.and.arrow.left.and.arrow.right")
    // .frame(width: 60.0, height: 40.0)
    // Text ("Button-Referee")
    // Judge
    // Image (systemName: "person.3.fill")
    // Text ("Button-Judge")
    //.frame(width: 89.0, height: 40.0)
    
    static var previews: some View {
        OwnerViewButton(buttonImage: "person.fill.and.arrow.left.and.arrow.right", imageWidth: 60.0, imageHeigth: 40.0, buttonText: "Button-Referee", isOn: true)
            .previewLayout(.sizeThatFits)
    }
}
