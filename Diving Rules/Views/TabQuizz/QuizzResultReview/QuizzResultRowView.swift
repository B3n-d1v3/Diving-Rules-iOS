//
//  QuizzResultRowView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 05/07/2021.
//

import SwiftUI

struct QuizzResultRowView: View {
    var penaltyRow: Penalty
    var body: some View {
        // show one line of penalty

        HStack {
            if ((penaltyRow.sanctionValue == penalties[penaltyRow.id].sanctionValue) && (penaltyRow.judge == penalties[penaltyRow.id].judge) && (penaltyRow.referee == penalties[penaltyRow.id].referee)) {
                // yes
                Image (systemName: "checkmark.circle.fill")
                .font(.title)
                .foregroundColor(Color.green)
            } else if ((penaltyRow.sanctionValue == penalties[penaltyRow.id].sanctionValue) && ((penaltyRow.judge == penalties[penaltyRow.id].judge) || (penaltyRow.referee == penalties[penaltyRow.id].referee))) {
                // almost
                Image (systemName: "exclamationmark.circle.fill")
                .font(.title)
                .foregroundColor(Color.orange)
            } else {
                // no
                Image (systemName: "xmark.circle.fill")
                .font(.title)
                .foregroundColor(Color.red)
            }
//            Text(penalties.description)
            // Using tranlated penalty desciprion
            let penaltyDescription = "Penalty-" + String(penaltyRow.id)
            Text(LocalizedStringKey(penaltyDescription))
            Spacer ()
        }
        .padding(.all, 5.0)
    }
}

struct QuizzResultRowView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzResultRowView(penaltyRow: penalties [0])
            .previewLayout(.sizeThatFits)
    }
}
