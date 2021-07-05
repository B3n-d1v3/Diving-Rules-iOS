//
//  QuizzStartView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 23/03/2021.
//

import SwiftUI


// ToDo >>>>> update the page to ask for the type of quiz and the number of questions
//       https://www.youtube.com/watch?v=Ho88Eid9gi0

struct QuizzStartView: View {
    @State private var questionNumber = 20
    var body: some View {
        VStack {
            Text("Quizz-Intro-Title")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(.all)
            Text ("Quizz-Intro-Description")
                .padding(.all)
            Divider ()
            Stepper(value: $questionNumber, in: 5...40, step: 5) {
                Text("Number of Questions: \(questionNumber)")
                }
                .padding(.all)
            Divider ()
            Spacer ()
            NavigationLink(destination: QuizzQuestionView (questionList: newQuiz(of: questionNumber), penaltyButtonStatus: penaltyButtonStatus).navigationBarTitle("", displayMode: NavigationBarItem.TitleDisplayMode.inline)) {
                Text("Quizz-Intro-Start-Button")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.leading, 10.0)
                Image (systemName: "play.circle.fill")
                    .font(.title)
            }
            .padding(10.0)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(40)
            
            Spacer ()
        }
    }
}

struct QuizzStartView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzStartView()
    }
}
