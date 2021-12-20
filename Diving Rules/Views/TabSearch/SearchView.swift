//
//  SearchView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 16/12/2021.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
//        ToDo Translation in this page
        NavigationView {
            ScrollView {
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                
                // The search result
                ForEach((0..<20).filter({"\($0)".contains(searchText)}), id: \.self) { num in
                    HStack {
                        Text ("\(num)")
                        Spacer ()
                    }.padding(8.0)
                    Divider ()
                        .background(Color(.systemGray5))
                        .padding(.leading)
                        .padding(.trailing)
                } // end ForEach
                Spacer()
            } // End ScrollView
        } // End NavigationView
        
        
        
        // possibility to setup the seach directly in the penalty list
//         see example here: https://youtu.be/nuag1PILxCA?t=351
    } // end body
//        .navigationTitle("Search")
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    // Search bar implementation source was found here: https://www.youtube.com/watch?v=vgvbrBX2FnE
    var body: some View {
        HStack{
            HStack {
                // The Search Bar
                TextField("Search Rules", text: $searchText)
                    .padding(.horizontal, 24)
            }
            .padding()
            .background(Color(.systemGray4))
            .cornerRadius(10)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            // Side buttons on Search bar
            .overlay(
                HStack {
                    Image (systemName: "magnifyingglass")
                    Spacer ()
                    if isSearching {
                        Button (action: {
                            searchText = ""
                        }, label: {
                            Image (systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                        
                    }
                } // end Overlay Stack
                    .padding(.horizontal, 32)
                    .foregroundColor(Color.accentColor)
            ) // end overlay
            .transition(.move(edge: .trailing))
            .animation(.spring())
            
            // Show Hide Cancel Button
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text ("Cancel")
                        .padding(.trailing)
                        .padding(.leading, -12)
                })
                    .transition(.move(edge: .trailing))
                    .animation(.spring())
            } // end if Cancel Button
            
        } // end HStack - full Search inc cancel
    }
}
