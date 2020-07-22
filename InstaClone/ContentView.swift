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
                            StoriesView(author: author)
                        }
                    } .padding(.all, 10)
                }
                Divider()
                
                ForEach(Post.all) { post in
                    VStack(alignment: .leading, spacing: 0) {
                        StoriesView(author: post.author, width: 40, showText: false)
                    }
                }
            }
        }
    }
}

struct StoriesView: View {
    let author: Author
    var width: CGFloat = 70
    var showText = true
    var body: some View {
        VStack {
            Image(author.photoName)
                .resizable()
                .frame(width: width, height: width)
                .scaledToFit()
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.red, style: StrokeStyle(lineWidth: 2))
                        .frame(width: width + 5, height: width + 5)
            )
            if showText {
                Text(author.name)
            }
        }
    }
}
