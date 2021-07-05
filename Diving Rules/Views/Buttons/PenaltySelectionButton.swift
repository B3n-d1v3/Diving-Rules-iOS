//
//  PenaltyButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 30/03/2021.
//

import SwiftUI

struct PenaltySelectionButton: View {
    var buttonImage: String
    var buttonText: String
    @Binding var isOn: Bool
    var sanctionID: Int
    @Binding var nextQuestion: Bool

    
    var body: some View {
             Button(action: {
                isOn.toggle()
                // when button is turned on
                if isOn {
                    penaltyButtonStatus.userSanctionSelection = sanctionID
                    if (sanctionID == 0) {penaltyButtonStatus.penaltyZeroPts = true} else {penaltyButtonStatus.penaltyZeroPts = false}
                    if (sanctionID == 2) {penaltyButtonStatus.penaltyMaxTwoPts = true} else {penaltyButtonStatus.penaltyMaxTwoPts = false}
                    if (sanctionID == 3) {penaltyButtonStatus.penaltyMaxFourHalfPts = true} else {penaltyButtonStatus.penaltyMaxFourHalfPts = false}
                    if (sanctionID == 1) {penaltyButtonStatus.penaltyMinusTwoPts = true} else {penaltyButtonStatus.penaltyMinusTwoPts = false}
                    if (sanctionID == 4) {penaltyButtonStatus.penaltyMinusHalfToTwoPts = true} else {penaltyButtonStatus.penaltyMinusHalfToTwoPts = false}
                    if (sanctionID == 5) {penaltyButtonStatus.penaltyJudgeOpinion = true} else {penaltyButtonStatus.penaltyJudgeOpinion = false}
                } else {
                    // when button is turned off
                    penaltyButtonStatus.userSanctionSelection = 50
                    if (sanctionID == 0) {penaltyButtonStatus.penaltyZeroPts = false}
                    if (sanctionID == 2) {penaltyButtonStatus.penaltyMaxTwoPts = false}
                    if (sanctionID == 3) {penaltyButtonStatus.penaltyMaxFourHalfPts = false}
                    if (sanctionID == 1) {penaltyButtonStatus.penaltyMinusTwoPts = false}
                    if (sanctionID == 4) {penaltyButtonStatus.penaltyMinusHalfToTwoPts = false}
                    if (sanctionID == 5) {penaltyButtonStatus.penaltyJudgeOpinion = false}
                }
                if (penaltyButtonStatus.userSanctionSelection > 6) || (!penaltyButtonStatus.ownershipReferee && !penaltyButtonStatus.ownershipJudge) {
                    // next button should be turned off
                    nextQuestion = false
                } else {
                    // next button should be turned on
                    nextQuestion = true
                }
//                print ("[PenaltyButton] Button activated:  \(sanctionID) - penaltyButtonStatus: ")
//                print (penaltyButtonStatus)
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
             }
    }
}

struct PenaltySelectionButton_Previews: PreviewProvider {
    @State static var penaltyOn = true
    @State static var nextQuestion = false


    static var previews: some View {
        PenaltySelectionButton(buttonImage: "0.circle", buttonText: "Button-0pts", isOn: $penaltyOn, sanctionID: 0, nextQuestion: $nextQuestion)
            .previewLayout(.sizeThatFits)
    }

}
