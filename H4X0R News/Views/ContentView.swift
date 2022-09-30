//
//  ContentView.swift
//  H4X0R News
//
//  Created by Duane, Kevin on 9/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4x0R NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hola")
//]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

