//
//  ProfileView.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 15/03/25.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        VStack(alignment:.leading,spacing: 32){
            
            VStack(alignment:.leading,spacing: 8) {
                Text("Profile").font(.largeTitle).fontWeight(.semibold)
                Text("Log in start planning your next trip.")
            }
           
            
            Button{
                
            }label: {
                Text("Log in")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 340,height: 48)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
            }
            HStack{
                Text("Don't have an account?")
                Text("SignUp").fontWeight(.semibold).underline()
            }.font(.caption)
            
            //ProfileOptionRow
            VStack(spacing:24){
                ProfileOptionRowView(imagename: "gear", title: "Setting")
                ProfileOptionRowView(imagename: "gear", title: "Accessibility")
                ProfileOptionRowView(imagename: "gear", title: "Visit the Help Centre")
            }.padding(.vertical)
           
            
        }.padding()
        
    }
}

#Preview {
    ProfileView()
}
