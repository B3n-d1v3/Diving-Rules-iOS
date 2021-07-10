//
//  QuizzQuestions.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 09/04/2021.
//

import Foundation
import SwiftUI

struct Quizz: CustomDebugStringConvertible {
    // ToDo >>>>>> previous Quizz taken list
    // the list of the id's for the quizz
    var questions: [Int] = []
    // the list of answers provided to the questionnaire
    var answers: [Penalty] = []
//    var answers: [PenaltyAnswer]
    // score rewards
    var score: Int = 0
    // percentage version
//    var result:
    var debugDescription: String {
        // a debug function to display the data model in the print's
        var response: String = "** Quizz Object: \n"
        // questions
        // TODO Add the print description
        response += "- Quizz Questions List:"
        for questionNumber in currentQuizz.questions {
            response += " \(questionNumber),"
        }
        //answers
        response += "\n- Quizz Answers List: \n"
        for i in 0 ..< currentQuizz.answers.count {
            print("-- Penalty Answer \(i + 1): \(currentQuizz.answers[i])")
        }
        response += "\n- Quizz Score: \(score)"
        return response
    } //debugDescription
}

// Generate new Quizz question list in currentQuizz Object
//func newQuiz(of quizzQuestionNumber: Int) -> [Int] {
func newQuizz(of quizzQuestionNumber: Int) -> [Int] {
    print ("[newQuizz] - launch newList func")
    logCurrentQuizz()
    currentQuizz = Quizz()
    currentQuizz.questions = newList(of: quizzQuestionNumber)
    return currentQuizz.questions
}

// create a new Quizz list
func newList (of quizzQuestionNumber: Int) -> [Int] {
    var newList: [Int] = []
    let totalQuestionNumber = penalties.count
//    print("[Quizz.NewList] totalQuestionNumber: \(totalQuestionNumber)")
    // While the total number of items in array not met add a new random number
    while (newList.count < quizzQuestionNumber) {
         newList.append(Int.random(in: 0...(totalQuestionNumber-1)))
//        print("[Quizz.NewList] newList: \(newList)")
        // Remove Duplicates
        newList = newList.removingDuplicates()
//        print("[Quizz.NewList] newList - delete duplicates: \(newList)")
    }
    return newList
}

// Delete Duplicated in a table
extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}


// Log the answer provided by the user in currentQuizz Object
func logUserAnswer (userAnswerScore: Int) {
    let questionIndex: Int = currentQuizz.answers.count
    var loggedPenalty = Penalty()
    // transform view model to data model injected in currentQuizz
    loggedPenalty.id = currentQuizz.questions[questionIndex]
    loggedPenalty.judge = penaltyButtonStatus.ownershipJudge
    loggedPenalty.referee = penaltyButtonStatus.ownershipReferee
    loggedPenalty.sanctionValue = penaltyButtonStatus.userSanctionSelection
    currentQuizz.answers.append (loggedPenalty)
    currentQuizz.score = userAnswerScore
    // Reset the penaltyButtonStatus
    buttonStatusReset()
}

// added to have 2 objects : one for the data of the previous and one ready to be used in the next quizz
// Log Full Quizz Data in the Quizz History Objet
func logCurrentQuizz () {
    quizzHistory.append(currentQuizz)
}


// Question page - buttons model for view
class ButtonsStatus: ObservableObject, CustomDebugStringConvertible  {
    // penalty buttons status
    @Published var penaltyZeroPts: Bool = false
    @Published var penaltyMaxTwoPts: Bool = false
    @Published var penaltyMaxFourHalfPts: Bool = false
    @Published var penaltyMinusTwoPts: Bool = false
    @Published var penaltyMinusHalfToTwoPts: Bool = false
    @Published var penaltyJudgeOpinion: Bool = false
    
    // ownership buttons status
    @Published var ownershipReferee: Bool = false
    @Published var ownershipJudge: Bool = false
    
    // Other data needed
    // Sanction set by the user
    @Published var userSanctionSelection: Int = 500
    // has the user answered enough elemets to go to the next question
    @Published var nextQuestion: Bool = false

    var debugDescription: String {
        // a debug function to display the data model in the print's
        var response: String = "** ButtonStatus Object: \n"
        response += "- penaltyZeroPts: \(penaltyZeroPts) \n"
        response += "- penaltyMaxTwoPts: \(penaltyMaxTwoPts) \n"
        response += "- penaltyMaxFourHalfPts: \(penaltyMaxFourHalfPts) \n"
        response += "- penaltyMinusTwoPts: \(penaltyMinusTwoPts) \n"
        response += "- penaltyMinusHalfToTwoPts: \(penaltyMinusHalfToTwoPts) \n"
        response += "- penaltyJudgeOpinion: \(penaltyJudgeOpinion) \n"
        response += "- ownershipReferee: \(ownershipReferee) \n"
        response += "- ownershipJudge: \(ownershipJudge) \n"
        response += "- userSanctionSelection: \(userSanctionSelection) \n"
        response += "- nextQuestion: \(nextQuestion) \n"

        return response
    }
}

func buttonStatusReset (){
    // Reset the current question status dipslay model
    penaltyButtonStatus.penaltyZeroPts = false
    penaltyButtonStatus.penaltyMaxTwoPts = false
    penaltyButtonStatus.penaltyMaxFourHalfPts = false
    penaltyButtonStatus.penaltyMinusTwoPts = false
    penaltyButtonStatus.penaltyMinusHalfToTwoPts = false
    penaltyButtonStatus.penaltyJudgeOpinion = false
    
    penaltyButtonStatus.ownershipReferee = false
    penaltyButtonStatus.ownershipJudge = false
    
    penaltyButtonStatus.nextQuestion = false
    penaltyButtonStatus.userSanctionSelection = 400
}

func buttonStatusSet (fromPenalty penaltyID: Int) ->  ButtonsStatus {
    // Set the ButtonsStatus Object to the penalty's status dipslay model
    // This is used by the error review page to set the data display model to the penalty's reference sanction & ownership
    let penaltyButtonStatusResponse: ButtonsStatus = ButtonsStatus()
    let sanctionID = penalties[penaltyID].sanctionValue
    if (sanctionID == 0) {penaltyButtonStatusResponse.penaltyZeroPts = true} else {penaltyButtonStatusResponse.penaltyZeroPts = false}
    if (sanctionID == 2) {penaltyButtonStatusResponse.penaltyMaxTwoPts = true} else {penaltyButtonStatusResponse.penaltyMaxTwoPts = false}
    if (sanctionID == 3) {penaltyButtonStatusResponse.penaltyMaxFourHalfPts = true} else {penaltyButtonStatusResponse.penaltyMaxFourHalfPts = false}
    if (sanctionID == 1) {penaltyButtonStatusResponse.penaltyMinusTwoPts = true} else {penaltyButtonStatusResponse.penaltyMinusTwoPts = false}
    if (sanctionID == 4) {penaltyButtonStatusResponse.penaltyMinusHalfToTwoPts = true} else {penaltyButtonStatusResponse.penaltyMinusHalfToTwoPts = false}
    if (sanctionID == 5) {penaltyButtonStatusResponse.penaltyJudgeOpinion = true} else {penaltyButtonStatusResponse.penaltyJudgeOpinion = false}
    
    penaltyButtonStatusResponse.ownershipJudge = penalties[penaltyID].judge
    penaltyButtonStatusResponse.ownershipReferee = penalties[penaltyID].referee
    
    return penaltyButtonStatusResponse
}
