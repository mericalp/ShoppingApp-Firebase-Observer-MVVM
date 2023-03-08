//
//  StoreModel.swift
//  Shopping
//
//  Created by Meric on 2.09.2022.
//

import Foundation
import MapKit

struct StoreModel:Identifiable,Equatable {
 
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
 
    var id:String {
        name + cityName
    }
    
    static func == (lhs: StoreModel, rhs: StoreModel) -> Bool {
        lhs.id  == rhs.id
    }
     
}
