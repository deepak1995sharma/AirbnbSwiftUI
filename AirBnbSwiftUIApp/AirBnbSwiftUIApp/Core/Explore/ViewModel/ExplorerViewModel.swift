//
//  ExplorerViewModel.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 15/03/25.
//

import Foundation

class ExplorerViewModel:ObservableObject {
    
    @Published var listing = [Listing]()
    
    private let service:ExploreService // Dependecy Injection
    @Published var searchLocation = ""
    private var listingCopy = [Listing]()
    
    init(service:ExploreService) {
        self.service = service
        
        Task{ await fetchListing() }
    }
    func fetchListing() async {
        do{
            self.listing = try await service.fetchListings()
            self.listingCopy = listing
        }catch{
            print("DEBUG:Failed to fetch listing with errors\(error.localizedDescription)")
        }
    }
    func updateListingForLocation() {
        let filterListing = listing.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        self.listing = filterListing.isEmpty ? listingCopy : filterListing  // agr filter list empty hau matlb koi match nhi kiya to pura list return karo wanra filter list return karo
    }
}
