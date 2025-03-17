//
//  DeveloperPreview.swift
//  AirBnbSwiftUIApp
//
//  Created by Deepak Sharma on 15/03/25.
//

import Foundation

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    var listings: [Listing] = [
        Listing(
            id: NSUUID().uuidString,
            ownerId: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "male-profile-photo",
            noOfBaths: 4,
            noOfBeds: 3,
            noOfBedsRooms: 3,
            noOfGuests: 4,
            pricePerNight:567,
            imageURLs: ["photo-athens-greece", "photo-barcelona-spain", "photo-budapest-hungary", "photo-dubai-emirates"],
            latitude: 25.7850 ,
            longitude: -80.1936,
            address: "124 Main st",
            city: "Miami",
            state:"Florida" ,
            title: "Miami Villa",
            rating: 2.1,
            features: [.selfCheckIn, .selfCheckIn],
            aminities: [.wifi, .alaramSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        Listing(
            id: NSUUID().uuidString,
            ownerId: NSUUID().uuidString,
            ownerName: "Peter parker",
            ownerImageUrl: "male-profile-photo",
            noOfBaths: 4,
            noOfBeds: 5,
            noOfBedsRooms: 7,
            noOfGuests: 200,
            pricePerNight:1000,
            imageURLs: ["photo-barcelona-spain","photo-athens-greece", "photo-budapest-hungary", "photo-dubai-emirates"],
            latitude: 25.7850 ,
            longitude: -80.1936,
            address: "154 Saket st",
            city: "Los Angeles",
            state:"US" ,
            title: "Austrailia Villa",
            rating: 5,
            features: [.selfCheckIn, .selfCheckIn],
            aminities: [.wifi, .alaramSystem, .balcony],
            type: .villa
        ),
        Listing(
            id: NSUUID().uuidString,
            ownerId: NSUUID().uuidString,
            ownerName: "Pragya parker",
            ownerImageUrl: "male-profile-photo",
            noOfBaths: 4,
            noOfBeds: 5,
            noOfBedsRooms: 7,
            noOfGuests: 200,
            pricePerNight:1000,
            imageURLs: ["photo-dubai-emirates","photo-athens-greece", "photo-barcelona-spain", "photo-budapest-hungary"],
            latitude: 25.7850 ,
            longitude: -80.1936,
            address: "154 Saket st",
            city: "Los Angeles",
            state:"US" ,
            title: "American Villa",
            rating: 3,
            features: [.selfCheckIn, .selfCheckIn],
            aminities: [.wifi, .alaramSystem, .balcony],
            type: .villa
        ),
        Listing(
            id: NSUUID().uuidString,
            ownerId: NSUUID().uuidString,
            ownerName: "Deepak sharma",
            ownerImageUrl: "male-profile-photo",
            noOfBaths: 2,
            noOfBeds: 1,
            noOfBedsRooms: 5,
            noOfGuests: 7,
            pricePerNight:800,
            imageURLs: ["photo-budapest-hungary","photo-athens-greece", "photo-barcelona-spain","photo-dubai-emirates"],
            latitude: 25.7850 ,
            longitude: -80.1936,
            address: "124 Greensland",
            city: "Swizeland",
            state:"Florida" ,
            title: "Swizeland Villa",
            rating: 3.2,
            features: [.selfCheckIn, .selfCheckIn],
            aminities: [.wifi, .alaramSystem, .laundry, .tv],
            type: .villa
        )
    ]
}
