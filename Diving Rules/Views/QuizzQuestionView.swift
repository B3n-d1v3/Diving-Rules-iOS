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

    // Quizz Context: Question list
    var questionList: [Int]
//    var questionNumber: Int
//    @State private var penatlyNumber = Int.random(in: 0...45)
//    @State private var penatlyNumber = questionList[currentQuestion]
    @State private var score = 0
    @State private var currentQuestion = 0
    

    // User Answer Management
    @State private var askForAnswer = false
    @State private var userSanctionSelection = 55
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
    @State private var lastQuestion = false
    
    var body: some View {
            let penalty = penalties[questionList[currentQuestion]]
            
            VStack(alignment: .leading) {
                //Rule Description
                VStack (alignment: .leading) {
                    HStack {
                        Text("Quizz-Question")
                        Text(" \(currentQuestion+1)")
                    }
                    .font(.title)
                    .foregroundColor(Color.accentColor)
                    .padding(.bottom, 1.0)
                    
                    Text("Penalty-Description")
                        .font(.title2)
                        .foregroundColor(Color.accentColor)
                        .padding(.bottom)
                    
//                    Text(penalty.description)
                    // Using tranlated penalty desciprion
                    let penaltyDescription = "Penalty-" + String(penalty.id)
                    Text(LocalizedStringKey( penaltyDescription))
                        .fixedSize(horizontal: false, vertical: true)
                } // VStack Penalty Description
                 
                Spacer()
                Divider ()
                
                ScrollView {
                    // ScrollView for the entire Buttons
                    
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
                            PenaltySelectionButton (buttonImage: "0.circle", buttonText: NSLocalizedString("Button-0pts", comment: "Button Description"), isOn: $penaltyZeroPts, sanctionSelection: $userSanctionSelection, sanctionID: 0, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion, ownershipReferee: $ownershipReferee, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
                            //        penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion
                            
                            
                            Spacer ()
                            // Max 2 pts
                            PenaltySelectionButton (buttonImage: "lessthan.circle.fill", buttonText: NSLocalizedString("Button-max2pts", comment: "Button Description"), isOn: $penaltyMaxTwoPts, sanctionSelection: $userSanctionSelection, sanctionID: 2, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion, ownershipReferee: $ownershipReferee, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
                            //                        PenaltyMaxTwoPtsButton (isSet: resetPenalties)
                            Spacer ()
                            // Max 4 1/2 pts
                            PenaltySelectionButton (buttonImage: "lessthan.circle", buttonText: NSLocalizedString("Button-max4halfpts", comment: "Button Description"), isOn: $penaltyMaxFourHalfPts, sanctionSelection: $userSanctionSelection, sanctionID: 3, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion, ownershipReferee: $ownershipReferee, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
                            //                        PenaltyMaxFourHalfPtsButton (isSet: resetPenalties)
                            Spacer ()
                        } // HStack Penalty Line 1
                        HStack{
                            //Penalty Line 2
                            Spacer ()
                            // -2 pts
                            PenaltySelectionButton (buttonImage: "gobackward.minus", buttonText: NSLocalizedString("Button--2pts", comment: "Button Description"), isOn: $penaltyMinusTwoPts, sanctionSelection: $userSanctionSelection, sanctionID: 1, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion, ownershipReferee: $ownershipReferee, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
                            //                        PenaltyMinusTwoPtsButton (isSet: resetPenalties)
                            Spacer ()
                            // -1/2 to 2 pts
                            PenaltySelectionButton (buttonImage: "arrow.left.and.right.circle", buttonText: NSLocalizedString("Button--halfto2pts", comment: "Button Description"), isOn: $penaltyMinusHalfToTwoPts, sanctionSelection: $userSanctionSelection, sanctionID: 4, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion, ownershipReferee: $ownershipReferee, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
                            //                        PenaltyMinusHalfToTwoPtsButton (isSet: resetPenalties)
                            Spacer ()
                            // judge Opinion
                            PenaltySelectionButton (buttonImage: "plusminus.circle", buttonText: NSLocalizedString("Button-judgeOpinion", comment: "Button Description"), isOn: $penaltyJudgeOpinion, sanctionSelection: $userSanctionSelection, sanctionID: 5, penaltyZeroPts: $penaltyZeroPts, penaltyMaxTwoPts: $penaltyMaxTwoPts, penaltyMaxFourHalfPts: $penaltyMaxFourHalfPts, penaltyMinusTwoPts: $penaltyMinusTwoPts, penaltyMinusHalfToTwoPts: $penaltyMinusHalfToTwoPts, penaltyJudgeOpinion: $penaltyJudgeOpinion, ownershipReferee: $ownershipReferee, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
                            //                        PenaltyJudgeOpinionButton (isSet: resetPenalties)
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
                            Spacer ()
                            // Ownership Referee
                            OwnershipRefereeButton (isOn: $ownershipReferee, sanctionSelection: $userSanctionSelection, ownershipJudge: $ownershipJudge, nextQuestion: $nextQuestion)
                            
                            Spacer ()
                            Spacer ()
                            // Ownership Judge
                            OwnershipJudgeButton (isOn: $ownershipJudge, sanctionSelection: $userSanctionSelection, ownershipReferee: $ownershipReferee, nextQuestion: $nextQuestion)
                            Spacer ()
                        } // HStack Ownership
    //                    .padding(.horizontal, 30.0)
                    } // VStack Ownership
                    .frame(alignment: .center)
 
                } // sub ScrollView for all buttons
                      
                Divider ()
                // Navigation
                HStack {
                    Text(" \(score) pts")
                        .padding(10.0)
                        .foregroundColor(Color.white)
                        .background(Color("Score"))
                        .cornerRadius(20)
                    Spacer ()
                    Button (action: {
                        lastQuestion = (currentQuestion + 1 >= questionList.count)
                        print("[Next Button] lastQuestion: \(lastQuestion)")
                        self.nextQuestion(penalty)
//                        print("[Next Button] lastQuestion: \(lastQuestion) - penatlyNumber (questionList[currentQuestion]): \(questionList[currentQuestion])")
                    }) {
                        Text("Quizz-Next")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.leading, 10.0)
                        Image (systemName: "chevron.right.circle.fill")
                            .font(.title)
                    } // Button
                    .padding(10.0)
                    .foregroundColor(.white)
//                    .background(Color.accentColor)
                    .background((nextQuestion ? Color("AccentColor") : Color.gray))
                    .cornerRadius(400)
                    NavigationLink(destination: QuizzResultView (score: score, questionNumber: questionList.count), isActive: $lastQuestion) {}
                                        
                    Spacer ()
                    Text(" \(currentQuestion+1) / \(questionList.count)")
                        .padding(10.0)
                        .foregroundColor(Color.white)
                        .background(Color("Score"))
                        .cornerRadius(20)
                } // HStack Navigation
                .padding(.vertical, 10.0)
                
            } // VStack Top
            .padding(.all)
    } // Body
   
    func nextQuestion(_ penalty : Penalty) {
        print("[nextQuestion] userSanctionSelection: \(userSanctionSelection) - ownershipReferee: \(ownershipReferee) - ownershipJudge: \(ownershipJudge)")
        if (userSanctionSelection > 6) || (!ownershipReferee && !ownershipJudge) {
            // Has the user provided an answer at least one penalty and one owner
            askForAnswer = true
            print("[nextQuestion] Missing answer")
        } else {
            // else user has answered items
            if userSanctionSelection == penalty.sanctionValue {
                // if the penalty answer is correct
                    if (ownershipReferee == penalty.referee) && (ownershipJudge == penalty.judge) {
                        // if the Ownership answer is correct
                        score += 10
                        print("[nextQuestion] Good answer")
                    } else if (ownershipReferee == penalty.referee) || (ownershipJudge == penalty.judge){
                       // if the ownership is shared between Referee and Judge and only one was selected
                        score += 5
                        print("[nextQuestion] Partial answer")
                    }
                    print("[nextQuestion] Score updated to: \(score)")
                
                } else {
                    // if the penalty is wrong
                    print("[nextQuestion] Wrong answer")
                }
            print("[nextQuestion] Question Status before count - currentQuestion: \(currentQuestion) / questionNumber(questionList.count): \(questionList.count) - penatlyNumber (questionList[currentQuestion]): \(questionList[currentQuestion])")
//            if currentQuestion < questionList.count{
            if !lastQuestion{
                // if the are still questions to answer
                print("Jumpt to the Next Question")
                currentQuestion += 1
                print("[nextQuestion] Question Status after count - currentQuestion: \(currentQuestion)")
                self.askNewQuestion()
            } else {
                // if this was the last question
                print("End of Quizz - switch to Result Page")
            }
        } // end else user has answered items
    } // NextQuestion

    
    func askNewQuestion() {
        //select another penalty
        // ToDo >>>>>> ADD count the number of penalties to random from   <<<<<<
//        penatlyNumber = Int.random(in: 0...45)
//        penatlyNumber = questionList[currentQuestion]
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
        nextQuestion = false
    }

}
    
struct QuizzQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzQuestionView (questionList: newList(of: 5))
            .environment(\.locale, .init(identifier: "en"))
    }
}
