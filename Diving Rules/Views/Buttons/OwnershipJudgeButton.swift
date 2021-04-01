//
//  OwnershipJudgeButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 18/03/2021.
//

import SwiftUI

struct OwnershipJudgeButton: View {
//    @Binding var isSet: Bool
    @State var isOn: Bool

    var body: some View {
        
        Button(action: {
            isOn.toggle()
        }) {
            VStack {
                // Ownership Referee
                Image (systemName: "person.3.fill")
                .resizable()
                    .frame(width: 89.0, height: 40.0)
                Text ("Button-Judge")
                    .font(.caption)
                    
            }
            .foregroundColor((isOn ? Color("AccentColor") : Color.secondary))
        }
        
    }
}

struct OwnershipJudgeButton_Previews: PreviewProvider {
    static var previews: some View {
        OwnershipJudgeButton(isOn: true)
    }
}
