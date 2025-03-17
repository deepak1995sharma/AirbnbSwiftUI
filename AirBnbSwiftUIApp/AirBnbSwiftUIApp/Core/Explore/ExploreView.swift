//
//  ExploreView.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 12/03/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    
    @ObservedObject private var viewModel = ExplorerViewModel(service: ExploreService()) // DI
    
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            }else{
                // SearchAndFIlterBar()  // agr usko uapr rkhna hai scrool nhi krna tb yha dalo
                 ScrollView{
                     SearchAndFIlterBar(location: $viewModel.searchLocation) // scroll krna hai toyha dalo scrollview kai andar
                     //Tap Gesture and Snapy animation
                         .onTapGesture {
                             withAnimation(.snappy) {
                                 showDestinationSearchView.toggle() // matble false sai true ya vice-versa
                             }
                         }
                     LazyVStack {
                         
                         ForEach(viewModel.listing, id: \.self) { listing in
                             NavigationLink(value: listing) {
                                 ListingItemView(listing: listing)
                             }
                             
                         }
                     }
                 }
                 .navigationDestination(for: Listing.self) { listing in
                     ListingDetailView(listing: listing)  // yaha destination view ka naam aayega
                         .navigationBarBackButtonHidden() // taki destinationm screen par default bar button na dekhe kyuki hmne apna custom bnya hai
                 }
            }
        }
    }
}

#Preview {
    ExploreView()
}
