//
//  ContentView.swift
//  InstaClone
//
//  Created by Flo on 19/07/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
                    .navigationBarTitle("Instagram", displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {}, label: { Image(systemName: "camera")}),
                                        trailing: Button(action: {}, label: { Image(systemName: "paperplane")}))
            }
            .tabItem {
                Image(systemName: "house.fill")
            }
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
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(Author.all) { author in
                            VStack {
                                Image(author.photoName)
                                .resizable()
                                .frame(width: 70, height: 70)
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.red, style: StrokeStyle(lineWidth: 2))
                                .frame(width: 75, height: 77)
                                )
                            }
                        }
                    } .padding(.all, 10)
                }
            }
        }
    }
}
