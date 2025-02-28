//
//  Movie.swift
//  MovieReviewApp
//
//  Created by kyuhyeon Lee on 2/28/25.
//


import Foundation

struct Movie: Codable {
    let id: UUID
    let title: String
    let poster: String
    let description: String
}