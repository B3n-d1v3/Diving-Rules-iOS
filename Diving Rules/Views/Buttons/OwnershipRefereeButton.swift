//
//  OwnershipRefereeButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 18/03/2021.
//

import SwiftUI

struct OwnershipRefereeButton: View {
    @Binding var isOn: Bool
//    @State var isOn: Bool
//    Color(red: 0.0, green: 0.38, blue: 0.62, opacity: 1.0)

    var body: some View {
        
        Button(action: {
            isOn.toggle()
        }) {
            VStack {
                // Ownership Referee
                Image (systemName: "person.fill.and.arrow.left.and.arrow.right")
                .resizable()
                    .frame(width: 60.0, height: 40.0)
                Text ("Button-Referee")
                    .font(.caption)
            }
            .foregroundColor((isOn ? Color("AccentColor") : Color.gray))
        }
        
    }
}

struct OwnershipRefereeButton_Previews: PreviewProvider {
    @State static var ownerRefereeOn = true
    
    static var previews: some View {
        OwnershipRefereeButton(isOn: $ownerRefereeOn)
    }
}
