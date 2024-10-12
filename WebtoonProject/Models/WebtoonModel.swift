//
//  WebtoonModel.swift
//  WebtoonProject
//
//  Created by Swayam Rustagi on 12/10/24.
//

import Foundation


struct Webtoon: Identifiable, Codable, Hashable {
    let id: UUID
    let title: String
    let thumbnail: String
    let description: String
}
