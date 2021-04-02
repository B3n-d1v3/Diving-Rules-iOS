//
//  PenaltyButton.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 30/03/2021.
//

import SwiftUI

struct PenaltyButton: View {
    var buttonImage: String
    var buttonText: String
    var buttonImageWidth: CGFloat
    var buttonImageHeight: CGFloat
    @Binding var isOn: Bool
    @Binding var sanctionSelection: Int
    var sanctionID: Int
    
    @Binding var penaltyZeroPts: Bool
    @Binding var penaltyMaxTwoPts: Bool
    @Binding var penaltyMaxFourHalfPts: Bool
    @Binding var penaltyMinusTwoPts: Bool
    @Binding var penaltyMinusHalfToTwoPts: Bool
    @Binding var penaltyJudgeOpinion: Bool

    
    var body: some View {
             Button(action: {
                isOn.toggle()
                // Does this action get executed ?????
                if isOn {
                    sanctionSelection = sanctionID
                    if (sanctionID == 0) {penaltyZeroPts = true} else {penaltyZeroPts = false}
                    if (sanctionID == 2) {penaltyMaxTwoPts = true} else {penaltyMaxTwoPts = false}
                    if (sanctionID == 3) {penaltyMaxFourHalfPts = true} else {penaltyMaxFourHalfPts = false}
                    if (sanctionID == 1) {penaltyMinusTwoPts = true} else {penaltyMinusTwoPts = false}
                    if (sanctionID == 4) {penaltyMinusHalfToTwoPts = true} else {penaltyMinusHalfToTwoPts = false}
                    if (sanctionID == 5) {penaltyJudgeOpinion = true} else {penaltyJudgeOpinion = false}

                } else {
                    sanctionSelection = 50
                    if (sanctionID == 0) {penaltyZeroPts = false}
                    if (sanctionID == 2) {penaltyMaxTwoPts = false}
                    if (sanctionID == 3) {penaltyMaxFourHalfPts = false}
                    if (sanctionID == 1) {penaltyMinusTwoPts = false}
                    if (sanctionID == 4) {penaltyMinusHalfToTwoPts = false}
                    if (sanctionID == 5) {penaltyJudgeOpinion = false}
                }
                print("[PenaltyButton] Button activated: \(sanctionID) - toggle: \(isOn) -  sanctionSelection: \(sanctionSelection)")

             }) {
                VStack {
                    Image (systemName: buttonImage)
                        .resizable()
                        .frame(width: buttonImageWidth, height: buttonImageHeight)
                    Text (buttonText)
                        .font(.caption)
                }
                .frame(width: 80.0)
                .padding(.all, 10.0)
//                .foregroundColor((isSet ? Color("AccentColor") : Color.secondary))
                .foregroundColor((isOn ? Color("AccentColor") : Color.gray))

//             .onTapGesture {
//                // Does this action get executed ?????
//                if isOn {
//                    sanctionSelection = sanctionID
//                } else {
//                    sanctionSelection = 50
//                }
//             }
        
             }

        
    }
    
    func ToogleButtons(buttonOn: Int) {
        if (buttonOn == 0) {
            
        }
//        penaltyZeroPts = false
//        penaltyMaxTwoPts = false
//        penaltyMaxFourHalfPts = false
//        penaltyMinusTwoPts = false
//        penaltyMinusHalfToTwoPts = false
//        penaltyJudgeOpinion = false

    }
}

struct PenaltyButton_Previews: PreviewProvider {
    @State static var sanctionPreview = 10
    @State static var penaltyOn = true
    @State static var penaltyZeroPts = false
    @State static var penaltyMaxTwoPts = false
    @State static var penaltyMaxFourHalfPts = false
    @State static var penaltyMinusTwoPts = false
    @State static var penaltyMinusHalfToTwoPts = false
    @State static var penaltyJudgeOpinion = false

    static var previews: some View {
        PenaltyButton(buttonImage: "0.circle", buttonText: "Button-0pts", buttonImageWidth: 40.0, buttonImageHeight: 40.0, isOn: $penaltyOn, sanctionSelection: $sanctionPreview, sanctionID: 0, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion)
    }
}
