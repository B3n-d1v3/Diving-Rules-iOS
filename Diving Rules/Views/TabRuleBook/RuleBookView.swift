//
//  RuleBookPdfView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 17/07/2021.
//

import SwiftUI

struct RuleBookView: View {
    var body: some View {
        VStack {
            // Loads the pdf file in the dedicated language
            RuleBookPdfView ()
        }
        // Adds the app logo to the header
        .toolbar {
            ToolbarItem(placement: .principal) {
                AppTitleView()
            }
        }
    }
}

struct RuleBookView_Previews: PreviewProvider {
    static var previews: some View {
        RuleBookPdfView()
    }
}
