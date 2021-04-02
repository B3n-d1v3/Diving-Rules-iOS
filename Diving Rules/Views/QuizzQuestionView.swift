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
    @State private var answeredQuestions = 0 
    @State private var userSanctionSelection = 55
    var penaltyIconImageWidth: CGFloat = 40.0
    var penaltyIconImageHeight: CGFloat = 40.0

    // All the buttons status
    @State private var penaltyZeroPts = false
    @State private var penaltyMaxTwoPts = false
    @State private var penaltyMaxFourHalfPts = false
    @State private var penaltyMinusTwoPts = false
    @State private var penaltyMinusHalfToTwoPts = false
    @State private var penaltyJudgeOpinion = false
    
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
                            .fixedSize(horizontal: false, vertical: true)
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
                        PenaltyButton (buttonImage: "0.circle", buttonText: NSLocalizedString("Button-0pts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: $penaltyZeroPts, sanctionSelection: $userSanctionSelection, sanctionID: 0, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion)
                        //        penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion


                        Spacer ()
                        // Max 2 pts
                        PenaltyButton (buttonImage: "lessthan.circle.fill", buttonText: NSLocalizedString("Button-max2pts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: $penaltyMaxTwoPts, sanctionSelection: $userSanctionSelection, sanctionID: 2, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion)
//                        PenaltyMaxTwoPtsButton (isSet: resetPenalties)
                        Spacer ()
                        // Max 4 1/2 pts
                        PenaltyButton (buttonImage: "lessthan.circle", buttonText: NSLocalizedString("Button-max4halfpts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: $penaltyMaxFourHalfPts, sanctionSelection: $userSanctionSelection, sanctionID: 3, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion)
//                        PenaltyMaxFourHalfPtsButton (isSet: resetPenalties)
                        Spacer ()
                   }
                    HStack{
                        //Penalty Line 2
                        Spacer ()
                        // -2 pts
                        PenaltyButton (buttonImage: "gobackward.minus", buttonText: NSLocalizedString("Button--2pts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: $penaltyMinusTwoPts, sanctionSelection: $userSanctionSelection, sanctionID: 1, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion)
//                        PenaltyMinusTwoPtsButton (isSet: resetPenalties)
                        Spacer ()
                        // -1/2 to 2 pts
                        PenaltyButton (buttonImage: "arrow.left.and.right.circle", buttonText: NSLocalizedString("Button--halfto2pts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: $penaltyMinusHalfToTwoPts, sanctionSelection: $userSanctionSelection, sanctionID: 4, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion)
//                        PenaltyMinusHalfToTwoPtsButton (isSet: resetPenalties)
                        Spacer ()
                        // judge Opinion
                        PenaltyButton (buttonImage: "plusminus.circle", buttonText: NSLocalizedString("Button-judgeOpinion", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: $penaltyJudgeOpinion, sanctionSelection: $userSanctionSelection, sanctionID: 5, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion)
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
                        Alert(title: Text(scoreTitle), message: Text(NSLocalizedString("Quizz-Score-Message \(score)/\(answeredQuestions)", comment: "Alert Quizz Message")), dismissButton: .default(Text("Quizz-Next")) {
                            self.askNewQuestion()
                        })
                    }
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer ()
        }
    }
   
    func nextQuestion(_ penalty : Penalty) {
        // ToDo  >>>>>> Check that the user has provided answers
        // Check if the answer is correct
        if userSanctionSelection == penalty.sanctionValue {
            scoreTitle = NSLocalizedString("Quizz-Score-Message-Correct", comment: "Alert Quizz Title OK")
            score += 1
            print("[nextQuestion] Score updated to: \(score)")
        } else {
            scoreTitle = NSLocalizedString("Quizz-Score-Message-Wrong", comment: "Alert Quizz Title error")
            print("[nextQuestion] Wrong answer")
        }
        answeredQuestions += 1
        showingScore = true
    }

    
    func askNewQuestion() {
        //select another penalty
        // ToDo >>>>>> ADD count the number of penalties to random from   <<<<<<
        penatlyNumber = Int.random(in: 0...45)
        userSanctionSelection = 40
//        resetPenalties = false
        penaltyZeroPts = false
        penaltyMaxTwoPts = false
        penaltyMaxFourHalfPts = false
        penaltyMinusTwoPts = false
        penaltyMinusHalfToTwoPts = false
        penaltyJudgeOpinion = false

    }

}
    
struct QuizzQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzQuestionView ()
            .environment(\.locale, .init(identifier: "en"))
    }
}
