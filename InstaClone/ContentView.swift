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
        Text("Home")
    }
}
