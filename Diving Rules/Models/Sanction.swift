//
//  Sanctions.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import Foundation

struct Sanction: Hashable, Codable, Identifiable {
    var id: Int
    var description: String
    var icon: String
}

//struct PenaltySanction: Codable {
//    var isPenaltyZeroPts: Bool
//    var isPenaltyMaxTwoPts: Bool
//    var isPenaltyMaxFourHalfPts: Bool
//    var isPenaltyMinusTwoPts: Bool
//    var isPenaltyMinusHalfToTwoPts: Bool
//    var isPenaltyJudgeOpinion: Bool
//
//}
