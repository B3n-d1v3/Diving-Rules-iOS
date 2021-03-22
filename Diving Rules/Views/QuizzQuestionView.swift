//
//  QuizzQuestion.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import SwiftUI

struct QuizzQuestionView: View {
    var penalty: Penalty
    
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
                Text("Question Y")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                Text(penalty.description)
            }
            Text("D6.25")
                .font(.caption)
                .fontWeight(.ultraLight)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.trailing)
        }
        .padding()
    }
}

struct QuizzQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzQuestionView (penalty: penalties[0])
    }
}
