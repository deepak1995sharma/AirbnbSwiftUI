//
//  SearchAndFIlterBar.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 12/03/25.
//

import SwiftUI

struct SearchAndFIlterBar: View {
    @Binding var location:String // taki location text mai show kr sake
    
    var body: some View {
        HStack(spacing:10){
            Image(systemName: "magnifyingglass")
            VStack(alignment:.leading){
                Text(location.isEmpty ? "Where to?" : location)
                    
                    .fontWeight(.semibold)
                Text("\(location.isEmpty ? "Anywhere - " : "" )Any Week - Add guests")
                    .foregroundStyle(.gray)
            }
            Spacer()
            Button{
                
            }label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .font(.footnote)
        .overlay{
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray))
                .shadow(color: .black.opacity(0.4), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .padding()
        Spacer()
    }
}

#Preview {
    SearchAndFIlterBar(location: .constant("Los Angeles"))
}
