//
//  QuizzQuestions.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 09/04/2021.
//

import Foundation
import SwiftUI

struct Quizz {
    // ToDo >>>>>> previous Quizz taken list
    // the list of the id's for the quizz
    var questions: [Int]
    // the list of answers provided to the questionnaire
    var answers: [Penalty]
//    var answers: [PenaltyAnswer]
    // score rewards
    var score: Int
    // percentage version
//    var result:
    
    init() {
        questions = []
        answers = []
        score = 0
    }
}

// Check if the Penalty struct is enough
//struct PenaltyAnswer  {
//    let sanctionValue: Int
//    let referee: Bool
//    let judge: Bool
//}


// create a new Quizz list
func newList (of quizzQuestionNumber: Int) -> [Int]
{
    var newList: [Int] = []
    let totalQuestionNumber = penalties.count
    print("[Quizz.NewList] totalQuestionNumber: \(totalQuestionNumber)")
    // While the total number of items in array not met add a new random number
    while (newList.count < quizzQuestionNumber) {
         newList.append(Int.random(in: 0...(totalQuestionNumber-1)))
        print("[Quizz.NewList] newList: \(newList)")
    }
    // use Set (array with no duplicates
    // then change Set to Array
    
    return newList
}

// declaration objet array
// 
