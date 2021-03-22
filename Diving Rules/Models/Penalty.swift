//
//  Penalty.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import Foundation
import SwiftUI

//struct Penalty: Hashable, Codable, Identifiable {
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

struct PenaltySanction {
    var penalty: Penalty
    
}
