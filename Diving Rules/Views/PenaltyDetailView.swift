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
    @State private var nextQuestion = false
    
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
                            
//                        Text(penalty.description)
                        
                        // Using tranlated penalty desciprion
                        let penaltyDescription = "Penalty-" + String(penalty.id)
                        Text(LocalizedStringKey( penaltyDescription))

                    } // VStack Penalty description
                    HStack {
                        Spacer()
                        //Penalty Reference
                        Text (rulesRelatedList (penaltyItem: penalty))
                            .font(.caption)
                            .fontWeight(.ultraLight)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.trailing)
                    } // HStack Penalty Reference

                Spacer()
                Divider ()
                //What is the saction for this penalty
                Text("Penalty-Penalty")
                    .font(.title2)
                    .foregroundColor(Color.accentColor)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)

                VStack(alignment: .center) {
                    // Penalties: What sanction is appropriate
                    HStack{
                        //Penalty Line 1
                        Spacer ()
                        // 0 pts
                        PenaltyViewButton(buttonImage: "0.circle", buttonText: NSLocalizedString("Button-0pts", comment: "Button Description"), isOn: (penalty.sanctionValue == 0))
                            .disabled(true)
                        Spacer ()
                        // Max 2 pts
                        PenaltyViewButton(buttonImage: "lessthan.circle.fill", buttonText: NSLocalizedString("Button-max2pts", comment: "Button Description"), isOn: (penalty.sanctionValue == 2))
                            .disabled(true)
                        Spacer ()
                        // Max 4 1/2 pts
                        PenaltyViewButton(buttonImage: "lessthan.circle", buttonText: NSLocalizedString("Button-max4halfpts", comment: "Button Description"), isOn: (penalty.sanctionValue == 3))
                            .disabled(true)
                        Spacer ()
                   } // HStack Penalty Line 1
                    HStack{
                        //Penalty Line 2
                        Spacer ()
                        // -2 pts
                        PenaltyViewButton(buttonImage: "gobackward.minus", buttonText: NSLocalizedString("Button--2pts", comment: "Button Description"), isOn: (penalty.sanctionValue == 1))
                            .disabled(true)
                        Spacer ()
                        // -1/2 to 2 pts
                        PenaltyViewButton(buttonImage: "arrow.left.and.right.circle", buttonText: NSLocalizedString("Button--halfto2pts", comment: "Button Description"), isOn: (penalty.sanctionValue == 4))
                            .disabled(true)
                        Spacer ()
                        // judge Opinion
                        PenaltyViewButton(buttonImage: "plusminus.circle", buttonText: NSLocalizedString("Button-judgeOpinion", comment: "Button Description"), isOn: (penalty.sanctionValue == 5))
                            .disabled(true)
                        Spacer ()
                    } // HStack Penalty Line 2
                } // VStack Penalty Buttons
                
                Divider ()
                // Ownership : who is can take the sanction
                Text("Penalty-Ownership")
                    .font(.title2)
                    .foregroundColor(Color.accentColor)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                
                VStack {
                    HStack {
                        // Ownership Referee
                        OwnerViewButton(buttonImage: "person.fill.and.arrow.left.and.arrow.right", imageWidth: 60.0, imageHeigth: 40.0, buttonText: NSLocalizedString("Button-Referee", comment: "Button Description"), isOn: penalty.referee)
                            .disabled(true)
                        Spacer ()
                        // Ownership Judge
                        OwnerViewButton(buttonImage: "person.3.fill", imageWidth: 85.0, imageHeigth: 40.0, buttonText: NSLocalizedString("Button-Judge", comment: "Button Description"), isOn: penalty.judge)
                            .disabled(true)
                    }  // HStack Ownership
                    .padding(.horizontal, 30.0)
                } // VStack Ownership
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer ()
                

            } // VStack Top
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        } //ScrollView
    } // Body
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
        Group {
            PenaltyDetailView(penalty: penalties[1])
                .environment(\.locale, .init(identifier: "en"))
            PenaltyDetailView(penalty: penalties[1])
                .environment(\.locale, .init(identifier: "fr"))
        }
            
    }
}
