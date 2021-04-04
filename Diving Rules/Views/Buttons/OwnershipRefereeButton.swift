//
//  OwnershipRefereeButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 18/03/2021.
//

import SwiftUI

struct OwnershipRefereeButton: View {
    @Binding var isOn: Bool
    @Binding var sanctionSelection: Int
    @Binding var ownershipJudge: Bool
    @Binding var nextQuestion: Bool

    var body: some View {
        
        Button(action: {
            isOn.toggle()
            if (sanctionSelection > 6) || (!isOn && !ownershipJudge) {
                // next button should be turned off
                nextQuestion = false
            } else {
                // next button should be turned on
                nextQuestion = true
            }
            print("[RefereeButton] Button activated - toggle: \(isOn) -  sanctionSelection: \(sanctionSelection) - nextQuestion: \(nextQuestion)")
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
    @State static var sanctionPreview = 10
    @State static var ownershipReferee = false
    @State static var ownershipJudge = false
    @State static var nextQuestion = false
    
    static var previews: some View {
        OwnershipRefereeButton(isOn: $ownerRefereeOn, sanctionSelection: $sanctionPreview, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
    }
}
