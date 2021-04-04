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
    @State private var askForAnswer = false
    @State private var scoreTitle = ""
    @State private var score = 0.0
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
    @State private var ownershipReferee = false
    @State private var ownershipJudge = false
    @State private var nextQuestion = false
    
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
                        PenaltyButton (buttonImage: "0.circle", buttonText: NSLocalizedString("Button-0pts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: $penaltyZeroPts, sanctionSelection: $userSanctionSelection, sanctionID: 0, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion, ownershipReferee: $ownershipReferee, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
                        //        penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion


                        Spacer ()
                        // Max 2 pts
                        PenaltyButton (buttonImage: "lessthan.circle.fill", buttonText: NSLocalizedString("Button-max2pts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: $penaltyMaxTwoPts, sanctionSelection: $userSanctionSelection, sanctionID: 2, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion, ownershipReferee: $ownershipReferee, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
//                        PenaltyMaxTwoPtsButton (isSet: resetPenalties)
                        Spacer ()
                        // Max 4 1/2 pts
                        PenaltyButton (buttonImage: "lessthan.circle", buttonText: NSLocalizedString("Button-max4halfpts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: $penaltyMaxFourHalfPts, sanctionSelection: $userSanctionSelection, sanctionID: 3, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion, ownershipReferee: $ownershipReferee, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
//                        PenaltyMaxFourHalfPtsButton (isSet: resetPenalties)
                        Spacer ()
                   }
                    HStack{
                        //Penalty Line 2
                        Spacer ()
                        // -2 pts
                        PenaltyButton (buttonImage: "gobackward.minus", buttonText: NSLocalizedString("Button--2pts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: $penaltyMinusTwoPts, sanctionSelection: $userSanctionSelection, sanctionID: 1, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion, ownershipReferee: $ownershipReferee, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
//                        PenaltyMinusTwoPtsButton (isSet: resetPenalties)
                        Spacer ()
                        // -1/2 to 2 pts
                        PenaltyButton (buttonImage: "arrow.left.and.right.circle", buttonText: NSLocalizedString("Button--halfto2pts", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: $penaltyMinusHalfToTwoPts, sanctionSelection: $userSanctionSelection, sanctionID: 4, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion, ownershipReferee: $ownershipReferee, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
//                        PenaltyMinusHalfToTwoPtsButton (isSet: resetPenalties)
                        Spacer ()
                        // judge Opinion
                        PenaltyButton (buttonImage: "plusminus.circle", buttonText: NSLocalizedString("Button-judgeOpinion", comment: "Button Description"), buttonImageWidth: penaltyIconImageWidth, buttonImageHeight: penaltyIconImageHeight, isOn: $penaltyJudgeOpinion, sanctionSelection: $userSanctionSelection, sanctionID: 5, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion, ownershipReferee: $ownershipReferee, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
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
                        OwnershipRefereeButton (isOn: $ownershipReferee, sanctionSelection: $userSanctionSelection, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)

                        Spacer ()
                        // Ownership Judge
                        OwnershipJudgeButton (isOn: $ownershipJudge, sanctionSelection: $userSanctionSelection, ownershipReferee: $ownershipReferee, nextQuestion: $nextQuestion)
                    }
                    .padding(.horizontal, 30.0)
                }
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Divider ()
                // Navigation
                HStack {
                    Spacer ()
                    Button (action: {
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
//                    .background(Color.accentColor)
                    .background((nextQuestion ? Color("AccentColor") : Color.gray))
                    .cornerRadius(400)
                    
                    
                    .alert(isPresented: $showingScore) {
                        // ToDo >>>> Look how to update Translation string with parameter
                        Alert(title: Text(scoreTitle), message: Text(NSLocalizedString("Quizz-Score-Message \(score) / \(answeredQuestions)", comment: "Alert Quizz Message")), dismissButton: .default(Text("Quizz-Next")) {
                            self.askNewQuestion()
                        })
                        // ToDo  >>>>>> Alert in case the answers have not been provided
//                    .alert(isPresented: $askForAnswer) {
//
//                            Alert(title: Text(scoreTitle), message: Text(NSLocalizedString("Quizz-Score-Message \(score)/\(answeredQuestions)", comment: "Alert Quizz Message")), dismissButton: .default(Text("Quizz-Next")) {
//                                self.askNewQuestion()
//                            })
                    }
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer ()
        }
    }
   
    func nextQuestion(_ penalty : Penalty) {
        print("[nextQuestion] userSanctionSelection: \(userSanctionSelection) - ownershipReferee: \(ownershipReferee) - ownershipJudge: \(ownershipJudge)")
        if (userSanctionSelection > 6) || (!ownershipReferee && !ownershipJudge) {
            // As the user provided an answer at least one penalty and one owner
            askForAnswer = true
            print("[nextQuestion] Missing answer")
        } else {
            if userSanctionSelection == penalty.sanctionValue {
                // if the penalty answer is correct
                    if (ownershipReferee == penalty.referee) && (ownershipJudge == penalty.judge) {
                        // if the Ownership answer is correct
                        scoreTitle = NSLocalizedString("Quizz-Score-Message-Correct", comment: "Alert Quizz Title OK")
                        score += 1
                        print("[nextQuestion] Good answer")
                    } else if (ownershipReferee == penalty.referee) || (ownershipJudge == penalty.judge){
                       // if the ownership is shared between Referee and Judge and only one was selected
                        scoreTitle = NSLocalizedString("Quizz-Score-Message-Partly", comment: "Alert Quizz Title Almost")
                        score += 0.5
                        print("[nextQuestion] Partial answer")
                    }
                    print("[nextQuestion] Score updated to: \(score)")
                
                } else {
                    // if the penalty is wrong
                    scoreTitle = NSLocalizedString("Quizz-Score-Message-Wrong", comment: "Alert Quizz Title error")
                    print("[nextQuestion] Wrong answer")
                }
                answeredQuestions += 1
                showingScore = true
        }
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
        ownershipReferee = false
        ownershipJudge = false
    }

}
    
struct QuizzQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzQuestionView ()
            .environment(\.locale, .init(identifier: "en"))
    }
}
