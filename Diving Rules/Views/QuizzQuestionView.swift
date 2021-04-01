//
//  QuizzQuestion.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import SwiftUI

//enum PenaltySanction {
//    case zeroPts, maxTwoPts, 
//}

struct QuizzQuestionView: View {
    
    // ToDo >>>>>> ADD count the number of penalties to random from   <<<<<<
    @State private var penatlyNumber = Int.random(in: 0...45)
//    @State private var penalty = penalties[penatlyNumber]
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
//    @State private var resetPenalties = false
    
    @State private var userSanctionSelection = 55
    var penaltyIconImageWidth: CGFloat = 40.0
    var penaltyIconImageHeight: CGFloat = 40.0
    
    // ToDo Init with all penalties sanctions to unselected
    
    var body: some View {
        ScrollView {
            let penalty = penalties[penatlyNumber]
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
                        PenaltyButton (buttonImage: "0.circle", buttonText: NSLocalizedString("Button-0pts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: (userSanctionSelection == 0), sanctionSelection: $userSanctionSelection, sanctionID: 0)

                        Spacer ()
                        // Max 2 pts
                        PenaltyButton (buttonImage: "lessthan.circle.fill", buttonText: NSLocalizedString("Button-max2pts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: (userSanctionSelection == 2), sanctionSelection: $userSanctionSelection, sanctionID: 2)
//                        PenaltyMaxTwoPtsButton (isSet: resetPenalties)
                        Spacer ()
                        // Max 4 1/2 pts
                        PenaltyButton (buttonImage: "lessthan.circle", buttonText: NSLocalizedString("Button-max4halfpts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: (userSanctionSelection == 3), sanctionSelection: $userSanctionSelection, sanctionID: 3)
//                        PenaltyMaxFourHalfPtsButton (isSet: resetPenalties)
                        Spacer ()
                   }
                    HStack{
                        //Penalty Line 2
                        Spacer ()
                        // -2 pts
                        PenaltyButton (buttonImage: "gobackward.minus", buttonText: NSLocalizedString("Button--2pts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: (userSanctionSelection == 1), sanctionSelection: $userSanctionSelection, sanctionID: 1)
//                        PenaltyMinusTwoPtsButton (isSet: resetPenalties)
                        Spacer ()
                        // -1/2 to 2 pts
                        PenaltyButton (buttonImage: "arrow.left.and.right.circle", buttonText: NSLocalizedString("Button--halfto2pts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: (userSanctionSelection == 4), sanctionSelection: $userSanctionSelection, sanctionID: 4)
//                        PenaltyMinusHalfToTwoPtsButton (isSet: resetPenalties)
                        Spacer ()
                        // judge Opinion
                        PenaltyButton (buttonImage: "plusminus.circle", buttonText: NSLocalizedString("Button-judgeOpinion", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: (userSanctionSelection == 5), sanctionSelection: $userSanctionSelection, sanctionID: 4)
//                        PenaltyJudgeOpinionButton (isSet: resetPenalties)
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
                        OwnershipRefereeButton (isOn: false)

//                        .onTapGesture {
//                            isOwnerReferee.toggle()
//                        }
                        Spacer ()
                        // Ownership Judge
                        OwnershipJudgeButton (isOn: false)
                    }
                    .padding(.horizontal, 30.0)
                }
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Divider ()
                // Navigation
                HStack {
                    Spacer ()
                    Button (action: {
                        // Button Action
                        self.nextQuestion(penalty)
                    }) {
                        Text("Quizz-Next")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Image (systemName: "chevron.right.circle.fill")
                            .font(.title)
                    }
                    .padding(10.0)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(400)
                    
                    .alert(isPresented: $showingScore) {
                        // ToDo >>>> Look how to update Translation string with parameter
                        Alert(title: Text(scoreTitle), message: Text(NSLocalizedString("Quizz-Score-Message  \(score)", comment: "Alert Quizz Message")), dismissButton: .default(Text("Quizz-Next")) {
                            self.askNewQuestion()
                        })
                    }
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
   
    func nextQuestion(_ penalty : Penalty) {
        // ToDo  >>>>>> Check that the user has provided answers
        // Check if the answer is correct
        if userSanctionSelection == penalty.sanctionValue {
            scoreTitle = NSLocalizedString("Quizz-Score-Message-Correct", comment: "Alert Quizz Title OK")
            score += 1
        } else {
            scoreTitle = NSLocalizedString("Quizz-Score-Message-Wrong", comment: "Alert Quizz Title error")
        }
        showingScore = true
    }

    
    func askNewQuestion() {
        //select another penalty
        // ToDo >>>>>> ADD count the number of penalties to random from   <<<<<<
        penatlyNumber = Int.random(in: 0...45)
        userSanctionSelection = 40
//        resetPenalties = false
    }

}
    
struct QuizzQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzQuestionView ()
            .environment(\.locale, .init(identifier: "en"))
    }
}
