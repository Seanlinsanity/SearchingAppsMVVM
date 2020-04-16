//
//  SearchResult.swift
//  AppStoreJSONAPI
//
//  Created by Sean on 2020/4/3.
//  Copyright © 2020 Sean. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String // app icon
    let description: String
    let releaseNotes: String
}
