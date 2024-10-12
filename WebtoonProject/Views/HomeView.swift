//
//  HomeView.swift
//  WebtoonProject
//
//  Created by Swayam Rustagi on 12/10/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: WebtoonViewModel
    @State private var searchText: String = ""
    
    var filteredWebtoons: [Webtoon] {
        if searchText.isEmpty {
            return viewModel.webtoons
        } else {
            return viewModel.webtoons.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(filteredWebtoons) { webtoon in
                    NavigationLink(destination: DetailView(webtoon: webtoon, viewModel: viewModel)) {
                        VStack(alignment: .center) {
                            Image(webtoon.thumbnail)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.width)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text(webtoon.title)
                                .font(.headline)
                                .padding(.top, 8)
                        }
                        .padding(.bottom, 10)
                    }
                }
                .navigationTitle("Webtoon Library")
            }
            .searchable(text: $searchText, prompt: "Search Webtoons")
        }
    }
}

