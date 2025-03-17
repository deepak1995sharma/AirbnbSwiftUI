//
//  ListingImageCarousalView.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 13/03/25.
//

import SwiftUI

struct ListingImageCarousalView: View {
    let listing:Listing
    
    var body: some View {
        TabView{  // segmantaed control kai liye yeh krna padta hai
            ForEach(listing.imageURLs,id:\.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
            .tabViewStyle(.page) //or yeh bhi add krna pdta hai segmantaed kai liye
        
    }
}

#Preview {
    ListingImageCarousalView(listing: DeveloperPreview.shared.listings[0])
}
