//
//  ListingDetailView.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 13/03/25.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    var services = ["Wifi","Alaram Syatem","Balcony","Laundary","TV"]
    var servicesImage = ["star.fill","star.fill","star.fill","star.fill","star.fill"]
    
    @Environment(\.dismiss) var dismiss  // to dismiss the view
    
    var body: some View {
        ScrollView(){
            //ListingImageCarousalView
            VStack(alignment:.leading){
                // Zstackisliye liye hai kyuki hme back btn uske upar lgna hai
                ZStack(alignment:.topLeading) {
                    ListingImageCarousalView()
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
                     Text("Miami Villa")
                         .font(.title)
                         .fontWeight(.semibold)
                     HStack{
                         Image(systemName: "star.fill")
                         Text("4.56 -")
                         Text("28 reviews")
                             .underline()
                             
                     }.foregroundStyle(.black)
                     Text("Miami,Florida")
                         .foregroundStyle(.gray)
                         .font(.caption)
                     
                 }.padding(.horizontal)
                
                Divider()
                
                //Host InfoView
                HStack {
                    VStack(alignment: .leading) {
                        Text("Entire Villa hosted by John Smith").font(.headline).fontWeight(.medium)
                           
                        HStack(spacing: 2) {
                            Text("4 guests - ")
                            Text(" 4 bedrooms - ")
                            Text(" 4 beds - ")
                            Text("3 baths")
                               
                        } 
                        .foregroundStyle(.gray)
                            .font(.caption)
                    }
                    .frame(width: 250)
                    Spacer()
                   Image("photo-barcelona-spain")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64,height: 64)
                        .clipShape(Circle())
                    
                }.padding(.horizontal)
                 .padding(.vertical,16)
                
                Divider()
                
                //Listing FeatureView
                
                VStack(alignment:.leading,spacing: 16){
                    ForEach(0 ..< 2,id: \.self) { count in
                        HStack(spacing:12){
                            Image(systemName: "medal")
                            
                            VStack(alignment: .leading){
                                Text("Self check-in")
                                    .font(.footnote).fontWeight(.semibold)
                                Text("check yourself in with the keypad ajbdjabdbabajcbahvavadavdahavahvchchavhccvajahchacvajv.").font(.caption).foregroundStyle(.gray)
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
                            ForEach(0 ... 4,id: \.self) { bedroom in
                                VStack(alignment:.leading,spacing:10){
                                    Image(systemName: "bed.double")
                                    Text("Bedroom 1")
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
                    ForEach(services,id: \.self) { feature in
                        HStack{
                            Image(systemName: "wifi").frame(width: 32)
                            Text(feature).foregroundStyle(.gray).font(.footnote)
                        }
                    }
                }.padding()
                
                Divider()
                
                //MAPView
                VStack(alignment:.leading,spacing: 16){
                    Text("Where you'll be").font(.headline).fontWeight(.medium)
                    Map()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }.padding()
            }

        }.ignoresSafeArea()  // To ignore safe area and shit the view
        // FooterView is outside scroolView
        .overlay(alignment:.bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                   
                    VStack(alignment:.leading){
                        Text("$300").font(.headline).fontWeight(.medium)
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
    ListingDetailView()
}
