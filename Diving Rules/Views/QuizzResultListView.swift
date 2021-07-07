//
//  QuizzResultListView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 09/06/2021.
//

import SwiftUI

struct QuizzResultListView: View {
    let lastQuizz: Int = quizzHistory.count
    var body: some View {
//        List (penalties) { penalty in
//            NavigationLink(destination: PenaltyDetailView(penalty: penalty)) {
//                PenaltyRowView (penalties: penalty)
//        List (currentQuizz.answers) { penalty in
        List (quizzHistory[lastQuizz].answers) { penalty in
            NavigationLink(destination: QuizzResultAnswerView(quizzResponse: penalty)) {
                QuizzResultRowView (penaltyRow: penalty)
            }
        }

    }
}

struct QuizzResultListView_Previews: PreviewProvider {
//    var currentQuizz  = Quizz()
//    currentQuizz.questions = [10,25]
//    currentQuizz.answers[0].id = 10
//    currentQuizz.answers[0].judge = false
//    currentQuizz.answers[0].referee = true
//    currentQuizz.answers[0].sanctionValue = 4
//    currentQuizz.answers[1].id = 25
//    currentQuizz.answers[1].judge = true
//    currentQuizz.answers[1].referee = true
//    currentQuizz.answers[1].sanctionValue = 0
    static var previews: some View {
        QuizzResultListView()
    }
}
