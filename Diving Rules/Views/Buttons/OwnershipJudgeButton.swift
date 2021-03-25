//
//  OwnershipJudgeButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 18/03/2021.
//

import SwiftUI

struct OwnershipJudgeButton: View {
//    @Binding var isSet: Bool
    @State var isSet: Bool

    var body: some View {
        
        Button(action: {
            isSet.toggle()
        }) {
            VStack {
                // Ownership Referee
                Image (systemName: "person.3.fill")
                .resizable()
                    .frame(width: 89.0, height: 40.0)
                Text ("Button-Judge")
                    .font(.caption)
                    
            }
            .foregroundColor((isSet ? Color("AccentColor") : Color.gray))
        }
        
    }
}

struct OwnershipJudgeButton_Previews: PreviewProvider {
    static var previews: some View {
        OwnershipJudgeButton(isSet: true)
    }
}
