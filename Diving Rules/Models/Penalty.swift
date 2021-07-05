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
struct Penalty: Decodable,Identifiable, CustomDebugStringConvertible {
    // penalty id number
    var id: Int = 200
    //penalty description in en - not used in the code anymore
    var description: String = ""
    // List of the rules associated with this penalty
    var rules: [Rule] = []
    
    // TODO Update the rules table to be more simple
    // var rules: [String] = []
    
    // The sanction associated with this penalty
    var sanctionValue: Int = 200
    // Is the referee concerned by this penalty
    var referee: Bool = false
    // Is the judge concerned by this penalty
    var judge: Bool = false

    var debugDescription: String {
        // a debug function to display the data model in the print's
        var response: String = "** Penalty Object: \n"
        response += "- id: \(id) \n"
        response += "- description: \(description) \n"
        response += "- rules:"
        for i in 0 ..< rules.count {
            response += " \(rules[i].ruleId),"
        }
        response += "\n- sanctionValue: \(sanctionValue) \n"
        response += "- referee: \(referee) \n"
        response += "- judge: \(judge) \n"
        return response

    } // debugDescription

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
