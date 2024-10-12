//
//  RatingView.swift
//  WebtoonProject
//
//  Created by Swayam Rustagi on 12/10/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    var body: some View {
        HStack {
            ForEach(1..<6) { i in
                Image(systemName: i <= rating ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        rating = i
                    }
            }
        }
    }
}
