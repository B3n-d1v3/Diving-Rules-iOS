//
//  QuizzResultView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 07/04/2021.
//

import SwiftUI

struct QuizzResultView: View {
    // QuizzStart >> QuizzQuestion (looped) >> [[QuizzResult]]
    // QuizzResult >> QuizzResultList >> QuizzResultAnswer
    // or QuizzResult >> QuizzQuestion (Looped  for a new quizz)
    
    // To handle the Quizz Quit
    @Binding var shouldPopToRootView: Bool
    
    var score : Int
    var questionNumber : Int
    var body: some View {
        ScrollView {
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
            VStack {
                if (score >= (questionNumber * 8)) {
                    Sticker(stickerImage: "checkmark.circle", stickerColor: "Good", stickerText: NSLocalizedString("Passed", comment: "Stiker Status"))
                } else {
                    Sticker(stickerImage: "xmark.octagon.fill", stickerColor: "Bad", stickerText: NSLocalizedString("Failed", comment: "Stiker Status"))
                }
            } // VStack Sticker
            .padding(.all, 20.0)
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
                .padding(5.0)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(40)
                
                Spacer ()
                
                NavigationLink(destination: QuizzQuestionView (shouldPopToRootView: self.$shouldPopToRootView, questionList: newQuizz(of: questionNumber), penaltyButtonStatus: penaltyButtonStatus)) {
                    Text("Quizz-Result-Start-Button")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading, 10.0)
                    Image (systemName: "play.circle.fill")
                        .font(.title)
                }
                .padding(5.0)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(40)
            } // HStack Navigation
            
            Spacer ()
        } // ScrollView
        // Header info & Exit Button
        .navigationBarTitle("Quizz-Title", displayMode: NavigationBarItem.TitleDisplayMode.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: Button(action: {
//            print ("[QuizzResultView > Quizz Exit]")
//            print (" Exit >>> currentQuizz: \(currentQuizz)")
//            print (" Exit >>> quizzHistory: \(quizzHistory)")
            currentQuizz = Quizz()
            newQuizz(of: questionNumber)
            buttonStatusReset ()
            self.shouldPopToRootView = false
        }) {
            Image(systemName: "xmark.circle")
                .accentColor(.accentColor)
                .font(.title)
        })
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct QuizzResultView_Previews: PreviewProvider {
    @State static var shouldGoToRoot = false
    static var previews: some View {
        Group {
            QuizzResultView(shouldPopToRootView: $shouldGoToRoot, score: 80, questionNumber: 10)
                .environment(\.locale, .init(identifier: "en"))
            QuizzResultView(shouldPopToRootView: $shouldGoToRoot, score: 50, questionNumber: 10)
                .environment(\.locale, .init(identifier: "en"))

            QuizzResultView(shouldPopToRootView: $shouldGoToRoot, score: 80, questionNumber: 10)
                .environment(\.locale, .init(identifier: "fr"))
            QuizzResultView(shouldPopToRootView: $shouldGoToRoot, score: 50, questionNumber: 10)
                .environment(\.locale, .init(identifier: "fr"))
        }
        
    }
}
