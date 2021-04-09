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
    @Binding var sanctionSelection: Int
    var sanctionID: Int
    
    // button status
    @Binding var penaltyZeroPts: Bool
    @Binding var penaltyMaxTwoPts: Bool
    @Binding var penaltyMaxFourHalfPts: Bool
    @Binding var penaltyMinusTwoPts: Bool
    @Binding var penaltyMinusHalfToTwoPts: Bool
    @Binding var penaltyJudgeOpinion: Bool
    
    // Next Status
    @Binding var ownershipReferee: Bool
    @Binding var ownershipJudge: Bool
    @Binding var nextQuestion: Bool

    
    var body: some View {
             Button(action: {
                isOn.toggle()
                // when button is turned on
                if isOn {
                    sanctionSelection = sanctionID
                    if (sanctionID == 0) {penaltyZeroPts = true} else {penaltyZeroPts = false}
                    if (sanctionID == 2) {penaltyMaxTwoPts = true} else {penaltyMaxTwoPts = false}
                    if (sanctionID == 3) {penaltyMaxFourHalfPts = true} else {penaltyMaxFourHalfPts = false}
                    if (sanctionID == 1) {penaltyMinusTwoPts = true} else {penaltyMinusTwoPts = false}
                    if (sanctionID == 4) {penaltyMinusHalfToTwoPts = true} else {penaltyMinusHalfToTwoPts = false}
                    if (sanctionID == 5) {penaltyJudgeOpinion = true} else {penaltyJudgeOpinion = false}
                } else {
                    // when button is turned off
                    sanctionSelection = 50
                    if (sanctionID == 0) {penaltyZeroPts = false}
                    if (sanctionID == 2) {penaltyMaxTwoPts = false}
                    if (sanctionID == 3) {penaltyMaxFourHalfPts = false}
                    if (sanctionID == 1) {penaltyMinusTwoPts = false}
                    if (sanctionID == 4) {penaltyMinusHalfToTwoPts = false}
                    if (sanctionID == 5) {penaltyJudgeOpinion = false}
                }
                if (sanctionSelection > 6) || (!ownershipReferee && !ownershipJudge) {
                    // next button should be turned off
                    nextQuestion = false
                } else {
                    // next button should be turned on
                    nextQuestion = true
                }
                print("[PenaltyButton] Button activated: \(sanctionID) - toggle: \(isOn) -  sanctionSelection: \(sanctionSelection) - nextQuestion: \(nextQuestion)")

             }) {
                VStack {
                    Image (systemName: buttonImage)
                        .resizable()
                        .frame(width: 40.0, height: 40.0)
                    Text (buttonText)
                        .font(.caption)
                }
                .frame(width: 80.0)
                .padding(.all, 10.0)
                .foregroundColor((isOn ? Color("AccentColor") : Color.gray))
             }
    }
}

struct PenaltySelectionButton_Previews: PreviewProvider {
    @State static var sanctionPreview = 10
    @State static var penaltyOn = true
    @State static var penaltyZeroPts = false
    @State static var penaltyMaxTwoPts = false
    @State static var penaltyMaxFourHalfPts = false
    @State static var penaltyMinusTwoPts = false
    @State static var penaltyMinusHalfToTwoPts = false
    @State static var penaltyJudgeOpinion = false
    @State static var ownershipReferee = false
    @State static var ownershipJudge = false
    @State static var nextQuestion = false


    static var previews: some View {
        PenaltySelectionButton(buttonImage: "0.circle", buttonText: "Button-0pts", isOn: $penaltyOn, sanctionSelection: $sanctionPreview, sanctionID: 0, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion, ownershipReferee: $ownershipReferee, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
    }
}
