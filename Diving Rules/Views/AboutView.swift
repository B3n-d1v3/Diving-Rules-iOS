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
            // Link
            Button(action: actionSheet) {
                HStack {
                    Spacer ()
                    VStack {
                        Spacer ()
                        Spacer ()
                        Text ("Share this app")
                            .font(.headline)
                            .foregroundColor(Color("AccentColor"))
                          
                        Spacer ()
                        Image("qrcode-DivingRules-Logo")
                            .resizable()
                            .frame(width: 150, height: 150)
                        Spacer ()
                        Spacer ()
                    } // Link VStack
                    Spacer ()
                } // Link HStack
                .background(Color.white)
                .cornerRadius(20)
                .padding(10.0)
            } // Link Button
            
        } // Top ScrollView
        .padding(10.0)
        .background(Color("LaunchScreenBackgroundColor"))
        .foregroundColor(.white)
        
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: actionSheet) {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("AccentColor"))
                                .frame(width: 20, height: 20
                                )
                        } // end Button
            }
        } // end Toobar
    }
    func actionSheet() {
        // set text
        let shareText = "I 😍 this app to learn the Diving Rules"
        // set Link URL
//        guard let shareLink = URL(string : "bit.ly/DivingRulesApp") else { return }
        guard let shareLink: URL = URL(string : "bit.ly/DivingRulesApp") else { return }
//        guard let data = URL(string: "https://apps.apple.com/app/diving-rules/id1579861867") else { return }
        // set Image
        let shareImage : UIImage = UIImage(named: "AppIcon")!
//        let shareImage : UIImage = UIImage(named: "qrcode-DivingRules-Logo")!
        
        let av = UIActivityViewController(activityItems: [shareText, shareLink, shareImage], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }

}
    
struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
