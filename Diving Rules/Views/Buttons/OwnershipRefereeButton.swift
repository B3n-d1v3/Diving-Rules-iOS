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

    var body: some View {
        
        Button(action: {
            isSet.toggle()
        }) {
            VStack {
                // Ownership Referee
                Image (systemName: "person.fill.and.arrow.left.and.arrow.right")
                .resizable()
                    .frame(width: 60.0, height: 40.0)
                    .foregroundColor((isSet ? Color.blue : Color.gray))
                Text ("Button-Referee")
                    .font(.caption)
                    .foregroundColor((isSet ? Color.blue : Color.gray))
            }
        }
        
    }
}

struct OwnershipRefereeButton_Previews: PreviewProvider {
    static var previews: some View {
        OwnershipRefereeButton(isSet: true)
    }
}
