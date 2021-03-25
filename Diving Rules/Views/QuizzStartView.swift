//
//  QuizzStartView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 23/03/2021.
//

import SwiftUI

struct QuizzStartView: View {
    var body: some View {
        VStack {
            Text("Quizz-Intro-Title")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(.all)
            Text ("Quizz-Intro-Description")
                .padding(.all)
            Spacer ()

            NavigationLink(destination: QuizzQuestionView ()) {
                Text("Quizz-Intro-Start-Button")
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

struct QuizzStartView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzStartView()
    }
}
