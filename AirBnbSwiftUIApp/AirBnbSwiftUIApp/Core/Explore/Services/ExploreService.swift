//
//  ExploreService.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 15/03/25.
//

import Foundation

class ExploreService {
    
   // static let shared = ExploreService()
    
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
    
}
