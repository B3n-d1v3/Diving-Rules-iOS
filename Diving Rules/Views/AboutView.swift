//
//  AboutView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 27/07/2021.
//

import SwiftUI
import MessageUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            Spacer ()
            Image("DivingRulesLogo")
                .resizable()
                .frame(width: 130, height: 210)
            Spacer ()
            HStack {
                Text("About-Version")
                // Add the marketing version Number
                let appVarsion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
                Text(appVarsion ?? "X.X")
                Spacer ()
            }
            .font(.footnote)
                Spacer ()
                Text("About-Description")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                Spacer ()
                Button(action: {
                    // send mail
                    let to = "BenDivingJudge@gmail.com"
                    let subject = "Diving Rules Feedback"
                    let body =  "Please provide your feedback here."
                    let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                    let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                    let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")
//                    print("[About] - Contact us - defaultUrl: \(String( defaultUrl))")
                    if UIApplication.shared.canOpenURL(defaultUrl!) {
                        UIApplication.shared.open(defaultUrl!, options: [:])
                    }
                   
                }) {
                    Text ("About-Contact-Link")
                        .font(.body)
                        .fontWeight(.semibold)
                        .padding(.leading, 10.0)
                    Image (systemName: "envelope.circle")
                        .font(.title)
                    
                }
                .padding(5.0)
                .foregroundColor(Color("AccentColor"))
                .background(Color.white)
                .cornerRadius(40)
        } // Top ScrollView
        .padding(10.0)
        .background(Color("LaunchScreenBackgroundColor"))
        .foregroundColor(.white)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
