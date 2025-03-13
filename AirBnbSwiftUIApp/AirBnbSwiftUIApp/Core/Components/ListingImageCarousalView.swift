//
//  ListingImageCarousalView.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 13/03/25.
//

import SwiftUI

struct ListingImageCarousalView: View {
    let placesImages:[String] = ["photo-barcelona-spain","photo-athens-greece","photo-budapest-hungary","photo-dubai-emirates","photo-emaraldlake-canada","photo-grandcanyon-usa","photo-krabi-thailand","photo-london-uk","photo-newyork-usa","photo-paris-france","photo-riodejaneiro-brazil","photo-rome-italy","photo-sanfrancisco-usa","photo-seoraksan-southkorea","photo-sydney-australia","photo-tatras-poland","photo-tulum-mexico","photo-veligandu-island-maldives"]
    
    var body: some View {
        TabView{  // segmantaed control kai liye yeh krna padta hai
            ForEach(placesImages,id:\.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
            .tabViewStyle(.page) //or yeh bhi add krna pdta hai segmantaed kai liye
        
    }
}

#Preview {
    ListingImageCarousalView()
}
