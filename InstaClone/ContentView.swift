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
                .font(.system(size: 20))
                .accentColor(.black)
            }
            
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 20))
            }
            
            Text("Add")
                .tabItem {
                    Image(systemName: "plus.app")
                        .font(.system(size: 20))
            }
            
            Text("Heart")
                .tabItem {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 20))
            }
            
            Text("Profil")
                .tabItem {
                    Image(systemName: "person.fill")
                        .font(.system(size: 20))
            }
        }.accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    var relativeFormatter: RelativeDateTimeFormatter {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter
    }
    
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
                        HStack {
                           StoriesView(author: post.author, width: 40, showText: false)
                            VStack(alignment: .leading) {
                                Text(post.author.name)
                                Text("Paris")
                           }
                            
                            Spacer()
                            Image(systemName: "ellipsis")
                        }.padding(.all, 10)
                        
                        Divider()
                        Image(post.imageName)
                        .resizable()
                        .scaledToFit()
                        
                        HStack(spacing: 20) {
                            Button(action: {}, label: { Image(systemName: "heart")
                                .font(.title)
                                }).buttonStyle(PlainButtonStyle())
                            
                            Button(action: {}, label: { Image("circlebubble")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .font(.title)
                            }).buttonStyle(PlainButtonStyle())
                            
                            Button(action: {}, label: { Image(systemName: "paperplane")
                            .font(.title)
                            }).buttonStyle(PlainButtonStyle())
                            Spacer()
                             
                            Button(action: {}, label: { Image(systemName: "bookmark")
                            .font(.title)
                            }).buttonStyle(PlainButtonStyle())
                        }.padding(.all, 10)
                    }
                    
                    VStack(alignment: .leading) {
                        Button(action: {}, label: { Text("Voir les J'aime")
                        .font(.headline)
                        }).buttonStyle(PlainButtonStyle())
                        
                        HStack(alignment: .top) {
                            Text(post.author.name)
                                .font(.headline)
                            Text(post.comment)
                            .lineLimit(nil)
                        }
                        
                        Text(self.relativeFormatter.localizedString(for: post.creationDate, relativeTo: Date()))
                        
                    }.padding(.horizontal)
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
