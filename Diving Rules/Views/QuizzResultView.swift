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
            
            Text ("\((score*10)/questionNumber) %")
                .font(.title)
                .fontWeight(.heavy)
            
            Text ("(\(score) pts / max \(questionNumber * 10) pts)")
                .font(.caption)
                .fontWeight(.thin)

            Spacer ()
            if (score >= (questionNumber * 8)) {
                Sticker(stickerImage: "checkmark.circle", stickerColor: "Good", stickerText: "Passed")
            } else {
                Sticker(stickerImage: "xmark.octagon.fill", stickerColor: "Bad", stickerText: "Failed")
            }
            Spacer ()
            
            HStack {
                //Todo: change this link to open the list with the list of questions of the last quizz
                NavigationLink(destination: QuizzResultListView ()) {
                    Image (systemName: "memories")
                        .font(.title)
                    Text("Quizz-Result-Review-Button")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.trailing, 10.0)
                }
                .padding(10.0)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(40)
                
                Spacer ()
                
                NavigationLink(destination: QuizzQuestionView (questionList: newQuiz(of: questionNumber), penaltyButtonStatus: penaltyButtonStatus)) {
                    Text("Quizz-Result-Start-Button")
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
            } // HStack Navigation
            
            
            Spacer ()
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct QuizzResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzResultView(score: 80, questionNumber: 10)
    }
}