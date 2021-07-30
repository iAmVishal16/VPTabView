//
//  ContentView.swift
//  VPTabViewDemo
//
//  Created by Vishal Paliwal on 30/07/21.
//

import SwiftUI
import VPTabView

struct ContentView: View {
    let images = ["house", "suit.heart", "bell.badge", "person.circle"]
    
    var body: some View {
        VPTabView<AnyView>(icons: images) {
            ProfileView()
            BookmarksView()
            SettingsView()
            UserView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ProfileView: View {
    
    var body: some View {
        NavigationView {
            List {
                Button("Bookmarks") {
                    print("Switch to Bookmarks Tab")
                }
                Button("Settings") {
                    print("Switch to Settings Tab")
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BookmarksView: View {
    
    var body: some View {
        NavigationView {
            List {
                //                NavigationLink() {
                //                    Text("ICE")
                //                }
                Button("Settings") {
                    print("Switch to Settings Tab")
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Bookmarks")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsView: View {
    
    var body: some View {
        NavigationView {
            List {
                Button("Profile") {
                    print("Switch to Profile View")
                }
                Button("Bookmarks") {
                    print("Switch to Bookmarsk View")
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct UserView: View {
    
    var body: some View {
        VStack {
            Image("girl1")
                .resizable()
        }
    }
}
