//
//  TryOutView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 13/07/2021.
//

import SwiftUI

struct TryOutView: View {
    var body: some View {
        NavigationView{
            Form{
                Text("Hello, World!")
            }
            .navigationTitle("toto")
            .navigationBarItems(leading:
                HStack{
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color.accentColor)
                    
                    Button(action: {
                  print("back button tapped")
                    }, label: {
                        Text("Exit-Quizz")
                    })
                }
            )
            
            
            
        }
        
        
    }
}

struct TryOutView_Previews: PreviewProvider {
    static var previews: some View {
        TryOutView()
    }
}
