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
            Text("Quizz-Intro-Start-Button").padding()
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(20)
            Spacer ()
        }
    }
}

struct QuizzStartView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzStartView()
    }
}
