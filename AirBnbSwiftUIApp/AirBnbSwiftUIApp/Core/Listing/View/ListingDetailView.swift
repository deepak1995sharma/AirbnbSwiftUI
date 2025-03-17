//
//  ListingDetailView.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 13/03/25.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    let listing:Listing
    
    @Environment(\.dismiss) var dismiss  // to dismiss the view
    @State private var camerPosition:MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        let region = MKCoordinateRegion(center: listing.city == "Los Angeles" ? .losAngles :.miami,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        self._camerPosition = State(initialValue: .region(region))
    }
    var body: some View {
        ScrollView(){
            //ListingImageCarousalView
            VStack(alignment:.leading){
                // Zstackisliye liye hai kyuki hme back btn uske upar lgna hai
                ZStack(alignment:.topLeading) {
                    ListingImageCarousalView(listing: listing)
                        .frame(height: 320)
                    Button{
                       dismiss()
                    }label: {
                        
                            Image(systemName: "chevron.left")
                            .background{
                                Circle().fill(.white).frame(width: 32,height:32)
                            }.padding(32)
                        
                    }
                }
                //Miami Villa View
                VStack(alignment:.leading,spacing: 16){
                    Text(listing.title)
                         .font(.title)
                         .fontWeight(.semibold)
                     HStack{
                         Image(systemName: "star.fill")
                         Text("\(listing.rating) -")
                         Text("28 reviews")
                             .underline()
                             
                     }.foregroundStyle(.black)
                     Text("\(listing.city),\(listing.state)")
                         .foregroundStyle(.gray)
                         .font(.caption)
                     
                 }.padding(.horizontal)
                
                Divider()
                
                //Host InfoView
                HStack {
                    VStack(alignment: .leading) {
                        Text("Entire \(listing.type.description) hosted by \(listing.ownerName)").font(.headline).fontWeight(.medium)
                           
                        HStack(spacing: 2) {
                            Text("\(listing.noOfGuests) guests - ")
                            Text(" \(listing.noOfBedsRooms) bedrooms- ")
                            Text(" \(listing.noOfBeds) beds- ")
                            Text("\(listing.noOfBaths) baths")
                               
                        } 
                        .foregroundStyle(.gray)
                            .font(.caption)
                    }
                    .frame(width: 250)
                    Spacer()
                    Image(listing.ownerImageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64,height: 64)
                        .clipShape(Circle())
                    
                }.padding(.horizontal)
                 .padding(.vertical,16)
                
                Divider()
                
                //Listing FeatureView
                
                VStack(alignment:.leading,spacing: 16){
                    ForEach(listing.features,id: \.self) { features in
                        HStack(spacing:12){
                            Image(systemName: features.imageName)
                            
                            VStack(alignment: .leading){
                                Text(features.title)
                                    .font(.footnote).fontWeight(.semibold)
                                Text(features.subTitle).font(.caption).foregroundStyle(.gray)
                            }
                        }
                    }
                }.padding(.horizontal)
                .padding(.vertical,16)
                
                Divider()
                
                //Bedrooms View
                VStack(alignment:.leading,spacing: 16){
                    Text("Where you'll sleep").font(.headline).fontWeight(.medium)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(spacing:16){
                            ForEach(1 ... listing.noOfBedsRooms,id: \.self) { bedroom in
                                VStack(alignment:.leading,spacing:10){
                                    Image(systemName: "bed.double")
                                    Text("Bedroom \(bedroom)")
                                }.frame(width: 132,height: 100)
                                //Yeh hai round shape dene kai liye
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 1.0)
                                            .foregroundStyle(.gray)
                                    }
                                
                            }
                        }
                    }.scrollTargetBehavior(.paging)
                        
                }.padding()
                
                Divider()
                
                VStack(alignment:.leading,spacing: 16){
                    Text("What this place offers").font(.headline).fontWeight(.medium)
                    ForEach(listing.aminities) { aminity in
                        HStack{
                            Image(systemName: aminity.images).frame(width: 32)
                            Text(aminity.title).foregroundStyle(.gray).font(.footnote)
                        }
                    }
                }.padding()
                
                Divider()
                
                //MAPView
                VStack(alignment:.leading,spacing: 16){
                    Text("Where you'll be").font(.headline).fontWeight(.medium)
                    Map(position: $camerPosition) // TO zoom in 
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }.padding()
            }

        }
        .toolbar(.hidden, for: .tabBar)  // Tabbar hide karne kai liye 
        .ignoresSafeArea()  // To ignore safe area and shit the view
        // FooterView is outside scroolView
        .overlay(alignment:.bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                   
                    VStack(alignment:.leading){
                        Text("$\(listing.pricePerNight)").font(.headline).fontWeight(.medium)
                        Text("total before taxes").font(.callout).fontWeight(.light)
                        Text("Oct 15-20").font(.headline).fontWeight(.medium)
                    }
                    Spacer()
                    Button{
                        
                    }label:{
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140,height:40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                    }
                }.padding(.horizontal,32)
                
            }.background(.white) // pehle clear the color vstack ka white krne par shi ho gya
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}
