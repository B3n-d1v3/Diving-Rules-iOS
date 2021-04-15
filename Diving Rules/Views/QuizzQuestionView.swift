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

    // Quizz Context
//    var questionNumber: Int
    @State private var penatlyNumber = Int.random(in: 0...45)
//    @State private var penatlyNumber = 0
    @State private var score = 0
    @State private var currentQuestion = 0
    var questionList: [Int]

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
        ScrollView {
            let penalty = penalties[penatlyNumber]
            // Set the new question list
//            let newQuizzList = newList(quizzQuestionNumber: questionNumber)
//            var newQuizz = Quizz()
//            newQuizz.questions = newList(of: questionNumber)
            
            // dummy values test
//            questionList = [10,3,20,25,14]
//            penatlyNumber = questionList[0]
            
            // define the real list without the newQuizz Object
//            questionList = newList(of: questionNumber)
//            penatlyNumber = questionList[currentQuestion]
            
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
                    }
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
                .frame(alignment: .center)
                
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
                        self.nextQuestion(penalty)
                        lastQuestion = (currentQuestion >= questionList.count)
                        print("[Next Button] lastQuestion: \(lastQuestion)")
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
                    NavigationLink(destination: QuizzResultView (score: score, questionNumber: questionList.count), isActive: $lastQuestion) {}
                                        
                    Spacer ()
                    Text(" \(currentQuestion+1) / \(questionList.count)")
                        .padding(10.0)
                        .foregroundColor(Color.white)
                        .background(Color("Score"))
                        .cornerRadius(20)
                }
                .padding(.vertical)
                
            }
            .padding(.all)
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
            currentQuestion += 1
            print("Question Status - currentQuestion: \(currentQuestion) / questionNumber: \(questionList.count)")
            if currentQuestion < questionList.count{
                // if the are still questions to answer
                print("Jumpt to the Next Question")
                self.askNewQuestion()
            } else {
                // if this was the last question
                print("End of Quizz - switch to Result Page")
            }
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
        nextQuestion = false
    }

}
    
struct QuizzQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzQuestionView (questionList: newList(of: 5))
            .environment(\.locale, .init(identifier: "en"))
    }
}
