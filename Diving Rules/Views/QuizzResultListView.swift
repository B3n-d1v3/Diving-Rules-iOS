//
//  QuizzResultListView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 09/06/2021.
//

import SwiftUI

struct QuizzResultListView: View {
    var body: some View {
        List (penalties) { penalty in
            NavigationLink(destination: PenaltyDetailView(penalty: penalty)) {
                PenaltyRowView (penalties: penalty)
                //PenaltyRowView (penalties: penalty, sanctions: sanction)
            }
        }

    }
}

struct QuizzResultListView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzResultListView()
    }
}
