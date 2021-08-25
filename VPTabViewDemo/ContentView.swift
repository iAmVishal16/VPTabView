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
            HomeView()
            FavoriteView()
            NotificationsView()
            UserView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    
    var body: some View {
        VStack {
            Spacer()
            HStack (alignment: .center) {
                Spacer()
                Text("Home Secreen")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            Spacer()
        }
    }
}

struct FavoriteView: View {
    
    var body: some View {
        VStack {
            Spacer()
            HStack (alignment: .center) {
                Spacer()
                Text("Favorite Secreen")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            Spacer()
        }
    }
}

struct NotificationsView: View {
    
    var body: some View {
        VStack {
            Spacer()
            HStack (alignment: .center) {
                Spacer()
                Text("Notification Secreen")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            Spacer()
        }
    }
}

struct UserView: View {
    
    var body: some View {
        VStack {
            Spacer()
            HStack (alignment: .center) {
                Spacer()
                Text("Profile Secreen")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            Spacer()
        }
    }
}
