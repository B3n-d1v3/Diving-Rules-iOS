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
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Text ("Quizz-Intro-Description")
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer ()
            Text("Quizz-Intro-Start-Button")
            Spacer ()
        }
    }
}

struct QuizzStartView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzStartView()
    }
}
