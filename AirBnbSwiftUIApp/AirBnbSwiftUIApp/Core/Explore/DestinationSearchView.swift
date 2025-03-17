//
//  DestinationSearchView.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 15/03/25.
//

import SwiftUI

//Better approch then creating boolen state var
enum DestinationSearchOption {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    @Binding  var show:Bool
    @State private var selectedOption:DestinationSearchOption = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var noOfGuests = 0
    
    @ObservedObject var viewModel:ExplorerViewModel
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Button{
                    //Snapy animation
                    withAnimation(.snappy) {
                        viewModel.updateListingForLocation() // agr hmene clear btn sai textfiled clear nhi kiya balki bacspace sai kiya or yeh btn press kiya tb bhi hme sare list dkhna chyie 
                        show.toggle() // take parent view ko pata chale ki value true hai ya false
                    }
                    
                }label: {
                    Image(systemName: "xmark.circle").foregroundStyle(.black)
                        .imageScale(.large)
                }
                
                Spacer()
                //Clear button view // agr empty ho tbhi clear btn dkhna chyie warna nhi
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear"){
                        viewModel.searchLocation = ""
                        viewModel.updateListingForLocation()
                    }.font(.subheadline).foregroundStyle(.black).fontWeight(.semibold)
                }
                
            }.padding()
            
            //Where to view ?
            VStack(alignment:.leading){
                if selectedOption == .location {
                    Text("Where to?").font(.title2).fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass").imageScale(.small)
                        TextField("Search Destinations",text: $viewModel.searchLocation)
                            .onSubmit {
                                viewModel.updateListingForLocation()
                                show.toggle() // dismiss the view after update list
                            }
                        
                    }.frame(height: 64)
                        .padding(.horizontal)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(Color(.systemGray))
                            //.shadow(color: .black.opacity(0.4), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                }else{
                    CollapsedPickerView(title: "Where", description: "Destination")
                }
            }
            
            // yeh outerview with shodow kai liye hai
            .modifier(CollaspibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .location}
                
            }
            //Date selection View
            VStack(alignment:.leading){
                if selectedOption == .dates {
                    Text("When's your trip?").font(.title2).fontWeight(.semibold)
                    
                    VStack{
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }.foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                }else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollaspibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .dates}
                
            }
            
            // No of Guestview
            VStack(alignment:.leading){
                if selectedOption == .guests {
                    Text("Who's coming?").font(.title2).fontWeight(.semibold)
                    Stepper {
                        Text("\(noOfGuests) Adults")
                    } onIncrement: {
                        noOfGuests += 1
                    } onDecrement: {
                        guard noOfGuests >= 0 else{return}
                        noOfGuests -= 1
                    }
                }else{
                    
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollaspibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .guests }
                
                
            }
            Spacer()
        }
        .padding(5)
        
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExplorerViewModel(service: ExploreService()))
}
//Create custom modifier .so basically hum is content pr yeh styling kar rhe hai or ishe use kr rhe hai multiple places par 
struct CollaspibleDestinationViewModifier:ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .shadow(radius: 10)
        
    }
}
struct CollapsedPickerView: View {
    @State var title:String
    @State var description:String
    var body: some View {
        VStack{
            HStack{
                Text(title).foregroundStyle(.gray)
                Spacer()
                Text(description)
            }.fontWeight(.semibold).font(.subheadline)
            
        }
    }
}
