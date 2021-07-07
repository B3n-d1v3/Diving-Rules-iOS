//
//  ModelData.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import Foundation

// The object with all penalties descriptions
var penalties: [Penalty] = load("divingPenaltiesSummary.json")

// The object with the sanction descriptions
var sanctions: [Sanction] = load("divingPenaltiesSanctions.json")

// The object with the current Quizz Data Logged in
var currentQuizz: Quizz = Quizz()

// The object containing the entire quizz history of the user
var quizzHistory: [Quizz] = []

// The object with the current question status dipslay model
var penaltyButtonStatus: ButtonsStatus = ButtonsStatus()

// The object to view history of multiple Quizzes // Not Used yet
//var userQuizzHistory: [Quizz] = []

func load<T: Decodable>(_ filename: String) -> T {
    // a de-serialization of the json to be inserted in the object model
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


