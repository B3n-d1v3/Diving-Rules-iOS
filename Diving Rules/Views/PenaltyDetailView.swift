//
//  PenaltyDetailView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import SwiftUI

struct PenaltyDetailView: View {
    var penalty: Penalty
    var penaltyIconImageWidth: CGFloat = 40.0
    var penaltyIconImageHeight: CGFloat = 40.0
    @State private var userSanctionSelection = 50
//    var ruleSanctionId: Int

    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                    //Rule Description
                    VStack (alignment: .leading) {
                        Text("Penalty-Rule")
                            .font(.title)
                            .foregroundColor(Color.accentColor)
                            .padding(.bottom, 1.0)


                        Text("Penalty-Description")
                            .font(.title2)
                            .foregroundColor(Color.accentColor)
                            .padding(.bottom)
                            
                        Text(penalty.description)
//                            .fixedSize(horizontal: false, vertical: true)
                    }
                    HStack {
                        Spacer()
                        Text (rulesRelatedList (penaltyItem: penalty))
                            .font(.caption)
                            .fontWeight(.ultraLight)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.trailing)
                        
                    }


                Spacer()
                Divider ()
                //What is the saction for this penalty
                Text("Penalty-Penalty")
                    .font(.title2)
                    .foregroundColor(Color.accentColor)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)

                VStack(alignment: .center) {
                    HStack{
                        //Penalty Line 1
                        Spacer ()
                        // 0 pts
                        PenaltyZeroPtsButton(isOn: (penalty.sanctionValue == 0))
                            .disabled(true)
                        Spacer ()
                        // Max 2 pts
                        // ToDo >>>>> Change other buttons in this screen
                        PenaltyMaxTwoPtsButton (isOn: (penalty.sanctionValue == 2))
                            .disabled(true)
                        Spacer ()
                        // Max 4 1/2 pts
                        PenaltyMaxFourHalfPtsButton (isOn: (penalty.sanctionValue == 3))
                            .disabled(true)
                        Spacer ()
                   }
                    HStack{
                        //Penalty Line 2
                        Spacer ()
                        // -2 pts
                        PenaltyMinusTwoPtsButton (isOn: (penalty.sanctionValue == 1))
                            .disabled(true)
                        Spacer ()
                        // -1/2 to 2 pts
                        PenaltyMinusHalfToTwoPtsButton (isOn: (penalty.sanctionValue == 4))
                            .disabled(true)
                        Spacer ()
                        // judge Opinion
                        PenaltyJudgeOpinionButton (isOn: (penalty.sanctionValue == 5))
                            .disabled(true)
                        Spacer ()
                    }
                }
                
                Divider ()
                // who is can take the sanction
                Text("Penalty-Ownership")
                    .font(.title2)
                    .foregroundColor(Color.accentColor)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                
                VStack {
                    HStack {
                        // Ownership Referee
                        OwnershipRefereeButton (isOn: penalty.referee)
                            .disabled(true)

//                        .onTapGesture {
//                            isOwnerReferee.toggle()
//                        }
                        Spacer ()
                        // Ownership Judge
                        OwnershipJudgeButton (isOn: penalty.judge)
                            .disabled(true)
                    }
                    .padding(.horizontal, 30.0)
                }
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer ()
                

            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
}

func rulesRelatedList(penaltyItem: Penalty) -> String {
    var rulesList = ""
    for item in penaltyItem.rules {
        rulesList += " - \(item.ruleId)"
    }
    return rulesList
    //                        penalty.rules.count

}


struct PenaltyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PenaltyDetailView(penalty: penalties[1])
            
    }
}
