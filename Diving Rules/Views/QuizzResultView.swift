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
            
            Spacer ()
            
            Text ("\(score) pts")
                .font(.title)
                .fontWeight(.heavy)
            
            Text ("(max \(questionNumber * 10) pts)")
                .font(.caption)
                .fontWeight(.thin)

            Spacer ()
            if (score >= (questionNumber * 8)) {
                Sticker(stickerImage: "checkmark.circle", stickerColor: "Good", stickerText: "Passed")
            } else {
                Sticker(stickerImage: "xmark.octagon.fill", stickerColor: "Bad", stickerText: "Failed")
            }
            Spacer ()
            NavigationLink(destination: QuizzQuestionView (questionNumber: questionNumber)) {
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
