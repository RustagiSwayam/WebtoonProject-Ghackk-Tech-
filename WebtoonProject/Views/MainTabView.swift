//
//  MainTabView.swift
//  WebtoonProject
//
//  Created by Swayam Rustagi on 12/10/24.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            HomeView(viewModel: WebtoonViewModel())
                .tabItem { Label("Home", systemImage: "house") }
            
            FavouritesView(viewModel: WebtoonViewModel())
                .tabItem { Label("Favourites", systemImage: "heart") }
            
        }
        .accentColor(.black)
    }
}


#Preview {
    MainTabView()
}
