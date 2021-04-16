//
//  PenaltyRowView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import SwiftUI

struct PenaltyRowView: View {
    var penalties: Penalty
    var body: some View {
        // show one line of penalty

        HStack {
            Image (systemName: sanctions[penalties.sanctionValue].icon)
            .font(.title)
            .foregroundColor(Color.accentColor)

            Text(penalties.description)
            Spacer ()
        }
        .padding(.all, 5.0)
    }
}

struct PenaltyRowView_Previews: PreviewProvider {
    static var previews: some View {
        PenaltyRowView(penalties: penalties [0])
            .previewLayout(.sizeThatFits)
    }
}
