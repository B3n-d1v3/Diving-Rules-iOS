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
            AboutDescriptionView()
            Spacer ()
            Spacer ()
            Spacer ()
            // Contact Us
            VStack {
                HStack {
                    Text("About-Contact-Title")
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    Spacer ()
                }
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
            } // VStack Contact Us
            Spacer ()
            // Share
            VStack {
                HStack {
                    Text("About-Share-Title")
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    Spacer ()
                }
                Spacer ()
                Button(action: actionSheet) {
                    HStack {
//                        Spacer ()
                        VStack {
                            Spacer ()
                            Spacer ()
                            Text("About-Share")
                                .font(.headline)
                                .foregroundColor(Color("AccentColor"))
                                .padding([.top, .leading, .trailing], 15.0)
                              
                            Spacer ()
                            Image("qrcode-DivingRules-Logo")
                                .resizable()
                                .padding([.leading, .bottom, .trailing], 15.0)
                                .frame(width: 150, height: 150)
                            Spacer ()
                            Spacer ()
                        } // Link VStack
//                        Spacer ()
                    } // Link HStack
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(10.0)
                } // Link Button
            } // VStack Link
            
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
        
        let activityVC = UIActivityViewController(activityItems: [shareText, shareLink, shareImage], applicationActivities: nil)
        
        // iPad Crash correction
        // found at https://stackoverflow.com/questions/29550849/uiactivityviewcontroller-in-swift-crashes-on-ipad
        if UIDevice.current.userInterfaceIdiom == .pad {
            activityVC.popoverPresentationController?.sourceView = UIApplication.shared.windows.first
            activityVC.popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: 300, height: 350)
            activityVC.popoverPresentationController?.permittedArrowDirections = [.left]
        }

        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }

}
    
struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
//        Group {
//            AboutView().environment(\.locale, .init(identifier: "en"))
//            AboutView().environment(\.locale, .init(identifier: "fr"))
//            AboutView().environment(\.locale, .init(identifier: "it"))
//            AboutView().environment(\.locale, .init(identifier: "es"))
//        }
    }
}
