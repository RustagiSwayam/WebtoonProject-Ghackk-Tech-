//
//  DetailView.swift
//  WebtoonProject
//
//  Created by Swayam Rustagi on 12/10/24.
//

import SwiftUI

struct DetailView: View {
    let webtoon: Webtoon
    @ObservedObject var viewModel: WebtoonViewModel
    @State private var rating: Int = 0

    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                Image(webtoon.thumbnail)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(12)
                
                Text(webtoon.description)
                    .font(.body)
                    .padding()
                
                Button(action: {
                    if viewModel.favorites.contains(where: { $0.id == webtoon.id }) {
                        viewModel.removeFromFavorites(webtoon)
                    } else {
                        viewModel.addToFavorites(webtoon)
                    }
                }) {
                    Text(viewModel.favorites.contains(where: { $0.id == webtoon.id }) ? "Remove from Favorites" : "Add to Favorites")
                        .padding()
                        .background(viewModel.favorites.contains(where: { $0.id == webtoon.id }) ? Color.red : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Text("Please rate the Webtoon")
                    .font(.headline)
                
                RatingView(rating: $rating)
                    .onChange(of: rating) { newRating in
                        viewModel.saveRating(for: webtoon, rating: newRating)
                    }
            }
            .navigationTitle(webtoon.title)
            .onAppear {
                loadInitialRating()
            }
        }
    }

    func loadInitialRating() {
        rating = viewModel.loadRating(for: webtoon)
    }
}
