//
//  OwnershipRefereeButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 18/03/2021.
//

import SwiftUI

struct OwnershipRefereeButton: View {
//    @Binding var isSet: Bool
    @State var isSet: Bool
//    Color(red: 0.0, green: 0.38, blue: 0.62, opacity: 1.0)

    var body: some View {
        
        Button(action: {
            isSet.toggle()
        }) {
            VStack {
                // Ownership Referee
                Image (systemName: "person.fill.and.arrow.left.and.arrow.right")
                .resizable()
                    .frame(width: 60.0, height: 40.0)
                Text ("Button-Referee")
                    .font(.caption)
            }
            .foregroundColor((isSet ? Color("AccentColor") : Color.secondary))
        }
        
    }
}

struct OwnershipRefereeButton_Previews: PreviewProvider {
    static var previews: some View {
        OwnershipRefereeButton(isSet: false)
    }
}
