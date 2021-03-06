//
//  OwnershipJudgeButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 18/03/2021.
//

import SwiftUI

struct OwnershipJudgeButton: View {
    @Binding var isOn: Bool
//    @Binding var sanctionSelection: Int
//    @Binding var ownershipReferee: Bool
    @Binding var nextQuestion: Bool

    var body: some View {
        // The button used to show the penalty owner Judge selection
        // Within the Quizz Question View
        Button(action: {
            isOn.toggle()
            if (penaltyButtonStatus.userSanctionSelection > 6) || (!penaltyButtonStatus.ownershipReferee && !isOn) {
                // next button should be turned off
                nextQuestion = false
            } else {
                // next button should be turned on
                nextQuestion = true
            }
//            print("[RefereeButton] Button activated - toggle: \(isOn) -  sanctionSelection: \(sanctionSelection) - nextQuestion: \(nextQuestion)")
        }) {
            VStack {
                // Ownership Referee
                Image (systemName: "person.3.fill")
                .resizable()
                    .frame(width: 80.0, height: 37.0)
                Text ("Button-Judge")
                    .font(.caption)
                    
            }
            .foregroundColor((isOn ? Color("AccentColor") : Color.gray))
        }
        
    }
}

struct OwnershipJudgeButton_Previews: PreviewProvider {
    @State static var ownerJudgeOn = true
//    @State static var sanctionPreview = 10
//    @State static var ownershipReferee = false
    @State static var nextQuestion = false

    static var previews: some View {
//        OwnershipJudgeButton(isOn: $ownerJudgeOn, sanctionSelection: $sanctionPreview, ownershipReferee: $ownershipReferee, nextQuestion: $nextQuestion)
        OwnershipJudgeButton(isOn: $ownerJudgeOn, nextQuestion: $nextQuestion)
          .previewLayout(.sizeThatFits)
    }
}
