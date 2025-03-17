//
//  WishListView.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 15/03/25.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading,spacing: 32) {
                
                VStack(alignment:.leading,spacing: 4){
                    Text("Log in to view your wishlists.").font(.headline).fontWeight(.bold)
                    Text("You can create,view or edit wishlists once you've logged in").font(.footnote)
                }
                Button{
                    
                }label: {
                    Text("Log in")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360,height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                Spacer()
            }.padding()
            .navigationTitle("Wishlists")
        }
        
    }
}

#Preview {
    WishListView()
}
