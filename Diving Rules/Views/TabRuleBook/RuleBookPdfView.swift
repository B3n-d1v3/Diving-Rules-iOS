//
//  RuleBookView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import PDFKit
import SwiftUI

struct RuleBookPdfView : UIViewRepresentable {
    var currentLanguage = Locale.autoupdatingCurrent.languageCode
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        // PDF File Access
//        let path = Bundle.main.url(forResource: "2017-2021_fina-diving_16032018", withExtension: "pdf")
        var path = Bundle.main.url(forResource: "2017-2021_Fina_EN_Diving_Rules", withExtension: "pdf")
        if (currentLanguage == "fr") {
            path = Bundle.main.url(forResource: "2017-2021_Fina_FR_Reglements_Plongeon", withExtension: "pdf")
        } else if (currentLanguage == "es") {
            path = Bundle.main.url(forResource: "2017-2021_Fina_ES_Reglamento_Saltos", withExtension: "pdf")
        } else if (currentLanguage == "it") {
            path = Bundle.main.url(forResource: "2017-2021_Fina_IT_Regolamento_Tuffi", withExtension: "pdf")
        }
        let doc = PDFDocument(url: path!)
        pdfView.document = doc
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        print ("PDF File View")
    }
    
    typealias UIViewType = PDFView
}

//struct RuleBookView: View {
//    var body: some View {
//        //Text("Rule Book")
//
//        // PDF document settings
//        let pdfView = PDFView()
//        self.view.addSubview(pdfView)
//        pdfView.translatesAutoresizingMaskIntoConstraints = false
//        pdfView.leadingAnchor.constraint (equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
//        pdfView.trailingAnchor.constraint (equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
//        pdfView.bottomAnchor.constraint (equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
//        pdfView.topAnchor.constraint (equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//
//        // PDF File Access
//        guard let path = Bundle.main.url(forResource: "2017-2021_fina-diving_16032018", withExtension: "pdf")
//        else {
//            return
//        }
//
//        if let doc = PDFDocument(url: path){
//            pdfView.document = doc
//        }
//    }
//}

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
