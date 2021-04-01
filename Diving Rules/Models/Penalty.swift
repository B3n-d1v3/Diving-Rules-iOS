//
//  Penalty.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import Foundation
import SwiftUI

//struct Penalty: Hashable, Codable, Identifiable {

// one penalty description
struct Penalty: Decodable,Identifiable {
    let id: Int
    let description: String
    let rules: [Rule]
    let sanctionValue: Int
    let referee: Bool
    let judge: Bool
    
}

struct Rule: Decodable {
    let ruleId: String
}

//struct PenaltySanction {
//    var penalty: Int
//    //    0 > ZeroPts
//    //    1 > MinusTwoPts
//    //    2 > MaxTwoPts
//    //    3 > MaxFourHalfPts
//    //    4 > MinusHalfToTwoPts
//    //    5> JudgeOpinion
//}
