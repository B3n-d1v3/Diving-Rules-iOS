//
//  PenaltyRowView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import SwiftUI

struct PenaltyRowView: View {
    var penalties: Penalty
    //let sanctions: Sanction
    var body: some View {
        // show one line of penalty
        HStack {
            Image (systemName: "star.circle.fill")
            //Change the icon dependong on the penalty sanction
            //Image (systemName: sanctions.icon[penalties.sanctionValue])
            Text(penalties.description)
            Spacer ()
        }
        .padding(.all, 5.0)
    }
}

struct PenaltyRowView_Previews: PreviewProvider {
    static var previews: some View {
        PenaltyRowView(penalties: penalties [0])
    }
}
