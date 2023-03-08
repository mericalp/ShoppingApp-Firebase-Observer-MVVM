//
//  UserOrderModel.swift
//  Shopping
//
//  Created by Meric on 20.08.2022.
//

import Foundation

struct UserOrderModel:Identifiable {
    
    var id = UUID()
    var uid : String

    var name : String
    var image: String
    var size : String
    var price: String
    var date: Date
    
    var formattedPrice: String { return "\(price)" }
 
}

