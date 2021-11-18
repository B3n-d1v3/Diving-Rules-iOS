//
//  RuleBookView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import PDFKit
import SwiftUI

struct RuleBookPdfView : UIViewRepresentable {
    @EnvironmentObject var language: LanguageSettings
    
    func makeUIView(context: Context) -> PDFView {
//        print ("[RuleBookView > RuleBookPdfView > Make UIView] current language: \(language.current)")
        let pdfView = PDFView()
        // PDF File Access
        var path: URL
        path = selectFile(Lang: language.current)
        
        // Display Document
        let doc = PDFDocument(url: path)
        pdfView.document = doc
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
//        print ("[RuleBookView > RuleBookPdfView > update UIView] - current language: \(language.current)")
        // PDF File Access
        var path: URL
        path = selectFile(Lang: language.current)
        // Display Document
        let doc = PDFDocument(url: path)
        uiView.document = doc
    }
    
    func selectFile(Lang: String) -> URL {
        var path: URL
        // Select Document depending on language
        switch language.current {
        case "en":
            path = Bundle.main.url(forResource: "2017-2021_Fina_EN_Diving_Rules", withExtension: "pdf")!
        case "fr":
            path = Bundle.main.url(forResource: "2017-2021_Fina_FR_Reglements_Plongeon", withExtension: "pdf")!
        case "it":
            path = Bundle.main.url(forResource: "2017-2021_Fina_IT_Regolamento_Tuffi", withExtension: "pdf")!
        case "es":
            path = Bundle.main.url(forResource: "2017-2021_Fina_ES_Reglamento_Saltos", withExtension: "pdf")!
        case "mx":
            path = Bundle.main.url(forResource: "2017-2021_Fina_MX_Reglas_Clavados", withExtension: "pdf")!
        default:
            path = Bundle.main.url(forResource: "2017-2021_Fina_EN_Diving_Rules", withExtension: "pdf")!
        } // end Switch
        return path
    }
    
    typealias UIViewType = PDFView
}


struct RuleBookPdfView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RuleBookView()
                .environment(\.locale, .init(identifier: "en"))
            RuleBookView()
                .environment(\.locale, .init(identifier: "fr"))
            RuleBookView()
                .environment(\.locale, .init(identifier: "es"))
        }
    }
}

