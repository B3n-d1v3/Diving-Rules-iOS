//
//  QuizzQuestion.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import SwiftUI

struct QuizzQuestionView: View {
    
    // ToDo >>>>>> ADD count the number of penalties to random from   <<<<<<
    @State private var penatlyNumber = Int.random(in: 0...45)
//    @State private var penalty = penalties[penatlyNumber]
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
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
                        PenaltyZeroPtsButton(isSet: (penalty.sanctionValue == 0))
                            .disabled(true)
                        Spacer ()
                        // Max 2 pts
                        PenaltyMaxTwoPtsButton (isSet: (penalty.sanctionValue == 2))
                            .disabled(true)
                        Spacer ()
                        // Max 4 1/2 pts
                        PenaltyMaxFourHalfPtsButton (isSet: (penalty.sanctionValue == 3))
                            .disabled(true)
                        Spacer ()
                   }
                    HStack{
                        //Penalty Line 2
                        Spacer ()
                        // -2 pts
                        PenaltyMinusTwoPtsButton (isSet: (penalty.sanctionValue == 1))
                            .disabled(true)
                        Spacer ()
                        // -1/2 to 2 pts
                        PenaltyMinusHalfToTwoPtsButton (isSet: (penalty.sanctionValue == 4))
                            .disabled(true)
                        Spacer ()
                        // judge Opinion
                        PenaltyJudgeOpinionButton (isSet: (penalty.sanctionValue == 5))
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
                        OwnershipRefereeButton (isSet: penalty.referee)
                            .disabled(true)

//                        .onTapGesture {
//                            isOwnerReferee.toggle()
//                        }
                        Spacer ()
                        // Ownership Judge
                        OwnershipJudgeButton (isSet: penalty.judge)
                            .disabled(true)
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
                        Alert(title: Text(scoreTitle), message: Text("Quizz-Score-Message" + " \(score)"), dismissButton: .default(Text("Quizz-Next")) {
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
        // Check if the answer is correct
        
//        if number == correctAnswer {
//            scoreTitle = "Quizz-Score-Message-Correct"
//            score += 1
//        } else {
//            scoreTitle = "Quizz-Score-Message-Wrong"
//        }
        showingScore = true
    }

    
    func askNewQuestion() {
        //select another penalty
        // ToDo >>>>>> ADD count the number of penalties to random from   <<<<<<
        penatlyNumber = Int.random(in: 0...45)
    }

}
    
struct QuizzQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzQuestionView ()
    }
}
