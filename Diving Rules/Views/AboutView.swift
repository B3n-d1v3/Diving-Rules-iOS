//
//  AboutView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 27/07/2021.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
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
            ScrollView {
                Spacer ()
                Text("About-Description")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                Spacer ()
                Button(action: {
                    // send mail
                    let email = "BenDivingJudge@gmail.com"
                    let subject = "Diving Rules Feedback"
                    let body =  "Please provide your feedback here."
                    let mailtoString =  "mailto:\(email)?subject=\(subject)&body=\(body)"
                    print("[About] - Contact us - mailtoString: \(mailtoString)")
                    let mailtoUrl = URL (string: mailtoString)!
                    if UIApplication.shared.canOpenURL(mailtoUrl) {
                        UIApplication.shared.open(mailtoUrl, options: [:])
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
            } // ScrollView
        } // Top VStack
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
