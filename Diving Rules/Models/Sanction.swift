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

struct PenaltySanction: Decodable {
    var ZeroPts : Bool
    var MaxTwoPts : Bool
    var MaxFourHalfPts : Bool
    var MinusTwoPts : Bool
    var MinusHalfToTwoPts : Bool
    var JudgeOpinion : Bool

}
