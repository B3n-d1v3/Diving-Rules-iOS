//
//  AboutDescriptionView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 26/11/2021.
//

import SwiftUI

struct AboutDescriptionView: View {
    var body: some View {
        VStack {
            Spacer ()
            
            // App Version
            HStack {
                Text("About-Version")
                // Add the marketing (Build) version Number
                Text(getAppVersion())
                Spacer ()
            }
            .font(.footnote)
            Spacer ()
            
            // Rules reference
            HStack {
                Text("About-RulesReference")
                Text("2017-2021")
                Spacer ()
            }
            .font(.footnote)
            Spacer ()
            Spacer ()
            Spacer ()
            
            // Description
            Group {
                HStack {
                    Text("About-Description-Title")
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    Spacer ()
                }
                Text("About-Description")
//                    .font(.body)
                    .multilineTextAlignment(.leading)
                Spacer ()
                Spacer ()
            }

            // License
            Group {
                HStack {
                    Text("About-License-Title")
                        .font(.title2)
                    Spacer ()
                }
                Text("About-License")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                Spacer ()
                Spacer ()
            }

            // Thanks
            Group {
                HStack {
                    Text("About-Thanks-Title")
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                    
                    Spacer ()
                }
                Text("About-Thanks")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                Spacer ()
                Spacer ()
            }
            
            
        } // VStack
            
    } // View body
    
    func getAppVersion () -> String {
        // Find the marketing version Number
        let appReleaseVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        // Find the Bundle / Build Version
        let appBundleVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        // Formats the version number display: marketing (Build)
        var fullVersion = ""
        fullVersion += appReleaseVersion ?? "X.X"
        fullVersion += " ("
        fullVersion += appBundleVersion ?? "x"
        fullVersion += ")"
        return fullVersion
    }
}

struct AboutDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        AboutDescriptionView()
    }
}
