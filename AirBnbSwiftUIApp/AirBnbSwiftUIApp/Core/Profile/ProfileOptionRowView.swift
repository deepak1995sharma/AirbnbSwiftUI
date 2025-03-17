//
//  ProfileOptionRowView.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 15/03/25.
//

import SwiftUI

struct ProfileOptionRowView: View {
   // private var menu = ["Setting","Accessibility","Visit the Help Centre"]
    let imagename:String
    let title:String
    var body: some View {
        VStack(alignment:.leading,spacing: 20){
                HStack{
                    Image(systemName: imagename)
                    Text(title).font(.subheadline)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                Divider()
        }
    }
}

#Preview {
    ProfileOptionRowView(imagename: "gear", title: "Setting")
}
