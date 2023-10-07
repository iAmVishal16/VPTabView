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
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Spacer()
            HStack (alignment: .center) {
                Spacer()
                VStack(spacing: 16) {
                    Image(systemName: "chart.bar.xaxis.ascending.badge.clock")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray.opacity(0.4))
                        .accentColor(.blue)
                    Text("Buy or Sell More!")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    Text("Here your stastics will be shown. sell some more products!")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(colorScheme == .dark ? .black : Color.white)
            Spacer()
        }
    }
}

struct FavoriteView: View {
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Spacer()
            HStack (alignment: .center) {
                Spacer()
                VStack(spacing: 16) {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray.opacity(0.4))
                    Text("Wishlist is empty!")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    Text("Pump up that heart button, to view your favourite topics.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(colorScheme == .dark ? .black : Color.white)
            Spacer()
        }
    }
}

struct NotificationsView: View {
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Spacer()
            HStack (alignment: .center) {
                Spacer()
                VStack(spacing: 16) {
                    Image(systemName: "bell.fill")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 86, height: 100)
                        .foregroundColor(.gray.opacity(0.4))
//                        .accentColor(.blue)
                    Text("No Notifications Yet!")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    Text("You'll get notified for any new updates, sell, order.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(colorScheme == .dark ? .black : Color.white)
            Spacer()
        }
    }
}

struct UserView: View {
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Spacer()
            HStack (alignment: .center) {
                Spacer()
                VStack(spacing: 16) {
                    Image(systemName: "person.line.dotted.person.fill")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 100, height: 46)
                        .foregroundColor(.gray.opacity(0.4))
                        .accentColor(.blue)
                    Text("User Management!")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    Text("You can manage user. add, edit, view and delete users profiles")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding([.leading, .trailing], 16)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(colorScheme == .dark ? .black : Color.white)
            Spacer()
        }
    }
}
