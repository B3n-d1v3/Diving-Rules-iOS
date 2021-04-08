//
//  QuizzResultView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 07/04/2021.
//

import SwiftUI

struct QuizzResultView: View {
    var score : Int
    var questionNumber : Int
    var body: some View {
        VStack {
            Text("Quizz-Result-Title")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(.all)
            
            Text ("Quizz-Result-Description")
                .padding(.all)
            
            Text ("\(score) pts")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.all)
            Spacer ()
            if (score >= (questionNumber * 8)) {
                StickerPassed ()
            } else {
                StickerFailed ()
            }
            Spacer ()
            NavigationLink(destination: QuizzQuestionView ()) {
                Text("Quizz-Result-Start-Button")
                    .font(.title3)
                    .fontWeight(.semibold)
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

struct QuizzResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzResultView(score: 80, questionNumber: 10)
    }
}
