//
//  Listing.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 15/03/25.
//

import Foundation
// Identifible - each item should be distingush based on identifier and it should be unique
struct Listing:Identifiable,Codable,Hashable {
    let id: String
    let ownerId:String
    let ownerName:String
    let ownerImageUrl:String
    let noOfBaths:Int
    let noOfBeds:Int
    let noOfBedsRooms:Int
    let noOfGuests:Int
    var pricePerNight:Int
    var imageURLs:[String]
    let latitude:Double
    let longitude:Double
    let address:String
    let city:String
    let state:String
    let title:String
    let rating:Double
    let features:[ListingFeatures]
    let aminities:[ListingAminities]
    let type:ListingType
    
}

enum ListingFeatures:Int,Codable,Identifiable,Hashable {
    case selfCheckIn
    case superHost
    
    var imageName:String{
        switch self {
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    
    var title:String {
        switch self {
        case .selfCheckIn: return "Self check-in"
        case .superHost: return "Superhost"
        }
    }
    var subTitle:String {
        switch self {
        case .selfCheckIn: return "Check yourself in with the keypad"
        case .superHost: return "Superhosts are experienced, highly rated hosts who are commited to providing greate stars for guests."
        }
    }
    var id: Int {return self.rawValue} // error aaye to yeh add kar
}

enum ListingAminities:Int,Codable,Identifiable,Hashable {
    case Pool  // we are explicity giving the value like pool = 0 , kitchen = 1 by using var id
    case Kitchen
    case wifi
    case laundry
    case tv
    case alaramSystem
    case balcony
    case office
    
    //Enum with Associate values
    var title:String {
        switch self {
        case .Pool: return "Pool"
        case .laundry: return "Laundry"
        case .Kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .office: return "Office"
        case .tv: return "TV"
        case .balcony: return "Balcony"
        case .alaramSystem: return "Alaram System"
        }
    }
    
    var images:String{
        switch self {
        case .Pool: return "figure.pool.swim"
        case .laundry: return "washer"
        case .Kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .office: return "pencil.and.ruler.fill"
        case .tv: return "tv"
        case .balcony: return "building"
        case .alaramSystem: return "checkerboard.shield"
        }
    }
        
        var id: Int {return self.rawValue} // error aaye to yeh add kar
}

enum ListingType:Int,Codable,Identifiable,Hashable {
    case apartment
    case house
    case townHouse
    case villa
    
    var description:String{
        switch self {
        case .apartment:return "Apartment"
        case .house:return "House"
        case .townHouse:return "Town Home"
        case .villa:return "Villa"
        }
    }
    var id: Int {return self.rawValue} // error aaye to yeh add kar
}
