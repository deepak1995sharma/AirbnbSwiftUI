//
//  ExploreView.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 12/03/25.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
           // SearchAndFIlterBar()  // agr usko uapr rkhna hai scrool nhi krna tb yha dalo
            ScrollView{
                SearchAndFIlterBar() // scroll krna hai toyha dalo scrollview kai andar
                LazyVStack {
                    
                    ForEach(1...10, id: \.self) { listing in
                        NavigationLink(value: listing) {
                            ListingItemView()
                        }
                        
                    }
                }
            }
            .navigationDestination(for: Int.self) { liating in
                ListingDetailView()  // yaha destination view ka naam aayega
                    .navigationBarBackButtonHidden() // taki destinationm screen par default bar button na dekhe kyuki hmne apna custom bnya hai 
            }
        }
    }
}

#Preview {
    ExploreView()
}
