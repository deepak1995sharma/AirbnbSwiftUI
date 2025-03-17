//
//  ListingView.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 12/03/25.
//

import SwiftUI

struct ListingItemView: View {
    
    let listing:Listing
    
    let placesImages:[String] = ["photo-barcelona-spain","photo-athens-greece","photo-budapest-hungary","photo-dubai-emirates","photo-emaraldlake-canada","photo-grandcanyon-usa","photo-krabi-thailand","photo-london-uk","photo-newyork-usa","photo-paris-france","photo-riodejaneiro-brazil","photo-rome-italy","photo-sanfrancisco-usa","photo-seoraksan-southkorea","photo-sydney-australia","photo-tatras-poland","photo-tulum-mexico","photo-veligandu-island-maldives"]
    
    var body: some View {
        VStack(spacing:8){
            //Image
            ListingImageCarousalView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            
            //listing Details
            HStack(alignment:.top){  // taki rating view top par rahe 
                VStack(alignment:.leading){
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mile")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    Text("$\(listing.pricePerNight)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                }
                
                Spacer() // dono kai beach mai spacer dene kai liye
                
                //RATING
                
                HStack{
                    Image(systemName: "star.fill")
                    Text("\(listing.rating)")
                        
                }.foregroundStyle(.black)
            }
            
            .font(.footnote)
        }.padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
