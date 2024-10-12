//
//  FavouritesView.swift
//  WebtoonProject
//
//  Created by Swayam Rustagi on 12/10/24.
//

import SwiftUI

struct FavouritesView: View {
    @ObservedObject var viewModel: WebtoonViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.favorites) { webtoon in
                NavigationLink(destination: DetailView(webtoon: webtoon, viewModel: viewModel)) {
                    HStack {
                        Image(webtoon.thumbnail)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)
                        Text(webtoon.title)
                    }
                }
            }
            .onDelete(perform: deleteWebtoon)
        }
        .navigationTitle("Favorites")
    }
    
    private func deleteWebtoon(at offsets: IndexSet) {
        for index in offsets {
            let webtoonToRemove = viewModel.favorites[index]
            viewModel.removeFromFavorites(webtoonToRemove)
        }
    }
}
